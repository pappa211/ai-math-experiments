#!/usr/bin/env python3
"""Existential internal anchor target, fixed small tree mechanisms."""
import itertools,functools,time,json,datetime
from pathlib import Path
start=time.monotonic();tested=0;failure=None;unknown=[];domains=[];controls=[]
def check(n,C,E,force_all=False):
    E=sorted(E);ix={e:i for i,e in enumerate(E)};cm=sum(1<<ix[e] for e in C)
    T=[];tr=[]
    for t in itertools.combinations(range(n),3):
        es=list(itertools.combinations(t,2))
        if all(e in ix for e in es):
            z=sum(1<<ix[e] for e in es)
            if not z&cm:return 'not_cover'
            T.append(z);tr.append(t)
    if not T:return {'empty':True}
    all_t=(1<<len(T))-1;hit=[sum(1<<j for j,t in enumerate(T) if t>>e&1) for e in range(len(E))]
    te=[[e for e in range(len(E)) if t>>e&1] for t in T]
    con=[sum(1<<j for j,t in enumerate(T) if t&u) for u in T]
    @functools.lru_cache(None)
    def cover(s,k):
        if not s:return ()
        if not k:return None
        j=(s&-s).bit_length()-1
        for e in te[j]:
            z=cover(s&~hit[e],k-1)
            if z is not None:return (e,)+z
        return None
    tested_packings=0;solutions=[]
    def visit(s,chosen,used):
        nonlocal tested_packings
        if time.monotonic()-start>7:raise TimeoutError
        if chosen:
            tested_packings+=1;forced=used&cm;left=all_t
            fidx=[e for e in range(len(E)) if forced>>e&1]
            for e in fidx:left&=~hit[e]
            ans=cover(left,2*len(chosen)-len(fidx))
            if ans is not None:
                solutions.append({'packing':[tr[j] for j in chosen],'forced_C_edges':[E[e] for e in fidx],'cover':sorted(set(E[e] for e in fidx+list(ans))),'packing_size':len(chosen)})
                if not force_all:return True
        while s:
            bit=s&-s;s^=bit;j=bit.bit_length()-1
            if visit(s&~con[j],chosen+(j,),used|T[j]) and not force_all:return True
        return False
    visit(all_t,(),0)
    if solutions:return {'solutions':solutions[:10],'tested_packings':tested_packings}
    return {'failure':True,'n':n,'edges':E,'C':C,'triangles':tr,'packing_subsets_exhausted':tested_packings,'certificate':'Every nonempty edge-disjoint triangle subset visited; each exact forced-cover recursion rejected budget2|I|-|C∩E(I)|'}
controls.append({'name':'K4 path3','result':check(4,[(0,1),(1,2),(2,3)],set(itertools.combinations(range(4),2)),True)})
try:
 for name,C in [('path6',[(0,1),(1,2),(2,3),(3,4),(4,5)]),('double_star6',[(0,1),(0,2),(0,3),(1,4),(1,5)]),('fork_long_arm6',[(0,1),(0,2),(0,3),(3,4),(4,5)])]:
    n=6;extra=[e for e in itertools.combinations(range(n),2) if e not in C];row={'tree':name,'chord_masks_completed':0,'complete':False};domains.append(row)
    for mask in range(1<<len(extra)):
        E=set(C)|{e for j,e in enumerate(extra) if mask>>j&1};ans=check(n,C,E)
        row['chord_masks_completed']+=1
        if ans=='not_cover':continue
        tested+=1
        if ans.get('failure'):
            failure=ans;failure['tree_name']=name;failure['chord_mask']=mask;raise StopIteration
    row['complete']=True
except StopIteration:pass
except TimeoutError:unknown.append({'reason':'internal7s','next_state':(name,mask)})
result={'target':'For every internal graph H covered by spanning tree C, some triangle packing I has internal cover D containing C∩E(I), |D|≤2|I|','tested_tree_covered_graphs':tested,'domains':domains,'controls':controls,'failure':failure,'unknown':unknown,'elapsed_seconds':time.monotonic()-start,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
Path('evidence/challenger_tree_anchor_probe.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
