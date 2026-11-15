#!/usr/bin/env python3
"""Bounded constructive checks; no imported historical code, solver, or network."""
import itertools,json,random,resource,signal,sys,time
from pathlib import Path
START=time.monotonic(); signal.alarm(60)
resource.setrlimit(resource.RLIMIT_CPU,(60,60))
limits={'wall_alarm_seconds':60,'cpu_seconds':60}
try:
 resource.setrlimit(resource.RLIMIT_AS,(1536*1024**2,1536*1024**2));limits['address_space_bytes']=1536*1024**2
except (ValueError,OSError) as e: limits['address_space_limit']='NOT_AVAILABLE: '+str(e)
ROOT=Path(__file__).resolve().parent.parent

def edge(u,v):return tuple(sorted((u,v)))
def myc(n,E):
 F=set(E)
 for u,v in E:F.update([edge(n+u,v),edge(n+v,u)])
 F.update((n+i,2*n) for i in range(n))
 return 2*n+1,F

def rim(n,E,t):
 N=2*n*t; L=set()
 def v(layer,base,c):return (layer*n+base)*t+c
 for layer in range(2):
  for a,b in E:
   for i in range(t):
    for j in range(t):L.add(edge(v(layer,a,i),v(layer,b,j)))
 for a in range(n):
  for i in range(t):
   for j in range(t):L.add(edge(v(0,a,i),v(1,a,j)))
 return N,L

def complete(n,t,q,prescribed):
 # prescribed entries: (apex index, rim endpoint, rim endpoint)
 R=[(a,*edge(u,v)) for a,u,v in prescribed]
 all_prescribed_vertices={v for _,u,w in R for v in (u,w)}
 used=set(); result=[]
 for apex in range(q):
  current=[edge(u,v) for a,u,v in R if a==apex]
  future={edge(u,v) for a,u,v in R if a>apex}
  F=used|future
  Q=set(current); occupied={x for e in Q for x in e}
  for u,v in current:
   lu,bu=divmod(u//t,n);lv,bv=divmod(v//t,n)
   if lu!=lv:continue
   opposite=1-lu
   xs=[(opposite*n+bu)*t+i for i in range(t) if (opposite*n+bu)*t+i not in occupied|all_prescribed_vertices]
   ys=[(opposite*n+bv)*t+i for i in range(t) if (opposite*n+bv)*t+i not in occupied|all_prescribed_vertices]
   found=None
   for x in xs:
    for y in ys:
     if edge(x,y) not in F:
      found=edge(x,y);break
    if found:break
   assert found is not None,('companion failure',n,t,q,R,apex)
   Q.add(found);occupied.update(found)
  for b in range(n):
   left=[b*t+i for i in range(t) if b*t+i not in occupied]
   right=[(n+b)*t+i for i in range(t) if (n+b)*t+i not in occupied]
   assert len(left)==len(right)
   match={}
   def aug(x,seen):
    for y in right:
     if y in seen or edge(x,y) in F:continue
     seen.add(y)
     if y not in match or aug(match[y],seen):match[y]=x;return True
    return False
   assert all(aug(x,set()) for x in left)
   Q.update(edge(x,y) for y,x in match.items())
  assert len(Q)==n*t
  assert not (Q&used)
  assert set(current)<=Q
  result.append(sorted(Q));used.update(Q)
 return result

C5={edge(i,(i+1)%5) for i in range(5)}
probes=[];rng=random.Random(1704)
for q,t,random_count in [(1,10,20),(2,12,40),(3,14,40)]:
 n=5;N,L=rim(n,C5,t);Es=sorted(L)
 patterns=[[],[(0,*Es[0])]]
 # Same apex: two distinct backbone edges and two mirrored within-layer edges.
 patterns += [[(0,0,5*t),(0,1,5*t+1)],[(0,0,t),(0,5*t,6*t)]]
 if q>1:
  patterns += [[(0,0,t),(1,0,t+1)],[(0,0,5*t),(1,0,5*t+1)]]
 for _ in range(random_count):
  while True:
   a,b=rng.randrange(q),rng.randrange(q);e,f=rng.choice(Es),rng.choice(Es)
   if e!=f and (a!=b or not(set(e)&set(f))):break
  patterns.append([(a,*e),(b,*f)])
 certificates=[]
 for P in patterns:
  certificates.append({'prescribed':P,'rim_perfect_matchings':complete(n,t,q,P)})
 probes.append({'base_n':n,'base_edges':sorted(C5),'q':q,'t':t,'rim_order':N,'rim_edges':len(L),'graph_order':N+q,'graph_edges':len(L)+q*N,'predicted_triangles':q*len(L),'predicted_nu':q*N//2,'certificates':certificates})
# A mixed-clone colour-count census, not a graph/cover census.
n=5;B=set()
for u,v in C5:B.update([edge(u,v),edge(n+u,n+v)])
B.update((i,n+i) for i in range(n))
minimum_B=min(sum(c[u]==c[v] for u,v in B) for c in itertools.product(range(2),repeat=10))
minimum_blowup=10**9;arg=None
for x in itertools.product(range(3),repeat=10):
 cost=sum(x[u]*x[v]+(2-x[u])*(2-x[v]) for u,v in B)
 if cost<minimum_blowup:minimum_blowup=cost;arg=x
assert minimum_B==2 and minimum_blowup==8
# Explicit finite seed for the symbolic r=4 family.
n0=5;E0=C5
for _ in range(2):n0,E0=myc(n0,E0)
assert n0==23 and len(E0)==71
assert not any(all(edge(u,v) in E0 for u,v in itertools.combinations(T,2)) for T in itertools.combinations(range(n0),3))
out={'status':'PASS','method':'explicit matching construction plus integer-only checks; optimality from exact spoke-count bound','python':sys.version,'limits':limits,'probes':probes,'colour_check':{'B':'C5 Cartesian K2','r':2,'t':2,'clone_count_vectors_examined':3**10,'m_r_B':minimum_B,'min_monochromatic_blowup_cost':minimum_blowup,'argmin_red_counts':arg},'large_symbolic_seed':{'base_n':n0,'base_edges':sorted(E0),'q':4,'t':93,'base_chromatic_lower_bound':'ordinary Mycielski proof, not computed','large_graph_enumerated':False,'graph_order':4282,'rim_edge_count':165*93**2,'actual_triangle_count_formula':4*165*93**2,'nu':8556,'colour_cost_lower_bound':17298,'two_nu':17112,'explicit_cover_size':16740,'nu_after_any_spoke_deletion':8555},'elapsed_seconds':time.monotonic()-START,'peak_rss_bytes_darwin':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss}
(ROOT/'evidence/a_constructive_checks.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'status':out['status'],'cases':sum(len(p['certificates']) for p in probes),'colour_vectors':3**10,'elapsed_seconds':out['elapsed_seconds'],'limits':limits}))
