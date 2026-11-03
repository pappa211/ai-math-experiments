"""Freeze literal A3/A4 refutations; exact graph recursion for cone control."""
from pathlib import Path
from itertools import combinations
from functools import lru_cache
import json
W=Path(__file__).resolve().parents[1]
cs=json.loads((W/'evidence/track_a_controls.json').read_text())['records']
r=cs[1];t=r['cover_tests'][0]
a3={'candidate':'A3: some maximum eligible packing contains every unique actual private witness','status':'REFUTED_EXACT_AUXILIARY_ONLY','n':r['n'],'edges':r['edges'],'cover':t['cover'],'tau':7,'unique_red_edge':[4,6],'unique_private_witness':[4,6,8],'eligible_k':5,'eligible_packing':[[4,7,8],[2,4,6],[1,3,4],[2,3,7],[0,5,8]],'forced_unique_k':4,'forced_packing':[[4,6,8],[2,3,7],[1,4,7],[5,7,8]],'blocks':{'K5':[1,2,3,4,7],'K4':[0,5,7,8],'outside_triangles':[[2,4,6],[4,6,8],[4,7,8]]},'proof':'K5 and K4 are edge-disjoint and outside triangle468 is edge-disjoint from both, giving tau>=4+2+1=7; displayed C attains7. Forced468 blocks both other outside triangles, so at most2+1+1=4. The displayed five-packing is eligible. At most two outside triangles can be disjoint, so eligible_k<=2+1+2=5.'}
(W/'witnesses'/'track_a_unique_prepacking.json').write_text(json.dumps(a3,indent=2)+'\n')
a4=json.loads((W/'evidence/track_a_multiplicity_two.json').read_text())['witness']
n=a4['base_n'];adj=[0]*n
for u,v in a4['base_edges']:adj[u]|=1<<v;adj[v]|=1<<u
@lru_cache(None)
def alpha(mask):
    if not mask:return 0
    v=max((i for i in range(n) if mask>>i&1),key=lambda i:(adj[i]&mask).bit_count())
    return max(alpha(mask&~(1<<v)),1+alpha(mask&~(1<<v)&~adj[v]))
@lru_cache(None)
def matching(mask):
    if not mask:return ()
    v=(mask&-mask).bit_length()-1
    rest=mask&~(1<<v)
    best=matching(rest)
    neighbors=adj[v]&rest
    while neighbors:
        bit=neighbors&-neighbors;neighbors^=bit;u=bit.bit_length()-1
        trial=((v,u),)+matching(rest&~bit)
        if len(trial)>len(best):best=trial
        if 2*len(best)>=mask.bit_count()-1:break
    return best
assert alpha((1<<n)-1)==6
M=matching((1<<n)-1);assert len(M)==10
apex=n
P=[]
for i in range(6):
    p=tuple(sorted((i,(i+1)%6)));j=[tuple(x) for x in a4['pairs']].index(p)
    P.append([i,6+j,apex])
a4.update({'candidate':'A4: private multiplicity at most2 implies private packing at leastceil(tau/2)','status':'REFUTED_EXACT_AUXILIARY_ONLY','private_nu':6,'private_packing':P,'eligible_nu':10,'eligible_packing':[[u,v,apex] for u,v in M],'independent_alpha_solver':'vertex include/exclude recursion on the 21-vertex actual base graph','alpha_cache_states':alpha.cache_info().currsize,'proof':'Every cone triangle consists of a base edge and its two spokes because base H is triangle-free. Cone triangle-cover number equals the base vertex-cover number: any triangle cover using spokes S and other base edges converts to a base vertex cover of size no larger by choosing one endpoint from each remaining base edge. The exact alpha(H)=6 gives tau=21-6=15. Every private triangle uses one of six I spokes, so private_nu<=6; displayed packing attains6. A 10-edge base matching gives eligible_nu=10, optimal by the 21 spoke resources.'})
(W/'witnesses'/'track_a_private_multiplicity_two.json').write_text(json.dumps(a4,indent=2)+'\n')
print(json.dumps({'A3_witness':'witnesses/track_a_unique_prepacking.json','A4_witness':'witnesses/track_a_private_multiplicity_two.json','A4':{'tau':15,'eligible_nu':10,'private_nu':6,'alpha':6,'alpha_states':alpha.cache_info().currsize}}))
