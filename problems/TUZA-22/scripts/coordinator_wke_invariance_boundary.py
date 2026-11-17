"""Two fixed literal controls for the limits of residual-cover invariance, not a census."""
from exact_graph import clique,optimize,triangles
from itertools import combinations
from pathlib import Path
import json

def vc(E,V=range(1,7)):
 E=set(E);V=tuple(V)
 for k in range(len(V)+1):
  for Q in combinations(V,k):
   if all(set(e)&set(Q) for e in E):return k,Q
L=clique([1,2,3])|{tuple(sorted(e)) for e in [(1,4),(2,5),(3,6),(1,5),(2,6),(3,4)]}
M={(1,5),(2,6),(3,4)};F=L-M;out=[]
for completion in (1,2):
 block=[1,2,3]+list(range(7,7+completion))
 H=F|clique(block);G=H|M|{(0,i) for i in range(1,7)};n=7+completion
 h=optimize(n,H);g=optimize(n,G)
 covers=[]
 for D in combinations(sorted(clique(block)),h['tau']):
  if all(set(D)&clique(t) for t in triangles(n,H)):
   cost,Q=vc(F-set(D));covers.append({'D':D,'vc_remaining':cost,'Q':Q})
 out.append({'completion':completion,'L':sorted(L),'M':sorted(M),'F':sorted(F),'H':h,'G':g,'initial_F_vc':vc(F)[0], 'all_min_H_covers':covers,'invariance_holds':all(c['vc_remaining']==3 for c in covers),'packing_balance_holds':g['nu']==h['nu']+3})
Path('evidence/coordinator_wke_invariance_boundary.json').write_text(json.dumps({'scope':'Exactly two fixed cone-over-three-sun graphs with one residual clique completion; no general conclusion','unknown':0,'cases':out},indent=2)+'\n')
for x in out:print({k:x[k] for k in ('completion','invariance_holds','packing_balance_holds')},'G_tau_nu',x['G']['tau'],x['G']['nu'],'H_tau_nu',x['H']['tau'],x['H']['nu'])
