#!/usr/bin/env python3
"""Independent literal verification of the fixed nine-vertex TF light-wedge graph."""
from pathlib import Path
from itertools import combinations
from collections import Counter
import hashlib,json,datetime,platform
W=Path(__file__).resolve().parents[1];OUT=W/'evidence/tf_light_wedge_fresh'
src=OUT/'inverse_n9.json';raw=json.loads(src.read_text());d=raw['candidate']
assert d is not None
E=[tuple(e) for e in d['edges']];assert E==sorted(set(E));ES=set(E);eid={e:i for i,e in enumerate(E)}
T=[t for t in combinations(range(9),3) if set(combinations(t,2))<=ES]
assert len(E)==22 and len(T)==18 and T==list(map(tuple,d['triangles']))
TM=[sum(1<<eid[e] for e in combinations(t,2)) for t in T]
ALL=(1<<len(E))-1
COV=[sum(1<<j for j,t in enumerate(T) if e[0] in t and e[1] in t) for e in E]
FULL=(1<<len(T))-1
checked7=0
for C in combinations(range(len(E)),7):
 reached=0
 for e in C:reached|=COV[e]
 assert reached!=FULL
 checked7+=1
assert checked7==170544
witnesses={}
for row in d['TF_witnesses']:
 t=tuple(row['triangle']);C=[tuple(e) for e in row['cover']]
 assert t in T and len(C)==len(set(C))==8 and set(C)<=ES and set(combinations(t,2))<=set(C)
 mask=sum(1<<eid[e] for e in C)
 assert all(mask&tm for tm in TM)
 witnesses[t]=C
assert set(witnesses)==set(T)
# Independent packing recursion; visits only subfamilies of these 18 triangles.
packings=[];best=0
def visit(i,used,chosen):
 global best,packings
 if i==len(T):
  if len(chosen)>best:best=len(chosen);packings=[(tuple(chosen),used)]
  elif len(chosen)==best:packings.append((tuple(chosen),used))
  return
 if len(chosen)+(len(T)-i)<best:return
 visit(i+1,used,chosen)
 if not used&TM[i]:visit(i+1,used|TM[i],chosen+[i])
visit(0,0,[])
resilient_pairs=[];blockers=[]
for i,j in combinations(range(len(E)),2):
 forbidden=(1<<i)|(1<<j)
 k=next((k for k,(_,used) in enumerate(packings) if not used&forbidden),None)
 if k is None:blockers.append([E[i],E[j]])
 else:resilient_pairs.append({'deleted':[E[i],E[j]],'packing_index':k})
codeg={e:sum(set(e)<=set(t) for t in T) for e in E}
assert codeg[(0,1)]==codeg[(0,2)]==2
heavy={e for e,n in codeg.items() if n>=3}
heavyT=[t for t in T if set(combinations(t,2))<=heavy]
light_counts=Counter(sum(codeg[e]<=2 for e in combinations(t,2)) for t in T)
negative=[]
for t,C in list(witnesses.items())[:1]:
 for removed in C:
  rest=set(C)-{removed};uncovered=[z for z in T if not set(combinations(z,2))&rest]
  assert uncovered;negative.append({'removed':removed,'uncovered':uncovered[0]})
result={'status':'PASS_LITERAL_EXACT','utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'host':platform.system(),'python':platform.python_version(),'producer_code_imported':False,'n':9,'m':22,'triangle_count':18,'edges':E,'triangles':T,'tau':8,'seven_subsets_checked':checked7,'TF_witnesses':d['TF_witnesses'],'nu':best,'all_maximum_packings':[[T[i] for i in ids] for ids,_ in packings],'maximum_packing_count':len(packings),'two_edge_resilient':not blockers,'two_edge_blockers':blockers,'avoiding_pair_certificates':resilient_pairs,'heavy_edges':sorted(heavy),'heavy_triangles':heavyT,'light_edges_per_triangle_histogram':dict(light_counts),'codegrees':[{'edge':e,'codegree':codeg[e]} for e in E],'negative_controls':negative,'input_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'scope':'Fixed literal graph only. Exact exhaustive 7-cover rejection and maximum packing enumeration, no SAT dependency.'}
(OUT/'literal_verification.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k not in ['edges','triangles','TF_witnesses','all_maximum_packings','avoiding_pair_certificates','two_edge_blockers','codegrees']},indent=2))
print('first_two_edge_blocker',blockers[:1])
