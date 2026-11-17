"""Separately authored named-fact checker for disjoint reconstruction review.
Does not import the author's generator or optimizer. Reuses the reviewer's
already completed independent210-insertion solve through326 internal rows.
"""
from itertools import combinations
from pathlib import Path
import json,hashlib,time
ROOT=Path('problems/TUZA-26')
SRC=Path('problems/TUZA-25/evidence/residual_edge_exchange_seeds.json')
TAB=ROOT/'evidence/apex_simplicial_internal_checks.json'
start=time.time();models=json.loads(SRC.read_text());old=json.loads(TAB.read_text());tests=0;rows=[];expected=set()
for C in models:
 E=set(map(tuple,C['edges']));V=range(C['n']);triples=[T for T in combinations(V,3) if all(e not in E for e in combinations(T,2))];tests+=len(list(combinations(V,3)))
 high={v:[T for T in triples if all(tuple(sorted((v,w))) in E for w in T)] for v in V}
 vertices=[v for v in V if high[v]];assert len(vertices)<=1
 if vertices:assert sum(vertices[0] in e for e in E)==C['n']-1
 rows.append({'model':C['name'],'independent_triples':triples,'vertices_with_neighborhood_triple':vertices})
 expected|={(C['name'],e) for e in combinations(V,2) if e not in E}
vals={}
for row in old['rows']:
 key=(row['seed'],tuple(row['inserted']));v=(row['nu_C'],row['nu_J'],row['tau_J'])
 if key in vals:assert vals[key]==v
 vals[key]=v
assert set(vals)==expected and len(vals)==210
qual=[{'model':name,'inserted':e,'nu_C':v[0],'nu_J':v[1],'tau_J':v[2]} for (name,e),v in vals.items() if v[1]==v[0]+1 and v[2]==2*v[0]]
assert len(qual)==4 and all(z['model']=='central_K4_star_4' for z in qual)
assert {tuple(z['inserted']) for z in qual}=={(2,4),(2,5),(3,4),(3,5)}
C=next(C for C in models if C['name']=='central_K4_star_4');E=set(map(tuple,C['edges']));assert not next(r for r in rows if r['model']==C['name'])['independent_triples']
controls=[]
for S,pack in [([(2,4),(3,5)],[(0,2,3),(0,4,5),(1,2,4),(1,3,5)]), ([(2,5),(3,4)],[(0,2,3),(0,4,5),(1,2,5),(1,3,4)])]:
 Q=E|set(S);used=set()
 for T in pack:
  es=set(combinations(T,2));assert es<=Q and not used&es;used|=es
 controls.append({'restored_edges':S,'packing':pack,'size':4})
print(json.dumps({'status':'VERIFIED_FINITE_INDEPENDENT_REVIEW','triples_tested':tests,'models':rows,'all210_insertions_covered_by_reviewers_prior_exact_solve':True,'qualifying_insertions':qual,'four_packings':controls,'sources':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [SRC,TAB]},'seconds':time.time()-start},indent=2))
