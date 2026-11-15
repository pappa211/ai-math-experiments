#!/usr/bin/env python3
"""Single triangle-transitive discriminator: KG(7,2), not a graph census."""
from itertools import combinations
from pathlib import Path
from types import SimpleNamespace
import json,time,platform
from global_routes_sat import TriangleSAT
from root_triangle_full_critical import odd_min

def main():
 assert platform.system()=='Darwin'
 vs=list(combinations(range(7),2));es=[(i,j) for i,j in combinations(range(len(vs)),2) if not set(vs[i])&set(vs[j])]
 g=TriangleSAT(len(vs),es)
 ex=SimpleNamespace(edges=g.edges,tri=[sum(1<<i for i in t) for t in g.ts],full=(1<<len(es))-1)
 start=time.time();pi,pc,dim=odd_min(ex)
 out={'hypothesis':'TF implies existence of a minimum odd cover','purpose':'A triangle-transitive graph reduces TF to whether one fixed triangle occurs in some minimum cover. Test a dense codegree-three non-clique graph where parity is global cut parity.','graph':'KG(7,2)','vertices':vs,'edges':g.edges,'triangles':g.triples,'pi':pi,'parity_cover':[e for i,e in enumerate(g.edges) if pc>>i&1],'kernel_dimension':dim,'pi_enumeration_seconds':time.time()-start,'calls':[]}
 path=Path('evidence/root_triangle_full/kneser_7_2.json')
 def save():path.write_text(json.dumps(out,indent=2)+'\n')
 save();print('pi',pi,'dimension',dim,flush=True)
 lo=35;hi=pi
 while lo<hi:
  k=(lo+hi)//2;r=g.cover(k,timeout=20);out['calls'].append({'kind':'tau','k':k,**r});save();print('tau',k,r['status'],flush=True)
  if r['status']=='SAT':hi=len(r['cover'])
  elif r['status']=='UNSAT':lo=k+1
  else:break
 out['tau_bounds']=[lo,hi];save()
 if lo==hi:
  out['tau']=lo;r=g.cover(lo,forced=g.ts[0],timeout=30);out['TF_fixed_triangle_test']={'triangle':g.triples[0],**r};save();print('TF',r['status'],flush=True)
 out['seconds']=time.time()-start;save()
if __name__=='__main__':main()
