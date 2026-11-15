from pathlib import Path
from itertools import product,combinations
import json,hashlib
F=Path(__file__).resolve().parent
p=F/'inputs/canonical_witnesses.json';raw=p.read_bytes();assert hashlib.sha256(raw).hexdigest()=='e69818bb2599b6b934dd945f3b6cd0305f6718c3d2fe165ea9f7f6d1bfe17cc1'
x=json.loads(raw);table={}
for row in x['kernels']:
 key=(row['branches'],tuple(row['states']));assert key not in table;table[key]=row
 assert all(0<=s<5 for s in row['states'])
 b=row['branches'];n=b;edges=[]
 for (u,v),s in zip(combinations(range(b),2),row['states']):
  if s==1:edges+=[(u,v)]
  if s==2:edges+=[(u,n),(v,n)];n+=1
  if s==3:edges+=[(u,n),(n,n+1),(v,n+1)];n+=2
  if s==4:edges+=[(u,v),(u,n),(v,n)];n+=1
 assert sorted(edges)==list(map(tuple,row['edges'])) and n==row['n']

def natlist(xs):return '['+','.join(map(str,xs))+']'
def edges(xs):return '['+','.join('('+str(u)+','+str(v)+')' for u,v in xs)+']'
def rowtext(r):return '⟨'+','.join([natlist(r['states']),str(r['n']),edges(r['edges']),edges(r['witness']['M']),natlist(r['witness']['Q'])])+'⟩'
schedule=[(1,(),0),(2,(),1),(3,(),3)]+[(4,p,3) for p in product(range(5),repeat=3)]
counts=[];assigned=set()
for i,(b,head,tail) in enumerate(schedule):
 rows=[]
 for suffix in product(range(5),repeat=tail):
  key=(b,head+suffix)
  if key in table:rows.append(table[key]);assigned.add(key)
 name=f'Chunk{i:03d}'
 source='import Core\nset_option maxRecDepth 100000\nset_option maxHeartbeats 0\nnamespace FourBranch.'+name+'\n'
 source+='def rows : List Row := [\n'+',\n'.join(rowtext(r) for r in rows)+'\n]\n'
 source+='def segment : Segment := ⟨'+str(b)+','+natlist(head)+','+str(tail)+',rows⟩\n'
 source+='theorem correct : checkSegment segment = true := by decide\n#print axioms correct\nend FourBranch.'+name+'\n'
 (F/(name+'.lean')).write_text(source)
 counts.append({'module':name,'branches':b,'head':head,'suffixLength':tail,'rows':len(rows)})
assert assigned==set(table) and len(assigned)==5375
(F/'generation.json').write_text(json.dumps({'input_sha256':hashlib.sha256(raw).hexdigest(),'rows':len(table),'segments':counts},indent=2)+'\n')
print(json.dumps({'segments':len(schedule),'rows':len(table),'largest_chunk':max(counts,key=lambda r:r['rows'])},indent=2))
