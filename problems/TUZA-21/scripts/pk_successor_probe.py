"""Targeted minimum-cover/private-packing extension screen, standard library only."""
from pathlib import Path
from itertools import combinations
from functools import lru_cache
import json,time,datetime,platform
W=Path(__file__).resolve().parents[1]
assert platform.system()=="Darwin"
start=time.monotonic();whole_deadline=start+85
clock=json.loads((W/'operations/clock.json').read_text())
assert datetime.datetime.now(datetime.timezone.utc)<datetime.datetime.fromisoformat(clock['research_cutoff_utc'])
def clique(v):return set(combinations(sorted(v),2))
def bits(s):
 while s:
  b=s&-s;yield b.bit_length()-1;s-=b

def analyze(name,edges):
 deadline=min(time.monotonic()+2,whole_deadline)
 E=sorted(edges);V=sorted(set().union(*map(set,E)));ei={e:i for i,e in enumerate(E)}
 Ts=[t for t in combinations(V,3) if clique(t)<=edges]
 tm=[sum(1<<ei[e] for e in clique(t)) for t in Ts];full=(1<<len(Ts))-1
 inc=[sum(1<<i for i,t in enumerate(tm) if t>>e&1) for e in range(len(E))]
 conf=[sum(1<<j for j,u in enumerate(tm) if t&u) for t in tm]
 def check():
  if time.monotonic()>deadline:raise TimeoutError
 @lru_cache(None)
 def cover(s):
  check()
  if not s:return 0
  j=next(bits(s));return 1+min(cover(s&~inc[e]) for e in bits(tm[j]))
 @lru_cache(None)
 def pack(s):
  check()
  if not s:return ()
  j=next(bits(s));a=(j,)+pack(s&~conf[j]);b=pack(s&~(1<<j))
  return a if len(a)>=len(b) else b
 @lru_cache(None)
 def minmax(s):
  check()
  if not s:return ()
  j=next(bits(s))
  return min(((i,)+minmax(s&~conf[i]) for i in bits(s&conf[j])),key=len)
 tau=cover(full);Cs=set();seen=set();ccap=False
 def covers(s,c):
  nonlocal ccap
  check()
  if len(Cs)>=64:ccap=True;return
  if (s,c) in seen:return
  seen.add((s,c))
  if not s:Cs.add(c);return
  j=next(bits(s));z=cover(s)
  for e in bits(tm[j]):
   if cover(s&~inc[e])==z-1:covers(s&~inc[e],c|1<<e)
 covers(full,0)
 checked=0;deficient=0;qchecked=0;qcap=False;minq=None
 for C in sorted(Cs):
  check();checked+=1;F=sum(1<<j for j,t in enumerate(tm) if (t&C).bit_count()==1)
  q=len(pack(F));minq=q if minq is None else min(minq,q)
  if 2*q>=tau:continue
  deficient+=1;Qs=[]
  def enum(s,p):
   nonlocal qcap
   check()
   if len(Qs)>=128:qcap=True;return
   if not s:Qs.append(p);return
   j=next(bits(s));z=len(pack(s))
   if 1+len(pack(s&~conf[j]))==z:enum(s&~conf[j],p+(j,))
   if len(pack(s&~(1<<j)))==z:enum(s&~(1<<j),p)
  enum(F,())
  for Q in Qs:
   qchecked+=1;s=full
   for j in Q:s&=~conf[j]
   P=Q+minmax(s)
   if 2*len(P)<tau:
    best=Q+pack(s)
    assert all(not tm[a]&tm[b] for a,b in combinations(P,2))
    assert all(any(tm[j]&tm[p] for p in P) for j in range(len(Ts)))
    return {'name':name,'status':'COUNTEREXAMPLE_D_ALL','edges':E,'triangles':Ts,'tau':tau,'C':[E[e] for e in bits(C)],'private_triangles':[Ts[j] for j in bits(F)],'nu_private':q,'Q':[Ts[j] for j in Q],'P':[Ts[j] for j in P],'best_extension':[Ts[j] for j in best],'best_extension_size':len(best),'also_refutes_every_Q_some_extension':2*len(best)<tau,'cover_states':cover.cache_info().currsize,'packing_states':pack.cache_info().currsize}
 return {'name':name,'status':'PASS_EXAMINED','edges':E,'n':len(V),'m':len(E),'triangles':len(Ts),'tau':tau,'minimum_nu_private_examined':minq,'minimum_covers_checked':checked,'minimum_covers_partial':ccap,'deficient_minimum_covers':deficient,'maximum_private_packings_checked_for_extension':qchecked,'maximum_private_packings_partial':qcap}

def corpus():
 yield 'K4',clique(range(4));yield 'K5',clique(range(5))
 yield 'three_sun',clique((0,1,2))|clique((0,1,3))|clique((1,2,4))|clique((0,2,5))
 yield 'wheel_5rim',set((0,i) for i in range(1,6))|{(1,2),(2,5),(4,5),(3,4),(1,3)}
 for a,b in [(4,4),(5,4),(5,5)]:
  for overlap in [1,2,3]:
   yield f'cells_{a}_{b}_overlap_{overlap}',clique(range(a))|clique(list(range(overlap))+list(range(a,a+b-overlap)))
 for cells in [((0,1,2,3),(2,3,4,5),(4,5,0,1)),((0,1,2,3),(0,1,4,5),(2,3,4,5)),((0,1,2,3,4),(0,1,5,6),(2,3,6,7)),((0,1,2,3,4),(0,1,5,6),(0,2,7,8))]:
  yield 'three_cells_'+str(cells),set().union(*(clique(c) for c in cells))
 # Local endpoint templates: central red triangle012, one page per edge,
 # all eight missing opposite-tip spokes, then tip triangle optional.
 base=clique((0,1,2))|clique((0,1,3))|clique((1,2,4))|clique((0,2,5))
 extra=[(2,3),(0,4),(1,5)]
 for mask in range(8):
  for tips in [False,True]:
   E=base|{e for i,e in enumerate(extra) if mask>>i&1}
   if tips:E|=clique((3,4,5))
   yield f'red_triangle_opposite_{mask}_tip_clique_{tips}',E
 blocks=[{0,1,2,4,5},{0,1,3,6},{1,6,7,8},{1,8,9,10},{1,3,10,11}]
 yield 'TUZA20_twelve',set().union(*(clique(c) for c in blocks))
rows=[];complete=True
for name,E in corpus():
 if time.monotonic()>whole_deadline:complete=False;break
 try:r=analyze(name,E)
 except TimeoutError:r={'name':name,'status':'UNKNOWN_TIMEOUT','edges':sorted(E),'per_case_seconds':2}
 rows.append(r)
 out={'candidate':'C21-D-all','corpus':'Fixed cell overlaps and literal red-triangle templates; no random seed or generic census','complete_corpus':False,'seconds':time.monotonic()-start,'cover_cap':64,'private_packing_cap':128,'rows':rows}
 (W/'results/pk_successor_probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(name,r['status'],r.get('tau'),r.get('minimum_nu_private_examined'),flush=True)
 if r['status'].startswith('COUNTEREXAMPLE'):complete=False;break
out['complete_corpus']=complete;out['seconds']=time.monotonic()-start
(W/'results/pk_successor_probe.json').write_text(json.dumps(out,indent=2)+'\n')
print('DONE',len(rows),out['seconds'],complete)
