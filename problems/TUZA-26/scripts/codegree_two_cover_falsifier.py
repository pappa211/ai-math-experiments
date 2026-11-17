"""Targeted broad cover-only falsifier; not an unknown-core census.
Frozen domain: labels0,1 are a present edge, common neighbors exactly2,3.
Each outside vertex is adjacent to neither/0only/1only; all edges among2..n-1 arbitrary.
All actual triangles count. Isolates/background allowed. Stop at first witness.
"""
from pathlib import Path
from itertools import product,combinations
from functools import lru_cache
import sys,time,signal,json,hashlib,platform
w=Path(__file__).resolve().parents[1]; n=int(sys.argv[1]); budget=int(sys.argv[2]); start=time.monotonic(); signal.signal(signal.SIGALRM,lambda *_:(_ for _ in ()).throw(TimeoutError()));signal.alarm(budget)
assert platform.system()=='Darwin'
base={(0,1),(0,2),(1,2),(0,3),(1,3)}; rest=list(combinations(range(2,n),2)); expected=3**(n-4)*2**len(rest); tested=0;found=None;status='COMPLETE_NO_WITNESS_IN_DOMAIN'
def solve(E):
 edges=sorted(E); idx={e:i for i,e in enumerate(edges)}; triangles=[t for t in combinations(range(n),3) if all(e in E for e in combinations(t,2))]; masks=[sum(1<<idx[e] for e in combinations(t,2)) for t in triangles];hits=[sum(1<<j for j,m in enumerate(masks) if m>>i&1) for i in range(len(edges))]
 @lru_cache(None)
 def cover(s):
  if not s:return ()
  j=max((j for j in range(len(masks)) if s>>j&1),key=lambda j:sum((hits[i]&s).bit_count() for i in range(len(edges)) if masks[j]>>i&1))
  return min(((i,)+cover(s&~hits[i]) for i in range(len(edges)) if masks[j]>>i&1),key=len)
 full=(1<<len(triangles))-1; C=cover(full);rows=[]
 for t in ((0,1,2),(0,1,3)):
  te=set(combinations(t,2));s=full
  for e in te:s&=~hits[idx[e]]
  tail=cover(s);rows.append({'triangle':t,'residual_tau':len(tail),'cover_with_triangle':sorted(te|{edges[i] for i in tail})})
 return len(C),[edges[i] for i in C],rows,triangles
try:
 for adj in product(range(3),repeat=n-4):
  seed=set(base)
  for v,choice in enumerate(adj,4):
   if choice:seed.add((choice-1,v))
  for mask in range(1<<len(rest)):
   E=seed|{e for i,e in enumerate(rest) if mask>>i&1};tested+=1;tau,cover,rows,T=solve(E)
   if all(r['residual_tau']+3==tau for r in rows):
    found={'n':n,'edges':sorted(E),'triangles':T,'tau':tau,'cover':cover,'rows':rows};status='REFUTED_BROAD_COVER_ONLY_CANDIDATE';break
  if found:break
except TimeoutError:status='UNKNOWN_PARTIAL_TIMEOUT'
result={'status':status,'domain':'fixed edge01 with common neighbors exactly2,3; all labelled graphs on nvertices, isolates/background allowed; cover-only assertion, no packing/resilience assumptions','n':n,'expected_domain':expected,'tested':tested,'found':found,'elapsed_seconds':time.monotonic()-start,'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'python':sys.executable,'threads':1}
(w/f'evidence/codegree_two_cover_falsifier_n{n}.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items() if k not in ('found','script_sha256')}));print(json.dumps(found) if found else 'no witness')
