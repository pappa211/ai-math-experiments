from itertools import permutations
from pathlib import Path
import random,json,time,hashlib
ROOT=Path(__file__).resolve().parents[1]
base=[(a,j) for a in range(5) for j in range(5) if a!=j];idx={e:i for i,e in enumerate(base)}
constraints=set()
for k in (2,3):
 for aa in permutations(range(5),k):
  for jj in permutations(range(5),k):
   if not all(aa[i]!=jj[i] and aa[(i+1)%k]!=jj[i] for i in range(k)):continue
   row=[0]*20
   for i in range(k):row[idx[aa[i],jj[i]]]+=1;row[idx[aa[(i+1)%k],jj[i]]]-=1
   tup=tuple(row);constraints.add(min(tup,tuple(-v for v in row)))
constraints=sorted(constraints);rng=random.Random(18141120261755);start=time.time();found=None;attempts=[]
for q,lim in [(31,5000),(101,1000)]:
 for it in range(lim):
  w=[rng.randrange(q) for _ in base]
  if all(sum(c*v for c,v in zip(row,w))%q for row in constraints):
   found=dict(q=q,base_edges=base,voltages=w);break
 attempts.append(dict(q=q,attempts=it+1))
 if found:break
result=dict(found=found,attempts=attempts,constraints=len(constraints),seed=18141120261755,elapsed=time.time()-start,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
(ROOT/'evidence/apex_pruned_voltage.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2))
