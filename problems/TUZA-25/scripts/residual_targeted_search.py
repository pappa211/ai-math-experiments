from residual_oracle import *
import networkx as nx,random,json,time,signal,resource,collections,datetime
R=random.Random(251116)
class Timeout(Exception):pass
def alarm(*a):raise Timeout()
signal.signal(signal.SIGALRM,alarm)
def merge(E,a,b):return canonical({edge(a if u==b else u,a if v==b else v) for u,v in E if (a if u==b else u)!=(a if v==b else v)})
def wheel(k):return k+1,{edge(i,(i+1)%k) for i in range(k)}|{edge(i,k) for i in range(k)}
def candidates():
 # Mandatory construction and one/two nonfresh identifications among private leaf vertices.
 n,E,Q=star();yield 'star_control',n,E
 leaves=Q[1:]
 for a,b in combinations(range(4,n),2):
  n1,E1=merge(E,a,b);yield 'star_identify_one',n1,E1
  for c,d in R.sample(list(combinations(range(n1),2)),8):
   n2,E2=merge(E1,c,d);yield 'star_identify_two',n2,E2
 # 11-14 vertex clique-overlap systems including cyclic/noncomplete overlaps.
 for it in range(1200):
  nv=R.choice([11,12,13,14]);E=set();pieces=[]
  root=list(range(R.choice([4,5])));E|=clique(root);used=set(root)
  while len(used)<nv:
   k=R.choice([4,5]);fresh=min(R.choice([1,2,3]),nv-len(used));old=k-fresh
   if old>len(used):continue
   if R.random()<.55 and pieces:
    pool=R.choice(pieces)
    A=R.sample(pool,min(old,len(pool)))
    if len(A)<old:A+=R.sample(sorted(used-set(A)),old-len(A))
   else:A=R.sample(sorted(used),old)
   new=list(range(max(used)+1,max(used)+1+fresh));Q=A+new;pieces.append(Q);E|=clique(Q);used.update(new)
  yield 'clique_overlap_11_14',nv,E
 # Wheel attachments then vertex identification/cross edges; allow extra triangles.
 for it in range(600):
  n,E=wheel(R.choice([5,7,9]));target=R.choice([11,12,13,14])
  while n<target:
   k=R.choice([3,4,5]);fresh=min(k-2,target-n);A=R.sample(range(n),k-fresh)
   E|=clique(A+list(range(n,n+fresh)));n+=fresh
  yield 'wheel_overlap_11_14',n,E
 # Near miss of sharp accepted model: mixed vertex identifications and added/deleted edges.
 for it in range(600):
  n,E,Q=star(R.choice([(5,5,5),(4,5,5),(5,4,5),(5,5,4)]));E=set(E)
  if R.random()<.5:
   a,b=R.sample(range(n),2);n,E=merge(E,a,b)
  for _ in range(R.choice([1,1,2,3])):
   if R.random()<.35:E.remove(R.choice(sorted(E)))
   else:E.add(edge(*R.sample(range(n),2)))
  yield 'sharp_mutation',n,E
out=open('evidence/residual_targeted_records.jsonl','w');counts=collections.Counter();seen=set();start=time.time();nonF=[]
for kind,n,E in candidates():
 key=(n,tuple(sorted(E)))
 if key in seen:continue
 seen.add(key);counts['examined']+=1;counts['kind:'+kind]+=1
 X=None;t=time.time()
 try:
  signal.setitimer(signal.ITIMER_REAL,3.0)
  X=Exact(n,E)
  if not X.connected():counts['disconnected']+=1;continue
  p,c=X.values();counts['exact']+=1
  row={'kind':kind,'n':n,'m':len(E),'triangles':len(X.T),'nu':p,'tau':c,'seconds':time.time()-t,'status':'EXACT'}
  if c==2*p-1:
   counts['defect_one']+=1
   r=X.profile();row.update(r)
   if r['one_edge_resilient']:
    counts['defect_one_resilient']+=1
    if r['all_triangles_extend']:counts['full_extension_profile']+=1
    G=nx.Graph();G.add_edges_from(E);row['chordal']=nx.is_chordal(G)
    row['is_W5']=nx.is_isomorphic(G,nx.wheel_graph(6))
    if not row['chordal'] and not row['is_W5']:
     counts['certifiable_nonF']+=1;nonF.append(row);print('NONF',kind,n,p,c,flush=True)
   out.write(json.dumps(row)+'\n');out.flush()
  else:
   out.write(json.dumps(row)+'\n')
 except Timeout:
  counts['UNKNOWN_timeout']+=1;out.write(json.dumps({'kind':kind,'n':n,'m':len(E),'status':'UNKNOWN_timeout','seconds':time.time()-t})+'\n');out.flush()
 finally:
  signal.setitimer(signal.ITIMER_REAL,0)
  if X:X.clear()
 if counts['examined']%50==0:print(dict(counts), 'elapsed',round(time.time()-start,1),'rss',resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,flush=True)
 if time.time()-start>900:counts['stopped_budget']=1;break
out.close();summary={'counts':dict(counts),'seconds':time.time()-start,'seed':251116,'universe':'targeted labelled constructions; no isomorphism completeness claimed','timeout_seconds_per_instance':3,'nonF':nonF}
open('evidence/residual_targeted_summary.json','w').write(json.dumps(summary,indent=2)+'\n')
print('DONE',dict(counts),'seconds',time.time()-start,flush=True)
