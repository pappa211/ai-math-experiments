#!/usr/bin/env python3
"""Bounded C6/C7 chord test: can the specified spanning cycle be minimum?"""
import itertools,functools,time,json,datetime
from pathlib import Path
start=time.monotonic(); valid=0;domains=[];failure=None;unknown=[];controls=[]
def check(n,C,E,retain=False):
 E=sorted(E);ix={e:i for i,e in enumerate(E)};cm=sum(1<<ix[e] for e in C)
 T=[];tv=[]
 for tri in itertools.combinations(range(n),3):
  es=list(itertools.combinations(tri,2))
  if all(e in ix for e in es):
   t=sum(1<<ix[e] for e in es)
   if not t&cm:return None
   T.append(t);tv.append(tri)
 full=(1<<len(T))-1
 hit=[sum(1<<j for j,t in enumerate(T) if t>>e&1) for e in range(len(E))]
 te=[[e for e in range(len(E)) if t>>e&1] for t in T]
 calls=0
 @functools.lru_cache(None)
 def cover(s,k):
  nonlocal calls
  calls+=1
  if time.monotonic()-start>7:raise TimeoutError
  if not s:return ()
  if k==0:return None
  j=(s&-s).bit_length()-1
  for e in sorted(te[j],key=lambda e:-(hit[e]&s).bit_count()):
   ans=cover(s&~hit[e],k-1)
   if ans is not None:return (e,)+ans
  return None
 D=cover(full,len(C)-1)
 if D is not None:
  return {'smaller_cover':[E[e] for e in sorted(set(D))],'size':len(set(D))} if retain else {'smaller':True}
 return {'minimum_cycle_witness':True,'n':n,'edges':E,'C':C,'all_actual_triangles':tv,'tau':len(C),'search_budget':len(C)-1,'memo_states':cover.cache_info().currsize,'recursive_calls':calls,'certificate':'C is an explicit cover; exhaustive first-uncovered-triangle branching found no cover of size |C|-1.'}
def cyc(n):return sorted({tuple(sorted((i,(i+1)%n))) for i in range(n)})
controls.append({'name':'K4 selected C4 is not minimum','result':check(4,cyc(4),set(itertools.combinations(range(4),2)),True)})
C=cyc(5);E=set(C)|{(i,z) for i in range(5) for z in (5,6)}
controls.append({'name':'two independent full apices over C5: NONspanning C5 is minimum','result':check(7,C,E,True)})
try:
 for n in (6,7):
  C=cyc(n);extra=[e for e in itertools.combinations(range(n),2) if e not in C]
  row={'n':n,'chord_masks_total':1<<len(extra),'chord_masks_completed':0,'valid_cycle_cover_graphs':0,'complete':False};domains.append(row)
  for mask in range(1<<len(extra)):
   if time.monotonic()-start>7:raise TimeoutError
   ans=check(n,C,set(C)|{e for j,e in enumerate(extra) if mask>>j&1});row['chord_masks_completed']+=1
   if ans is None:continue
   valid+=1;row['valid_cycle_cover_graphs']+=1
   if ans.get('minimum_cycle_witness'):
    failure=ans;failure['chord_mask']=mask;raise StopIteration
  row['complete']=True
except StopIteration:pass
except TimeoutError:unknown.append({'reason':'internal7s','next_state':{'n':n,'mask':mask}})
result={'target':'Can a specified spanning C_n be a minimum ordinary triangle-edge cover on exactly its n vertices?','domain':'all chord subsets on C6 and C7, no outside vertices','valid_graphs_completed':valid,'domains':domains,'controls':controls,'first_minimum_cycle_witness':failure,'unknown':unknown,'elapsed_seconds':time.monotonic()-start,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
Path('evidence/challenger_spanning_cycle_mincover_probe.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
