from residual_oracle import *
import networkx as nx,random,json,time,signal,resource,collections
R=random.Random(25111602)
class Timeout(Exception):pass
def alarm(*a):raise Timeout()
signal.signal(signal.SIGALRM,alarm)
def wheel():return 6,{edge(i,(i+1)%5) for i in range(5)}|{edge(i,5) for i in range(5)}
seeds=[]
for L in [(4,),(5,),(4,4),(4,5),(5,5),(4,4,4),(4,4,5),(4,5,5),(5,5,5)]:
 n,E,Q=star(L);seeds.append(('star'+''.join(map(str,L)),n,E))
seeds += [('W5',*wheel()),('K5-e',5,clique(range(5))-{(3,4)})]
def candidates():
 for it in range(2000):
  name,n,E=R.choice(seeds);name2,m,F=R.choice(seeds)
  possible=[s for s in range(2,min(n,m)) if 11<=n+m-s<=14]
  if not possible:continue
  s=R.choice(possible);A=R.sample(range(n),s);B=R.sample(range(m),s);mp=dict(zip(B,A));fresh=n
  for v in range(m):
   if v not in mp:mp[v]=fresh;fresh+=1
  EE=E|{edge(mp[u],mp[v]) for u,v in F}
  yield name+'+'+name2,fresh,EE,{'left':name,'right':name2,'identifications':list(zip(B,A))}
 # Two-edge pruning of near-tight fresh clique assemblies with 4-5 leaves.
 for it in range(600):
  n,E,Q=star(R.choice([(5,5,5),(4,5,5),(4,4,5)]));a,b=R.choice(sorted(E));s=R.choice([4,5]);QQ=[a,b]+list(range(n,n+s-2));E=E|clique(QQ);n+=s-2
  while n>14:
   a,b=R.sample(range(n),2);n,E=canonical({edge(a if u==b else u,a if v==b else v) for u,v in E if (a if u==b else u)!=(a if v==b else v)})
  E=E-set(R.sample(sorted(E),R.choice([1,2,2,3])))
  yield 'near_tight_two_edge_prune',n,E,{}
counts=collections.Counter();seen=set();start=time.time();out=open('evidence/residual_pair_gluing_records.jsonl','w');witnesses=[]
for kind,n,E,construction in candidates():
 key=(n,tuple(sorted(E)))
 if key in seen:continue
 seen.add(key);counts['examined']+=1;counts['kind:'+kind]+=1;X=None;t=time.time()
 try:
  signal.setitimer(signal.ITIMER_REAL,3.0);X=Exact(n,E)
  if not X.connected():counts['disconnected']+=1;continue
  p,c=X.values();counts['exact']+=1;row={'kind':kind,'n':n,'m':len(E),'triangles':len(X.T),'nu':p,'tau':c,'seconds':time.time()-t,'status':'EXACT'}
  if c==2*p-1:
   counts['defect_one']+=1;row.update(X.profile());row['construction']=construction
   if row['one_edge_resilient']:
    counts['defect_one_resilient']+=1
    if row['all_triangles_extend']:counts['all_triangles_extend']+=1
    G=nx.Graph();G.add_edges_from([e for e,h in zip(X.E,X.hits) if h]);row['support_chordal']=nx.is_chordal(G);row['support_is_W5']=nx.is_isomorphic(G,nx.wheel_graph(6))
    if not row['support_chordal'] and not row['support_is_W5']:
     counts['nonF']+=1;witnesses.append(row);print('NONF',kind,n,p,c,flush=True)
   out.write(json.dumps(row)+'\n');out.flush()
  else:out.write(json.dumps(row)+'\n')
 except Timeout:
  counts['UNKNOWN_timeout']+=1;out.write(json.dumps({'kind':kind,'n':n,'m':len(E),'status':'UNKNOWN_timeout','seconds':time.time()-t})+'\n');out.flush()
 finally:
  signal.setitimer(signal.ITIMER_REAL,0)
  if X:X.clear()
 if counts['examined']%50==0:print(dict(counts),'elapsed',round(time.time()-start,1),'rss',resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,flush=True)
 if time.time()-start>900:counts['stopped_budget']=1;break
out.close();open('evidence/residual_pair_gluing_summary.json','w').write(json.dumps({'counts':dict(counts),'seconds':time.time()-start,'seed':25111602,'witnesses':witnesses},indent=2)+'\n');print('DONE',dict(counts),flush=True)
