#!/usr/bin/env python3
"""One fixed actual graph and its vertex-sum padding; no producer imports."""
import hashlib, itertools as it, json, platform, sys
from pathlib import Path
W=Path(__file__).resolve().parents[1]
OUT=W/'evidence/fresh_global_private_pair_gate'
OUT.mkdir(parents=True,exist_ok=True)
def edge(a,b): return tuple(sorted((a,b)))
def te(t): return frozenset(it.combinations(sorted(t),2))
def triangles(vertices,edges): return [t for t in it.combinations(vertices,3) if te(t)<=edges]
def packing_ok(p): return sum(map(len,map(te,p)))==len(set().union(*map(te,p)))
def maxpack(ts):
    edge_bound=len(set().union(*map(te,ts)))//3
    for k in range(edge_bound,-1,-1):
        ps=[p for p in it.combinations(ts,k) if packing_ok(p)]
        if ps:return k,ps
    raise AssertionError

def pdata(p,ts):
    support=set().union(*map(te,p))
    ans=[]
    for t in p:
        pages=[q for q in ts if q not in p and len(te(q)&support)==1 and te(q)&te(t)]
        bases=sorted(set().union(*(te(q)&support for q in pages))) if pages else []
        ans.append({'owner':t,'bases':bases,'pages':pages,'type':len(bases)})
    return support,ans

def concentration(p):
    ds={v:sum(v in t for t in p) for v in range(8)}
    return sum(d*d for d in ds.values()),ds

def cover_ok(c,ts):return all(set(c)&te(t) for t in ts)
def mincover(edges,ts):
    for k in range(len(edges)+1):
        for c in it.combinations(sorted(edges),k):
            if cover_ok(c,ts): return c

def pair_gate(p,ts):
    support,data=pdata(p,ts)
    assert all(x['type']==1 for x in data)
    bases={x['bases'][0] for x in data}
    spokes=[sorted(te(x['owner'])-set(x['bases'])) for x in data]
    owner={e:i for i,t in enumerate(p) for e in te(t)}
    residual=[t for t in ts if not (te(t)&bases)]
    doubles=[];triples=[]
    for t in residual:
        se=sorted(te(t)&support)
        assert len(se) in (2,3)
        if len(se)==2:
            doubles.append({'triangle':t,'clause':se})
        else:
            possible=[]
            for e,f in it.combinations(se,2):
                a,b=owner[e],owner[f]
                assert a!=b
                if len(data[a]['pages'])==len(data[b]['pages'])==1:
                    common=te(data[a]['pages'][0])&te(data[b]['pages'][0])
                    if common:
                        assert not (common&support)
                        possible.append({'clause':[e,f],'shared_private_edges':sorted(common)})
            triples.append({'triangle':t,'actual_clause':se,'eligible_pair_clauses':possible})
    assert all(len(t['eligible_pair_clauses'])==1 for t in triples)
    strong=[x['clause'] for x in doubles]+[x['eligible_pair_clauses'][0]['clause'] for x in triples]
    actual=[sorted(te(t)&support) for t in residual]
    strong_models=[];actual_models=[]
    for bits in it.product((0,1),repeat=len(p)):
        selected={spokes[i][b] for i,b in enumerate(bits)}
        if all(selected&set(c) for c in strong):strong_models.append(bits)
        if all(selected&set(c) for c in actual):actual_models.append(bits)
    # Allow both or neither spoke to expose the exact cardinality/budget distinction.
    allspokes=sorted(support-bases)
    support_min=mincover(support,ts)
    return {'packing':p,'private_data':data,'spokes':spokes,'double_clauses':doubles,
            'triple_clauses':triples,'strong_models':strong_models,'actual_models':actual_models,
            'minimum_support_cover':support_min,'minimum_support_cover_size':len(support_min)}

K=(0,1,2,4,5)
E=set(it.combinations(K,2))|{(0,3),(1,3),(0,6),(3,6),(0,7),(3,7)}
T=triangles(range(8),E)
assert (len(E),len(T))==(16,13)
nu,ps=maxpack(T)
assert nu==3 and len(ps)==36
mc=mincover(E,T)
assert len(mc)==5
P=((0,1,3),(1,2,4),(0,2,5))
assert packing_ok(P)
original=pair_gate(P,T)
assert len(original['strong_models'])==0 and len(original['actual_models'])>0
assert len(original['minimum_support_cover'])==5
assert original['private_data'][0]['pages']==[(0,3,6),(0,3,7)]
assert original['private_data'][1]['pages']==[(1,4,5)]
assert original['private_data'][2]['pages']==[(0,4,5)]
core_receipts=[];bad=[]
for p in ps:
    _,pd=pdata(p,T)
    assert all(d['type']==1 for d in pd)
    f,ds=concentration(p)
    outside=[t for t in p if 3 in t]
    assert len(outside)==1
    h=sum(ds[v] for v in range(6))
    assert all(ds[v]>0 for v in range(6))
    prof={'packing':p,'outside_triangle':outside[0],'F':f,'old_incidence_sum':h,
          'degrees':ds,'types':[d['type'] for d in pd],
          'normalized_padded_F':f+4*h+48}
    core_receipts.append(prof)
    if outside[0]==(0,1,3):
        g=pair_gate(p,T)
        assert not g['strong_models'] and g['actual_models']
        assert g['minimum_support_cover_size']==5
        bad.append(g)
assert len(bad)==6
assert max(d['F'] for d in core_receipts)==15
assert sorted(set(d['normalized_padded_F'] for d in core_receipts))==[93,95,99]
assert [d for d in core_receipts if d['normalized_padded_F']==99]==[d for d in core_receipts if d['outside_triangle']==(0,1,3)]
# Every local K5 maximum packing, independently enumerated.
KT=list(it.combinations(range(5),3))
knu,kps=maxpack(KT)
assert knu==2 and len(kps)==15
assert all(all(d['type']==1 for d in pdata(p,KT)[1]) for p in kps)
assert len(mincover(set(it.combinations(range(5),2)),KT))==4
# Fixed padded graph and literal certificates.
WE=set(E);WP=list(P);WC={(0,3),(1,4),(0,5),(1,2),(2,4)}
blocks=[]
for v in range(6):
    a,b,c,d=range(8+4*v,12+4*v)
    block=(v,a,b,c,d)
    WE.update(it.combinations(block,2))
    WP += [(v,a,b),(v,c,d)]
    WC.update([edge(a,b),edge(c,d),edge(v,a),edge(v,b)])
    blocks.append(block)
WT=triangles(range(32),WE)
assert (len(WE),len(WT),len(WP),len(WC))==(76,73,15,29)
assert packing_ok(WP) and cover_ok(WC,WT)
assert len(set(T)|set().union(*(set(it.combinations(b,3)) for b in blocks)))==len(WT)
WB,WPD=pdata(WP,WT)
assert all(x['type']==1 for x in WPD)
assert sum(len(x['pages'])>=2 for x in WPD)==13
assert WC<=WB
# Exhaustive local-profile product: not a graph-family census.
profile_hist={};max_profiles=[]
for i,cp in enumerate(core_receipts):
    for centred in it.product((0,1),repeat=6):
        f=cp['F']+sum((4 if c else 2)*cp['degrees'][v]+8 for v,c in enumerate(centred))
        profile_hist[f]=profile_hist.get(f,0)+1
        if f==99:max_profiles.append({'core_index':i,'attachment_centred':centred})
assert sum(profile_hist.values())==36*64
assert max(profile_hist)==99 and len(max_profiles)==6
assert all(all(p['attachment_centred']) for p in max_profiles)
# All F-maximizers: 6 core choices times 3 pair partitions per centred pad.
assert 6*3**6==4374
# Mutations are semantic negative controls, not altered producer sources.
assert original['actual_models'] # restoring the omitted third literal repairs SAT
assert cover_ok(original['minimum_support_cover'],T) # permitting 2/0 allocations repairs cover
assert not cover_ok(WC-{(1,2)},WT) # removing required certificate edge rejected
record={'status':'PASS_FIXED_GATE_COUNTEREXAMPLE','python':sys.version,'host':platform.platform(),
 'scope':'Literal fixed graph, its 36 maximum core packings, and 2304 exhaustive attachment profiles; ordinary factorization handles all full maximum packings. No Lean.',
 'core':{'vertices':list(range(8)),'edges':sorted(E),'triangles':T,'nu':nu,'tau':len(mc),'minimum_cover':mc,
         'maximum_packing_count':len(ps),'all_maximum_packing_profiles':core_receipts,'specified_gate':original,
         'six_obstructed_core_states':bad},
 'padded':{'vertices':list(range(32)),'edges':sorted(WE),'triangles':WT,'blocks':blocks,'nu_by_factorization':15,
           'tau_by_factorization':29,'packing':WP,'private_data':WPD,'cover':sorted(WC),
           'Fmax':99,'Fmax_count_by_factorization':4374,'profile_histogram':profile_hist,'max_profiles':max_profiles,
           'all_maximum_packings_count_by_factorization':36*15**6,'all_maximum_packings_all_type1':True},
 'negative_controls':{'restoring_third_literal_is_satisfiable':True,'allowing_both_or_neither_spoke_restores_five_cover':True,
                      'deleting_required_cover_edge_is_rejected':True}}
path=OUT/'literal_receipt.json'
path.write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps({'status':record['status'],'core':[8,16,13,3,5],'padded':[32,76,73,15,29],
 'core_maximum_packings':36,'obstructed_core_states':6,'padded_Fmax':99,'padded_Fmax_count':4374,
 'profile_cases':2304,'receipt_sha256':hashlib.sha256(path.read_bytes()).hexdigest()},sort_keys=True))
