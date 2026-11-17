"""Replay existing complete insertion rows; verify the sharp local cap control."""
from apex_exact import Solver,edge,clique
from pathlib import Path
from collections import Counter
import hashlib,json,time
start=time.time(); root=Path(__file__).resolve().parents[1]
if not (root/'evidence/apex_simplicial_internal_checks.json').exists():
 root=Path('problems/TUZA-26')
p=root/'evidence/apex_simplicial_internal_checks.json'; data=json.loads(p.read_text())
seedpath=Path(data['source']);seeds={s['name']:s for s in json.loads(seedpath.read_text())}
critical=[]
for row in data['rows']:
 if len(row['critical_A_edges'])!=3:continue
 c=row['apex_c']; deg=sum(c in e for e in seeds[row['seed']]['edges'])
 critical.append(dict(row,degree_c_in_C=deg))
assert len(data['rows'])==326 and len(critical)==105
assert {2*r['nu_J']-r['tau_J'] for r in critical}=={3}
deg3=[r for r in critical if r['degree_c_in_C']==3]
assert len(deg3)==5 and {r['seed'] for r in deg3}=={'W5'}
E={edge(i,(i+1)%5) for i in range(5)}|{edge(5,i) for i in range(5)}|{edge(0,2)}
s=Solver(E); cert=s.certificate()
assert (cert['nu'],cert['tau'])==(3,3)
assert all(s.nu([e])==2 for e in clique([0,1,2]))
u,v=6,7
Q=E|{edge(u,t) for t in [0,1,2,3,v]}|{edge(v,t) for t in [0,2,4]}
packing=[(u,0,1),(u,2,3),(v,0,2),(5,1,2),(5,3,4)]
used=set()
for t in packing:
 f=clique(t);assert f<=Q and not f&used;used|=f
r={'status':'VERIFIED_SCOPED_CONTROL_AND_EXISTING_TABLE_PROJECTION','source_complete_table':str(p),'table_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'source_seeds':str(seedpath),'seed_sha256':hashlib.sha256(seedpath.read_bytes()).hexdigest(),'counts':{'all_inserted_triangle_presentations':326,'wholly_critical_inserted_triangle_presentations':105,'distinct_critical_insertions':len({(r['seed'],tuple(r['inserted'])) for r in critical}),'degree_three_critical_apices':5},'critical_presentations':critical,'degree_three_presentations':deg3,'W5_chord_control':cert,'forced_restoration':{'edges':sorted(Q),'five_packing':packing,'required_packing_in_hypothesis':4,'conclusion':'This literal restored candidate fails the required packing profile; not a Tuza counterexample.'},'seconds':time.time()-start}
print(json.dumps(r,indent=2))
