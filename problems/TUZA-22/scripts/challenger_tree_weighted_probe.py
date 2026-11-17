#!/usr/bin/env python3
"""Exact finite target: minimum P4/P5 cover, internal triangle weight2/external1."""
import itertools,json,time,datetime,functools
from pathlib import Path
started=time.monotonic(); counts={'graphs':0,'nonminimal':0,'minimum':0,'not_inclusion_minimal':0}; failure=None; unknown=[];domains=[]
def solve(n,C,E):
    global counts
    E=sorted(E); ids={e:i for i,e in enumerate(E)}; Cset=set(C);cm=sum(1<<ids[e] for e in C)
    nt=max((v for e in E for v in e),default=-1)+1
    T=[]; tv=[]; w=[]
    for a,b,c in itertools.combinations(range(nt),3):
        es=((a,b),(a,c),(b,c))
        if all(e in ids for e in es):
            mask=sum(1<<ids[e] for e in es);assert mask&cm
            T.append(mask);tv.append((a,b,c));w.append(2 if c<n else 1)
    counts['graphs']+=1
    if any(not any((t&cm)==(1<<ids[e]) for t in T) for e in C):
        counts['not_inclusion_minimal']+=1;return None
    te=[tuple(i for i in range(len(E)) if t>>i&1) for t in T]
    hit=[sum(1<<j for j,t in enumerate(T) if t>>i&1) for i in range(len(E))]
    all_t=(1<<len(T))-1
    @functools.lru_cache(None)
    def cov(s,k):
        if not s:return ()
        if not k:return None
        j=(s&-s).bit_length()-1
        for e in te[j]:
            ans=cov(s&~hit[e],k-1)
            if ans is not None:return (e,)+ans
        return None
    cheaper=cov(all_t,len(C)-1)
    if cheaper is not None:counts['nonminimal']+=1;return None
    counts['minimum']+=1
    conflict=[sum(1<<j for j,t in enumerate(T) if t&s) for s in T]
    @functools.lru_cache(None)
    def pack(s,need):
        if need<=0:return ()
        if not s:return None
        j=max((j for j in range(len(T)) if s>>j&1),key=lambda j:w[j])
        ans=pack(s&~conflict[j],need-w[j])
        if ans is not None:return (j,)+ans
        return pack(s&~(1<<j),need)
    good=pack(all_t,len(C))
    if good is not None:return None
    @functools.lru_cache(None)
    def optimum(s):
        if not s:return (0,())
        j=(s&-s).bit_length()-1
        val,ps=optimum(s&~conflict[j]);take=(val+w[j],(j,)+ps);skip=optimum(s&~(1<<j))
        return max(take,skip,key=lambda x:x[0])
    val,p=optimum(all_t)
    return {'n':nt,'core_vertices':list(range(n)),'cover_edges':C,'edges':E,'triangles':tv,'triangle_weights':w,'tau':len(C),'weighted_packing_optimum':val,'weighted_packing':[tv[j] for j in p],'cover_search':'all branches of a triangle-edge hitting recursion exclude cover of size|C|-1','packing_search':'all branches of weighted independent-set recurrence over actual triangle intersection graph'}
try:
 for n in (4,5):
    C=[(i,i+1) for i in range(n-1)]; extra=[e for e in itertools.combinations(range(n),2) if e not in C]; d={'core':'P'+str(n),'internal_masks_completed':0,'apex_cap':3};domains.append(d)
    for internal_mask in range(1<<len(extra)):
        H={e for j,e in enumerate(extra) if internal_mask>>j&1};A=set(C)|H
        it=[t for t in itertools.combinations(range(n),3) if all(e in A for e in itertools.combinations(t,2))]
        if not it or any(all(e in H for e in itertools.combinations(t,2)) for t in it):continue
        types=[]
        for mask in range(1<<n):
            if any((mask>>u&1) and (mask>>v&1) for u,v in H):continue
            if not any((mask>>u&1) and (mask>>v&1) for u,v in C):continue
            types.append(mask)
        for b in range(4):
            for ns in itertools.combinations_with_replacement(types,b):
                if time.monotonic()-started>45:raise TimeoutError((n,internal_mask,b,ns))
                E=set(A)
                for j,mask in enumerate(ns):
                    for v in range(n):
                        if mask>>v&1:E.add((v,n+j))
                result=solve(n,C,E)
                if result is not None:
                    failure=result;failure['generator']={'core':d['core'],'internal_mask':internal_mask,'apex_neighborhood_masks':ns};raise StopIteration
        d['internal_masks_completed']+=1
except StopIteration:pass
except TimeoutError as ex:unknown.append({'reason':'internal45s','next_state':ex.args[0]})
result={'claim':'Every minimum TREE cover C admits edge-disjoint triangles of weight≥|C|, with weight2 internal toV(C),weight1 external','scope':'Finite P4/P5 covers; every actual internal triangle retained; independent outside vertices with at most3 permitted-neighborhood occurrences; stop first failure','counts':counts,'domains':domains,'failure':failure,'unknown':unknown,'elapsed_seconds':time.monotonic()-started,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
Path('evidence/challenger_tree_weighted_probe.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
