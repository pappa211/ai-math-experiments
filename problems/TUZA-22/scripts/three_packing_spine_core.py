"""TUZA-22: exact sufficient-interface screen, not a CS census."""
import itertools,json,time,sys
from pathlib import Path
start=time.monotonic()
CASES={'common_hub':[(0,1,2),(0,3,4),(0,5,6)],'chain':[(0,1,2),(0,3,4),(3,5,6)],'three_intersections':[(0,1,2),(0,3,4),(1,3,5)]}
out={'identity':'TUZA22-three-packing-spine-core-v1','claim':'For each candidate core and every common-spine choice, a cover of size<=5 containing the3 spines exists, or core packs4. Finite sufficient interface only.','cases':{},'failures':[]}
for name,P in CASES.items():
 n=1+max(sum((list(t) for t in P),[]));edges=list(itertools.combinations(range(n),2));idx={e:i for i,e in enumerate(edges)}
 def mask(es): return sum(1<<idx[tuple(sorted(e))] for e in es)
 pms=[mask(itertools.combinations(t,2)) for t in P]; pm=pms[0]|pms[1]|pms[2]
 extra=[1<<i for i in range(len(edges)) if not(pm>>i&1)]
 alltris=[(t,mask(itertools.combinations(t,2))) for t in itertools.combinations(range(n),3)]
 cnt={'R_subsets':0,'R_triangle_free':0,'all_three_book_intermediates':0,'spine_choices':0,'cover_pass':0,'four_pack_pass':0,'failures':0}
 for bits in range(1<<len(extra)):
  cnt['R_subsets']+=1
  if time.monotonic()-start>60: raise RuntimeError('external-budget guard60s; incomplete result must not be admitted')
  R=sum(extra[j] for j in range(len(extra)) if bits>>j&1)
  if any(tm&R==tm for _,tm in alltris):continue
  cnt['R_triangle_free']+=1
  opts=[]
  for pmi in pms:
   g=R|pmi;c=pmi
   for _,tm in alltris:
    if tm&g==tm:c&=tm
   if not c:break
   opts.append([1<<i for i in range(len(edges)) if c>>i&1])
  if len(opts)<3:continue
  cnt['all_three_book_intermediates']+=1
  G=R|pm;tris=[(t,tm) for t,tm in alltris if tm&G==tm]
  pack4cache=None
  for fs in itertools.product(*opts):
   cnt['spine_choices']+=1;F=fs[0]|fs[1]|fs[2];rest=[tm for _,tm in tris if not(tm&F)]
   uncovered=(1<<len(rest))-1
   covermasks=[sum(1<<j for j,tm in enumerate(rest) if tm>>i&1) for i in range(len(edges)) if G>>i&1]
   ok=not rest or any(c==uncovered for c in covermasks) or any(a|b==uncovered for a,b in itertools.combinations(covermasks,2))
   if ok:cnt['cover_pass']+=1;continue
   if pack4cache is None:
    def search(av,chosen):
     if len(chosen)==4:return chosen
     if len(av)<4-len(chosen):return None
     for j,(t,tm) in enumerate(av):
      got=search([(u,um) for u,um in av[j+1:] if not(um&tm)],chosen+[t])
      if got:return got
     return None
    pack4cache=search(tris,[]) or []
   if pack4cache:cnt['four_pack_pass']+=1;continue
   cnt['failures']+=1
   out['failures'].append({'type':name,'n':n,'packing':P,'edges':[edges[i] for i in range(len(edges)) if G>>i&1],'background':[edges[i] for i in range(len(edges)) if R>>i&1],'spines':[edges[x.bit_length()-1] for x in fs],'nu_core':3,'nu_upper_evidence':'Complete exhaustive decision search found no4 packing; P certifies3','forced_cover_bound5':'REFUTED at this core/spine choice; does not assert ordinary tau>5'})
 out['cases'][name]=cnt
out['elapsed_seconds']=time.monotonic()-start
out['complete']=True
Path(sys.argv[1]).write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='failures'},indent=2));print('failures',len(out['failures']))
