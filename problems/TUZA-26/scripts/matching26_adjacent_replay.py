"""Independent adjacent-interface domain and certificate replay.
No author optimizer is imported. Domain generation starts from independent
old-neighbor sets I, then chooses restored endpoints outside I. Every actual
triangle is reconstructed. Structural and optimization rejection witnesses
are checked directly; exact cover optimality is unnecessary for exclusion.
"""
from pathlib import Path
from itertools import combinations
from collections import defaultdict,Counter
from math import comb
from datetime import datetime,timezone
import hashlib,json,sys,platform,time
start=time.monotonic();root=Path(__file__).resolve().parents[1]
files={
 'models':root/'inputs/C12_frozen.json',
 'opening':root/'evidence/opening_checks.json',
 'domain':root/'evidence/apex_adjacent_interface_domain.json',
 'exact':root/'evidence/apex_adjacent_interface_exact.json',
 'internal':root/'evidence/apex_adjacent_internal_controls.json',
 'vertex_note':root/'notes/apex_adjacent_vertex_domain_v1.md',
 'domain_note':root/'notes/apex_adjacent_interface_domain_v1.md',
 'result_note':root/'notes/apex_adjacent_interface_result_v1.md',
 'author_script':root/'scripts/apex_adjacent_interface.py',
}
hashes={k:hashlib.sha256(p.read_bytes()).hexdigest() for k,p in files.items()}
assert hashes['domain']=='dddbb2bb0e42b91f9c2025356cc1120d1d80e44b427587989d18837fcd6872a4'
assert hashes['exact']=='76192d39f8c27bd665ebd7f9db481d8b3f0faa2029b4cc0ab73b7ad7e4134c4e'
assert hashes['internal']=='1f2c6d0862420b6f647618b4adc0b89e2f79c6031b65fdda28f1bf0198e37965'
models=json.loads(files['models'].read_text());D=json.loads(files['domain'].read_text());X=json.loads(files['exact'].read_text());O=json.loads(files['opening'].read_text());Z=json.loads(files['internal'].read_text())
Cmap={r['name']:r for r in models};Omap={r['name']:r for r in O['models']}
def edge(u,v):return tuple(sorted((u,v)))
def edges(E):return {edge(*e) for e in E}
def triangles(n,E):return [t for t in combinations(range(n),3) if all(e in E for e in combinations(t,2))]
def valid_packing(P,E):
 used=set()
 for T0 in P:
  T=tuple(sorted(T0));assert len(T)==3 and len(set(T))==3
  Tedges=set(combinations(T,2));assert Tedges<=E and not(Tedges&used)
  used|=Tedges
 return len(P)
def valid_cover(C,T,E):
 Ce=edges(C);assert len(Ce)==len(C) and Ce<=E
 assert all(Ce&set(combinations(t,2)) for t in T)
 return len(Ce)
def components(n,E,removed=()):
 live=set(range(n))-set(removed);adj={v:set() for v in live}
 for u,v in E:
  if u in live and v in live:adj[u].add(v);adj[v].add(u)
 parts=[]
 while live:
  stack=[min(live)];part=set();live.remove(stack[0])
  while stack:
   u=stack.pop();part.add(u)
   for v in adj[u]&live:live.remove(v);stack.append(v)
  parts.append(part)
 return parts
def all_small_separators(n,E):
 for size in (0,1,2):
  for cut in combinations(range(n),size):
   if len(components(n,E,cut))>1:return cut
 return None
# Re-establish each old packing optimum by a valid packing and a literal upper bound.
rbase={};model_checks=[];expected={};all_subsets=0
for C in models:
 name=C['name'];n=C['n'];E=edges(C['edges']);T=triangles(n,E)
 assert not any(all(e not in E for e in combinations(I,2)) for I in combinations(range(n),4))
 if name=='central_K4_star_4':assert not any(all(e not in E for e in combinations(I,2)) for I in combinations(range(n),3))
 assert set.union(*(set(combinations(t,2)) for t in T))==E
 universal=[v for v in range(n) if sum(v in e for e in E)==n-1];assert universal
 assert not any(sum(e in E for e in combinations(V,2))==4 and all(sum(v in e for e in combinations(V,2) if e in E)==2 for v in V) for V in combinations(range(n),4))
 if 'pieces' in C:
  pieces=[set(P) for P in C['pieces']];assert all(len(P) in(4,5) for P in pieces)
  assert all(all(e in E for e in combinations(sorted(P),2)) for P in pieces)
  assert all(sum(set(t)<=P for P in pieces)==1 for t in T)
  r=sum(len(P)-3 for P in pieces);upper='sum of literal K4/K5 packing bounds over the exact triangle partition'
 elif name=='W5':
  h=universal[0];assert all(h in t for t in T);r=(n-1)//2;upper='every triangle uses two of the five hub spokes'
 elif name=='K5-e':
  assert n==5 and len(E)==9 and any(sum(v in e for e in E)%2 for v in range(n));r=2;upper='three triangles would use all nine edges, contradicting odd vertex degree'
 else:raise AssertionError(name)
 assert valid_packing(Omap[name]['optimum']['packing'],E)==r
 assert Omap[name]['optimum']['nu']==r
 rbase[name]=r;model_checks.append({'model':name,'nu_C':r,'upper_bound':upper,'packing':Omap[name]['optimum']['packing'],'alpha_at_most_three':True,'universal_vertices':universal,'induced_C4_free':True})
 all_subsets+=comb(n,4)+comb(n,5)
 # Independently regenerate from old independent I, not from A then complement tests.
 for size in(2,3):
  for I0 in combinations(range(n),size):
   I=set(I0)
   if any(e in E for e in combinations(I0,2)):continue
   for pair in combinations(sorted(set(range(n))-I),2):
    A=tuple(sorted(I|set(pair)));key=(name,A)
    expected.setdefault(key,set()).add(pair)
recorded={(r['seed'],tuple(r['A'])):r for r in D['rows']};assert len(recorded)==len(D['rows'])
assert set(recorded)==set(expected)
counts=Counter();counts['all_size4_or5_neighborhoods']=all_subsets;counts['labelled_neighborhoods_in_domain']=len(expected);counts['no_independent_remainder']=all_subsets-len(expected);counts['restoration_pair_presentations']=sum(map(len,expected.values()))
retained=set();reject_certificates=[]
for key,choices in expected.items():
 name,A=key;C=Cmap[name];n=C['n'];a=n;E=edges(C['edges']);Q=E|{edge(a,v) for v in A};row=recorded[key]
 assert row['outside_center']==a and tuple(row['restored_pair_witness']) in choices and row['restoration_pair_count']==len(choices)
 degrees={v:sum(v in e for e in Q) for v in range(n+1)}
 lows=[v for v,d in degrees.items() if d<4]
 unsupported=[v for v in A if not any(edge(v,w) in E for w in A if w!=v)]
 status=row['status'];counts[status]+=1
 if status=='REJECT_MIN_DEGREE':
  assert lows and row['vertex'] in lows and row['degree']==degrees[row['vertex']]
 elif status=='REJECT_UNSUPPORTED_APEX_EDGE':
  assert not lows and unsupported and row['vertex'] in unsupported
 elif status=='REJECT_VERTEX_SEPARATOR':
  assert not lows and not unsupported
  cert=row['separator'];cut=set(cert['deleted_vertices']);part=set(cert['component']);other=set(cert['other_vertices'])
  assert len(cut)<=2 and cut<=set(range(n+1)) and part and other
  assert not(part&other or part&cut or other&cut) and part|other|cut==set(range(n+1))
  assert all(not((u in part and v in other) or(u in other and v in part)) for u,v in Q)
  assert any(part==P for P in components(n+1,Q,cut))
 elif status=='STRUCTURALLY_RETAINED':
  assert not lows and not unsupported and all_small_separators(n+1,Q) is None
  TT=triangles(n+1,Q);assert set.union(*(set(combinations(t,2)) for t in TT))==Q
  retained.add(key)
 else:raise AssertionError(status)
 assert (not lows or status=='REJECT_MIN_DEGREE')
 reject_certificates.append({'seed':name,'A':A,'status':status,'independently_validated':True})
assert dict(counts)==D['counts'],(dict(counts),D['counts'])
# Validate all old matching witnesses; no optimality is claimed for lower r-1 witnesses.
tables={};old_witness_count=0
for table in X['old_matching_tables']:
 name=table['seed'];C=Cmap[name];E=edges(C['edges']);r=rbase[name];assert table['nu_C']==r
 expected_pairs={tuple(sorted((e,f))) for e,f in combinations(sorted(E),2) if not(set(e)&set(f))}
 got={}
 for row in table['matching_pairs']:
  M=tuple(sorted(edge(*e) for e in row['matching']));assert M in expected_pairs and M not in got
  L=valid_packing(row['packing'],E-set(M));assert L==row['nu_after_deletion'] and L in(r,r-1)
  got[M]=row['packing'];old_witness_count+=1
 assert set(got)==expected_pairs;tables[name]=got
assert len({t['seed'] for t in X['old_matching_tables']})==len(X['old_matching_tables'])
assert set(tables)=={name for name,A in retained}
exact={(r['seed'],tuple(r['A'])):r for r in X['rows']};assert len(exact)==len(X['rows']) and set(exact)==retained
assert not X['unknown'];final_counts=Counter();final_rows=[]
for key,row in exact.items():
 name,A=key;C=Cmap[name];n=C['n'];a=n;E=edges(C['edges']);Q=E|{edge(a,v) for v in A};T=triangles(n+1,Q);r=rbase[name]
 assert row['outside_center']==a
 if row['status']=='REJECT_PACKING_GAIN_TWO':
  M=tuple(sorted(edge(*e) for e in row['matching']));assert len(M)==2 and not(set(M[0])&set(M[1]))
  assert all(set(e)<=set(A) and e in E for e in M)
  old=tables[name][M];assert len(old)==r
  P=old+[tuple(sorted((a,*e))) for e in M];assert valid_packing(P,Q)==r+2
  assert row['nu_lower_bound']==r+2
  final_rows.append({'seed':name,'A':A,'status':'REJECT_PACKING_GAIN_TWO','nu_lower_bound':r+2,'required_profile_nu':r+1,'packing':P})
 elif row['status']=='REJECT_COVER_PROFILE':
  U=valid_cover(row['cover'],T,Q);L=valid_packing(row['packing_lower_bound'],Q)
  assert U==row['tau_Q'] and L==row['nu_Q'] and U<=2*L-2
  final_rows.append({'seed':name,'A':A,'status':'REJECT_DEFECT_ONE_BY_BOUNDS','packing_lower_bound':L,'cover_upper_bound':U,'proved_defect_lower_bound':2*L-U,'packing':row['packing_lower_bound'],'cover':row['cover']})
 else:raise AssertionError(row['status'])
 final_counts[row['status']]+=1
assert dict(final_counts)=={k:v for k,v in X['counts'].items() if k.startswith('REJECT_')}
# Independently derive and check the zero-outside adjacent pair domain.
qual=[r for r in O['insertions'] if 2*r['optimum']['nu']-r['optimum']['tau']==2]
assert len(O['insertions'])==210 and len(qual)==4 and all(r['model']=='central_K4_star_4' for r in qual)
missing=sorted(tuple(r['inserted']) for r in qual);expected_internal={tuple(sorted((e,f))) for e,f in combinations(missing,2) if set(e)&set(f)}
assert len(expected_internal)==4
internal_seen=set();internal_checks=[];C=Cmap['central_K4_star_4'];E=edges(C['edges'])
for row in Z['rows']:
 S=tuple(sorted(edge(*e) for e in row['restored_edges']));assert S in expected_internal and S not in internal_seen;internal_seen.add(S)
 Q=E|set(S);T=triangles(C['n'],Q);assert edges(row['edges'])==Q and {tuple(sorted(t)) for t in row['triangles']}==set(T)
 U=valid_cover(row['cover'],T,Q);L=valid_packing(row['packing'],Q);assert U<=2*L-2
 degree=min(sum(v in e for e in Q) for v in range(C['n']));assert degree==row['min_degree']==3
 internal_checks.append({'restored_edges':S,'minimum_degree':degree,'cover_upper_bound':U,'packing_lower_bound':L,'proved_defect_lower_bound':2*L-U})
assert internal_seen==expected_internal
assert all(hashlib.sha256(p.read_bytes()).hexdigest()==hashes[k] for k,p in files.items())
result={'status':'PASS_COMPLETE_INDEPENDENT_DOMAIN_AND_WITNESS_REPLAY','utc':datetime.now(timezone.utc).isoformat(),'method':__doc__,'all_size_proof':'Reviewed separately in reviews/matching26_adjacent_interface_review.md; explicit minimum-degree-four dependency remains.','domain_counts':dict(counts),'final_rejection_counts':dict(final_counts),'old_matching_packing_witnesses_checked':old_witness_count,'old_exact_optimality_limit':'r-1 matching rows and author cover optima were not re-optimized; explicit lower packings and upper covers already exclude every required profile.','model_checks':model_checks,'structural_rows':reject_certificates,'final_rows':final_rows,'zero_outside_controls':internal_checks,'sources':{str(files[k]):v for k,v in hashes.items()},'source_hashes_stable_during_replay':True,'python':sys.version,'platform':platform.platform(),'processes':1,'solver_threads':0,'elapsed_seconds':time.monotonic()-start}
out=root/'evidence/matching26_adjacent_replay.json';out.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['status','domain_counts','final_rejection_counts','old_matching_packing_witnesses_checked','elapsed_seconds']}));print(out)
