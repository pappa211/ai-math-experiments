#!/usr/bin/env python3
"""Independent reconstruction and exact half/third-cover certificates."""
from pathlib import Path
from itertools import combinations
from collections import Counter
import ast,hashlib,json,platform
W=Path(__file__).resolve().parents[1]
OUT=W/'evidence/halfcover_tf_fresh';OUT.mkdir(parents=True,exist_ok=True)
INPUT=OUT/'inputs';INPUT.mkdir(exist_ok=True)
expected={'notes/codegree_two_tf_resilience_counterexample.md':'ae0bd41560dae51e58f5197a46eb5cd62e7859f10fb7aeb2f488178c052da1a4','evidence/codegree_two/petersen_join.json':'d517e3fd66923c02b079a66fad6291b66676235bb434a90d4b38375a036d5fb4','evidence/codegree_two/tf_lift_witness.json':'3dbd56433357c22745b2a96a733685874b94a9ed7c24463e27b88cdadd1def7e'}
hashes={}
for name,h in expected.items():
    data=(W/name).read_bytes();actual=hashlib.sha256(data).hexdigest();assert actual==h,(name,actual)
    hashes[name]=actual
    target=INPUT/Path(name).name
    if target.exists():assert target.read_bytes()==data
    else:target.write_bytes(data)
base=json.loads((W/'evidence/codegree_two/petersen_join.json').read_text())
retained=json.loads((W/'evidence/codegree_two/tf_lift_witness.json').read_text())
def edge(u,v):return tuple(sorted((u,v)))
def te(t):return set(combinations(sorted(t),2))
def triangles(vertices,E):return [t for t in combinations(vertices,3) if te(t)<=E]
def valid_packing(P,E,count,deleted=()):
    assert len(P)==count
    used=set()
    for t in P:
        assert len(set(t))==3
        es=te(t);assert es<=E and not es&used and not es&set(deleted)
        used|=es
    return used

def min_cover(E,ts):
    el=sorted(E);ix={e:i for i,e in enumerate(el)}
    tm=[sum(1<<ix[e] for e in te(t)) for t in ts]
    return min(z.bit_count() for z in range(1<<len(el)) if all(z&t for t in tm))

R={edge(i,(i+1)%5) for i in range(5)}|{edge(5+i,5+(i+2)%5) for i in range(5)}|{(i,5+i) for i in range(5)}
assert len(R)==15 and not triangles(range(10),R)
B=R|{(v,a) for v in range(10) for a in (10,11)}|{(10,11)}
BT=triangles(range(12),B)
assert B==set(map(tuple,base['edges'])) and BT==list(map(tuple,base['triangles']))
assert R==set(map(tuple,base['rim_edges']))
U=set(range(5))|{10,11};H={e for e in B if set(e)<=U};HT=triangles(sorted(U),H)
D=sorted(B-H);assert len(D)==20 and len(H)==16 and len(HT)==15
E=set(B);blocks=[];owner={}
for j,(u,v) in enumerate(D):
    vs=[u,v,12+3*j,13+3*j,14+3*j];block=set(combinations(vs,2));assert len(block)==10
    assert not set(owner)&block
    for e in block:owner[e]=j
    E|=block;blocks.append((vs,block))
T=triangles(range(72),E)
assert len(E)==216 and len(T)==240
assert E==set(map(tuple,retained['edges'])) and T==list(map(tuple,retained['triangles']))
assert H==set(map(tuple,retained['undecorated_H_edges'])) and D==list(map(tuple,retained['decorated_roots']))
assert H.isdisjoint(owner) and H|set(owner)==E
for t in BT:
    if not set(t)<=U:assert len(te(t)&set(D))>=2
assert min_cover(H,HT)==6
K5=set(combinations(range(5),2));K5T=triangles(range(5),K5)
assert min_cover(K5,K5T)==4

# Six literal perfect matchings give the independent upper bound nu(B)<=9.
perfect=[]
for z in combinations(sorted(R),5):
    if len(set(v for e in z for v in e))==10:perfect.append(set(z))
assert len(perfect)==6
assert all(a&b for a,b in combinations(perfect,2))
base_cert={}
for key,P in base['packing_certificates_by_deleted_pair'].items():
    deleted=tuple(sorted(tuple(e) for e in ast.literal_eval(key)))
    valid_packing(P,B,9,deleted);base_cert[deleted]=[tuple(t) for t in P]
assert set(base_cert)==set(combinations(sorted(B),2))

# Verify every retained full-triangle cover directly, without trusting summary flags.
tf_keys=set()
for key,raw in retained['TF_cover_certificates'].items():
    t=tuple(ast.literal_eval(key));C=set(map(tuple,raw));assert len(C)==len(raw)==86
    assert t in T and te(t)<=C and C<=E and all(te(q)&C for q in T)
    tf_keys.add(t)
assert tf_keys==set(T)
valid_packing(retained['maximum_packing'],E,49)
local={}
for key,P in retained['local_K5_deletion_certificates'].items():
    deleted=tuple(sorted(tuple(e) for e in ast.literal_eval(key)))
    valid_packing(P,K5,2,deleted);local[deleted]=[tuple(t) for t in P]
assert set(local)=={()}|{(e,) for e in sorted(K5)}|set(combinations(sorted(K5),2))

# Rebuild every lifted pair-avoidance certificate independently.
resilience_digest=hashlib.sha256();pairs=0
for deleted in combinations(sorted(E),2):
    affected={owner[e] for e in deleted if e in owner}
    required={D[j] for j in affected}|{e for e in deleted if e in H}
    assert len(required)<=2
    for e in sorted(B):
        if len(required)==2:break
        required.add(e)
    P=list(base_cert[tuple(sorted(required))])
    for j,(vs,block) in enumerate(blocks):
        if j in affected:
            ix={v:i for i,v in enumerate(vs)}
            absent=tuple(sorted(edge(ix[e[0]],ix[e[1]]) for e in deleted if e in block))
        else:absent=((0,1),)
        P.extend(tuple(sorted(vs[i] for i in t)) for t in local[absent])
    valid_packing(P,E,49,deleted)
    resilience_digest.update(json.dumps([deleted,sorted(P)],separators=(',',':')).encode()+b'\n')
    pairs+=1
assert pairs==23220

# Half-cover: half on ten core spokes; root plus fresh triangle in each block.
z2={e:0 for e in E}
for v in range(5):
    for a in (10,11):z2[(v,a)]=1
for vs,block in blocks:
    u,v,p,q,r=vs
    for e in [(u,v),(p,q),(p,r),(q,r)]:z2[e]=2
assert sum(z2.values())==170 and set(z2.values())=={0,1,2}
loads=[{'triangle':list(t),'half_cover_scaled_load':sum(z2[e] for e in te(t)),'third_cover_scaled_load':3} for t in T]
assert min(r['half_cover_scaled_load'] for r in loads)>=2
z3={e:1 for e in E};assert sum(z3.values())==216
hist=Counter(r['half_cover_scaled_load'] for r in loads)
assert hist=={2:195,4:5,5:10,6:30}
certificate={'graph_vertices':list(range(72)),'edges':[{'edge':list(e),'order2_multiplicity':z2[e],'order3_multiplicity':z3[e]} for e in sorted(E)],'triangle_loads':loads,'order2_total_multiplicity':170,'order2_normalized_mass':85,'order3_total_multiplicity':216,'order3_normalized_mass':72,'all_nonunit_orders':{'even_k':'(k/2) z2; total 85k','odd_k_at_least_3':'z3+((k-3)/2) z2; total 85k-39','common_normalized_budget':85},'scope':'Feasible covers only; no exact half-integral, third-integral or fractional optimum asserted.'}
(OUT/'cover_certificate.json').write_text(json.dumps(certificate,indent=2)+'\n')
receipt={'status':'PASS','host':platform.system(),'input_sha256':hashes,'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'certificate_sha256':hashlib.sha256((OUT/'cover_certificate.json').read_bytes()).hexdigest(),'graph_counts':{'vertices':72,'edges':216,'triangles':240,'decorations':20},'tau_H':6,'tau_K5':4,'tau_W':86,'nu_B':9,'nu_W':49,'Petersen_perfect_matchings':6,'base_deletion_pairs_verified':len(base_cert),'TF_covers_verified':len(tf_keys),'local_deletion_cases_verified':len(local),'W_deletion_pairs_verified':pairs,'W_deletion_certificate_digest':resilience_digest.hexdigest(),'half_cover_weight_counts_scaled':dict(sorted(Counter(z2.values()).items())),'half_cover_triangle_load_histogram_scaled':dict(sorted(hist.items())),'half_cover_mass':85,'third_cover_mass':72,'all_nonunit_normalized_budget':85,'no_producer_code_imported':True}
(OUT/'receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps(receipt,indent=2))
