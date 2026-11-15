#!/usr/bin/env python3
"""Literal TF/resilience counterexample from induced-core K5 decorations.
Uses the complete base pair-deletion certificate, then validates every output
against actual graph edges/triangles. All C(216,2) deletion pairs are checked.
"""
from itertools import combinations
from pathlib import Path
import ast,datetime,hashlib,json,platform
assert platform.system()=='Darwin'
ROOT=Path(__file__).resolve().parents[1]
base_data=json.loads((ROOT/'evidence/codegree_two/petersen_join.json').read_text())
def edge(u,v):return tuple(sorted((u,v)))
def faces(t):return set(combinations(sorted(t),2))
def triangles(vs,es):return [t for t in combinations(sorted(vs),3) if faces(t)<=es]
BE={tuple(e) for e in base_data['edges']};BT=triangles(range(12),BE)
assert len(BE)==36 and len(BT)==40
Hvertices={0,1,2,3,4,10,11};HE={e for e in BE if set(e)<=Hvertices};HT=triangles(Hvertices,HE)
assert len(HE)==16 and len(HT)==15
D=sorted(BE-HE);assert len(D)==20
# Exact local ordinary covers of H, using literal triangle masks.
hes=sorted(HE);hm=[sum(1<<i for i,e in enumerate(hes) if e in faces(t)) for t in HT]
hcovers=[]
for k in range(len(hes)+1):
    for inds in combinations(range(len(hes)),k):
        m=sum(1<<i for i in inds)
        if all(m&t for t in hm):hcovers.append({hes[i] for i in inds})
    if hcovers:break
assert k==6 and len(hcovers)==31
assert all(any(faces(t)<=C for C in hcovers) for t in HT)
assert set().union(*hcovers)==HE
# K5 templates, exhaustive local pairs and all minimum covers.
lvs=range(5);les=faces(lvs);lts=triangles(lvs,les)
lpack=[(t,u) for t,u in combinations(lts,2) if faces(t).isdisjoint(faces(u))]
assert len(lpack)==15
lcover=[faces(T)|faces(set(lvs)-set(T)) for T in combinations(lvs,3)]
assert all(len(C)==4 and all(C&faces(t) for t in lts) for C in lcover)
root=(0,1)
lavoid=next(P for P in lpack if root not in set().union(*(faces(t) for t in P)))
local_deletions={}
for k in (0,1,2):
    for ss in combinations(sorted(les),k):
        P=next(P for P in lpack if set(ss).isdisjoint(set().union(*(faces(t) for t in P))))
        local_deletions[str(ss)]=P
# Build blocks and map every graph edge to its block or to the undecorated H.
WE=set(BE);blocks=[];edge_block={}
for i,e in enumerate(D):
    vs=(*e,*range(12+3*i,15+3*i));es=faces(vs);ts=triangles(vs,es)
    for f in es:
        assert f not in edge_block;edge_block[f]=i
    WE|=es;blocks.append((vs,es,ts))
WT=triangles(range(72),WE)
assert len(WE)==216 and len(WT)==240
assert set(WT)==set(BT)|set().union(*(set(ts) for _,_,ts in blocks))
assert sum(len(ts) for _,_,ts in blocks)+len(BT)==len(WT)
assert HE.isdisjoint(set(edge_block)) and HE|set(edge_block)==WE
assert all(len(faces(t)&HE)<=1 for t in BT if t not in HT)
def map_tri(t,vs):return tuple(sorted(vs[i] for i in t))
def map_cover(C,vs):return {edge(vs[u],vs[v]) for u,v in C}
def template_edge(f,vs):
    inv={v:i for i,v in enumerate(vs)}
    return edge(inv[f[0]],inv[f[1]])
def check_cover(C,target=None,odd=False):
    assert C<=WE and len(C)==86
    if target is not None:assert faces(target)<=C
    assert all((len(C&faces(t)) in (1,3)) if odd else bool(C&faces(t)) for t in WT)
def cover_all_roots(HC,override=None):
    C=set(HC)
    for i,(vs,es,ts) in enumerate(blocks):
        lc=override[1] if override is not None and i==override[0] else next(q for q in lcover if root in q)
        C|=map_cover(lc,vs)
    return C
TF={}
for t in BT:
    positive=faces(t)&HE
    HC=next(C for C in hcovers if positive<=C)
    C=cover_all_roots(HC);check_cover(C,t);TF[str(t)]=sorted(C)
for i,(vs,es,ts) in enumerate(blocks):
    for t in ts:
        local_t=tuple(sorted(vs.index(v) for v in t))
        LC=faces(local_t)|faces(set(lvs)-set(local_t))
        C=cover_all_roots(hcovers[0],(i,LC));check_cover(C,t);TF[str(t)]=sorted(C)
assert len(TF)==240
# Odd optimum: extend a vertex coloring of H to all base vertices, then extend
# each root value by a minimum odd K5 cover. Every K5 minimum cover is odd.
colors={10:0,11:1,0:0,1:1,2:0,3:1,4:0,5:0,6:0,7:0,8:0,9:0}
base_odd={e for e in BE if colors[e[0]]==colors[e[1]]}
assert len(base_odd&HE)==6
OC=set(base_odd&HE)
for i,(vs,es,ts) in enumerate(blocks):
    val=D[i] in base_odd
    LC=next(q for q in lcover if (root in q)==val)
    OC|=map_cover(LC,vs)
check_cover(OC,odd=True)
# Validate all base pair-deletion witnesses, without trusting its numeric claim.
base_cert={}
for label,p in base_data['packing_certificates_by_deleted_pair'].items():
    ss=frozenset(tuple(e) for e in ast.literal_eval(label));pk=[tuple(t) for t in p]
    used=set()
    for t in pk:
        f=faces(t);assert t in BT and used.isdisjoint(f);used|=f
    assert len(pk)==9 and used.isdisjoint(ss);base_cert[ss]=pk
assert len(base_cert)==630
assert set(base_cert)=={frozenset(q) for q in combinations(sorted(BE),2)}
def choose_base(blocked):
    extra=[e for e in sorted(BE) if e not in blocked]
    ss=frozenset(list(blocked)+extra[:2-len(blocked)])
    return base_cert[ss]
def packing_after(ss):
    affected={edge_block[e] for e in ss if e in edge_block}
    blocked={e for e in ss if e in HE}|{D[i] for i in affected}
    assert len(blocked)<=len(ss)<=2
    P=list(choose_base(blocked))
    for i,(vs,es,ts) in enumerate(blocks):
        if i in affected:
            deleted={template_edge(e,vs) for e in ss if e in es}
            LP=next(P for P in lpack if deleted.isdisjoint(set().union(*(faces(t) for t in P))))
        else:LP=lavoid
        P += [map_tri(t,vs) for t in LP]
    used=set()
    for t in P:
        f=faces(t);assert t in WT and used.isdisjoint(f);used|=f
    assert len(P)==49 and used.isdisjoint(ss)
    return P
base_W_packing=packing_after(set())
count=0;digest=hashlib.sha256()
for ss in combinations(sorted(WE),2):
    P=packing_after(set(ss));count+=1
    digest.update(repr((ss,P)).encode())
assert count==23220
codeg={str(e):sum(e in faces(t) for t in WT) for e in sorted(WE)}
low=[e for e in sorted(WE) if codeg[str(e)]==2]
assert low==[e for e in sorted(HE) if e[0]<5 and e[1]<5]
res={'status':'COUNTEREXAMPLE: TF plus two-edge packing resilience does not force codegree three',
 'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'host':platform.platform(),
 'verifier_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
 'base_certificate_sha256':hashlib.sha256((ROOT/'evidence/codegree_two/petersen_join.json').read_bytes()).hexdigest(),
 'counts':{'vertices':72,'edges':216,'triangles':240,'attachments':20,'nu':49,'tau':86,'pi':86,
           'TF_certificates':len(TF),'two_edge_deletions_checked':count,'codegree_two_edges':len(low)},
 'edges':sorted(WE),'triangles':WT,'undecorated_H_vertices':sorted(Hvertices),'undecorated_H_edges':sorted(HE),
 'decorated_roots':D,'codegrees':codeg,'codegree_two_edges':low,
 'minimum_H_covers':[sorted(C) for C in hcovers],'TF_cover_certificates':TF,
 'minimum_odd_cover':sorted(OC),'maximum_packing':base_W_packing,
 'local_K5_deletion_certificates':local_deletions,'all_deletion_certificate_digest':digest.hexdigest(),
 'resilience_certificate':'The verifier deterministically lifts the retained base certificate and local K5 two-edge deletion certificates for every deletion pair. No 23,220-packing JSON dump is needed; the complete sequence is hashed.',
 'optimality_scope':'nu upper bound follows triangle-block partition and base nu=9; tau lower bound follows edge-disjoint H and K5 blocks. Literal certificates provide matching lower/upper bounds. Ordinary lifting theorem supplies all-size structural argument; not formal verification.'}
out=ROOT/'evidence/codegree_two/tf_lift_witness.json';out.write_text(json.dumps(res,indent=2)+'\n')
print(json.dumps({'status':res['status'],'counts':res['counts'],'codegree_two_edges':low,'output':str(out)},indent=2))
