"""Independent N=3 connected-chain verification. Standard library only."""
from itertools import combinations,product
from pathlib import Path
import json
V=(0,1,2,3,4,5,7);E0=set(combinations(V,2))-{(0,5),(5,7),(1,3),(2,4)}
P0=((2,3,7),(0,1,2),(1,4,7),(3,4,5));B0=set().union(*(set(combinations(t,2)) for t in P0));R0={(3,7),(1,2),(4,7),(3,4)}
T0=[t for t in combinations(V,3) if set(combinations(t,2))<=E0];U0=sorted(B0-R0)
def localcover(C):return all(C&set(combinations(t,2)) for t in T0)
LC=[R0|set(M) for M in combinations(U0,4) if localcover(R0|set(M))]
assert len(LC)==9 and not any(localcover(R0|set(M)) for M in combinations(U0,3))
N=3;maps=[];nextlabel=0
for i in range(N):
 m={}
 if i:m[5]=maps[-1][0];m[1]=maps[-1][7]
 for v in V:
  if v not in m:m[v]=nextlabel;nextlabel+=1
 maps.append(m)
def emap(e,m):return tuple(sorted(m[v] for v in e))
def tmap(t,m):return tuple(sorted(m[v] for v in t))
Es=[{emap(e,m) for e in E0} for m in maps];Bs=[{emap(e,m) for e in B0} for m in maps]
E=set().union(*Es);B=set().union(*Bs);VV=sorted(set().union(*map(set,E)))
P=[tmap(t,m) for m in maps for t in P0];PE=[set(combinations(t,2)) for t in P]
T=[t for t in combinations(VV,3) if set(combinations(t,2))<=E];TE=[set(combinations(t,2)) for t in T]
assert len(VV)==17 and len(E)==49 and len(B)==36 and len(T)==48
assert set(T)=={tmap(t,m) for m in maps for t in T0}
assert all(not Bs[i]&Bs[j] for i in range(N) for j in range(i))
assert not set(maps[0].values())&set(maps[2].values())
seen={0}
while True:
 q=seen|{j for i in seen for j in range(len(T)) if TE[i]&TE[j]}
 if q==seen:break
 seen=q
assert len(seen)==48
for F in PE:
 private={next(iter(Q&B)) for Q in TE if len(Q&B)==1 and Q&B<=F}
 assert len(private)==1
# Packing upper: all triangles local, each local block has six odd vertices;
# five local triangles would leave only two edges and cannot realize that odd set.
for Eblock,m in zip(Es,maps):assert sum(sum(v in e for e in Eblock)%2 for v in m.values())==6
assert len(set().union(*PE))==36

def deficiency(C):
 load=[len(F&C) for F in PE];H=[i for i,k in enumerate(load) if k==3];L=[i for i,k in enumerate(load) if k==1]
 adj={i:[j for j in L if set(P[i])&set(P[j])] for i in H}
 # Standard exhaustive augmenting path matching on this small bipartite graph.
 mate={}
 def augment(i,seen):
  for j in adj[i]:
   if j in seen:continue
   seen.add(j)
   if j not in mate or augment(mate[j],seen):mate[j]=i;return True
  return False
 for i in H:augment(i,set())
 return len(H)-len(mate),load
C0=R0|{(0,1),(0,2),(1,4),(2,3)}
start=set().union(*({emap(e,m) for e in C0} for m in maps));assert deficiency(start)[0]==1
states=[]
for choices in product(LC,repeat=N):
 C=set().union(*({emap(e,m) for e in A} for A,m in zip(choices,maps)))
 assert len(C)==24 and all(C&Q for Q in TE)
 states.append((C,deficiency(C)[0],len(C^start)))
assert len(states)==729
pivots=[(C,d,s) for C,d,s in states if s==2]
assert len(pivots)==12 and all(d>=1 for C,d,s in pivots)
minimum_distance=min(s for C,d,s in states if d==0);assert minimum_distance==4
repairlocal=(C0-{(2,3)})|{(3,5)}
repair=set().union(*({emap(e,m) for e in (repairlocal if i%2==0 else C0)} for i,m in enumerate(maps)))
assert deficiency(repair)[0]==0 and len(repair^start)==4
out={'status':'PASS','N':N,'vertex_maps':maps,'vertices':VV,'edges':sorted(E),'actual_triangles':T,'triangle_connected':True,'P':P,'nu':12,'all_packed_members_type1':True,'support_cover_minimum':24,'minimum_support_states':729,'start_cover':sorted(start),'start_deficiency':1,'one_pivot_deficiencies':[d for C,d,s in pivots],'minimum_symmetric_difference_to_compatible':minimum_distance,'repair_cover':sorted(repair),'repair_deficiency':0,'packing_upper_certificate':'Actual triangles partition among three literal blocks, each with parity-certified nu4','scope':'Connected actual triangle family; bounded global Hall-deficiency strict descent refuted, existential gluing not refuted'}
p=Path(__file__).resolve().parents[1]/'evidence'/'late_star_connected_chain_verified.json';p.write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({'status':'PASS','nu':12,'support_tau':24,'one_pivots':12,'pivot_deficiencies':out['one_pivot_deficiencies'],'minimum_distance':minimum_distance,'path':str(p)}))
