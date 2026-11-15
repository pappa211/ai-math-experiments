"""Standalone literal reconstruction of the concentration/canonical-centre witness.
All full graph triangles are enumerated. Global packing/optimization completeness
uses the proved vertex-sum factorization and exhaustive local degree profiles.
"""
import json, hashlib
from pathlib import Path
from itertools import combinations, product
from collections import Counter
ROOT=Path(__file__).resolve().parents[1]

def es(t):return set(combinations(sorted(t),2))
def triangles(vertices,edges):return [t for t in combinations(vertices,3) if es(t)<=edges]
def packings(ts,k):return [q for q in combinations(ts,k) if len(set().union(*(es(t) for t in q)))==3*k]
def cover_states(ts,allowed):
    allowed=sorted(allowed)
    for size in range(len(allowed)+1):
        ans=[set(q) for q in combinations(allowed,size) if all(set(q)&es(t) for t in ts)]
        if ans:return ans
    raise AssertionError

def analyze(P,ts):
    B=set().union(*(es(t) for t in P));assert len(B)==3*len(P)
    private=[];centres=[];bases=[]
    for t in P:
        pages=[q for q in ts if len(es(q)&B)==1 and es(q)&B<=es(t)]
        bs={next(iter(es(q)&B)) for q in pages}
        assert len(bs)==1
        b=next(iter(bs));bases.append(b);centres.append(next(iter(set(t)-set(b))));private.append(pages)
    return B,bases,centres,private

V=list(range(8));coreE=es((0,1,2,6))|es((3,4,5,6))|es((0,3,7))
coreT=triangles(V,coreE);coreP=[(0,1,2),(3,4,5),(0,3,6)]
assert len(coreE)==15 and len(coreT)==10
coreMax=packings(coreT,3);assert len(coreMax)==20 and not packings(coreT,4)
coreB,coreR,coreCentres,corePrivate=analyze(coreP,coreT)
assert coreR==[(1,2),(4,5),(0,3)] and coreCentres==[0,3,6]
coreMin=cover_states(coreT,coreB);assert len(coreMin)==1 and len(coreMin[0])==5
assert coreMin[0]=={(1,2),(4,5),(0,3),(0,6),(3,6)}
# Exhaust every support cover against all canonical quotas (not just minimum states).
coreCanonical=[]
for bits in product((0,1),repeat=len(coreB)):
    C={e for e,b in zip(sorted(coreB),bits) if b}
    if all(C&es(t) for t in coreT) and all(len(C&es(t))<=2 for t in coreP):coreCanonical.append(C)
assert not coreCanonical
high=set(range(6));coreProfiles=[]
for q in coreMax:
    d=Counter(v for t in q for v in t)
    coreProfiles.append({'packing':q,'degrees':[d[v] for v in V],'F':sum(d[v]**2 for v in V),'H':sum(d[v] for v in high)})
assert max(x['H'] for x in coreProfiles)==8
assert {x['F'] for x in coreProfiles if x['H']==8}=={13}
assert max(x['F'] for x in coreProfiles)==15
# Six fresh K5 blocks meeting the core in one high vertex apiece.
fullE=set(coreE);fullP=list(coreP);blocks=[];nextv=8
for v in range(6):
    fresh=list(range(nextv,nextv+4));nextv+=4
    block=[v]+fresh;fullE|=es(block)
    localP=[tuple(sorted((v,fresh[0],fresh[1]))),tuple(sorted((v,fresh[2],fresh[3])))]
    fullP+=localP
    localT=triangles(sorted(block),es(block));localMax=packings(localT,2)
    assert len(localT)==10 and len(localMax)==15 and not packings(localT,3)
    localB=set().union(*(es(t) for t in localP));localC=cover_states(localT,localB)
    assert len(localC)==2 and {len(c) for c in localC}=={4}
    # Every max local packing has the common shared vertex or one private vertex.
    assert all(sorted(Counter(v for t in q for v in t).values())==[1,1,1,1,2] for q in localMax)
    blocks.append({'shared_vertex':v,'vertices':block,'packing':localP,'triangles':localT,'all_maximum_packings':localMax,'support_minimum_covers':[sorted(c) for c in localC]})
fullV=list(range(nextv));fullT=triangles(fullV,fullE)
expected=set(coreT)|set(t for b in blocks for t in b['triangles'])
assert set(fullT)==expected and len(fullT)==70 and len(fullE)==75 and len(fullV)==32
assert len(fullP)==15 and len(set().union(*(es(t) for t in fullP)))==45
fullB,fullR,fullCentres,fullPrivate=analyze(fullP,fullT)
deg=Counter(v for t in fullP for v in t)
assert all(deg[c]>deg[next(iter(set(q)-set(base)))] for c,base,qs in zip(fullCentres,fullR,fullPrivate) for q in qs)
assert sum(d*d for d in deg.values())==93
# Exhaust every possible sorted degree profile of every global maximum packing.
# In each K5, choices among its four private common vertices permute degrees only
# within private vertices; two representative states therefore suffice exactly.
Fmax=-1;lexmax=None;profile_count=0;F_attainers=0;lex_attainers=0
for cp in coreProfiles:
    for flags in product((0,1),repeat=6):
        d=cp['degrees']+[0]*24
        for b,flag in zip(blocks,flags):
            v=b['shared_vertex'];fresh=b['vertices'][1:]
            if flag==0:
                d[v]+=2
                for x in fresh:d[x]+=1
            else:
                d[v]+=1
                for x in fresh:d[x]+=1
                d[fresh[0]]+=1
        f=sum(x*x for x in d);lex=tuple(sorted(d,reverse=True));profile_count+=1
        Fmax=max(Fmax,f)
        if lexmax is None or lex>lexmax:lexmax=lex
assert profile_count==1280 and Fmax==93
originalLex=tuple(sorted((deg[v] for v in fullV),reverse=True));assert originalLex==lexmax
# Literal minimum support cover and explicit heavy-light matching.
C=set(coreMin[0])
for b in blocks:C|=set(map(tuple,b['support_minimum_covers'][0]))
assert len(C)==29 and all(C&es(t) for t in fullT)
loads=[len(C&es(t)) for t in fullP]
H=[i for i,x in enumerate(loads) if x==3];L=[i for i,x in enumerate(loads) if x==1]
match=[(2,0)]
for i in range(3,15,2):
    hh=next(j for j in [i,i+1] if loads[j]==3);ll=next(j for j in [i,i+1] if loads[j]==1);match.append((hh,ll))
assert {h for h,l in match}==set(H) and len({l for h,l in match})==len(match)
assert all(set(fullP[h])&set(fullP[l]) for h,l in match)
result={'status':'PASS','core':{'vertices':V,'edges':sorted(coreE),'triangles':coreT,'packing':coreP,'nu':3,'private_bases':coreR,'canonical_centres':coreCentres,'private_pages':corePrivate,'minimum_support_covers':[sorted(c) for c in coreMin],'canonical_quota_covers':0,'all_maximum_packing_profiles':coreProfiles},'padded':{'vertices':fullV,'edges':sorted(fullE),'triangles':fullT,'packing':fullP,'nu':15,'blocks':blocks,'private_bases':fullR,'canonical_centres':fullCentres,'private_pages':fullPrivate,'packing_degrees':[deg[v] for v in fullV],'F':93,'global_F_maximum':Fmax,'global_lex_degree_maximum':lexmax,'degree_profiles_exhausted':profile_count,'profile_completeness':'Each maximum packing factors into one of20 core maxima and one of15 maxima per K5. For sorted degrees and F, each K5 has exactly2 states: common vertex shared or private; choices of which private vertex merely permute otherwise private coordinates.','minimum_support_cover':sorted(C),'minimum_support_cover_size':29,'heavy_light_matching_zero_based_packing_indices':match,'support_minimum_proof':'Core support minimum5 plus6 independent K5 support minima4; triangle families and supports factor over vertex sums.','canonical_quota_impossible_proof':'Every attached K5 needs at least2 nonbase support edges, exactly using the2 extra residual quota at its canonical centre. The four core constraints then force both 06 and36 at centre6, which has residual quota1.'},'scope':'Refutes canonical-centre quota gluing even for an all-type1 maximum packing globally maximizing F and sorted degrees. Does not refute arbitrary-centre SG, PK, or Tuza; literal support cover29<30 and matching provided.'}
out=ROOT/'evidence/packing_routes/concentration_witness.json';out.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'status':'PASS','core_maximum_packings':len(coreMax),'full_vertices':len(fullV),'full_edges':len(fullE),'full_triangles':len(fullT),'nu':15,'Fmax':Fmax,'lexmax':lexmax,'profiles':profile_count,'support_minimum':29,'certificate':str(out)}))
