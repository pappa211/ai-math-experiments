#!/usr/bin/env python3
"""Independent literal challenge of frozen third-integral assignment.
No producer checker, result, or imported graph library. All local actual triples,
maximum packings, singleton orders, and triangle loads are checked exactly.
Weights are integer multiples of1/3 (represented by integers0..3).
"""
from itertools import combinations,permutations
from collections import Counter
from pathlib import Path
import datetime,hashlib,json,platform
assert platform.system()=='Darwin'
ROOT=Path(__file__).resolve().parents[1]
INP=ROOT/'evidence/cksu_order3_fresh/input_statement.md'
EXPECTED='a0a8b8a2c8cdf3e0c028661bef9ce51c7586b13ffaed695ea99aa02ffe2c7ab9'
assert hashlib.sha256(INP.read_bytes()).hexdigest()==EXPECTED

def edge(u,v):return tuple(sorted((u,v)))
def edges(vs):return set(combinations(sorted(vs),2))
def triangles(vs,es):return tuple(t for t in combinations(sorted(vs),3) if edges(t)<=es)
def maximum_packings(ts):
    universe=sorted(set().union(*(edges(t) for t in ts))) if ts else []
    ids={e:i for i,e in enumerate(universe)}
    masks=[sum(1<<ids[e] for e in edges(t)) for t in ts]
    best=-1;out=[]
    def visit(start,used,chosen):
        nonlocal best,out
        if len(chosen)>best:best=len(chosen);out=[tuple(chosen)]
        elif len(chosen)==best:out.append(tuple(chosen))
        for j in range(start,len(ts)):
            if not used&masks[j]:visit(j+1,used|masks[j],chosen+[ts[j]])
    visit(0,0,[])
    return best,out

global_counts=Counter();case_counts=Counter();credit_counts=Counter();examples={}
def inspect(es,vs,P,label,keep=False):
    ts=triangles(vs,es);P=tuple(sorted(P));B=set().union(*(edges(t) for t in P)) if P else set()
    owner={e:t for t in P for e in edges(t)}
    assert len(owner)==3*len(P)
    pages={t:[] for t in P};bases={t:set() for t in P};tips={t:set() for t in P}
    attachments={}
    for t in ts:
        if t in P:continue
        inter=edges(t)&B
        assert inter
        owners={owner[e] for e in inter};assert len(owners)==len(inter)
        attachments[t]=(inter,owners)
        if len(inter)==1:
            b=next(iter(inter));p=owner[b];pages[p].append(t);bases[p].add(b)
            tips[p].add(next(iter(set(t)-set(b))))
    typ={p:len(bases[p]) for p in P}
    assert set(typ.values())<={0,1,3}
    for p in P:
        if typ[p]==3:
            assert len(pages[p])==3 and len(tips[p])==1
            z=next(iter(tips[p]));assert edges((*p,z))<=es
            assert all((edges(t)-edges(p)).isdisjoint(B) for t in pages[p])
    exceptional=set()
    for p in P:
        if typ[p]!=1 or len(tips[p])!=2:continue
        pb=next(iter(bases[p]));v=next(iter(set(p)-set(pb)));qt=tuple(sorted((v,*tips[p])))
        if qt not in P or typ[qt]!=1:continue
        if bases[qt]!={tuple(sorted(tips[p]))} or tips[qt]!=set(pb):continue
        nodes=set(p)|set(qt);assert len(nodes)==5 and edges(nodes)<=es
        cross=edges(nodes)-(edges(p)|edges(qt));assert cross.isdisjoint(B) and len(cross)==4
        exceptional.add(tuple(sorted((p,qt))))
    membership=Counter(p for pq in exceptional for p in pq)
    assert all(k==1 for k in membership.values())
    for t,(inter,owners) in attachments.items():
        if len(inter)!=2:continue
        p,q=sorted(owners,key=lambda z:typ[z]);pt,qt=typ[p],typ[q]
        if pt==0:case_counts['double_type0']+=1;continue
        if pt==qt==3:raise AssertionError(('forbidden33',label,t,P))
        c1=bool(inter&(bases[p]|bases[q]))
        if (pt,qt)==(1,3):
            c1=bool(inter&bases[p])
            c2=len(pages[p])==1 and bool(tips[p]&set(t))
            assert c1 or c2
            if not c1:
                assert (edges(t)-B)<=edges(pages[p][0])
            case_counts['double13_base' if c1 else 'double13_singleton']+=1
            continue
        assert pt==qt==1
        common=set(p)&set(q);assert len(common)==1
        v=next(iter(common))
        c2=any(len(pages[z])==1 and bool(tips[z]&set(t)) for z in (p,q))
        c3=(len(pages[p])==len(pages[q])==1 and v in next(iter(bases[p]))
            and v in next(iter(bases[q])) and tips[p]==tips[q])
        c4=tuple(sorted((p,q))) in exceptional
        assert c1 or c2 or c3 or c4,('missing11',label,t,P,bases,tips)
        k=1 if c1 else 2 if c2 else 3 if c3 else 4
        case_counts['double11_case'+str(k)]+=1
        if c4:assert edges(t)<=edges(set(p)|set(q))
    singletons=[p for p in P if typ[p]==1 and len(pages[p])==1]
    orders=list(permutations(singletons))
    lo_mass=None;hi_mass=None;min_load=99
    for order in orders:
        f={e:0 for e in es};origins={};record=Counter()
        def nonpacked(e,why):
            assert e not in B
            if f[e]:
                assert f[e]==1
                for old in origins[e]:record['overlap_'+old+'_'+why]+=1
            f[e]=1;origins.setdefault(e,set()).add(why)
        for p in P:
            if typ[p]==0:
                for e in edges(p):assert f[e]==0;f[e]=2
            elif typ[p]==3:
                z=next(iter(tips[p]))
                for e in edges((*p,z)):
                    if e in B:assert e in edges(p) and f[e]==0;f[e]=1
                    else:nonpacked(e,'type3')
        for p,q in sorted(exceptional):
            before=sum(f.values());bs=bases[p]|bases[q]
            for e in edges(p)|edges(q):assert f[e]==0;f[e]=2 if e in bs else 1
            for e in edges(set(p)|set(q))-(edges(p)|edges(q)):nonpacked(e,'exceptional')
            assert sum(f.values())-before<=12
        for p in P:
            if typ[p]==1 and len(pages[p])>=2 and p not in membership:
                for e in edges(p):assert f[e]==0;f[e]=3 if e in bases[p] else 1
        for p in order:
            before=sum(f.values());base=next(iter(bases[p]));z=next(iter(tips[p]));v=next(iter(set(p)-set(base)))
            assert all(f[e]==0 for e in edges(p))
            f[base]=2
            for u in base:
                eu=edge(u,v);ep=edge(u,z)
                assert eu in B and ep not in B and f[eu]==0
                if not f[ep]:nonpacked(ep,'singleton');f[eu]=1
                else:
                    assert f[ep]==1
                    for old in origins[ep]:record['singleton_reuses_'+old]+=1
                    f[eu]=2
            assert sum(f.values())-before==6
        assert set(f.values())<={0,1,2,3}
        assert all(f[e]>=1 for e in B)
        assert all(f[e] in (0,1) for e in es-B)
        loads=[sum(f[e] for e in edges(t)) for t in ts]
        assert all(x>=3 for x in loads),(label,P,order,[(t,x) for t,x in zip(ts,loads) if x<3])
        mass=sum(f.values());assert mass<=6*len(P),(label,P,order,mass)
        lo_mass=mass if lo_mass is None else min(lo_mass,mass)
        hi_mass=mass if hi_mass is None else max(hi_mass,mass)
        min_load=min(min_load,min(loads,default=3))
        global_counts['assignments_singleton_orders']+=1;credit_counts.update(record)
        if keep and label not in examples:
            examples[label]={'vertices':sorted(vs),'edges':sorted(es),'triangles':ts,'packing':P,
                'types':{str(p):typ[p] for p in P},'private_pages':{str(p):pages[p] for p in P},
                'exceptional_pairs':sorted(exceptional),'singleton_order':order,
                'weights_in_thirds':{str(e):v for e,v in sorted(f.items())},'total_weight_in_thirds':mass,
                'triangle_loads_in_thirds':{str(t):x for t,x in zip(ts,loads)},'credit_events':dict(record)}
    global_counts['maximum_packings_checked']+=1
    global_counts['exceptional_pairs_checked']+=len(exceptional)
    return {'orders':len(orders),'mass_range_in_thirds':[lo_mass,hi_mass],'minimum_triangle_load_in_thirds':min_load}

# Exhaust all six-vertex completions of p=012,q=034,t=013, retaining
# exactly those where the prescribed two-packing is globally maximum.
vs=range(6);P=((0,1,2),(0,3,4));fixed=edges(P[0])|edges(P[1])|edges((0,1,3))
free=sorted(edges(vs)-fixed);assert len(free)==8
eligible=0
for mask in range(1<<len(free)):
    es=fixed|{e for i,e in enumerate(free) if mask>>i&1}
    ts=triangles(vs,es);nu,ps=maximum_packings(ts)
    if nu==2:
        eligible+=1;inspect(es,vs,P,'six_vertex_mask_'+str(mask))
assert eligible>0

# Fixed controls: all maximum packings and every singleton processing order.
controls=[]
controls.append(('K5',set(range(5)),edges(range(5)),((0,1,2),(0,3,4))))
# Two exceptional K5 pairs overlap at nonpacked edge13; K4 and diamond share
# the same edge to exercise type3/exceptional/singleton credit reuse.
es=edges((0,1,2,3,4))|edges((1,3,5,6,7))|edges((1,3,8,9))
es|=edges((3,10,11))|edges((1,3,10))
prescribed=((0,1,2),(0,3,4),(1,5,6),(3,5,7),(3,8,9),(3,10,11))
controls.append(('overlapping_exceptional_type3_singleton',set(range(12)),es,prescribed))
# Singleton/singleton common-tip case3.
es=edges((0,1,2))|edges((0,3,4))|edges((0,2,5))|edges((0,4,5))|edges((0,1,3))
controls.append(('singleton_shared_tip',set(range(6)),es,((0,1,2),(0,3,4))))
# Mixed type1/type3: p's unique tip occurs in both doubly-attached triangles.
es=edges((0,1,2))|edges((0,3,4,5))|edges((1,2,3))
controls.append(('mixed_type1_type3',set(range(6)),es,((0,1,2),(0,3,4))))
control_results=[]
for name,vs,es,prescribed in controls:
    ts=triangles(vs,es);nu,ps=maximum_packings(ts)
    assert any(set(P)==set(prescribed) for P in ps),(name,nu,prescribed)
    prescribed_result=inspect(es,vs,prescribed,name,True)
    for P in ps:inspect(es,vs,P,name+'_allmax')
    control_results.append({'name':name,'vertices':len(vs),'edges':len(es),'triangles':len(ts),'nu':nu,
                            'maximum_packing_count':len(ps),'prescribed_result':prescribed_result})
for k in ('double11_case1','double11_case2','double11_case3','double11_case4','double13_singleton'):
    assert case_counts[k]>0,(k,case_counts)
assert credit_counts['overlap_exceptional_exceptional']>0
assert credit_counts['singleton_reuses_exceptional']>0
assert credit_counts['singleton_reuses_type3']>0
assert credit_counts['singleton_reuses_singleton']>0
result={'status':'PASS independent fixed/control and bounded endpoint verification',
 'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'host':platform.platform(),
 'input_sha256':EXPECTED,'verifier_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
 'six_vertex_completion_domain':256,'six_vertex_prescribed_maximum_cases':eligible,
 'counts':dict(global_counts),'double_triangle_cases':dict(case_counts),'credit_interactions':dict(credit_counts),
 'fixed_controls':control_results,'literal_examples':examples,
 'scope':'All256 completions of one prescribed six-vertex two-packing/double triangle; all maximum packings of four fixed controls and all singleton orders. Not a graph census or proof beyond the separately reconstructed ordinary argument.'}
out=ROOT/'evidence/cksu_order3_fresh/verification.json';out.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ('status','six_vertex_completion_domain','six_vertex_prescribed_maximum_cases','counts','double_triangle_cases','credit_interactions','fixed_controls')},indent=2))
