"""Deterministic two-vertex induced restriction; no search for smaller graphs."""
from pathlib import Path
from functools import lru_cache
import json
W=Path(__file__).resolve().parents[1]
d=json.loads((W/'witnesses/track_a_private_multiplicity_two.json').read_text())
deleted=[6,7];keep=[v for v in range(d['n']) if v not in deleted];rel={v:i for i,v in enumerate(keep)}
edges=[(rel[u],rel[v]) for u,v in d['edges'] if u in rel and v in rel]
base=[(rel[u],rel[v]) for u,v in d['base_edges'] if u in rel and v in rel]
cover=[(rel[u],rel[v]) for u,v in d['cover'] if u in rel and v in rel]
n=19;apex=19

def match(es):
    adj=[0]*n
    for u,v in es:adj[u]|=1<<v;adj[v]|=1<<u
    @lru_cache(None)
    def rec(mask):
        if not mask:return ()
        v=(mask&-mask).bit_length()-1;rest=mask&~(1<<v);best=rec(rest);options=adj[v]&rest
        while options:
            b=options&-options;options^=b;u=b.bit_length()-1
            p=((v,u),)+rec(rest&~b)
            if len(p)>len(best):best=p
            if 2*len(best)>=mask.bit_count()-1:break
        return best
    return rec((1<<n)-1)
M=match(base);P=match([(u,v) for u,v in base if u<6 or v<6])
assert len(M)==9 and len(P)==6 and len(cover)==13
res={'candidate':'A4: private multiplicity at most2 implies private packing at leastceil(tau/2)','status':'REFUTED_EXACT_AUXILIARY_ONLY','n':20,'edges':edges,'cover':cover,'base_n':19,'base_edges':base,'independent_I':list(range(6)),'alpha_base':6,'tau_cone':13,'private_multiplicity':2,'private_nu':6,'private_packing':[[u,v,apex] for u,v in P],'eligible_nu':9,'eligible_packing':[[u,v,apex] for u,v in M],'source':'track_a_private_multiplicity_two.json','source_deleted_vertices':deleted,'old_to_new':rel,'proof':'The base is the induced restriction of the independently checked21-vertex base obtained by deleting pair-vertices6,7. Its independence number is at most6 by induced-subgraph monotonicity and at least6 from retained I, hence exactly6. Cone tau=19-6=13. Every red spoke retains exactly its two I-neighbor private triangles. Private packing is at most6 from I-spoke resources and displayed6packing attains6. Displayed base matching9 gives eligible/full packing9; floor(19/2)=9 is an upper bound. This is a deterministic reduction, not a global smallest-order claim.','attribution':'Coordinator proposed original Kneser construction and this induced restriction; Track A implemented directed seeded search and exact witness checks.'}
(W/'witnesses'/'track_a_private_multiplicity_two_reduced.json').write_text(json.dumps(res,indent=2)+'\n')
print(json.dumps({'n':20,'tau':13,'private_nu':6,'eligible_nu':9,'deleted':deleted}))
