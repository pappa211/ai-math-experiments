#!/usr/bin/env python3
"""Same internal core domain; tests maximum-cardinality/minimum-two-C restriction."""
import itertools,functools,time,json,datetime
from pathlib import Path
start=time.monotonic(); tested=0; choices=0; failure=None;first_bad_choice=None;unknown=[];domains=[]
def analyze(n,C,E):
    global choices,first_bad_choice
    E=sorted(E);idx={e:i for i,e in enumerate(E)};cm=sum(1<<idx[e] for e in C)
    T=[];tv=[];p2=[]
    for tri in itertools.combinations(range(n),3):
        es=list(itertools.combinations(tri,2))
        if all(e in idx for e in es):
            t=sum(1<<idx[e] for e in es)
            if not t&cm:return None
            T.append(t);tv.append(tri);p2.append((t&cm).bit_count()==2)
    if not T:return {'empty':True}
    full=(1<<len(T))-1;con=[sum(1<<j for j,t in enumerate(T) if t&x) for x in T]
    @functools.lru_cache(None)
    def opt(s):
        if not s:return (0,0)
        j=(s&-s).bit_length()-1
        a,b=opt(s&~con[j]);take=(a+1,b-p2[j]);skip=opt(s&~(1<<j))
        return max(take,skip)
    score=opt(full);packings=[]
    def enum(s,P):
        if time.monotonic()-start>7:raise TimeoutError
        if not s:packings.append(P);return
        j=(s&-s).bit_length()-1;best=opt(s);a,b=opt(s&~con[j])
        if (a+1,b-p2[j])==best:enum(s&~con[j],P+(j,))
        if opt(s&~(1<<j))==best:enum(s&~(1<<j),P)
    enum(full,())
    hit=[sum(1<<j for j,t in enumerate(T) if t>>e&1) for e in range(len(E))]
    te=[[e for e in range(len(E)) if t>>e&1] for t in T]
    @functools.lru_cache(None)
    def cov(s):
        if not s:return (0,())
        j=(s&-s).bit_length()-1;best=None
        for e in te[j]:
            val,es=cov(s&~hit[e]);ans=(val+1,(e,)+es)
            if best is None or ans[0]<best[0]:best=ans
        return best
    rows=[]
    for P in packings:
        choices+=1;S=0
        for j in P:S|=T[j]&cm
        remaining=full
        for e in range(len(E)):
            if S>>e&1:remaining&=~hit[e]
        tau,D=cov(remaining);one=sum(not p2[j] for j in P)
        rows.append({'packing':[tv[j] for j in P],'p1':one,'p2':len(P)-one,'forced_C_edges':[E[e] for e in range(len(E)) if S>>e&1],'residual_tau':tau,'residual_minimum_cover':[E[e] for e in D],'anchored':tau<=one})
    bad=[r for r in rows if not r['anchored']]
    data={'n':n,'edges':E,'C':C,'triangles':tv,'maximum_packing_size':score[0],'minimum_p2_among_maximum':-score[1],'all_extremal_packings':rows,'all_extremal_choices_fail':len(bad)==len(rows)}
    if bad and first_bad_choice is None:first_bad_choice=data
    return data if len(bad)==len(rows) else {'pass':True}
try:
 for name,C in [('path6',[(0,1),(1,2),(2,3),(3,4),(4,5)]),('double_star6',[(0,1),(0,2),(0,3),(1,4),(1,5)]),('fork_long_arm6',[(0,1),(0,2),(0,3),(3,4),(4,5)])]:
    n=6;extra=[e for e in itertools.combinations(range(n),2) if e not in C];row={'tree':name,'chord_masks_completed':0,'complete':False};domains.append(row)
    for mask in range(1<<len(extra)):
        E=set(C)|{e for j,e in enumerate(extra) if mask>>j&1};ans=analyze(n,C,E);row['chord_masks_completed']+=1
        if ans is None:continue
        tested+=1
        if ans.get('all_extremal_choices_fail'):
            failure=ans;failure['tree_name']=name;failure['chord_mask']=mask;raise StopIteration
    row['complete']=True
except StopIteration:pass
except TimeoutError:unknown.append({'reason':'internal7s','next_state':(name,mask)})
result={'target':'There exists an anchored packing among maximum-cardinality packings minimizing number of2-C triangles','same_corpus_as':'challenger_tree_anchor_probe','tested_valid_graphs':tested,'extremal_choices_checked':choices,'domains':domains,'failure':failure,'first_bad_extremal_choice_even_if_other_choices_succeed':first_bad_choice,'unknown':unknown,'elapsed_seconds':time.monotonic()-start,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
Path('evidence/challenger_tree_anchor_extremal_probe.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
