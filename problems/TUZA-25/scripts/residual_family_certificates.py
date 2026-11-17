"""Literal certificates for frozen F. Discovery may use NetworkX; acceptance is direct."""
from residual_oracle import clique,edge
from itertools import combinations
import networkx as nx

def support(E):
 E=set(E);vs=sorted(set().union(*map(set,E))) if E else [];S=set()
 for t in combinations(vs,3):
  if clique(t)<=E:S|=clique(t)
 return S

def certify_F(E):
 S=support(E);G=nx.Graph();G.add_edges_from(S)
 W=nx.wheel_graph(6);match=nx.algorithms.isomorphism.GraphMatcher(G,W)
 if match.is_isomorphic():
  mapping=match.mapping
  assert {edge(mapping[u],mapping[v]) for u,v in S}=={edge(u,v) for u,v in W.edges()}
  return {'member':True,'type':'W5','mapping':mapping,'support_edges':sorted(S)}
 Q=[sorted(q) for q in nx.find_cliques(G)]
 if any(len(q) not in (4,5) for q in Q):return {'member':False,'type':'bad_maximal_clique','clique':next(q for q in Q if len(q) not in (4,5))}
 C=nx.Graph();C.add_nodes_from(range(len(Q)))
 for i,j in combinations(range(len(Q)),2):
  C.add_edge(i,j,weight=len(set(Q[i])&set(Q[j])))
 if not Q:return {'member':False,'type':'empty'}
 tree=nx.maximum_spanning_tree(C);order=list(nx.bfs_tree(tree,0));old=set();built=set();steps=[]
 for idx in order:
  q=set(Q[idx]);A=q&old;new=q-old
  if not old:
   assert len(q) in (4,5)
  elif not (2<=len(A)<len(q) and clique(A)<=built and new):
   return {'member':False,'type':'no_verified_clique_order'}
  built|=clique(q);old|=q;steps.append({'vertices':sorted(q),'old_overlap':sorted(A),'new_vertices':sorted(new)})
 if built!=S:return {'member':False,'type':'support_mismatch'}
 return {'member':True,'type':'clique_construction','steps':steps,'support_edges':sorted(S)}
