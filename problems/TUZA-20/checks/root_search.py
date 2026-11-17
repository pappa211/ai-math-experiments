"""Bounded structured PK-all and C01 search; independent of verifier code."""
from pathlib import Path
from itertools import combinations,product
from functools import lru_cache
import json,time,random,sys,datetime
W=Path(__file__).resolve().parents[1]
class Deadline(Exception):pass
def edge(a,b):return tuple(sorted((a,b)))
def triangles(n,E):return [t for t in combinations(range(n),3) if all(edge(*e) in E for e in combinations(t,2))]
def solve(n,E,label,cap=512,seconds=2):
 start=time.monotonic();end=start+seconds;counter=0
 def tick():
  nonlocal counter
  counter+=1
  if counter%128==0 and time.monotonic()>end:raise Deadline()
 ed=sorted(E);ix={e:i for i,e in enumerate(ed)};ts=triangles(n,E);te=[sum(1<<ix[edge(*e)] for e in combinations(t,2)) for t in ts]
 conflicts=[sum(1<<j for j,u in enumerate(te) if t&u) for t in te]
 row={'label':label,'n':n,'edges':ed,'triangles':ts,'status':'UNKNOWN','packings_checked':0,'all_packings':False,'candidate_tests':0,'pk_failures':[],'candidate_failures':[]}
 @lru_cache(None)
 def alpha(state):
  tick()
  if not state:return 0
  bits=[i for i in range(len(ts)) if state>>i&1]
  v=max(bits,key=lambda i:(conflicts[i]&state).bit_count())
  if (conflicts[v]&state).bit_count()==1:return len(bits)
  return max(1+alpha(state&~conflicts[v]),alpha(state&~(1<<v)))
 def enum(state,need,p):
  tick()
  if not need:yield tuple(p);return
  if state.bit_count()<need:return
  v=(state&-state).bit_length()-1
  tail=state&~(1<<v)
  if 1+alpha(state&~conflicts[v])>=need:yield from enum(state&~conflicts[v],need-1,p+[v])
  if alpha(tail)>=need:yield from enum(tail,need,p)
 def cover(allowed,budget):
  clauses=tuple(sorted(set(t&allowed for t in te),key=lambda t:(t.bit_count(),t)))
  if 0 in clauses:return None
  clauses=tuple(t for j,t in enumerate(clauses) if not any(u&t==u for u in clauses[:j]))
  @lru_cache(None)
  def hit(cs,b):
   tick()
   if not cs:return 0
   if b<=0:return None
   union=0;lb=0
   for c in cs:
    if not c&union:lb+=1;union|=c
   if lb>b:return None
   c=min(cs,key=int.bit_count);opts=[]
   while c:
    e=c&-c;c-=e;opts.append(e)
   opts.sort(key=lambda e:-sum(bool(x&e) for x in cs))
   for e in opts:
    s=hit(tuple(x for x in cs if not x&e),b-1)
    if s is not None:return e|s
   return None
  return hit(clauses,budget)
 def candidate(p,B,pages):
  bases=[];spokes=[]
  for i,own in enumerate(p):
   bs={te[q]&B for q in pages[i]}
   if len(bs)!=1:return None
   bases.append(next(iter(bs)));spokes.append(te[own]^bases[-1])
  R=0
  for b in bases:R|=b
  L=[];F=0;gains=[]
  for i,own in enumerate(p):
   if len(pages[i])==1:
    bv=set(ed[(bases[i]&-bases[i]).bit_length()-1]);x=next(iter(set(ts[own])-bv));z=next(iter(set(ts[pages[i][0]])-bv));g=edge(x,z)
    if g in ix:
     assert B>>ix[g]&1
     L.append(i);F|=1<<ix[g];gains.append([i,list(g)])
  F&=~R
  pairs=[];paired=set()
  for i,j in combinations(range(len(p)),2):
   if len(pages[i])==len(pages[j])==2:
    vi=set(ts[p[i]]);vj=set(ts[p[j]]);tipsi={next(iter(set(ts[q])-set(ed[bases[i].bit_length()-1]))) for q in pages[i]};tipsj={next(iter(set(ts[q])-set(ed[bases[j].bit_length()-1]))) for q in pages[j]}
    if len(vi&vj)==1 and tipsi==vj-vi and tipsj==vi-vj:
     assert not {i,j}&paired
     paired|={i,j};pairs.append((i,j))
  options=[]
  for i in range(len(p)):
   if i not in L and i not in paired:
    bits=[1<<j for j in range(len(ed)) if spokes[i]>>j&1];options.append([0]+bits)
  for i,j in pairs:
   bits=[1<<h for h in range(len(ed)) if (spokes[i]|spokes[j])>>h&1];options.append([0]+bits+[a|b for a,b in combinations(bits,2)])
  residual=[t for t in te if not t&(R|F)]
  for choices in product(*options):
   tick();S=F
   for c in choices:S|=c
   if all(t&S for t in residual):return {'pass':True,'cover_mask':R|S,'lenders':L}
  return {'pass':False,'bases':[ed[b.bit_length()-1] for b in bases],'spokes':[[ed[j] for j in range(len(ed)) if a>>j&1] for a in spokes],'lenders':L,'gains':gains,'fixed_gains':[ed[j] for j in range(len(ed)) if F>>j&1],'exceptional_pairs':pairs,'residual_clauses':[[ed[j] for j in range(len(ed)) if (t&B&~R)>>j&1] for t in te if not t&R]}
 try:
  full=(1<<len(ts))-1;k=alpha(full);row['nu']=k;row['maximum_certificate_method']='complete memoized include/exclude triangle recursion'
  g=enum(full,k,[])
  for p in g:
   if row['packings_checked']>=cap:row['status']='PARTIAL_PACKINGS';break
   B=0
   for q in p:B|=te[q]
   pages=[[j for j,t in enumerate(te) if (t&B).bit_count()==1 and bool(t&te[q])] for q in p]
   A=B
   for i,q in enumerate(p):
    for z in range(n):
     if z in ts[q]:continue
     extra=[edge(z,v) for v in ts[q]]
     if all(e in ix and not (B>>ix[e]&1) for e in extra):
      for e in extra:A|=1<<ix[e]
   C=cover(A,2*k)
   if C is None:row['pk_failures'].append({'packing':[ts[q] for q in p],'allowed':[ed[j] for j in range(len(ed)) if A>>j&1]})
   c=candidate(p,B,pages)
   if c is not None:
    row['candidate_tests']+=1
    if not c['pass']:
     c['packing']=[ts[q] for q in p];c['pk_cover']=[ed[j] for j in range(len(ed)) if C is not None and C>>j&1];row['candidate_failures'].append(c)
   row['packings_checked']+=1
   if row['pk_failures']:row['status']='PK_ALL_FAILURE_CANDIDATE';break
  else:row['all_packings']=True;row['status']='COMPLETE'
 except Deadline:row['status']='UNKNOWN_TIMEOUT'
 row['seconds']=time.monotonic()-start
 return row

def graphs():
 rng=random.Random(20261115)
 def clique(E,V):E.update(edge(a,b) for a,b in combinations(V,2))
 # Two dense blocks with one vertex in common, and carefully introduced cross edges.
 for n in range(11,15):
  for trial in range(60):
   E=set();clique(E,range(5));clique(E,[0,5,6,7,8])
   # Add private book/triangle ears until desired order; they create sparse interactions.
   for v in range(9,n):
    a,b=rng.choice(sorted(E));E.update([edge(a,v),edge(b,v)])
   cross=list(product(range(1,5),range(5,9)));rng.shuffle(cross)
   for a,b in cross[:trial%5]:E.add(edge(a,b))
   yield n,E,f'K5_vertex_sum_ears_n{n}_{trial}'
 # Edge-glued archived seven-vertex quota-failure blocks, with all cross triangles recomputed.
 core={edge(a,b) for a,b in combinations(range(7),2)}-{(0,5),(5,6),(1,3),(2,4)}
 for n in range(11,15):
  for trial in range(50):
   E=set(core);a,b=rng.choice(sorted(core));c,d=rng.choice(sorted(core));mapping={c:a,d:b};fresh=7
   for v in range(7):
    if v not in mapping:mapping[v]=fresh;fresh+=1
   E.update(edge(mapping[u],mapping[v]) for u,v in core)
   if n==11:
    # Further identify the last fresh vertex to a core vertex, then rebuild simple edges.
    target=rng.randrange(7);E={edge(target if a==11 else a,target if b==11 else b) for a,b in E if (target if a==11 else a)!=(target if b==11 else b)}
   for v in range(12,n):
    a,b=rng.choice(sorted(E));E.update([edge(a,v),edge(b,v)])
   if trial%3:E.add(edge(rng.randrange(7),rng.randrange(7,min(n,12))))
   yield n,E,f'quota_block_glue_n{n}_{trial}'
 # Prescribed sharp triple/singleton cycle core with nearby dense attachments.
 core={edge(a,b) for a,b in combinations([0,1,2,4,5],2)}|{(0,3),(1,3),(0,6),(3,6),(0,7),(3,7)}
 for n in range(11,15):
  for trial in range(30):
   E=set(core);clique(E,[trial%8]+list(range(8,min(n,12))))
   for v in range(12,n):
    a,b=rng.choice(sorted(E));E.update([edge(a,v),edge(b,v)])
   for _ in range(trial%4):E.add(edge(rng.randrange(8),rng.randrange(8,n)))
   yield n,E,f'private_pair_attachment_n{n}_{trial}'

if __name__=='__main__':
 start=time.monotonic();limit=float(sys.argv[1]) if len(sys.argv)>1 else 300
 out=W/'receipts/root_structured_rows.jsonl';summary={'started_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'seed':20261115,'runtime_limit_seconds':limit,'per_graph_seconds':2,'packing_cap':512,'graphs':0,'by_order':{},'statuses':{},'packings':0,'candidate_tests':0,'candidate_failures':0,'pk_failures':0}
 with out.open('w') as f:
  for n,E,label in graphs():
   if time.monotonic()-start>limit:summary['generator_exhausted']=False;break
   row=solve(n,E,label);f.write(json.dumps(row)+'\n');f.flush();summary['graphs']+=1;summary['packings']+=row['packings_checked'];summary['candidate_tests']+=row['candidate_tests'];summary['candidate_failures']+=len(row['candidate_failures']);summary['pk_failures']+=len(row['pk_failures']);summary['statuses'][row['status']]=summary['statuses'].get(row['status'],0)+1
   rr=summary['by_order'].setdefault(str(n),{'graphs':0,'fully_checked':0,'partly_checked':0,'packings':0});rr['graphs']+=1;rr['fully_checked']+=int(row['all_packings']);rr['partly_checked']+=int(not row['all_packings']);rr['packings']+=row['packings_checked']
   if row['candidate_failures'] or row['pk_failures']:
    (W/'data'/('root_failure_'+str(summary['graphs'])+'.json')).write_text(json.dumps(row,indent=2)+'\n');print('FAILURE',label,len(row['candidate_failures']),len(row['pk_failures']),flush=True)
   if summary['pk_failures']:break
  else:summary['generator_exhausted']=True
 summary['elapsed_seconds']=time.monotonic()-start;(W/'receipts/root_structured_summary.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary),flush=True)
