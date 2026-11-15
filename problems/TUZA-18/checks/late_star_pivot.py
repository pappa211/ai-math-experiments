"""Independent new pivot discriminator on frozen existing type1 controls."""
import gzip,json,time
from itertools import combinations
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def rows(path):
 dec=json.JSONDecoder();buf=''
 with gzip.open(path,'rt') as f:
  while True:
   buf=buf.lstrip(' \n\r\t[,]')
   try:obj,end=dec.raw_decode(buf)
   except json.JSONDecodeError:
    chunk=f.read(65536)
    if not chunk:
     if not buf:return
     raise
    buf+=chunk;continue
   yield obj;buf=buf[end:]
def examine(row):
 P=[tuple(t) for t in row['P']];pt=[set(combinations(t,2)) for t in P];B=set().union(*pt)
 te=[set(combinations(t,2)) for t in row['triangles']]
 R=set()
 for F in pt:
  b={next(iter(Q&B)) for Q in te if len(Q&B)==1 and Q&B<=F};assert len(b)==1;R|=b
 U=sorted(B-R);owners=[next(i for i,F in enumerate(pt) if e in F) for e in U]
 residual=[Q for Q in te if not Q&R];covers=[];best=2*len(P)+1
 def deficiency(mask):
  load=[0]*len(P)
  for j,i in enumerate(owners):load[i]+=(mask>>j)&1
  heavy=[i for i,n in enumerate(load) if n==2];light=[i for i,n in enumerate(load) if n==0]
  def mm(k,used):
   if k==len(heavy):return 0
   return max([mm(k+1,used)]+[1+mm(k+1,used|{j}) for j in light if j not in used and set(P[heavy[k]])&set(P[j])])
  return len(heavy)-mm(0,set()),load
 for mask in range(1<<len(U)):
  size=mask.bit_count()
  if size>best:continue
  D={e for j,e in enumerate(U) if mask>>j&1}
  if not all(D&Q for Q in residual):continue
  if size<best:best=size;covers=[]
  d,load=deficiency(mask);covers.append((mask,d,load))
 for mask,d,load in covers:
  if d and not any((mask^m).bit_count()==2 and dd<d for m,dd,ll in covers):
   return {'graph':row,'bases':sorted(R),'U':U,'minimum_residual_cover':best,'bad_cover':{'D':[e for j,e in enumerate(U) if mask>>j&1],'deficiency':d,'loads_without_bases':load},'all_minimum_cover_states':[{'D':[e for j,e in enumerate(U) if m>>j&1],'deficiency':dd,'loads_without_bases':ll,'distance_from_bad':(mask^m).bit_count()} for m,dd,ll in covers]}
 return None
start=time.monotonic();tested=0;seen=0;bad=None
for i,row in enumerate(rows(ROOT/'evidence/apex_type1_directed_ledger.json.gz')):
 seen+=1
 if row['status']!='COMPLETE':continue
 tested+=1;bad=examine(row)
 if bad:bad['source_row_index']=i;break
 if time.monotonic()-start>90:break
out={'claim':'PIV1 one-pivot strict Hall-deficiency descent','source':'evidence/apex_type1_directed_ledger.json.gz','rows_seen':seen,'eligible_tested':tested,'elapsed_seconds':time.monotonic()-start,'failure':bad,'stop':'FIRST_FAILURE' if bad else 'TIME_OR_END'}
(ROOT/'evidence/late_star_pivot.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'tested':tested,'seen':seen,'elapsed':out['elapsed_seconds'],'failure':bad is not None}))
