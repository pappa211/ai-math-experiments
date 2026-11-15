#!/usr/bin/env python3
"""Complete restriction discriminator for the binary geometry F2^4 minus 0.
All 32768 point restrictions, exact triangle-cover deletion DP, exact odd-cover
kernel enumeration over submasks, and TF deletion checks. Standard library.
No assertion of actual-graph realizability or unrestricted theorem.
"""
from itertools import combinations
from collections import Counter
from pathlib import Path
import datetime,hashlib,json,platform
assert platform.system()=='Darwin'
ROOT=Path(__file__).resolve().parents[1]
N=15;TOTAL=1<<N
lines=sorted({tuple(sorted((x,y,x^y))) for x,y in combinations(range(1,16),2)})
assert len(lines)==35
lm=[sum(1<<(v-1) for v in t) for t in lines]
inc=[sum(1<<j for j,t in enumerate(lines) if v in t) for v in range(1,16)]
size=[m.bit_count() for m in range(TOTAL)]
contained=[sum(1<<i for i,t in enumerate(lm) if m&t==t) for m in range(TOTAL)]
parity=[0]*TOTAL
alpha=[0]*TOTAL;cap=[0]*TOTAL;tau=[0]*TOTAL
for E in range(1,TOTAL):
    low=E&-E;parity[E]=parity[E^low]^inc[low.bit_length()-1]
    if not contained[E]:alpha[E]=size[E];cap[E]=E
    else:
        j=(contained[E]&-contained[E]).bit_length()-1
        candidates=[E^(1<<(v-1)) for v in lines[j]]
        q=max(candidates,key=lambda z:(alpha[z],-cap[z]))
        alpha[E]=alpha[q];cap[E]=cap[q]
    tau[E]=size[E]-alpha[E]
# B is the complement of an odd cover C within E. For every line in E,
# |B intersect line| must be even. This is exactly the bitset parity test below.
pi=[0]*TOTAL;even_set=[0]*TOTAL;kernel_count=[0]*TOTAL
submask_pairs=0
for E in range(TOTAL):
    B=E;best=-1;bestB=0;kernels=0
    while True:
        submask_pairs+=1
        if not (parity[B]&contained[E]):
            kernels+=1
            if size[B]>best:best=size[B];bestB=B
        if not B:break
        B=(B-1)&E
    pi[E]=size[E]-best;even_set[E]=bestB;kernel_count[E]=kernels
    assert pi[E]>=tau[E]
assert submask_pairs==3**15

def points(m):return [v for v in range(1,16) if m>>(v-1)&1]
def rank(E):
    basis={}
    for v in points(E):
        while v:
            b=v.bit_length()-1
            if b not in basis:basis[b]=v;break
            v^=basis[b]
    return len(basis)
def rows_rank(E):
    basis={}
    for j,t in enumerate(lm):
        if not (contained[E]>>j&1):continue
        row=t
        while row:
            b=row.bit_length()-1
            if b not in basis:basis[b]=row;break
            row^=basis[b]
    return len(basis)
def tf(E):
    return all(alpha[E^t]==alpha[E] for j,t in enumerate(lm) if contained[E]>>j&1)
rows=[];counts=Counter();by_size={};gaps=Counter();counter=[]
for E in range(TOTAL):
    is_tf=tf(E);nonvacuous=bool(contained[E]);r=rank(E)
    rr=rows_rank(E)
    assert kernel_count[E]==1<<(size[E]-rr)
    counts['restrictions']+=1
    counts['triangle_free' if not nonvacuous else 'with_triangles']+=1
    counts['TF' if is_tf else 'not_TF']+=1
    if is_tf and nonvacuous:counts['nonvacuous_TF']+=1
    if pi[E]>tau[E]:counts['parity_gap']+=1
    if is_tf and pi[E]>tau[E]:counter.append(E)
    gaps[(tau[E],pi[E],is_tf,nonvacuous)]+=1
    n=size[E]
    if n not in by_size:by_size[n]=Counter()
    by_size[n]['restrictions']+=1
    if is_tf:by_size[n]['TF']+=1
    if is_tf and nonvacuous:by_size[n]['nonvacuous_TF']+=1
    if pi[E]>tau[E]:by_size[n]['parity_gap']+=1
    rows.append([E,n,r,contained[E].bit_count(),tau[E],pi[E],is_tf,cap[E],even_set[E],rr,kernel_count[E]])
# Check literal witnesses retained for each restriction.
for E,n,r,nt,t,p,is_tf,CAP,B,rr,kc in rows:
    assert CAP&E==CAP and not contained[CAP] and size[CAP]==n-t
    assert B&E==B and not (parity[B]&contained[E]) and size[B]==n-p
# Minimal counterexample or gap, if any, with exact TF witnesses.
def describe(E):
    out={'mask':E,'points':points(E),'rank':rank(E),'triangles':[lines[j] for j in range(35) if contained[E]>>j&1],
         'tau':tau[E],'pi':pi[E],'TF':tf(E),'minimum_cover':points(E^cap[E]),
         'minimum_odd_cover':points(E^even_set[E]),'triangle_matrix_rank':rows_rank(E),
         'kernel_size':kernel_count[E]}
    if tf(E):
        out['TF_minimum_covers']={str(lines[j]):points(E^cap[E^t]) for j,t in enumerate(lm) if contained[E]>>j&1}
        for j,t in enumerate(lm):
            if contained[E]>>j&1:assert size[E^cap[E^t]]==tau[E] and (E^cap[E^t])&t==t
    return out
counter.sort(key=lambda E:(size[E],E))
allgaps=sorted((E for E in range(TOTAL) if pi[E]>tau[E]),key=lambda E:(size[E],E))
# Structural classification and affine-cap formula within this same domain.
full=(1<<15)-1
planes={sum(1<<(v-1) for v in range(1,16) if (ell&v).bit_count()%2==0) for ell in range(1,16)}
planes_plus_point={h|(1<<v) for h in planes for v in range(15) if not h>>v&1}
five_circuits={E for E in range(TOTAL) if size[E]==5 and not contained[E] and not __import__('functools').reduce(int.__xor__,points(E),0)}
assert len(five_circuits)==168
k5_representations=set()
for bs in combinations(range(1,16),4):
    bm=sum(1<<(v-1) for v in bs)
    if rank(bm)!=4:continue
    vals=set(bs)|{x^y for x,y in combinations(bs,2)}
    assert len(vals)==10
    k5_representations.add(sum(1<<(v-1) for v in vals))
assert k5_representations=={full^q for q in five_circuits}
pg_minus_point={full^(1<<v) for v in range(15)}
known_tf=planes|planes_plus_point|k5_representations|pg_minus_point|{full}
assert {E for E in range(TOTAL) if contained[E] and tf(E)}==known_tf
halfspaces=[sum(1<<(v-1) for v in range(1,16) if (ell&v).bit_count()%2) for ell in range(1,16)]
affine_fail=[]
for E in range(TOTAL):
    if max(size[E&H] for H in halfspaces)<alpha[E]:affine_fail.append(E)
assert set(affine_fail)==five_circuits
summary={'status':'H-BTF REFUTED IN RANK FOUR' if counter else 'H-BTF SURVIVES ALL RANK-FOUR RESTRICTIONS',
 'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'host':platform.platform(),
 'verifier_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
 'geometry':'Nonzero vectors of F2^4, labelled1..15; triangles x,y,x xor y',
 'lines':lines,'counts':dict(counts),'by_ground_set_size':{str(k):dict(v) for k,v in sorted(by_size.items())},
 'nonvacuous_TF_classification':{'Fano_planes':len(planes),'Fano_plane_plus_one_outside_point':len(planes_plus_point),'graphic_K5_representations':len(k5_representations),'full_geometry_minus_one_point':len(pg_minus_point),'full_geometry':1},
 'maximum_affine_cap_formula_exceptions':len(affine_fail),'affine_cap_exceptions_are_exactly_five_circuits':True,
 'exact_submask_states':submask_pairs,'counterexample_count':len(counter),
 'smallest_counterexample':describe(counter[0]) if counter else None,
 'smallest_unconditional_parity_gap':describe(allgaps[0]) if allgaps else None,
 'tau_pi_TF_counts':[{'tau':t,'pi':p,'TF':f,'nonvacuous':v,'count':num} for (t,p,f,v),num in sorted(gaps.items())],
 'scope':'Complete labelled restrictions of this fixed rank-four binary geometry, including lower ranks. Not a proof for arbitrary binary rank and not an actual-graph counterexample claim.'}
(ROOT/'evidence/binary_tf/rank4_summary.json').write_text(json.dumps(summary,indent=2)+'\n')
receipt={'columns':['mask','size','binary_rank','triangle_count','tau','pi','TF','maximum_cap_mask','maximum_triangle_even_mask','triangle_matrix_rank','kernel_size'],'records':rows}
(ROOT/'evidence/binary_tf/rank4_exact_table.json').write_text(json.dumps(receipt,separators=(',',':'))+'\n')
print(json.dumps({k:summary[k] for k in ('status','counts','exact_submask_states','counterexample_count','smallest_counterexample','smallest_unconditional_parity_gap')},indent=2))
