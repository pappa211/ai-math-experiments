"""Independent check of one primary catalogue record, NOT catalogue completeness."""
from pathlib import Path
from itertools import combinations
import hashlib,json,time,resource
r=Path(__file__).resolve().parents[1];start=time.monotonic()
source=r/'sources/literature/r35_13.g6';raw=source.read_bytes();lines=raw.decode('ascii').splitlines()
assert len(lines)==1
s=lines[0]
if s.startswith('>>graph6<<'):s=s[10:]
n=ord(s[0])-63;assert n==13
bits=[]
for c in s[1:]:
    v=ord(c)-63;assert 0<=v<64;bits.extend((v>>j)&1 for j in range(5,-1,-1))
assert len(bits)==78
E=set();z=0
for v in range(1,n):
    for u in range(v):
        if bits[z]:E.add((u,v))
        z+=1
assert not any(all(tuple(sorted(e)) in E for e in combinations(T,2)) for T in combinations(range(n),3))
def alpha(N,edges):
    for k in range(N,-1,-1):
        for I in combinations(range(N),k):
            if all((u,v) not in edges for u,v in combinations(I,2)):return I
Icat=alpha(13,E);assert len(Icat)==4
C={tuple(sorted((u,(u+d)%13))) for u in range(13) for d in (1,5)}
assert len(C)==len(E)==26
# Backtracking bijection using only exact adjacency and nonadjacency, stdlib.
A=[{v for u,v in E if u==i}|{u for u,v in E if v==i} for i in range(n)]
B=[{v for u,v in C if u==i}|{u for u,v in C if v==i} for i in range(n)]
mp={};used=set()
def iso():
    if len(mp)==n:return dict(mp)
    best=None
    for u in range(n):
        if u in mp:continue
        cand=[v for v in range(n) if v not in used and len(A[u])==len(B[v]) and all((w in A[u])==(mp[w] in B[v]) for w in mp)]
        key=(len(cand),-sum(w in A[u] for w in mp),u)
        if best is None or key<best[0]:best=(key,u,cand)
    _,u,candidates=best
    for v in candidates:
        mp[u]=v;used.add(v);ans=iso()
        if ans is not None:return ans
        used.remove(v);del mp[u]
    return None
mapping=iso();assert mapping is not None
assert {tuple(sorted((mapping[u],mapping[v]))) for u,v in E}==C
F={(0,1),(3,4)};I={0,1,3,4,7,10};M={(0,1),(3,4),(5,6),(7,8),(9,10),(11,12)}
assert {e for e in C if set(e)<=I}==F
assert F<=M<=C and len(set().union(*(set(e) for e in M)))==12
assert all(set(e)-I for e in C-F)
cycle_matchings=[]
for leave in range(13):
    match={tuple(sorted(((leave+1+2*j)%13,(leave+2+2*j)%13))) for j in range(6)}
    assert match<=C and len(set().union(*(set(e) for e in match)))==12
    cycle_matchings.append(match)
assert not set.intersection(*cycle_matchings)
cycles={tuple(sorted((b+i,b+(i+1)%5))) for b in (0,5,10) for i in range(5)}
F3={(0,1),(5,6)};M3={(0,1),(2,3),(5,6),(7,8),(10,11),(12,13)};V3={2,4,7,9,10,12,14}
assert F3<=M3<=cycles and len(set().union(*(set(e) for e in M3)))==12
assert all(set(e)&V3 for e in cycles-F3)
assert 15-len(alpha(15,cycles))==9 and 15-len(alpha(15,cycles-F3))==7
out={'status':'PASS','scope':'one downloaded13vertex graph record and two explicit link witnesses; NO completeness recomputation','catalogue_url':'https://users.cecs.anu.edu.au/~bdm/data/ramsey.html','record_url':'https://users.cecs.anu.edu.au/~bdm/data/r35_13.g6','source_sha256':hashlib.sha256(raw).hexdigest(),'catalogue_snapshot_sha256':hashlib.sha256((r/'sources/literature/mckay_ramsey_20261104.html').read_bytes()).hexdigest(),'graph6_record':lines[0],'catalogue_graph':{'vertices':13,'edges':sorted(E),'independence_number':len(Icat),'maximum_independent_set':Icat,'isomorphism_to_circulant':mapping},'circulant_witness':{'matching_number':6,'vertex_cover_number':9,'F':sorted(F),'I':sorted(I),'maximum_matching_extending_F':sorted(M),'vertex_cover_after_F':sorted(set(range(13))-I),'maximum_matching_intersection_empty_certificate':'13 rotated near-perfect cycle matchings'},'three_C5_witness':{'F':sorted(F3),'maximum_matching_extending_F':sorted(M3),'vertex_cover_after_F':sorted(V3)},'elapsed_seconds':time.monotonic()-start,'peak_rss_Darwin_bytes':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,'independent_final_verification':'NOT_RUN'}
(r/'evidence/critic_catalogue.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k not in ['catalogue_graph']},indent=2))
