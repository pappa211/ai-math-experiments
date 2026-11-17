"""Exact finite cover reduction and literal four-cone interacting construction."""
import itertools,json,time,platform
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
assert platform.system()=='Darwin'
start=time.monotonic();r=4;t=2
V=[x for x in range(32) if x.bit_count()%2==0];idx={v:i for i,v in enumerate(V)}
L={tuple(sorted((a,b))) for a,b in itertools.combinations(V,2) if (a^b).bit_count()==4}
I=lambda i:31^(1<<i)
P=[tuple(sorted(e)) for e in [(30,3),(29,6),(27,5),(23,9),(15,17)]]
U=sorted(set(V)-set(sum((list(e) for e in P),[])))
outedges=sorted(e for e in L if set(e)<=set(U));inedges=P[2:4]
J=inedges+outedges;ji={e:i for i,e in enumerate(J)}
parent={(i,v):(i,v) for i in range(r) for v in V+[32]}
def find(x):
 while parent[x]!=x:parent[x]=parent[parent[x]];x=parent[x]
 return x
def union(a,b):parent[find(a)]=find(b)
for i in range(r):
 for aedge,bedge in zip(outedges,inedges):
  for a,b in zip(aedge,bedge):union((i,a),((i+1)%r,b))
roots=sorted(set(find(x) for x in parent));number={x:i for i,x in enumerate(roots)};mp={(i,v):number[find((i,v))] for i,v in parent}
def ge(i,e):return tuple(sorted(mp[i,v] for v in e))
Es=[{ge(i,e) for e in L}|{ge(i,(32,v)) for v in V} for i in range(r)];E=set().union(*Es)
T=[t for t in itertools.combinations(range(len(roots)),3) if all(e in E for e in itertools.combinations(t,2))]
Q=[tuple(sorted((mp[i,32],mp[i,a],mp[i,b]))) for i in range(r) for a,b in P];qedges=[set(itertools.combinations(t,2)) for t in Q]
assert all(not a&b for a,b in itertools.combinations(qedges,2))
assert all(any(set(itertools.combinations(t,2))&q for q in qedges) for t in T)
C0={ge(i,(32,v)) for i in range(r) for v in V if v not in {I(j) for j in range(5)}}
assert all(len(set(itertools.combinations(t,2))&C0)>=1 for t in T)
# Exact conditional cover table: shared rim selected F, unselected shared rims cannot lie in W.
ad=[sum(1<<idx[b] for b in V if tuple(sorted((a,b))) in L) for a in V];ec=[0]*(1<<16);need=[0]*(1<<16);bval=[100]*(1<<(2*t));bw=[None]*(1<<(2*t))
for w in range(1<<16):
 if w:
  v=(w&-w).bit_length()-1;prev=w&~(1<<v);neigh=ad[v]&prev;ec[w]=ec[prev]+neigh.bit_count();need[w]=need[prev]
  for u in range(16):
   if neigh>>u&1:
    e=tuple(sorted((V[v],V[u])))
    if e in ji:need[w]|=1<<ji[e]
 value=16-w.bit_count()+ec[w]-need[w].bit_count();f=need[w]
 if value<bval[f]:bval[f]=value;bw[f]=w
h=bval[:];hw=bw[:]
for bit in range(2*t):
 for f in range(1<<(2*t)):
  if f>>bit&1 and h[f^(1<<bit)]<h[f]:h[f]=h[f^(1<<bit)];hw[f]=hw[f^(1<<bit)]
best=100;mins=[]
for f in range(1<<(t*r)):
 cost=f.bit_count();local=[]
 for i in range(r):
  incoming=(f>>(t*((i-1)%r)))&((1<<t)-1);outgoing=(f>>(t*i))&((1<<t)-1);mask=incoming|(outgoing<<t);local.append(mask);cost+=h[mask]
 if cost<best:best=cost;mins=[]
 if cost==best:mins.append((f,local))
f,local=mins[0];C=set()
for i,mask in enumerate(local):
 w=hw[mask];C|={ge(i,(32,v)) for j,v in enumerate(V) if not w>>j&1}
 C|={ge(i,e) for e in L if e not in ji and all(w>>idx[v]&1 for v in e)}
 for j,e in enumerate(J):
  if mask>>j&1:C.add(ge(i,e))
assert len(C)==best and all(set(itertools.combinations(t,2))&C for t in T)
result={'construction':'four Clebsch cones cyclically glued outgoing2K2 to incoming2K2','n':len(roots),'m':len(E),'triangle_count':len(T),'edges':sorted(E),'triangles':T,'local_vertex_maps':[{str(v):mp[i,v] for v in V+[32]} for i in range(r)],'shared_local_edges_incoming':inedges,'shared_local_edges_outgoing':outedges,'Q':Q,'Q_size':len(Q),'Q_is_full_maximal':True,'original_spoke_cover':sorted(C0),'original_spoke_cover_size':len(C0),'tau_exact':best,'minimum_cover':sorted(C),'conditional_cover_h':h,'conditional_cover_argmin_W':hw,'minimum_shared_edge_patterns':len(mins),'selected_shared_pattern':f,'seconds':time.monotonic()-start}
(ROOT/'evidence/challenger_cycle_two_matching.json').write_text(json.dumps(result,indent=2)+'\n')
print({k:result[k] for k in ['n','m','triangle_count','Q_size','original_spoke_cover_size','tau_exact','minimum_shared_edge_patterns','seconds']})
