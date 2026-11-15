#!/usr/bin/env python3
"""Fresh finite certificates for apex witness, K4 pruning, and controls."""
from datetime import datetime, timezone
from hashlib import sha256
from itertools import combinations
from pathlib import Path
import json, sys, time

ROOT=Path('ARCHIVE/TUZA-18')
STOP=datetime(2026,11,14,21,0,10,tzinfo=timezone.utc)
SOURCES={'notes/apex_minimum_restriction.md':'a4f3419d5acd52ae32751ff00a5c27869150ee6b8971be80dcba470ff4b0b2a5',
 'evidence/apex_witness_verified.json':'f01204b5c93d3535b94fca9dcc0011073c843ff01c74e42b52b69286cfd03c80',
 'notes/criticality_control_proofs.md':'faf8f2c8cbb79cd0064b40a7f69c3194856009520587bd6c55e01a4c97326bf3',
 'notes/apex_pruned_critique.md':'5b739fc1662ea1bf38ebf4f67de1e0315ed940b5fa0df36d2aab71fe025542fe'}

def deadline():
 if datetime.now(timezone.utc)>=STOP:raise RuntimeError('Mathematical testing deadline reached')

def triangles(vertices,edges):
 return [frozenset(combinations(t,2)) for t in combinations(sorted(vertices),3) if frozenset(combinations(t,2))<=edges]

def mincovers(universe,hyperedges):
 universe=sorted(universe)
 for k in range(len(universe)+1):
  result=[frozenset(c) for c in combinations(universe,k) if all(set(c)&e for e in hyperedges)]
  if result:return result
 raise AssertionError('unreachable')

def packings(hyperedges):
 best=[]
 for k in range(len(hyperedges)+1):
  current=[p for p in combinations(hyperedges,k) if sum(map(len,p))==len(frozenset().union(*p))]
  if not current:return best
  best=current
 return best

def tau(vertices,edges):return len(mincovers(edges,triangles(vertices,edges))[0])

def apex():
 witness=json.loads((ROOT/'evidence/apex_witness_verified.json').read_text())
 E=frozenset(map(tuple,witness['edges']));V=set(range(7));z=1
 ts=triangles(V,E)
 assert set(ts)=={frozenset(map(tuple,t)) for t in witness['triangles']}
 H=frozenset(e for e in E if z not in e);W=V-{z};old=triangles(W,H)
 C=mincovers(H,old);P=packings(ts);HC=mincovers(E,ts)
 assert C==[frozenset(((3,5),(4,6)))]
 assert len(C[0])==len(packings(old)[0])==2 and len(HC[0])==len(P[0])==3
 X={v for v in W if tuple(sorted((v,z))) in E};L=frozenset(e for e in H if set(e)<=X)
 link_tau=len(mincovers(X,[frozenset(e) for e in L-C[0]])[0]);assert link_tau==2
 assert frozenset(map(tuple,witness['G_cover'])) in HC
 assert tuple(frozenset(map(tuple,t)) for t in witness['G_packing']) in P
 classes=({0,5},{2,6},{3,4});assert all(not any(set(e)<=c for c in classes) for e in H)
 profile=[]
 for k in range(len(X)+1):
  for chosen in combinations(sorted(X),k):
   s=set(chosen);F=frozenset(e for e in L if not set(e)&s)
   delta=len(F)+tau(W,H-F)-2
   assert delta>=0
   profile.append(dict(S=list(chosen),forced_edges=[list(e) for e in sorted(F)],delta=delta,value=k+delta))
 assert min(r['value'] for r in profile)==1
 assert min(len(r['S']) for r in profile if r['delta']==0)==2
 assert profile[0]['delta']==1
 return dict(tau_H=2,nu_H=2,minimum_H_covers=1,lambda_min=2,tau_G=3,nu_G=3,
             actual_triangles=len(ts),proper_H_three_coloring=True,forced_penalty_profile=profile)

def k4_pruning():
 E=frozenset(combinations(range(4),2));ts=triangles(range(4),E);rows=[]
 for packed in ts:
  for cut in range(16):
   same=lambda e:((cut>>e[0])&1)==((cut>>e[1])&1)
   selected={e for e in packed if same(e)}
   for t in ts:
    noncross=[e for e in t if same(e)]
    if len(noncross)==1 and noncross[0] not in packed:selected.add(noncross[0])
   fixed=selected-set(packed);optional=selected&set(packed);costs=[]
   for k in range(len(optional)+1):
    for retained in combinations(optional,k):
     cover=fixed|set(retained)
     if all(cover&t for t in ts):costs.append(len(cover))
   expected=2 if cut.bit_count()==2 else 3
   assert min(costs)==expected
   rows.append(expected)
 return dict(face_cut_cases=len(rows),balanced_cost_two=rows.count(2),unbalanced_cost_three=rows.count(3))

def base_voltage_cycles():
 base=frozenset((a,j+5) for a in range(5) for j in range(5) if a!=j)
 neigh={v:set() for v in range(10)}
 volt={e:1<<i for i,e in enumerate(sorted(base))}
 for a,b in base:neigh[a].add(b);neigh[b].add(a)
 def canon(seq):
  variants=[]
  for s in (seq,tuple(reversed(seq))):
   variants.extend(s[i:]+s[:i] for i in range(len(s)))
  return min(variants)
 rows=[];q=(1<<20)+1
 for length in (4,6):
  found=set()
  def visit(path):
   if len(path)==length:
    if path[0] in neigh[path[-1]]:found.add(canon(tuple(path)))
    return
   for w in neigh[path[-1]]:
    if w not in path:visit(path+[w])
  for v in range(10):visit([v])
  vals=[]
  for cyc in found:
   value=0
   for u,v in zip(cyc,cyc[1:]+cyc[:1]):
    if u<5:value+=volt[(u,v)]
    else:value-=volt[(v,u)]
   assert value!=0 and abs(value)<q and value%q!=0
   vals.append(abs(value))
  rows.append(dict(length=length,simple_cycles=len(found),minimum_absolute_voltage=min(vals),maximum_absolute_voltage=max(vals)))
 return dict(q=q,blocks=5*q,base_edges=len(base),cycle_checks=rows,all_nonzero_mod_q=True,
             limitation='Checks the finite base-cycle voltage certificate, not the full 5q-vertex graph.')

def criticality():
 K5=frozenset(combinations(range(5),2));T5=triangles(range(5),K5)
 K5covers=mincovers(K5,T5);K5packs=packings(T5)
 assert len(K5covers[0])==4 and len(K5packs[0])==2
 for deleted in combinations(K5,2):
  d=set(deleted);assert any(not frozenset().union(*p)&d for p in K5packs)
  assert tau(range(5),K5-d)==2
 A=set(combinations((0,1,2,3,4),2));B=set(combinations((0,1,5,6,7),2));G=frozenset(A|B)
 gt=triangles(range(8),G);gc=mincovers(G,gt);gp=packings(gt)
 assert len(gc[0])==7 and len(gp[0])==4
 for e in G:assert any(e in c for c in gc)
 for d in combinations(G,2):assert any(not frozenset().union(*p)&set(d) for p in gp)
 ring={(0,1),(1,2),(2,3),(3,4),(0,4)}
 J=frozenset(ring|{(v,h) for v in range(5) for h in (5,6)}|{(5,6)})
 jt=triangles(range(7),J);jc=mincovers(J,jt);jp=packings(jt)
 assert len(jt)==15 and len(jc[0])==6 and len(jp[0])==4
 assert all(any(t<=c for c in jc) for t in jt)
 reduced=J-{(0,1),(2,3)};assert len(packings(triangles(range(7),reduced))[0])==3
 lines=[frozenset(t) for t in ((0,3,4),(0,5,6),(1,3,5),(1,4,6),(2,3,6),(2,4,5))]
 fc=mincovers(range(7),lines);fp=packings(lines)
 assert len(fc[0])==3 and len(fp[0])==1 and all(t in fc for t in lines)
 for d in combinations(range(7),2):assert any(not t&set(d) for t in lines)
 return dict(K5=dict(tau=4,nu=2,two_edge_deletion_cases=45),
             glued_K5=dict(edges=len(G),triangles=len(gt),tau=7,nu=4,minimum_covers=len(gc),two_edge_resilience_cases=171),
             K2_join_C5=dict(edges=len(J),triangles=len(jt),tau=6,nu=4,Q=True,blocker=[[0,1],[2,3]],nu_after_blocker=3),
             Fano_minus_line=dict(tau=3,nu=1,Q_analogue=True,two_vertex_resilience_cases=21))

def main():
 deadline();start=datetime.now(timezone.utc).isoformat();tic=time.monotonic();hashes={}
 for rel,expected in SOURCES.items():
  data=(ROOT/rel).read_bytes();digest=sha256(data).hexdigest();assert digest==expected,(rel,digest)
  hashes[rel]=digest;Path('SCRATCH_OUTPUT/tuza18_critic_input_'+Path(rel).name).write_bytes(data)
 result=dict(status='PASS',input_sha256=hashes,started_utc=start,script_sha256=sha256(Path(__file__).read_bytes()).hexdigest(),
             apex_witness=apex(),K4_pruning=k4_pruning(),powers_of_two_lift=base_voltage_cycles(),criticality_controls=criticality(),
             python=sys.version,limitations=['Finite checks supplement ordinary proofs.','No full lifted graph is generated.','No Lean or external human verification.'])
 deadline();result['finished_utc']=datetime.now(timezone.utc).isoformat();result['elapsed_seconds']=time.monotonic()-tic
 print(json.dumps(result,indent=2,sort_keys=True))

if __name__=='__main__':main()
