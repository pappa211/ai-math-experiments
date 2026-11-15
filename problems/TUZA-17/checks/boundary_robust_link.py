"""Targeted 11-vertex LINK helper falsification; not an H/AC census."""
import itertools,json,random,time,resource
from pathlib import Path
start=time.monotonic(); rng=random.Random(171104)
n=11; pairs=list(itertools.combinations(range(n),2)); ix={e:i for i,e in enumerate(pairs)}
submasks=[]
for S in itertools.combinations(range(n),5):
    submasks.append((S,sum(1<<ix[e] for e in itertools.combinations(S,2))))
base={tuple(sorted((i,(i+1)%n))) for i in range(n)}
count=eligible=0; best=-1; witness=None; histogram={}
while time.monotonic()-start<25:
    E=set(base); adj=[set() for _ in range(n)]
    for u,v in E:adj[u].add(v);adj[v].add(u)
    order=pairs[:];rng.shuffle(order)
    for u,v in order:
        if (u,v) not in E and len(adj[u])<4 and len(adj[v])<4 and not(adj[u]&adj[v]):
            E.add((u,v));adj[u].add(v);adj[v].add(u)
    eb=sum(1<<ix[e] for e in E)
    counts=[(eb&sm).bit_count() for S,sm in submasks]
    low=min(counts);count+=1
    histogram[str(low)]=histogram.get(str(low),0)+1
    if low>=1:eligible+=1
    if low>best:
        best=low;witness={'edges':sorted(E),'minimum_induced_edges_on_five_vertices':low,'single_edge_five_sets':[list(S) for (S,sm),c in zip(submasks,counts) if c==1]}
    if low>=2:break
out={'target':'Find Hamiltonian triangle-free 11-vertex link with alpha=4 and no vertex-cover-critical edge; helper falsification only','seed':171104,'generated':count,'alpha_four_cases':eligible,'histogram_minimum_five_set_edge_count':histogram,'best':witness,'found_helper_counterexample':best>=2,'runtime_seconds':time.monotonic()-start,'rss_bytes':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,'scope':'NOT a full eligible H realization, NOT an AC counterexample; Hamiltonian cycle certifies factor-criticality and matching5. Five-set enumeration certifies alpha<=4; triangle-freeness gives alpha>=4 by elementary R(3,4)=9 proof.'}
Path('evidence/boundary_robust_link.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
