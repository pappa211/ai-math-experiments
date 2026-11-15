"""Independent finite controls for the two late structural addenda."""
from pathlib import Path
from itertools import combinations
from functools import lru_cache
import hashlib,json,time,resource
R=Path(__file__).resolve().parents[1];start=time.monotonic()
def solve(n,E):
    adj=[0]*n
    for u,v in E:adj[u]|=1<<v;adj[v]|=1<<u
    @lru_cache(None)
    def mu(V):
        if not V:return 0
        a=(V&-V).bit_length()-1;rest=V&~(1<<a)
        best=mu(rest);N=adj[a]&rest
        while N:
            bit=N&-N;N-=bit;best=max(best,1+mu(rest&~bit))
        return best
    def vc():
        return min(S.bit_count() for S in range(1<<n) if all(S>>u&1 or S>>v&1 for u,v in E))
    return mu,vc
cases=0
for mask in range(1<<10):
    base=list(combinations(range(5),2));E={e for i,e in enumerate(base) if mask>>i&1}
    if not E:continue
    mu,vc=solve(5,E);V=31;m=mu(V)
    blockers=[U for k in (1,2) for U in combinations(range(5),k) if mu(V&~sum(1<<u for u in U))<m]
    assert blockers;cases+=1
controls=[]
for name,n,E in [('C5',5,{tuple(sorted((v,(v+1)%5))) for v in range(5)}),('C7',7,{tuple(sorted((v,(v+1)%7))) for v in range(7)}),('two_C5',10,{tuple(sorted((b+v,b+(v+1)%5))) for b in (0,5) for v in range(5)})]:
    mu,cover=solve(n,E);m=mu((1<<n)-1);c=cover();assert c<=2*m-1
    if m>=3:assert c<=2*m-2
    controls.append({'graph':name,'matching':m,'vertex_cover':c})
files=['notes/A_CRITICAL_NONSATURATION.md','notes/B_FROZEN_ADDENDUM_1.md']
out={'status':'PASS','nonempty_five_vertex_graphs_with_blocker':cases,'triangle_free_controls':controls,'input_sha256':{f:hashlib.sha256((R/f).read_bytes()).hexdigest() for f in files},'elapsed_seconds':time.monotonic()-start,'peak_RSS_Darwin_bytes':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,'scope':'finite controls only; unbounded statements rest on ordinary proofs','independent_final_verification':'NOT_RUN'}
(R/'evidence/critic_addenda.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
