"""Exact fixed-witness test: all maxima and minimum support covers of old G0."""
from itertools import combinations
from collections import Counter
from pathlib import Path
import json
ROOT=Path(__file__).resolve().parents[1]
def es(t):return set(combinations(sorted(t),2))
def deficiency(P,loads):
    H=[i for i,a in enumerate(loads) if a==3];L=[i for i,a in enumerate(loads) if a==1]
    adj={i:[j for j in L if set(P[i])&set(P[j])] for i in H};matched={}
    def aug(i,seen):
        for j in adj[i]:
            if j in seen:continue
            seen.add(j)
            if j not in matched or aug(matched[j],seen):matched[j]=i;return True
        return False
    return len(H)-sum(aug(i,set()) for i in H)
V=[0,1,2,3,4,5,7];E=set(combinations(V,2))-{(0,5),(5,7),(1,3),(2,4)}
T=[t for t in combinations(V,3) if es(t)<=E]
# Parity upper bound: a five-packing leaves only two edges but six odd vertices.
assert len(E)==17 and sum(sum(v in e for e in E)%2 for v in V)==6
Ps=[q for q in combinations(T,4) if len(set().union(*(es(t) for t in q)))==12]
assert len(Ps)==50
f=lambda q:sum(x*x for x in Counter(v for t in q for v in t).values())
Fm=max(map(f,Ps));counts=Counter();fail=[];alls=[]
for P in Ps:
    B=set().union(*(es(t) for t in P));bs=[];centres=[];apices=[]
    for t in P:
        priv=[q for q in T if len(es(q)&B)==1 and es(q)&B<=es(t)]
        bases={next(iter(es(q)&B)) for q in priv}
        if len(bases)!=1:break
        b=next(iter(bases));bs.append(b);centres.append(next(iter(set(t)-set(b))));apices.append([next(iter(set(q)-set(b))) for q in priv])
    if len(bs)!=len(P):continue
    counts['alltype1']+=1
    arcs={(c,z) for c,zs in zip(centres,apices) for z in zs}
    reach={v:{w for x,w in arcs if x==v} for v in V}
    for k in V:
        for i in V:
            if k in reach[i]:reach[i]|=reach[k]
    acyclic=all(v not in reach[v] for v in V)
    if acyclic:counts['acyclic']+=1
    if f(P)==Fm:counts['Fmax_alltype1']+=1
    R=set(bs);U=sorted(B-R);constraints=[es(q) for q in T if not es(q)&R];states=[]
    for k in range(len(U)+1):
        for D in combinations(U,k):
            if all(set(D)&q for q in constraints):
                C=R|set(D);loads=[len(C&es(t)) for t in P]
                states.append({'C':sorted(C),'loads':loads,'delta':deficiency(P,loads)})
        if states:break
    bad=[s for s in states if s['delta']]
    if bad:
        counts['P_with_bad_minimum']+=1
        if acyclic:counts['acyclic_with_bad']+=1
        if f(P)==Fm:counts['Fmax_with_bad']+=1
        fail.append({'P':P,'F':f(P),'acyclic':acyclic,'arcs':sorted(arcs),'states':states})
    alls.append({'P':P,'F':f(P),'acyclic':acyclic,'private_bases':bs,'private_apices':apices,'minimum_support':len(states[0]['C']),'state_count':len(states),'bad_states':len(bad)})
r={'graph':{'vertices':V,'edges':sorted(E),'triangles':T},'maximum_packings':len(Ps),'Fmax':Fm,'counts':dict(counts),'all_type1_rows':alls,'all_bad_cover_packings':fail,'scope':'Only the fixed TUZA18 seven-vertex gluing block; all maxima and minimum support states, exact finite quantifier test.'}
(ROOT/'evidence/packing_routes/old_block_Fmax_Hall.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['graph','all_type1_rows','all_bad_cover_packings']}))
