from residual_oracle import *
import networkx as nx,json,time,signal,collections,resource
from pathlib import Path
class Timeout(Exception):pass
def alarm(*a):raise Timeout()
signal.signal(signal.SIGALRM,alarm)

def regen_sources():
 for script,records,marker in [('residual_targeted_search.py','residual_targeted_records.jsonl','out=open'),('residual_pair_gluing_search.py','residual_pair_gluing_records.jsonl','counts=collections.Counter()')]:
  source=Path('scripts/'+script).read_text();ns={};exec(source.split(marker)[0],ns);rows=[json.loads(x) for x in Path('evidence/'+records).read_text().splitlines()];pos=0;seen=set()
  for item in ns['candidates']():
   kind,n,E,*rest=item;key=(n,tuple(sorted(E)))
   if key in seen:continue
   seen.add(key);X=Exact(n,E);connected=X.connected();X.clear()
   if not connected:continue
   if pos==len(rows):break
   row=rows[pos];pos+=1
   assert (row['kind'],row['n'],row['m'])==(kind,n,len(E)),(script,pos,row,kind,n,len(E))
   if row['status']=='EXACT' and 2*row['nu']-row['tau']==2:
    yield {'source':records,'line':pos,'kind':kind,'n':n,'edges':sorted(E),'nu':row['nu'],'tau':row['tau']}
  assert pos==len(rows),(script,pos,len(rows))

bases=list(regen_sources());signal.signal(signal.SIGALRM,alarm);Path('evidence/residual_pruning_inputs.json').write_text(json.dumps(bases,indent=2)+'\n')
counts=collections.Counter();start=time.time();out=open('evidence/residual_pruning_records.jsonl','w');seen=set();witnesses=[]
for bi,base in enumerate(bases):
 X=None;t=time.time()
 try:
  signal.setitimer(signal.ITIMER_REAL,20);X=Exact(base['n'],{tuple(e) for e in base['edges']});p,c=X.values();assert(p,c)==(base['nu'],base['tau']);counts['bases_verified']+=1
  removals=[('edge_pair',list(S)) for S in combinations(X.E,2)]+[('triangle',list(clique(T))) for T in X.T]
  for kind,S in removals:
   mask=X.without(S);pp=len(X.pack(mask));counts['deletions_screened']+=1
   if pp>=p:continue
   cc=len(X.cover(mask));counts['packing_drop_exact']+=1
   if cc!=2*pp-1:continue
   E=set(X.E)-set(S);key=tuple(sorted(E))
   if key in seen:continue
   seen.add(key);counts['defect_one']+=1
   Y=Exact(base['n'],E)
   if not Y.connected():counts['defect_one_disconnected']+=1;Y.clear();continue
   r=Y.profile();r.update({'base_index':bi,'deletion_kind':kind,'removed':S,'status':'EXACT','source_base':base})
   if r['one_edge_resilient']:
    counts['defect_one_resilient_connected']+=1
    if r['all_triangles_extend']:counts['all_triangles_extend']+=1
    G=nx.Graph();G.add_edges_from([e for e,h in zip(Y.E,Y.hits) if h]);r['support_chordal']=nx.is_chordal(G);r['support_is_W5']=nx.is_isomorphic(G,nx.wheel_graph(6))
    if not r['support_chordal'] and not r['support_is_W5']:
     counts['nonF']+=1;witnesses.append(r);print('NONF',bi,kind,r['n'],pp,cc,flush=True)
   out.write(json.dumps(r)+'\n');out.flush();Y.clear()
 except Timeout:counts['UNKNOWN_base_timeout']+=1;out.write(json.dumps({'base_index':bi,'status':'UNKNOWN_timeout','seconds':time.time()-t})+'\n');out.flush()
 finally:
  signal.setitimer(signal.ITIMER_REAL,0)
  if X:X.clear()
 if bi%5==0:print('base',bi,dict(counts),'elapsed',round(time.time()-start,1),'rss',resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,flush=True)
 if time.time()-start>600:counts['stopped_budget']=1;break
out.close();Path('evidence/residual_pruning_summary.json').write_text(json.dumps({'counts':dict(counts),'seconds':time.time()-start,'bases_total':len(bases),'witnesses':witnesses},indent=2)+'\n');print('DONE',dict(counts),flush=True)
