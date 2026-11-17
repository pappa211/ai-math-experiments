"""Literal wheel control; no imported producer code or numerical solver."""
import itertools,json,platform,datetime,time
from pathlib import Path
start=time.monotonic()
w=Path(__file__).resolve().parents[1]
clock=json.loads((w/'operations/clock.json').read_text())
assert platform.system()=='Darwin'
assert datetime.datetime.now(datetime.timezone.utc)<datetime.datetime.fromisoformat(clock['research_cutoff_utc'])
edge=lambda a,b:tuple(sorted((a,b)))
E=set(edge(0,x) for x in range(1,6))|set(map(lambda x:edge(*x),[(1,2),(2,5),(5,4),(4,3),(3,1)]))
tri=lambda t:frozenset(itertools.combinations(t,2))
Ts=[t for t in itertools.combinations(range(6),3) if tri(t)<=E]
P=[(0,1,2),(0,3,4)]
B=set().union(*(tri(t) for t in P))
def packs(q):return len(set().union(*(tri(t) for t in q)))==3*len(q)
allp=[list(q) for r in range(len(Ts)+1) for q in itertools.combinations(Ts,r) if packs(q)]
nu=max(map(len,allp))
priv={str(t):[q for q in Ts if q not in P and len(tri(q)&B)==1 and tri(q)&B<=tri(t)] for t in P}
R={next(iter(tri(q)&B)) for qs in priv.values() for q in qs}
residual=[{'triangle':t,'clause':sorted(tri(t)&B)} for t in Ts if not tri(t)&R]
cs=[set(q) for r in range(len(B)+1) for q in itertools.combinations(sorted(B),r) if all(set(q)&tri(t) for t in Ts)]
c=min(map(len,cs))
ordinary=[set(q) for r in range(len(E)+1) for q in itertools.combinations(sorted(E),r) if all(set(q)&tri(t) for t in Ts)]
tau=min(map(len,ordinary))
assert nu==2 and c==3 and tau==3
assert Ts==[(0,1,2),(0,1,3),(0,2,5),(0,3,4),(0,4,5)]
assert R=={(0,2),(0,4)}
assert residual==[{'triangle':(0,1,3),'clause':[(0,1),(0,3)]}]
assert (1,5) not in E and (3,5) not in E
out={'status':'FINITE_CERTIFICATE','scope':'Refutes only the provisional lender-or-K5-only description of residual pair clauses; PK succeeds.','n':6,'edges':sorted(E),'triangles':Ts,'packing':P,'nu':nu,'private_pages':priv,'bases':sorted(R),'absent_gains':[(1,5),(3,5)],'residual':residual,'c_original':c,'ordinary_tau':tau,'cover':[(0,1),(0,2),(0,4)],'all_maximum_packings':[q for q in allp if len(q)==nu],'python':platform.python_version(),'host':platform.system(),'elapsed_seconds':time.monotonic()-start,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
(w/'data/pk_wheel_pair_control.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'nu':nu,'c':c,'tau':tau,'triangles':len(Ts),'elapsed_seconds':out['elapsed_seconds']}))
