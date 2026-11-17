#!/usr/bin/env python3
"""Descriptive lending-cycle audit, not a PK or C02 counterexample search."""
from verifier_candidate02 import *

def cycles(n,E,T,P):
 r=c01(n,E,T,P)
 if not r['eligible']:return None
 R=set(map(tuple,r['bases']));centres=[next(iter(set(p)-set(next(e for e in faces(p) if e in R)))) for p in P]
 arrow={}
 for i,g in zip(r['L'],r['gains']):
  g=tuple(g)
  if g in R:continue
  target=[j for j,p in enumerate(P) if g in faces(p)]
  assert len(target)==1
  arrow[i]=target[0]
 found=set()
 for start in arrow:
  chain=[];seen={};v=start
  while v in arrow and v not in seen:
   seen[v]=len(chain);chain.append(v);v=arrow[v]
  if v in seen:
   cyc=chain[seen[v]:];q=cyc.index(min(cyc));found.add(tuple(cyc[q:]+cyc[:q]))
 return {'centres':centres,'arcs':sorted(arrow.items()),'cycles':[{'owners':c,'centres':[centres[i] for i in c],'common_centre':len({centres[i] for i in c})==1} for c in sorted(found)]}

def main():
 start=time.time();E=set(combinations(range(4),2));P=[]
 for i in range(4):
  a=4+i
  for j in [(i-1)%4,i,(i+1)%4]:E.add(edge(a,j))
  P.append(tuple(sorted(((i-1)%4,i,a))))
 d=finite(8,E,tuple(P),'switched-four-cycle');_,T=reconstruct(8,E)
 d['lending_cycle_diagnostic']=cycles(8,E,T,tuple(P));d['candidate02']=c02(8,E,T,tuple(P))
 assert d['nu']==4 and len(d['lending_cycle_diagnostic']['cycles'])==1
 assert not d['lending_cycle_diagnostic']['cycles'][0]['common_centre']
 assert d['candidate02']['feasible']
 (ROOT/'data/verifier_switched_four_cycle.json').write_text(json.dumps(d,indent=2)+'\n')
 rows=[];first=None
 for n in range(7):
  es=list(combinations(range(n),2));eligible=ct=noncommon=0
  for m in range(1<<len(es)):
   E,T=reconstruct(n,[e for j,e in enumerate(es) if m>>j&1]);nu,ps=maximum_packings(T)
   for P in ps:
    r=cycles(n,E,T,P)
    if r is None:continue
    eligible+=1
    for c in r['cycles']:
     ct+=1
     if not c['common_centre']:
      noncommon+=1
      if first is None:first={'n':n,'edges':sorted(E),'triangles':T,'packing':P,'nu':nu,'diagnostic':r}
  rows.append({'n':n,'eligible_packings':eligible,'cycles':ct,'noncommon_centre_cycles':noncommon})
 out={'started_utc':datetime.datetime.fromtimestamp(start,datetime.timezone.utc).isoformat(),'elapsed_seconds':time.time()-start,'small_corpus':rows,'first_small_noncommon_cycle':first,'explicit_eight_vertex_control':{'nu':d['nu'],'restricted_cost':d['restricted_cost'],'all_maximum_packings':d['maximum_packings_count'],'diagnostic':d['lending_cycle_diagnostic'],'candidate02':d['candidate02']}}
 (ROOT/'receipts/verifier_lending_cycles.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
