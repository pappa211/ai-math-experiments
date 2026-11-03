"""Literal B9 refutation derived from immutable TUZA-13 cover-drop control."""
from pathlib import Path
from itertools import combinations
import json,time
ROOT=Path(__file__).resolve().parents[1]
start=time.monotonic()
edges=[(0,1),(0,2),(0,3),(0,4),(0,7),(0,8),(1,2),(1,3),(1,4),(1,5),(2,3),(2,5),(2,6),(2,8),(3,6),(3,7),(3,8),(4,5),(4,7),(5,6),(6,8)]
edges=sorted(edges);ei={e:i for i,e in enumerate(edges)}
triangles=[t for t in combinations(range(9),3) if all(e in ei for e in combinations(t,2))]
tm=[sum(1<<ei[e] for e in combinations(t,2)) for t in triangles]
def em(es):return sum(1<<ei[tuple(sorted(e))] for e in es)
def el(m):return [e for i,e in enumerate(edges) if (m>>i)&1]
D=em([(0,3),(0,4),(1,2),(1,5),(2,5),(2,8),(3,6)])
F=em([(1,3),(0,7),(0,2),(1,4),(3,8),(2,6)])
Q=(1,2,5);Qm=tm[triangles.index(Q)];e=(1,2);C=F|em([e])
assert len(triangles)==16 and all(D&t for t in tm) and all(C&t for t in tm)
assert [triangles[i] for i,t in enumerate(tm) if not F&t]==[Q]
assert [triangles[i] for i,t in enumerate(tm) if (C&t)==em([e])]==[Q]
# Independent full cover lower bound: reject every six-edge candidate.
full_rejected=0
for chosen in combinations(range(len(edges)),6):
    m=sum(1<<i for i in chosen)
    assert not all(m&t for t in tm)
    full_rejected+=1
assert D.bit_count()==C.bit_count()==7
# Deleting all three Q edges leaves D\Q as a four-cover; reject all triples.
residual=[t for t in tm if not t&Qm]
remaining=[i for i in range(len(edges)) if not (Qm>>i)&1]
residual_cover=D&~Qm
assert residual_cover.bit_count()==4 and all(residual_cover&t for t in residual)
residual_rejected=0
for chosen in combinations(remaining,3):
    m=sum(1<<i for i in chosen)
    assert not all(m&t for t in residual)
    residual_rejected+=1
# Exact eligible packing for the recolored optimum, tiny complete recursion.
allowed=[i for i,t in enumerate(tm) if (C&t).bit_count()<3]
best=[]
def dfs(pos,used,chosen):
    global best
    if len(chosen)+len(allowed)-pos<=len(best):return
    if pos==len(allowed):best=chosen[:];return
    i=allowed[pos]
    if not used&tm[i]:dfs(pos+1,used|tm[i],chosen+[i])
    dfs(pos+1,used,chosen)
dfs(0,0,[])
C_packing=best
allowed=[i for i,t in enumerate(tm) if not t&Qm]
best=[]
dfs(0,0,[])
residual_packing=best
best=C_packing
out={'candidate':'B9 frozen in notes/TRACK_B.md before tests','status':'REFUTED_EXACT_AUXILIARY','source_control':'TUZA-13 witnesses/theory_tau_drop.json and notes/STRUCTURAL_ATTACK.md','n':9,'edges':edges,'triangles':triangles,'tau':7,'all_red_optimum_D':el(D),'almost_cover_F':el(F),'unique_witness_optimum_C':el(C),'unique_private_edge':e,'unique_private_triangle':Q,'residual_tau':4,'residual_cover':el(residual_cover),'residual_nu':len(residual_packing),'residual_packing':[triangles[i] for i in residual_packing],'full_six_covers_rejected':full_rejected,'residual_three_covers_rejected':residual_rejected,'eligible_k_C':len(best),'eligible_packing_C':[triangles[i] for i in best],'C_red_counts':[(C&t).bit_count() for t in tm],'elapsed_seconds':time.monotonic()-start,'scope':'An auxiliary deletion/exchange failure, not a counterexample to S or E.'}
(ROOT/'evidence'/'track_b_unique_deletion_refutation.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:out[k] for k in ['status','tau','residual_tau','residual_nu','full_six_covers_rejected','residual_three_covers_rejected','eligible_k_C','elapsed_seconds']}))
