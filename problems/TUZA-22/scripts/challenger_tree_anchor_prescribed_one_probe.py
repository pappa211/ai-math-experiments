#!/usr/bin/env python3
"""Same 1761 valid graph domain; prescribed ONE-C triangle anchor discriminator."""
import itertools, functools, time, json, datetime
from pathlib import Path
start=time.monotonic(); tested=0; requests=0; domains=[]; unknown=[]; failure=None; controls=[]
def check(n,C,E,one_only=True):
 global requests
 E=sorted(E); ix={e:i for i,e in enumerate(E)}; cm=sum(1<<ix[e] for e in C)
 T=[]; tv=[]
 for tri in itertools.combinations(range(n),3):
  es=list(itertools.combinations(tri,2))
  if all(e in ix for e in es):
   t=sum(1<<ix[e] for e in es)
   if not t&cm:return None
   T.append(t);tv.append(tri)
 full=(1<<len(T))-1
 hit=[sum(1<<j for j,t in enumerate(T) if t>>e&1) for e in range(len(E))]
 te=[[e for e in range(len(E)) if t>>e&1] for t in T]
 con=[sum(1<<j for j,t in enumerate(T) if t&u) for u in T]
 @functools.lru_cache(None)
 def cov(s):
  if not s:return (0,())
  j=(s&-s).bit_length()-1; best=None
  for e in te[j]:
   k,D=cov(s&~hit[e]); ans=(k+1,(e,)+D)
   if best is None or ans[0]<best[0]:best=ans
  return best
 target_rows=[]
 for target in range(len(T)):
  if one_only and (T[target]&cm).bit_count()!=1:continue
  requests+=1; checked=[]; solution=None
  def visit(s,P,used):
   nonlocal solution
   if time.monotonic()-start>7:raise TimeoutError
   S=used&cm; left=full; fidx=[e for e in range(len(E)) if S>>e&1]
   for e in fidx:left&=~hit[e]
   k,D=cov(left); cost=len(fidx)+k
   row={'packing':[tv[j] for j in P], 'forced_C_edges':[E[e] for e in fidx], 'residual_tau':k, 'minimum_anchored_cost':cost, 'budget':2*len(P), 'minimum_anchored_cover':sorted(set(E[e] for e in fidx+list(D)))}
   checked.append(row)
   if cost<=2*len(P):solution=row;return True
   while s:
    bit=s&-s;s^=bit;j=bit.bit_length()-1
    if visit(s&~con[j],P+(j,),used|T[j]):return True
   return False
  visit(full&~con[target],(target,),T[target])
  row={'prescribed_triangle':tv[target], 'C_count':(T[target]&cm).bit_count(), 'success':solution is not None, 'packing_subsets_checked':len(checked)}
  if solution is not None:row['solution']=solution
  else:row['all_compatible_packing_certificates']=checked
  target_rows.append(row)
  if solution is None and one_only:
   return {'failure':True,'n':n,'edges':E,'C':C,'all_actual_triangles':tv,'failed_target':row,'certificate':'Every packing containing the prescribed triangle enumerated; exact minimum residual edge cover computed by first-uncovered-triangle recursion.'}
 return {'pass':True,'target_results':target_rows}
controls.append({'name':'K4 path3 prescribed one-C and two-C distinction','result':check(4,[(0,1),(1,2),(2,3)],set(itertools.combinations(range(4),2)),False)})
try:
 for name,C in [('path6',[(0,1),(1,2),(2,3),(3,4),(4,5)]),('double_star6',[(0,1),(0,2),(0,3),(1,4),(1,5)]),('fork_long_arm6',[(0,1),(0,2),(0,3),(3,4),(4,5)])]:
  extra=[e for e in itertools.combinations(range(6),2) if e not in C]
  row={'tree':name,'chord_masks_completed':0,'complete':False};domains.append(row)
  for mask in range(1<<len(extra)):
   ans=check(6,C,set(C)|{e for j,e in enumerate(extra) if mask>>j&1});row['chord_masks_completed']+=1
   if ans is None:continue
   tested+=1
   if ans.get('failure'):
    failure=ans;failure['tree_name']=name;failure['chord_mask']=mask;raise StopIteration
  row['complete']=True
except StopIteration:pass
except TimeoutError:unknown.append({'reason':'internal7s','next_state':{'tree':name,'mask':mask}})
result={'target':'Every prescribed actual ONE-C triangle extends to SOME anchored packing I, with C∩E(I)⊆D and |D|≤2|I|; I need not be maximum','same_corpus_as':'challenger_tree_anchor_probe.py','valid_graphs_completed':tested,'prescribed_requests_including_controls':requests,'domains':domains,'controls':controls,'first_failure':failure,'unknown':unknown,'elapsed_seconds':time.monotonic()-start,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
Path('evidence/challenger_tree_anchor_prescribed_one_probe.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
