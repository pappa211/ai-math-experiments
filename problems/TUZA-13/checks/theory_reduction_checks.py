#!/usr/bin/env python3
from pathlib import Path
from itertools import combinations
import json,fcntl,time
from core import Graph,bits
W=Path(__file__).resolve().parents[1]
def main():
 a=json.loads((W/'witnesses/theory_tau_drop.json').read_text())
 rest=[(0,1),(0,2),(0,3),(0,4),(0,7),(1,2),(1,3),(1,4),(1,5),(2,3),(2,5),(2,6),(3,6),(3,7),(4,5),(4,7),(5,6)]
 inputs=[('K4',4,list(combinations(range(4),2)),None),('K5',5,list(combinations(range(5),2)),None),('restoration8',8,rest,None),('auxiliary_tau_drop',9,a['input']['edges'],a['minimum_C'])]
 out={'ordinary_lemmas':'red subset deletion; eligible restriction; tau critical iff edge in some minimum cover','graphs':[]}
 with (W/'evidence/compute.lock').open('a+') as lock:
  fcntl.flock(lock,fcntl.LOCK_EX);start=time.monotonic()
  for name,n,E,C0 in inputs:
   g=Graph(n,E,seconds=10);tau,covers,complete=g.covers(20000);assert complete
   C=g.cover_mask(C0) if C0 is not None else covers[0]
   assert C in covers
   ce=[g.edges[i] for i in bits(C)];all_eligible={g.triangles[i] for i,m in enumerate(g.masks) if (m&C).bit_count()<3}
   for mask in range(1<<len(ce)):
    S={ce[i] for i in range(len(ce)) if mask>>i&1};H=Graph(n,[e for e in g.edges if e not in S],seconds=5)
    ht,_,_=H.covers(1);assert ht==tau-len(S)
    hc=H.cover_mask([e for e in ce if e not in S])
    eligible={H.triangles[i] for i,m in enumerate(H.masks) if (m&hc).bit_count()<3}
    expected={t for t in all_eligible if not (set(combinations(t,2))&S)}
    assert eligible==expected
   union=0
   for c in covers:union|=c
   critical=[]
   for i,e in enumerate(g.edges):
    H=Graph(n,[f for f in g.edges if f!=e],seconds=5);ht,_,_=H.covers(1)
    assert (ht==tau-1)==bool(union>>i&1)
    if ht==tau-1:critical.append(e)
   out['graphs'].append({'name':name,'n':n,'edges':g.edges,'cover':ce,'tau':tau,'all_optimum_cover_count':len(covers),'red_subsets_checked':1<<len(ce),'critical_edge_checks':len(g.edges),'critical_edges':critical,'all_checks_pass':True})
  out['elapsed_seconds']=time.monotonic()-start
 (W/'evidence/theory_reduction_checks.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({'graphs':len(out['graphs']),'subset_checks':sum(g['red_subsets_checked'] for g in out['graphs']),'critical_checks':sum(g['critical_edge_checks'] for g in out['graphs']),'elapsed_seconds':out['elapsed_seconds']}))
if __name__=='__main__':main()
