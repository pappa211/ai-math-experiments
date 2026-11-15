#!/usr/bin/env python3
"""Independent literal reconstruction; standard library; no producer imports/data.
Run from the TUZA-19 workspace. All actual triples and all local packing/cover
subsets are inspected. Global maximum packings are exhausted by a proven
vertex-sum factorization and an incidence-profile quotient, not by listing
all 227,812,500 individual global maximum packings.
"""
from collections import Counter
from itertools import combinations, product
from pathlib import Path
import datetime, hashlib, json, platform, sys

ROOT = Path(__file__).resolve().parents[1]
EXPECTED = '7faef08e207c5ef9dbfd58cc3b42820bb42012a451ce9932a7f68e8b598296c4'
SOURCE = ROOT / 'evidence/packing_concentration_fresh/input_statement.md'
assert hashlib.sha256(SOURCE.read_bytes()).hexdigest() == EXPECTED
assert platform.system() == 'Darwin', 'Owner Mac only'

def edge(u,v): return tuple(sorted((u,v)))
def face(t): return frozenset(combinations(sorted(t),2))
def clique(vs): return set(combinations(sorted(vs),2))
def triangles(vs, es):
    return tuple(t for t in combinations(sorted(vs),3) if face(t) <= es)
def maximal_cardinality_packings(ts):
    # Full 2^|triangles| enumeration, with conflicts tested by edge intersection.
    out=[]; best=-1; counts=Counter()
    for mask in range(1 << len(ts)):
        chosen=tuple(ts[i] for i in range(len(ts)) if mask >> i & 1)
        used=set(); okay=True
        for t in chosen:
            if used.intersection(face(t)): okay=False; break
            used.update(face(t))
        if not okay: continue
        counts[len(chosen)]+=1
        if len(chosen)>best: best=len(chosen);out=[chosen]
        elif len(chosen)==best: out.append(chosen)
    return best,tuple(out),dict(sorted(counts.items()))
def support(p): return set().union(*(face(t) for t in p))
def degrees(p,vs):
    c=Counter(v for t in p for v in t)
    return [c[v] for v in vs]
def private_bases(p,ts):
    b=support(p)
    return {t: sorted(set(next(iter(face(q)&b)) for q in ts if q not in p
                              and len(face(q)&b)==1 and (face(q)&b)<=face(t)))
            for t in p}
def covers(ts,allowed):
    es=tuple(sorted(allowed)); out=[]
    tm=[sum(1 << i for i,e in enumerate(es) if e in face(t)) for t in ts]
    for mask in range(1 << len(es)):
        if all(mask&m for m in tm):
            out.append(frozenset(es[i] for i in range(len(es)) if mask>>i&1))
    return out

a,b,x,c,d,w,y,z=range(8)
S=(a,b,x,c,d,w)
core_e=clique((a,b,x,y))|clique((c,d,w,y))|clique((a,c,z))
core_t=triangles(range(8),core_e)
assert len(core_e)==15 and len(core_t)==10
assert set(core_t)==set(combinations((a,b,x,y),3))|set(combinations((c,d,w,y),3))|{(a,c,y),(a,c,z)}
core_nu,core_max,core_counts=maximal_cardinality_packings(core_t)
assert core_nu==3 and len(core_max)==20
P0=((a,b,x),(c,d,w),(a,c,y))
assert any(set(P0)==set(q) for q in core_max)
core_cov=covers(core_t,support(P0))
mincore=min(map(len,core_cov)); mincorecovers=[v for v in core_cov if len(v)==mincore]
assert mincore==5 and len(mincorecovers)==1
assert mincorecovers[0]==frozenset((edge(b,x),edge(d,w),edge(a,c),edge(a,y),edge(c,y)))
assert not any(all(len(v&face(t))<=2 for t in P0) for v in core_cov)
# Unrestricted core edge cover exactness, separately from support restriction.
core_tau=min(map(len,covers(core_t,core_e)))
assert core_tau==5

local_v=range(5); local_e=clique(local_v); local_t=triangles(local_v,local_e)
local_nu,local_max,local_counts=maximal_cardinality_packings(local_t)
assert local_nu==2 and len(local_max)==15
local_details=[]
for p in local_max:
    common=set(p[0])&set(p[1]); assert len(common)==1
    common=next(iter(common)); db=private_bases(p,local_t)
    assert all(len(v)==1 for v in db.values())
    assert all(set(t)-set(db[t][0])=={common} for t in p)
    cs=covers(local_t,support(p)); opt=min(map(len,cs))
    assert opt==4
    assert all(sorted(len(v&face(t)) for t in p)==[1,3] for v in cs if len(v)==4)
    local_details.append({'packing':p,'common':common,'support_optimum':opt,
                          'minimum_cover_count':sum(len(v)==opt for v in cs)})
local_tau=min(map(len,covers(local_t,local_e)));assert local_tau==4

all_e=set(core_e);blocks=[];P=list(P0)
for i,v in enumerate(S):
    vs=(v,*range(8+4*i,12+4*i)); es=clique(vs); ts=triangles(vs,es)
    lp=(tuple(sorted((v,vs[1],vs[2]))),tuple(sorted((v,vs[3],vs[4]))))
    blocks.append((vs,es,ts,lp));all_e.update(es);P.extend(lp)
P=tuple(P);all_t=triangles(range(32),all_e)
assert len(all_e)==75 and len(all_t)==70 and len(P)==15
assert len(support(P))==45
block_t=[set(core_t)]+[set(q[2]) for q in blocks]
assert sum(len(q) for q in block_t)==len(all_t)
assert set(all_t)==set().union(*block_t)
assert all(sum(t in q for q in block_t)==1 for t in all_t)
# Edge-disjoint blocks plus triangle containment make cardinality additive.
assert core_nu+6*local_nu==15
bases=private_bases(P,all_t)
assert all(len(v)==1 for v in bases.values())
centres={t: next(iter(set(t)-set(bases[t][0]))) for t in P}
private_pages={str(t):[q for q in all_t if q not in P and len(face(q)&support(P))==1
                     and (face(q)&support(P))<=face(t)] for t in P}

# Complete global quotient: for each K5 there are 3 attachment-centred choices
# and 12 other choices. Off-centre locations and pairings only permute private
# coordinates. They never change the F score, sorted profile, or core type.
profiles=[];total=0; fbest=-1;lexbest=None
for qi,Q in enumerate(core_max):
    dd=degrees(Q,range(8)); f0=sum(t*t for t in dd); h=sum(dd[v] for v in S)
    pb=private_bases(Q,core_t); types=[len(pb[t]) for t in Q]
    for bits in product((0,1),repeat=6): # 1 means attachment-centred
        deg=dd+[0]*24;weight=1
        for i,(v,centred) in enumerate(zip(S,bits)):
            deg[v]+=1+centred
            fresh=range(8+4*i,12+4*i)
            for j in fresh:deg[j]=1
            if not centred:deg[8+4*i]=2
            weight*=3 if centred else 12
        score=sum(t*t for t in deg);lex=tuple(sorted(deg,reverse=True))
        r={'core_index':qi,'core':Q,'centred':bits,'score':score,
           'profile':lex,'multiplicity':weight,'core_types':types,
           'all_type1':all(t==1 for t in types),'F0':f0,'H':h}
        profiles.append(r);total+=weight
        fbest=max(fbest,score)
        if lexbest is None or lex>lexbest:lexbest=lex
assert len(profiles)==1280 and total==20*15**6
fm=[r for r in profiles if r['score']==fbest]
lm=[r for r in profiles if r['profile']==lexbest]
assert fbest==93
assert lexbest==(4,4,3,3,3,3)+25*(1,)+(0,)
assert len(fm)==len(lm)==2
assert {(r['core_index'],r['centred']) for r in fm}=={(r['core_index'],r['centred']) for r in lm}
assert sum(r['multiplicity'] for r in fm)==1458
assert sum(r['multiplicity'] for r in fm if r['all_type1'])==729
assert all(r['centred']==(1,)*6 for r in fm)
assert all(set(r['core'])==set(P0) for r in fm if r['all_type1'])
assert max(r['F0'] for r in profiles)==15
assert max(r['H'] for r in profiles)==8

# Canonical group quotas for the literal witness: attached blocks are all
# centred at their attachment. Each consumes at least 4 of that group's quota.
# Exhaust all core support covers; local minima are attainable independently.
quotas=Counter()
for t in P:quotas[centres[t]]+=2
padding=Counter({v:4 for v in S})
canonical_feasible=[]
for cv in core_cov:
    loads=padding.copy()
    for t in P0:loads[centres[t]]+=len(cv&face(t))
    if all(loads[v]<=q for v,q in quotas.items()):canonical_feasible.append(cv)
assert not canonical_feasible
# Changing a centred K5's pair partition is a permutation of its four fresh
# vertices, hence the same check applies to all 3^6=729 all-type1 maximizers.

C=set(mincorecovers[0])
for vs,es,ts,lp in blocks:
    cc=covers(ts,support(lp));C.update(min(cc,key=lambda q:(len(q),sorted(q))))
assert len(C)==29 and C<=support(P)
assert all(C&face(t) for t in all_t)
loads=[len(C&face(t)) for t in P]
heavy=[i for i,v in enumerate(loads) if v==3]
light=[i for i,v in enumerate(loads) if v==1]
adj={i:[j for j in light if set(P[i])&set(P[j])] for i in heavy}
matched={}
def augment(h,seen):
    for l in adj[h]:
        if l in seen:continue
        seen.add(l)
        if l not in matched or augment(matched[l],seen):matched[l]=h;return True
    return False
assert all(augment(h,set()) for h in heavy)
pairs=[{'heavy':h,'light':l,'centre':min(set(P[h])&set(P[l]))} for l,h in sorted(matched.items())]
assert len(pairs)==len(heavy)==7
assert mincore+6*4==29 and core_tau+6*local_tau==29

result={
 'status':'PASS independent literal/profile reconstruction; ordinary AI audit, not formal proof',
 'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),
 'host':platform.platform(),'python':sys.version,
 'input_sha256':EXPECTED,'verifier_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
 'counts':{'vertices':32,'edges':75,'actual_triangles':70,'nu':15,'support_optimum_for_P':29,
           'unrestricted_tau':29,'core_maximum_packings':20,'local_K5_maximum_packings':15,
           'global_maximum_packings_by_factorization':total,'global_profiles':1280,
           'F_maximum':fbest,'F_maximizing_packings':1458,'all_type1_F_maximizers':729,
           'lex_maximizing_packings':1458,'all_type1_lex_maximizers':729,
           'canonical_quota_feasible_core_states':len(canonical_feasible)},
 'core_packing_counts':core_counts,'K5_packing_counts':local_counts,
 'edges':sorted(all_e),'triangles':all_t,'packing':P,
 'private_bases':{str(t):v for t,v in bases.items()},'private_pages':private_pages,
 'canonical_centres':{str(t):v for t,v in centres.items()},'support_cover':sorted(C),
 'loads':loads,'heavy_light_matching':pairs,'global_F_maximizing_profiles':fm,
 'global_lex_maximum':lexbest,
 'core_profiles':[{'packing':q,'degrees':degrees(q,range(8)),
                   'F0':sum(t*t for t in degrees(q,range(8))),
                   'H':sum(degrees(q,range(8))[v] for v in S)} for q in core_max],
 'local_K5_details':local_details,
 'scope':'All triangles literal; local subsets exhaustive; global packing and cover optimality use block-factorization proof; 1280 profiles exhaust all 20*15^6 maximum packings up to private-vertex permutations.'
}
out=ROOT/'evidence/packing_concentration_fresh/verification.json'
out.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'status':'PASS','output':str(out),'counts':result['counts']},indent=2))
