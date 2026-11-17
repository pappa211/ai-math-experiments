#!/usr/bin/env python3
"""Independent finite verifier for TUZA-21's single switched-four-cycle control.
Pure Python exhaustive enumeration; no old checker or solver imported.
"""
from itertools import combinations
from pathlib import Path
import datetime, hashlib, json, platform, resource, time

START=time.monotonic()
DEADLINE=START+30
assert platform.system()=='Darwin', 'This mission runs only on the local Mac.'
def guard():
    if time.monotonic()>DEADLINE: raise TimeoutError('30 second finite-check deadline')
def edge(u,v): return tuple(sorted((u,v)))
def te(t): return frozenset(combinations(sorted(t),2))
def ordered(s): return [list(x) for x in sorted(s)]
def packing(ts):
    used=set()
    for t in ts:
        if used & te(t): return False
        used.update(te(t))
    return True

# Literal graph: x_i=i, a_i=4+i. No unspecified edges.
E=set(combinations(range(4),2))
for i in range(4):
    for j in [(i-1)%4,i,(i+1)%4]: E.add(edge(4+i,j))
tris=[t for t in combinations(range(8),3) if te(t)<=E]
P=[tuple(sorted(((i-1)%4,i,4+i))) for i in range(4)]
Q=[tuple(sorted(((i-1)%4,(i+1)%4,4+i))) for i in range(4)]
U=[tuple(sorted((i,(i+1)%4,4+i))) for i in range(4)]
bases={edge((i-1)%4,4+i) for i in range(4)}
gains=[edge(i,(i+1)%4) for i in range(4)]
B=set().union(*(te(t) for t in P))
assert len(E)==18 and len(tris)==16 and len(B)==12
assert packing(P)
private={}
for i,t in enumerate(P):
    private[i]=[q for q in tris if q not in P and len(te(q)&B)==1 and te(q)&B<=te(t)]
    assert private[i]==[Q[i]]
# Reconstruct completions from graph and privacy, without assuming A=B.
A=set(B); completions=[]
for i,t in enumerate(P):
    for v in set(range(8))-set(t):
        K=tuple(sorted((*t,v)))
        if set(combinations(K,2))<=E:
            other=[q for q in combinations(K,3) if q!=t]
            if all(q in private[i] for q in other):
                completions.append((i,K)); A.update(combinations(K,2))
assert A==B and not completions

# All 2^16 triangle subfamilies checked: exact packing number, no inference from maximality.
max_pack=[]; max_size=0; subfamilies=0
for mask in range(1<<len(tris)):
    subfamilies+=1
    if mask%1024==0: guard()
    size=mask.bit_count()
    if size<max_size: continue
    chosen=[tris[i] for i in range(len(tris)) if mask>>i&1]
    if packing(chosen):
        if size>max_size: max_size=size;max_pack=[]
        max_pack.append(chosen)
assert max_size==4

def exact_cover(allowed):
    edges=sorted(allowed);counts=[]
    for size in range(len(edges)+1):
        n=0; found=None
        for c in combinations(edges,size):
            n+=1
            if n%2048==0: guard()
            if all(set(c)&te(t) for t in tris): found=c; break
        counts.append({'size':size,'checked':n,'first_cover_found':found is not None})
        if found is not None: return size,ordered(found),counts
    raise AssertionError('No cover')
c,cw,ccount=exact_cover(A)
tau,tw,tcount=exact_cover(E)
assert c==8 and tau==6
assert all(len(te(q)&A)==1 and next(iter(te(q)&A)) in bases for q in Q)
clauses=[te(u)&A for u in U]
assert all(len(s)==2 and not (s & bases) for s in clauses)
assert sum(map(len,clauses))==len(set().union(*clauses))
assert all((bases|set(gains))&te(t) for t in tris)

rows=[]
for size in range(5):
    for ids in combinations(range(4),size):
        if not packing([Q[i] for i in ids]): continue
        C0=set()
        for i,t in enumerate(P):
            if i in ids: C0.add(edge((i-1)%4,4+i))
            else: C0.update(te(t))
        X={gains[i] for i in ids if gains[i] in E}
        C=C0|X
        assert C<=A and all(C&te(t) for t in tris)
        assert len(C)==12-2*size+len(X-C0)
        assert len(C)=={0:12,1:10,2:9}[size]
        rows.append({'page_indices':list(ids),'C0':ordered(C0),'opposite_edges':ordered(X),'new_opposite_edges':ordered(X-C0),'cover':ordered(C),'cover_size':len(C)})
assert len(rows)==9 and min(r['cover_size'] for r in rows)==9
result={'status':'PASS','graph':'switched four-cycle: x_i=i, a_i=4+i','vertices':list(range(8)),'edges':ordered(E),'triangles':[list(t) for t in tris],'specified_packing':[list(t) for t in P],'private_pages':[list(t) for t in Q],'allowed_edges':ordered(A),'private_completions':completions,'nu':max_size,'maximum_packing_count':len(max_pack),'packing_subfamilies_examined':subfamilies,'permitted_optimum':c,'permitted_cover':cw,'permitted_cover_enumeration':ccount,'ordinary_tau':tau,'ordinary_cover':tw,'ordinary_cover_enumeration':tcount,'forced_bases':ordered(bases),'disjoint_support_clauses':[ordered(s) for s in clauses],'book_selections':rows,'minimum_book_construction_cost':9,'seed':None,'deadline_seconds':30,'elapsed_seconds':time.monotonic()-START,'peak_self_rss_bytes_Darwin':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,'platform':platform.platform(),'python_version':platform.python_version(),'run_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'evidence_limit':'Independent finite enumeration plus separate ordinary argument; no Lean or external human review.'}
out=Path(__file__).resolve().parents[1]/'results/book_verification.json'
out.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['status','nu','maximum_packing_count','permitted_optimum','ordinary_tau','minimum_book_construction_cost','elapsed_seconds','peak_self_rss_bytes_Darwin']}))
