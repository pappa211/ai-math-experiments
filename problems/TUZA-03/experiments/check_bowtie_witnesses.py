#!/usr/bin/env python3
"""Independent finite edge checks for the published-in-draft bowtie witnesses.
This checks explicit local packings/covers, not the unbounded theorem.
"""
from itertools import combinations
from pathlib import Path
import json

def e(s): return frozenset(s)
def tri(s): return frozenset(e(x) for x in combinations(s,2))
def graph_tris(E):
    V=set().union(*E)
    return {tri(v) for v in combinations(sorted(V),3) if tri(v)<=E}
def graph(shared=False,identical=False,m=1,cross=()):
    P1='pq'; P2='pq' if identical else ('pr' if shared else 'rs')
    old={e(u+x) for U,P in [('vab',P1),('vcd',P2)] for u in U for x in P}
    old|={e(x) for x in (['ac','bd'][:m])}
    old|={e(x) for x in cross}
    added=set(tri('vab')|tri('vcd'))
    full=old|added
    return old, added, graph_tris(full)-graph_tris(old)
def assert_packing(P,full):
    T=[tri(x) for x in P]
    assert all(t<=full for t in T)
    assert all(a.isdisjoint(b) for a,b in combinations(T,2))
    return set().union(*T)
rows=[]
def check(name,old,added,F,Q,A,B,P,avoid):
    A={e(x) for x in A};B={e(x) for x in B}
    assert A<=old and A<=B
    assert all(t&B for t in F)
    used=assert_packing(Q,old|added)
    assert used&old<=A
    assert len(B)==2*len(Q)+1
    if P:
        used2=assert_packing(P,old|added)
        assert all(edge & set(avoid) or edge in A for edge in used2)
    rows.append({'case':name,'q':len(Q),'cover_size':len(B),'A_size':len(A),'full_new_triangles':len(F),'packing_verified':True,'covers_entire_new_family':True})
# Shared-apex cases, with all apex-only edges independently permitted.
for identical in [False,True]:
 for m in [0,1,2]:
  for mask in range(2 if identical else 8):
   candidates=['pq'] if identical else ['pq','pr','qr']
   cross=[x for i,x in enumerate(candidates) if mask>>i&1]
   old,added,F=graph(shared=True,identical=identical,m=m,cross=cross)
   r='q' if identical else 'r'
   if m==0 or (identical and m<=1):
    B={e(x) for x in ['vp','vq','v'+r,'ab','cd']}
    if m==1:B.add(e('ac'))
    assert len(B)<=5 and all(t&B for t in F)
    rows.append({'case':f'shared-small-identical={identical}-m={m}-mask={mask}','cover_size':len(B),'full_new_triangles':len(F),'covers_entire_new_family':True})
   else:
    if m==2:
     Q=['vac','vbd','abq','cd'+r];A=['ac','bd','aq','bq','c'+r,'d'+r,'vp'];B=A+['ab','cd']
    else:
     Q=['vac','abq','cdr','vbp'];A=['ac','aq','bq','cr','dr','vp','bp'];B=A+['vb','cd']
    P=['vcp','vaq','vbd','abp','cdq'] if identical else ['vac','abp','vbq','cdp','vdr']
    check(f'shared-identical={identical}-m={m}-mask={mask}',old,added,F,Q,A,B,P,'vabcd')
# Disjoint apices: all cross-apex subsets; individual apex pairs nonadjacent.
for m in [1,2]:
 for mask in range(16):
  cross=[x for i,x in enumerate(['pr','ps','qr','qs']) if mask>>i&1]
  old,added,F=graph(m=m,cross=cross)
  Q=['vac','abp','vbq','cdr','vds'];A=['ac','ap','bp','bq','vq','cr','dr','ds','vs']
  B=A+(['ab','cd'] if m==1 else ['vb','cd'])
  check(f'c9-m={m}-crossmask={mask}',old,added,F,Q,A,B,None,'')
  if m==2 and 'pr' in cross:
   Q=['vpr','vac','vbd','abq','cds'];A=['vp','vr','pr','ac','bd','aq','bq','cs','ds'];B=A+['ab','cd']
   P=['vpr','vac','abp','vbq','cdr','vds']
   check(f'double-mixed-pr-crossmask={mask}',old,added,F,Q,A,B,P,'vabcd')
result={'description':'Exhaustive optional local apex-edge checks of explicit witness lists; not a theorem proof','cases_checked':len(rows),'all_passed':True,'cases':rows}
out=Path(__file__).with_name('bowtie_witness_checks.json')
out.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='cases'}))
