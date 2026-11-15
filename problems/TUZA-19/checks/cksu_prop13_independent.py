"""Independent literal K5 audit of CKSU arXiv:2001.00257v2 Proposition13.
Written from the primary PDF and the supplied five-vertex witness; no producer
finding, checker, or stored output is imported. No conclusion about Theorem2.
"""
from itertools import combinations, product
from fractions import Fraction
from datetime import datetime, timezone
from pathlib import Path
from hashlib import sha256
import json,platform,sys
START=datetime.now(timezone.utc);STOP=datetime(2026,11,15,9,23,58,tzinfo=timezone.utc)
assert START<STOP and platform.system()=='Darwin'
ROOT=Path(__file__).resolve().parents[1];OUT=ROOT/'evidence/cksu_source_audit'
V=range(5);E=set(combinations(V,2));T=tuple(combinations(V,3))
def edges(t):return set(combinations(t,2))
def packing(ps):return sum(len(edges(t)) for t in ps)==len(set().union(*(edges(t) for t in ps))) if ps else True
by_size={k:[ps for ps in combinations(T,k) if packing(ps)] for k in range(4)}
assert len(T)==10 and not by_size[3] and len(by_size[2])==15
P=((0,1,2),(0,3,4));assert P in by_size[2]
B=set().union(*(edges(p) for p in P))
def classify(P):
    pri={p:[] for p in P};dou=[]
    for t in T:
        if t in P:continue
        conflict=[p for p in P if edges(t)&edges(p)]
        if len(conflict)==1:pri[conflict[0]].append(t)
        elif len(conflict)==2:dou.append(t)
        else:raise AssertionError('Unclassified actual triangle')
    bases={p:set().union(*(edges(t)&edges(p) for t in pri[p])) for p in P}
    return pri,dou,bases
pri,dou,bases=classify(P)
assert pri[P[0]]==[(1,2,3),(1,2,4)] and pri[P[1]]==[(1,3,4),(2,3,4)]
assert bases[P[0]]=={(1,2)} and bases[P[1]]=={(3,4)}
t=(0,1,3);assert t in dou
failure_rows=[]
for ps in by_size[2]:
    pr,ds,bs=classify(ps)
    assert all(len(bs[p])==1 and len(pr[p])==2 for p in ps)
    for q in ds:
        case1=any(bs[p]&edges(q) for p in ps)
        case2=any(len(pr[p])==1 and bool((set(pr[p][0])-set(p))&set(q)) for p in ps)
        case3_possible=all(len(pr[p])==1 for p in ps)
        assert not case1 and not case2 and not case3_possible
        failure_rows.append({'packing':ps,'residual':q,'private_counts':[len(pr[p]) for p in ps],'base_edges':[sorted(bs[p]) for p in ps],'conclusions_1_2_3':[False,False,False]})
assert len(failure_rows)==60
swaps=[]
for x,y in product(pri[P[0]],pri[P[1]]):
    swaps.append({'private_first':x,'private_second':y,'first_intersection_residual':sorted(edges(x)&edges(t)),'second_intersection_residual':sorted(edges(y)&edges(t)),'mutual_intersection':sorted(edges(x)&edges(y)),'is_three_packing':packing((t,x,y))})
assert all(not s['is_three_packing'] for s in swaps)
avoid=[s for s in swaps if not s['first_intersection_residual'] and not s['second_intersection_residual']]
assert len(avoid)==1 and avoid[0]['mutual_intersection']==[(2,4)]
# In this input Section3 has no type0, no type3, and no singleton-private type1.
f={e:Fraction(0) for e in E}
for p in P:
    for e in edges(p):f[e]=Fraction(1) if e in bases[p] else Fraction(1,3)
loads=[{'triangle':q,'load':[sum(f[e] for e in edges(q)).numerator,sum(f[e] for e in edges(q)).denominator]} for q in T]
uncovered=[r['triangle'] for r in loads if Fraction(*r['load'])<1]
assert set(uncovered)==set(dou) and len(uncovered)==4 and sum(f.values())==Fraction(10,3)
assert all(sum(Fraction(1,3) for e in edges(q))==1 for q in T)
for k in range(5):
    covers=[C for C in combinations(sorted(E),k) if all(set(C)&edges(q) for q in T)]
    if covers:break
assert k==4
FINISH=datetime.now(timezone.utc);assert FINISH<STOP
out={'status':'PASS_SCOPED_COUNTEREXAMPLE','started_utc':START.isoformat(),'finished_utc':FINISH.isoformat(),'host':platform.platform(),'python':sys.version,'script_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),'primary_pdf_sha256':sha256((OUT/'2001.00257v2.pdf').read_bytes()).hexdigest(),'label_map':{'0':'v','1':'a','2':'b','3':'c','4':'d'},'edges':sorted(E),'actual_triangles':T,'maximum_packing_number':2,'maximum_packings':by_size[2],'maximum_packing_upper_proof':'Three edge-disjoint triangles would leave one edge from K5; deleting triangle unions preserves even degrees, but a single edge has two odd endpoints.','packing':P,'packing_support':sorted(B),'private_pages':[{'packed':p,'pages':pri[p],'bases':sorted(bases[p])} for p in P],'doubly_attached':dou,'specified_residual':t,'swap_table':swaps,'proposition13_all_K5_failures':failure_rows,'lemma18':{'source_numbering':'Lemma18, not Proposition18','definition17_singleton_private_hypothesis_satisfied':False,'lend_arcs':[],'verdict':'K5 does not refute Lemma18; lend relation empty.'},'section3_printed_charging':{'edge_weights':[[e,[f[e].numerator,f[e].denominator]] for e in sorted(E)],'total':[10,3],'triangle_loads':loads,'uncovered':uncovered},'theorem_scope':{'K5_tau':4,'ordinary_cover':covers[0],'valid_third_integral_cover':'Assign 1/3 to every K5 edge; total10/3<=4.','claim':'No refutation of the main existential multicover theorem. Printed Proposition13 and Section3 procedure fail on this literal input.'}}
(OUT/'k5_independent_check.json').write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
print(json.dumps({'status':out['status'],'nu':2,'tau':4,'maximum_packings':15,'proposition13_failing_instances':60,'specified_avoiding_pages_shared_edge':avoid[0]['mutual_intersection'],'section3_uncovered':uncovered,'lemma18_refuted':False},sort_keys=True))
