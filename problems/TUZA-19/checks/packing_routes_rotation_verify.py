"""Exact rotation-ledger checks on fixed controls; not an all-graph census."""
from itertools import combinations,product
from collections import Counter,defaultdict
from pathlib import Path
import json,hashlib
ROOT=Path(__file__).resolve().parents[1]
def es(t):return set(combinations(sorted(t),2))
def tris(V,E):return [t for t in combinations(V,3) if es(t)<=E]
def analyse(P,ts):
    B=set().union(*(es(t) for t in P));assert len(B)==3*len(P)
    out=[]
    for t in P:
        pages=[q for q in ts if len(es(q)&B)==1 and es(q)&B<=es(t)]
        bases={next(iter(es(q)&B)) for q in pages}
        ty=len(bases);assert ty in (0,1,3)
        aps={next(iter(set(q)-set(t))) for q in pages}
        if ty==3:assert len(aps)==1 and len(pages)==3
        out.append({'type':ty,'pages':pages,'bases':bases,'apices':aps})
    return B,out

def test_graph(name,V,E,P):
    ts=tris(V,E);B,old=analyse(P,ts);candidates=defaultdict(list)
    for i,(t,data) in enumerate(zip(P,old)):
        if data['type']!=1:continue
        base=next(iter(data['bases']));x=next(iter(set(t)-set(base)))
        for z in data['apices']:candidates[x,z].append(i)
    rows=[]
    for (x,z),ids in candidates.items():
        for r in range(1,len(ids)+1):
            for selected in combinations(ids,r):
                S=set();Pnew=list(P)
                for i in selected:
                    base=next(iter(old[i]['bases']));S.update(base);Pnew[i]=tuple(sorted((*base,z)))
                F={tuple(sorted((x,u))) for u in S};A={tuple(sorted((z,u))) for u in S}
                Bnew,new=analyse(Pnew,ts)
                assert len(S)==2*r and Bnew==(B-F)|A and not A&B
                assert all(new[i]['type']==1 for i in selected)
                def completion(t,w):return w not in t and all(tuple(sorted((w,v))) in E-Bnew for v in t)
                predicted_new=[];predicted_lost=[];disrupted=[]
                for i,t in enumerate(P):
                    if i in selected:continue
                    if old[i]['type']==3:
                        w=next(iter(old[i]['apices']))
                        disruption=(w==z and bool(set(t)&S)) or (z in t and w in S)
                        if disruption:
                            assert x not in t;disrupted.append(i)
                            if not completion(t,x):predicted_lost.append(i)
                            if z in t:assert not completion(t,x)
                    else:
                        candidate=completion(t,x) if x not in t else any(completion(t,u) for u in S)
                        if candidate:predicted_new.append(i)
                actual_new=[i for i in range(len(P)) if old[i]['type']!=3 and new[i]['type']==3]
                actual_lost=[i for i in range(len(P)) if old[i]['type']==3 and new[i]['type']!=3]
                assert predicted_new==actual_new and predicted_lost==actual_lost
                rows.append({'x':x,'z':z,'selected_indices':selected,'endpoint_set':sorted(S),'created_indices':actual_new,'lost_indices':actual_lost,'disrupted_old_completions':disrupted})
    return {'name':name,'vertices':V,'edges':sorted(E),'triangles':ts,'packing':P,'old_types':[d['type'] for d in old],'rotations':rows}

controls=[]
V=[0,1,2,3,4,5,7];E=set(combinations(V,2))-{(0,5),(5,7),(1,3),(2,4)}
T=tris(V,E)
Ps=[q for q in combinations(T,4) if len(set().union(*(es(t) for t in q)))==12]
assert len(Ps)==50
for i,P in enumerate(Ps):controls.append(test_graph('old_block_maximum_'+str(i),V,E,P))
for n in range(1,8):
    # x,z,u,v=0,1,2,3; all later vertices private to one K4.
    V=list(range(4+2*n));E=es((0,2,3))|es((1,2,3));P=[(0,2,3)]
    for i in range(n):
        a,b=4+2*i,5+2*i;E|=es((1,2,a,b));P.append((2,a,b))
    c=test_graph('loss_fan_'+str(n),V,E,P)
    assert len(c['triangles'])==2+4*n and len(E)==5+5*n
    chosen=[r for r in c['rotations'] if r['x']==0 and r['z']==1 and r['selected_indices']==(0,)]
    assert len(chosen)==1 and len(chosen[0]['lost_indices'])==n and not chosen[0]['created_indices']
    C={(1,2),(2,3)}|{(4+2*i,5+2*i) for i in range(n)}
    assert len(C)==n+2 and all(es(t)&C for t in c['triangles'])
    c['fan_cover']=sorted(C);controls.append(c)
# These are fixed reviewed controls; no producer solver code is imported.
w=json.load(open(ROOT/'evidence/packing_routes/concentration_witness.json'))['padded']
V=w['vertices'];E=set(map(tuple,w['edges']));P=list(map(tuple,w['packing']))
controls.append(test_graph('padded_all_type1',V,E,P))
Pmix=list(P);Pmix[2]=(0,3,7)
controls.append(test_graph('padded_mixed',V,E,Pmix))
count=sum(len(c['rotations']) for c in controls)
result={'status':'PASS','control_graph_packings':len(controls),'rotation_instances':count,'control_scope':'All50 maxima of fixed old seven-vertex block, symbolic loss-fan instances n=1..7, and two reviewed padded concentration packings. No broader graph census or universal proof from these checks.','statement_sha256':hashlib.sha256((ROOT/'notes/packing_routes_page_rotation.md').read_bytes()).hexdigest(),'controls':controls}
(ROOT/'evidence/packing_routes/page_rotation_verified.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='controls'}))
