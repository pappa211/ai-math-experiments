from residual_oracle import *
from residual_family_certificates import *
import networkx as nx,random,json,time,signal,collections,resource
R=random.Random(25111603)
class Timeout(Exception):pass
def alarm(*a):raise Timeout()
signal.signal(signal.SIGALRM,alarm)
def wheel():return 6,{edge(i,(i+1)%5) for i in range(5)}|{edge(i,5) for i in range(5)}
seeds=[('W5',*wheel()),('K5-e',5,clique(range(5))-{(3,4)})]
for L in [(4,),(5,),(4,4),(4,5)]:
 n,E,Q=star(L);seeds.append(('star'+''.join(map(str,L)),n,E))
counts=collections.Counter();start=time.time();out=open('evidence/residual_core_gluing_records.jsonl','w');buckets={};witnesses=[]
for iteration in range(6000):
 a,n,E=R.choice(seeds);b,m,F=R.choice(seeds);s=R.randint(3,min(n,m)-1);A=R.sample(range(n),s);B=R.sample(range(m),s);mp=dict(zip(B,A));fresh=n
 for v in range(m):
  if v not in mp:mp[v]=fresh;fresh+=1
 EE=E|{edge(mp[u],mp[v]) for u,v in F};G=nx.Graph();G.add_edges_from(EE);counts['generated']+=1
 # Only genuinely nonchordal,3-connected candidates different from W5.
 if nx.is_chordal(G):counts['chordal_reject']+=1;continue
 if nx.is_isomorphic(G,nx.wheel_graph(6)):counts['W5_control_skip']+=1;continue
 if any(not nx.is_connected(nx.subgraph_view(G,filter_node=lambda v,S=S:v not in S)) for S in combinations(G.nodes(),2)):
  counts['two_separator_reject']+=1;continue
 key=(fresh,len(EE),tuple(sorted(dict(G.degree()).values())),sum(nx.triangles(G).values())//3)
 bucket=buckets.setdefault(key,[])
 if any(nx.is_isomorphic(G,H) for H in bucket):counts['duplicate_isomorphism']+=1;continue
 bucket.append(G.copy());counts['nonchordal_3connected_distinct']+=1;X=None;t=time.time()
 try:
  signal.setitimer(signal.ITIMER_REAL,3);X=Exact(fresh,EE)
  if not X.connected():counts['triangle_disconnected']+=1;continue
  p,c=X.values();counts['exact']+=1;r={'status':'EXACT','iteration':iteration,'left':a,'right':b,'identifications':list(zip(B,A)),'n':fresh,'edges':sorted(EE),'nu':p,'tau':c,'seconds':time.time()-t}
  if c==2*p-1:
   counts['defect_one']+=1;r.update(X.profile());r['F_certificate']=certify_F(EE)
   if r['one_edge_resilient']:
    counts['counterexample_to_broad_core']+=1;witnesses.append(r);print('CORE_COUNTEREXAMPLE',r,flush=True)
  out.write(json.dumps(r)+'\n');out.flush()
 except Timeout:counts['UNKNOWN_timeout']+=1;out.write(json.dumps({'status':'UNKNOWN_timeout','iteration':iteration,'n':fresh,'edges':sorted(EE),'left':a,'right':b,'identifications':list(zip(B,A))})+'\n');out.flush()
 finally:
  signal.setitimer(signal.ITIMER_REAL,0)
  if X:X.clear()
 if iteration%100==0:print(dict(counts),'seconds',round(time.time()-start,1),'rss',resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,flush=True)
 if time.time()-start>480:counts['stopped_budget']=1;break
out.close();open('evidence/residual_core_gluing_summary.json','w').write(json.dumps({'counts':dict(counts),'seconds':time.time()-start,'seed':25111603,'witnesses':witnesses},indent=2)+'\n');print('DONE',dict(counts),flush=True)
