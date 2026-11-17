"""Exact small facts for disjoint blocker restoration; no graph census.
Independent triples are reconstructed exhaustively from the frozen12 graphs.
The210 insertion optima are read from the separately accepted opening checker,
not re-solved or silently filtered by K4 completion. Two final4-packings are
checked directly against all actual edges of the corresponding graphs.
"""
from pathlib import Path
from itertools import combinations
from datetime import datetime,timezone
import hashlib,json,platform,sys,time
start=time.monotonic();root=Path(__file__).resolve().parents[1]
seed_path=root/'inputs/C12_frozen.json';opening_path=root/'evidence/opening_checks.json'
models=json.loads(seed_path.read_text());opening=json.loads(opening_path.read_text())
rows=[];triple_tests=0
for C in models:
 n=C['n'];E={tuple(e) for e in C['edges']}
 triples=[]
 for t in combinations(range(n),3):
  triple_tests+=1
  if all(tuple(e) not in E for e in combinations(t,2)):triples.append(t)
 neighborhoods={v:{w for w in range(n) if tuple(sorted((v,w))) in E} for v in range(n)}
 witness={v:[t for t in triples if set(t)<=N] for v,N in neighborhoods.items()}
 high=[v for v,W in witness.items() if W]
 assert len(high)<=1,(C['name'],high)
 rows.append({'model':C['name'],'n':n,'independent_triples':triples,'vertices_with_independent_neighborhood_triples':high,'neighborhood_triple_counts':{str(v):len(W) for v,W in witness.items()},'unique_high_vertex_is_universal':not high or len(neighborhoods[high[0]])==n-1})
 assert rows[-1]['unique_high_vertex_is_universal']
 assert C['name']!='central_K4_star_4' or not triples
ins=opening['insertions'];assert len(ins)==210
qual=[r for r in ins if 2*r['optimum']['nu']-r['optimum']['tau']==2]
assert len(qual)==4
assert all(r['model']=='central_K4_star_4' for r in qual)
assert {tuple(r['inserted']) for r in qual}=={(2,4),(2,5),(3,4),(3,5)}
assert all(r['optimum']['nu']==3 and r['optimum']['tau']==4 and r['critical_edges']==[r['inserted']] for r in qual)
C=next(C for C in models if C['name']=='central_K4_star_4');E={tuple(e) for e in C['edges']}
controls=[]
for S,P in [([(2,4),(3,5)],[(0,2,3),(0,4,5),(1,2,4),(1,3,5)]), ([(2,5),(3,4)],[(0,2,3),(0,4,5),(1,2,5),(1,3,4)])]:
 Q=E|set(S);used=set()
 for T in P:
  TE=set(combinations(T,2));assert TE<=Q and not used&TE;used|=TE
 controls.append({'restored_pair':S,'four_triangle_packing':P,'nu_lower_bound':4,'required_profile_nu':3,'verified_edge_disjoint':True})
out={'status':'VERIFIED_FINITE_NAMED_FACTS','utc':datetime.now(timezone.utc).isoformat(),'domain':'All C(n,3) vertex triples in each of exactly12 frozenC12; all210 accepted opening insertion rows filtered ONLY by exact defect2; both possible disjoint pairs of four qualifying nonedges.','triple_tests':triple_tests,'models':rows,'accepted_insertion_source':str(opening_path),'qualifying_insertion_rows':qual,'matching_pair_controls':controls,'sources':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [seed_path,opening_path]},'python':sys.version,'platform':platform.platform(),'elapsed_seconds':time.monotonic()-start,'threads':1}
p=root/'evidence/matching26_disjoint_named_facts.json';p.write_text(json.dumps(out,indent=2)+'\n')
print('triple_tests',triple_tests)
for r in rows:print(r['model'],len(r['independent_triples']),r['vertices_with_independent_neighborhood_triples'])
print('qualifying_internal_insertions',len(qual),'disjoint_pair_controls',len(controls))
print(p)
