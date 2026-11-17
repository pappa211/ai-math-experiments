#!/usr/bin/env python3
"""Independent literal Clebsch-cone refutation of C21-C.
No producer code, graph library, SAT or optimization solver is used.
"""
from itertools import combinations
from pathlib import Path
import datetime,hashlib,json,platform,resource,time
assert platform.system()=='Darwin'
start=time.monotonic()
V=[v for v in range(32) if v.bit_count()%2==0]
L={tuple(sorted((a,b))) for a,b in combinations(V,2) if (a^b).bit_count()==4}
assert len(V)==16 and len(L)==40
assert all(sum(v in e for e in L)==5 for v in V)
assert not [t for t in combinations(V,3) if all(e in L for e in combinations(t,2))]
U={0,3,5,9,17};S=set(V)-U
assert len(U)==5 and not any(set(e)<=U for e in L)
# Exhaustive independent-set verifier, separate from the ordinary alpha proof.
counts=[0]*17; all_max=[]
for mask in range(1<<16):
 if time.monotonic()-start>30:raise TimeoutError('30-second deadline')
 chosen={V[i] for i in range(16) if mask>>i&1}
 if not any(set(e)<=chosen for e in L):
  counts[len(chosen)]+=1
  if len(chosen)==5:all_max.append(sorted(chosen))
assert max(i for i,n in enumerate(counts) if n)==5
# Independently characterize all minimum cone covers by all 2^16 spoke complements W.
equality_W=[]
for mask in range(1<<16):
 chosen={V[i] for i in range(16) if mask>>i&1}
 internal=[e for e in L if set(e)<=chosen]
 if len(chosen)-len(internal)==5:
  equality_W.append(sorted(chosen))
  assert len(chosen)==5 and not internal
assert sorted(equality_W)==sorted(all_max) and len(equality_W)==16
neighborhoods={v:sorted(w for w in V if tuple(sorted((v,w))) in L) for v in V}
assert sorted(neighborhoods.values())==sorted(all_max)
for v,Uv in neighborhoods.items():
 for w in set(V)-set(Uv):
  degree_into=sum(tuple(sorted((w,u))) in L for u in Uv)
  assert degree_into==(5 if w==v else 2)
# Literal cone. Vertex32 is the apex; these masks are labels, not an interval graph.
apex=32; E=L|{(v,apex) for v in V}; W=V+[apex]
T=[t for t in combinations(W,3) if all(tuple(sorted(e)) in E for e in combinations(t,2))]
assert len(T)==40 and all(apex in t for t in T)
C={(v,apex) for v in S}
assert len(C)==11 and all(set(combinations(t,2))&C for t in T)
F=[t for t in T if len(set(combinations(t,2))&C)==1]
assert len(F)==25
assert all(len(set(t)&U)==1 for t in F)
# All full triangles use two distinct apex spokes; floor(16/2)=8 is an upper bound.
matching=[(v,v^15) for v in V if v<v^15]
assert len(matching)==8 and all(e in L for e in matching)
assert len(set().union(*(set(e) for e in matching)))==16
P=[tuple(sorted((*e,apex))) for e in matching]
# Independent backtracking constructs a private packing hitting all five U spokes.
Ulist=sorted(U)
def assign(i,used,chosen):
 if i==len(Ulist):return chosen
 u=Ulist[i]
 for s in sorted(S-used):
  if tuple(sorted((u,s))) in L:
   q=assign(i+1,used|{s},chosen+[tuple(sorted((u,s,apex)))])
   if q:return q
 return None
private_packing=assign(0,set(),[])
assert len(private_packing)==5 and all(t in F for t in private_packing)
all_private_packings={}
assert neighborhoods[30]==sorted(U)
for v,Uv in neighborhoods.items():
 translate=v^30
 Cv={(w,apex) for w in set(V)-set(Uv)}
 Pv=[tuple(sorted((t[0]^translate,t[1]^translate,apex))) for t in private_packing]
 assert all(t in T and len(set(combinations(t,2))&Cv)==1 for t in Pv)
 assert len(set().union(*(set(combinations(t,2)) for t in Pv)))==15
 all_private_packings[v]=Pv
for p in [P,private_packing]:
 assert len(set().union(*(set(combinations(t,2)) for t in p)))==3*len(p)
result={'status':'PASS','statement_refuted':'There exists a minimum ordinary triangle cover C with nu(F_C)>=ceil(|C|/2), where F_C contains all actual triangles with exactly one C-edge. This also refutes the universal-cover variant.','base_graph':'Even 5-bit masks, adjacent iff xor has weight4 (Clebsch)','base_vertices':V,'base_edges':sorted(L),'base_independence_histogram':counts,'all_minimum_cone_cover_spoke_complements':equality_W,'minimum_cone_cover_count':16,'every_minimum_cover_is_pure_spokes':True,'neighborhoods':neighborhoods,'all_maximum_independent_sets':all_max,'chosen_independent_set':sorted(U),'base_alpha':5,'apex':apex,'graph_edges':sorted(E),'all_triangles':T,'minimum_cover':sorted(C),'ordinary_tau':11,'tau_certificate':'Cone over triangle-free L: tau(cone L)=vertex_cover(L)=|V(L)|-alpha(L). Complete ordinary proof in review/book_clebsch_private_refutation.md.','full_packing':P,'full_nu':8,'full_nu_upper_bound':'Every cone triangle uses two distinct apex spokes; only16 exist.','private_triangles':F,'private_packing':private_packing,'private_5packings_for_all_16_minimum_covers':all_private_packings,'private_nu':5,'private_nu_upper_bound':'Each private triangle uses one of five apex-to-U spokes, so a packing has at most five.','required_lower_bound':6,'seed':None,'elapsed_seconds':time.monotonic()-start,'deadline_seconds':30,'peak_self_rss_bytes_Darwin':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,'run_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'python':platform.python_version(),'scope':'Ordinary proof plus independent finite certificate; no Lean verification and no Tuza counterexample.'}
Path('data/book_clebsch_private_certificate.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['status','base_alpha','ordinary_tau','full_nu','private_nu','required_lower_bound','private_packing','elapsed_seconds','peak_self_rss_bytes_Darwin']}))
