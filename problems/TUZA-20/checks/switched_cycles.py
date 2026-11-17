from pathlib import Path
from functools import lru_cache
from itertools import combinations
import json,time
w=Path(__file__).resolve().parents[1]
def edge(a,b):return tuple(sorted((a,b)))
rows=[]
for r in range(4,13):
 E=set();P=[]
 for i in range(r):
  prev=(i-1)%r;nxt=(i+1)%r
  E.update([edge(prev,i),edge(prev,nxt),edge(r+i,prev),edge(r+i,i),edge(r+i,nxt)])
  P.append(tuple(sorted([prev,i,r+i])))
 T=[t for t in combinations(range(2*r),3) if all(edge(*e) in E for e in combinations(t,2))];ed=sorted(E);ix={e:j for j,e in enumerate(ed)};m=[sum(1<<ix[edge(*e)] for e in combinations(t,2)) for t in T];conf=[sum(1<<j for j,b in enumerate(m) if a&b) for a in m]
 start=time.monotonic()
 @lru_cache(None)
 def best(s):
  if time.monotonic()-start>10:raise TimeoutError()
  if not s:return ()
  choices=[j for j in range(len(T)) if s>>j&1];i=max(choices,key=lambda j:(s&conf[j]).bit_count())
  a=(i,)+best(s&~conf[i]);b=best(s&~(1<<i));return a if len(a)>len(b) else b
 try:
  p=best((1<<len(T))-1);row={'r':r,'n':2*r,'edges':ed,'triangles':T,'planted_packing':P,'nu':len(p),'maximum_packing':[T[i] for i in p],'seconds':time.monotonic()-start,'status':'EXACT'}
 except TimeoutError:row={'r':r,'status':'UNKNOWN_TIMEOUT','seconds':time.monotonic()-start}
 rows.append(row);print(r,row.get('nu'),row['seconds'],flush=True)
(w/'data/switched_cycles.json').write_text(json.dumps(rows,indent=2)+'\n')
