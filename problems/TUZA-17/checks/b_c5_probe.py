#!/usr/bin/env python3
"""Targeted C5-link hard regime; all verdicts computed with exact integer recurrences."""
from pathlib import Path
import sys,time,signal,resource,json,random
W=Path(__file__).resolve().parents[1];sys.path.insert(0,str(W/'checks'))
from b_probe import graph,pack,cover,edge
resource.setrlimit(resource.RLIMIT_CPU,(125,130))
START=time.monotonic();rng=random.Random(17052026)
rim=tuple(edge(i,(i+1)%5) for i in range(5));basecol=[0,1,0,1,2]
class Timeout(Exception):pass
def al(s,f):raise Timeout()
signal.signal(signal.SIGALRM,al)
rows=[];counts={'graphs':0,'complete':0,'timeout':0,'all_rim_old':0,'hard_budget':0,'failure':0};best=0
for it in range(20000):
 if time.monotonic()-START>115 or resource.getrusage(resource.RUSAGE_SELF).ru_maxrss>700*1024**2:break
 n=rng.choice([7,8,9,10,11,12]);co=basecol+[rng.randrange(4) for _ in range(n-5)];density=rng.choice([.25,.4,.55,.7,.85])
 E=list(rim)+[(u,v) for u in range(n) for v in range(max(5,u+1),n) if co[u]!=co[v] and rng.random()<density]
 es,idx,ts,tm=graph(n,E)
 if not all(any(t&(1<<idx[e]) for t in tm) for e in rim):continue
 counts['all_rim_old']+=1;counts['graphs']+=1
 signal.setitimer(signal.ITIMER_REAL,.16)
 try:
  ph=pack(tm);th=cover(tm)
  _,_,gts,gtm=graph(n+1,es+tuple((v,n) for v in range(5)));pg=pack(gtm);b=2*pg-th
  if b<=2:
   counts['hard_budget']+=1
   deletions=[cover(tuple(t for t in tm if not t&(1<<idx[e]))) for e in rim]
   fail=b<3 and all(x==th for x in deletions)
   row={'iteration':it,'n':n,'edges':es,'vertex4colouring':co,'nu_H':ph,'tau_H':th,'nu_G':pg,'budget':b,'rim_deleted_cover_values':deletions,'status':'FAIL' if fail else 'PASS'}
   rows.append(row)
   if fail:counts['failure']+=1;print('FAILURE',row,flush=True);break
  counts['complete']+=1
 except Timeout:counts['timeout']+=1
 finally:signal.setitimer(signal.ITIMER_REAL,0)
 if it%100==0:
  pack.cache_clear();cover.cache_clear()
  (W/'evidence/b_c5_probe.json').write_text(json.dumps({'seed':17052026,'runtime_s':time.monotonic()-START,'counts':counts,'hard_rows':rows,'limits':'115s wall batch,0.16s pergraph,125s CPU,700MiB peak RSS stop check between 0.16s cases; cache max200000'},indent=2)+'\n')
(W/'evidence/b_c5_probe.json').write_text(json.dumps({'seed':17052026,'runtime_s':time.monotonic()-START,'counts':counts,'hard_rows':rows,'limits':'115s wall batch,0.16s pergraph,125s CPU,700MiB peak RSS stop check between 0.16s cases; cache max200000'},indent=2)+'\n')
print(counts,'seconds',time.monotonic()-START,flush=True)
