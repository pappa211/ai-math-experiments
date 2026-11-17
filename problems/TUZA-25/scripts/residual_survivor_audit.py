from residual_oracle import *
from residual_family_certificates import *
from pathlib import Path
import json,collections,time

def valid_pack(P,E):
 used=set()
 for T in P:
  s=clique(T)
  if not s<=E or used&s:return False
  used|=s
 return True

def is_B(X,s):
 while s:
  front=s&-s;seen=0
  while front:
   seen|=front;new=0;r=front
   while r:
    b=r&-r;r-=b;new|=X.conflicts[b.bit_length()-1]
   front=new&s&~seen
  vs=set();es=set();r=seen
  while r:
   b=r&-r;r-=b;t=X.T[b.bit_length()-1];vs.update(t);es|=clique(t)
  if len(vs) not in (4,5) or es!=clique(vs):return False
  s&=~seen
 return True

rows=[];counts=collections.Counter();start=time.time()
for f in ['residual_targeted_records.jsonl','residual_pruning_records.jsonl']:
 for line,txt in enumerate(Path('evidence/'+f).read_text().splitlines(),1):
  r=json.loads(txt)
  if not r.get('one_edge_resilient'):continue
  E={tuple(e) for e in r['edges']};X=Exact(r['n'],E);p=r['nu'];c=r['tau'];counts['records']+=1
  assert len(r['packing'])==p and valid_pack(r['packing'],E)
  assert len(r['cover'])==c and all(clique(t)&{tuple(e) for e in r['cover']} for t in X.T)
  assert set(map(tuple,r['triangles']))==set(X.T)
  assert len(r['edge_deletions'])==len(E)
  for d in r['edge_deletions']:assert len(d['packing'])==d['nu']==p and valid_pack(d['packing'],E-{tuple(d['edge'])})
  for d in r['triangle_deletions']:assert len(d['packing'])==d['nu']==p-1 and valid_pack(d['packing'],E-clique(d['triangle']))
  cert=certify_F(E);assert cert['member'],(f,line,cert)
  counts['F:'+cert['type']]+=1
  B_witness=None
  for size in (0,1,2):
   for S in combinations(X.E,size):
    if is_B(X,X.without(S)):B_witness=list(S);break
   if B_witness is not None:break
  if B_witness is None:counts['no_B_after_up_to_two_edges']+=1
  else:counts['has_B_after_up_to_two_edges']+=1
  rows.append({'source':f,'line':line,'n':r['n'],'support_n':len(set().union(*map(set,support(E)))),'nu':p,'tau':c,'F_certificate':cert,'B_deletion_at_most_two':B_witness,'witness_validation':'PASS; packing lower bounds and cover upper bound only; exact optima remain recurrence results'})
  X.clear()
Path('evidence/residual_survivor_audit.json').write_text(json.dumps({'counts':dict(counts),'seconds':time.time()-start,'records':rows},indent=2)+'\n');print(dict(counts),time.time()-start)
