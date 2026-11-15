# Independent exhaustive literal verifier. Imports no discovery code or NetworkX.
from itertools import combinations
from pathlib import Path
import json, hashlib
E={tuple(map(int,s)) for s in ['01','04','06','12','15','16','23','25','35','36','45','46','56']}
T=[set(combinations(t,2)) for t in combinations(range(7),3) if set(combinations(t,2))<=E]
H={e for e in E if 1 not in e};TH=[t for t in T if t<=H]
X={v for e in E if 1 in e for v in e if v!=1};L={e for e in H if set(e)<=X}
def covers(edges,tris):
 for k in range(len(edges)+1):
  cs=[set(c) for c in combinations(sorted(edges),k) if all(set(c)&t for t in tris)]
  if cs:return k,cs
def pack(tris):
 for k in range(len(tris),-1,-1):
  ps=[p for p in combinations(range(len(tris)),k) if len(set().union(*(tris[j] for j in p)))==3*k]
  if ps:return k,ps
def vc(edges):
 for k in range(7):
  for s in combinations(range(7),k):
   if all(set(s)&set(e) for e in edges):return k,list(s)
th,ch=covers(H,TH);tg,cg=covers(E,T);ph,wh=pack(TH);pg,wg=pack(T)
lam=min(vc(L-c)[0] for c in ch)
assert th==ph==2 and tg==pg==3 and lam==2
assert ch==[{(3,5),(4,6)}]
assert len(T)==7 and len(TH)==4
result=dict(status='PASS',edges=sorted(E),triangles=[sorted(t) for t in T],apex=1,H_edges=sorted(H),link=sorted(L),tau_H=th,nu_H=ph,minimum_H_covers=[sorted(c) for c in ch],lambda_min=lam,tau_G=tg,nu_G=pg,G_cover=sorted({(0,6),(2,5),(5,6)}),G_packing=[sorted(T[j]) for j in wg[0]],script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
Path(__file__).resolve().parents[1].joinpath('evidence/apex_witness_verified.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2))
