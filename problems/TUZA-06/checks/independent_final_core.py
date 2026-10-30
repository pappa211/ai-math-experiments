"""Independent TUZA-06 review checker, fixed graph only.
Uses integer edge-incidence masks and an independent backtracking packing search.
Does not import or execute the frozen generator and makes no claim about arbitrary
outside attachments or the global degeneracy theorem.
"""
import itertools, json, pathlib, hashlib, datetime
from functools import lru_cache
root=pathlib.Path(__file__).resolve().parents[1]
frozen=root/'checks/final_core_certificates.json'
V=('u','v','w','a','b','c','d','e')
idx={v:i for i,v in enumerate(V)}
universe=list(itertools.combinations(range(8),2))
bit={p:1<<i for i,p in enumerate(universe)}
def emask(vertices):
    s=sorted(idx[v] if isinstance(v,str) else v for v in vertices)
    return sum(bit[p] for p in itertools.combinations(s,2))
def edge(a,b): return emask((a,b))
A=tuple('abcde')
E=emask(A)
for z in V[1:]: E|=edge('u',z)
for z in 'abc': E|=edge('v',z)
for z in 'ade': E|=edge('w',z)
T=[(t,emask(t)) for t in itertools.combinations(V,3) if emask(t)&E==emask(t)]
assert E.bit_count()==23 and len(T)==32
D=json.loads(frozen.read_text())
assert E==sum(edge(*p) for p in D['edges'])
def validate_pack(ts,forbidden=0):
    accum=0
    for t in ts:
        assert len(t)==3 and len(set(t))==3
        m=emask(t)
        assert m&E==m and m&forbidden==0 and m&accum==0,(ts,t)
        accum|=m
    return accum
assert len(D['packing7'])==7
validate_pack(D['packing7'])
C=sum(edge(*p) for p in D['cover9'])
assert C.bit_count()==9 and C&E==C and all(m&C for t,m in T)
expected={tuple(sorted((edge(*f),edge(*g)))) for f,g in itertools.combinations(itertools.combinations(A,2),2)}
seen=set()
search_nodes=0
independent=[]
for row in D['pair_witnesses']:
    f,g=[edge(*p) for p in row['omitted']]
    k=tuple(sorted((f,g)))
    assert k not in seen
    seen.add(k)
    assert len(row['packing'])==6
    validate_pack(row['packing'],f|g)
    candidates=[(t,m) for t,m in T if not m&(f|g)]
    @lru_cache(None)
    def solve(start,used,need):
        global search_nodes
        search_nodes+=1
        if need==0:return ()
        compatible=[i for i in range(start,len(candidates)) if not candidates[i][1]&used]
        if len(compatible)<need:return None
        for pos,i in enumerate(compatible):
            if len(compatible)-pos<need:break
            result=solve(i+1,used|candidates[i][1],need-1)
            if result is not None:return (candidates[i][0],)+result
        return None
    answer=solve(0,0,6)
    assert answer is not None
    validate_pack(answer,f|g)
    independent.append({'omitted':row['omitted'],'packing':[''.join(t) for t in answer]})
assert seen==expected and len(seen)==45
cliques={}
for n in (4,5):
    vs=V[:n]
    ee=emask(vs)
    tt=[(t,emask(t)) for t in itertools.combinations(vs,3)]
    r=1 if n==4 else 2
    packs=[ts for ts in itertools.combinations(tt,r) if all(not ts[i][1]&ts[j][1] for i in range(r) for j in range(i))]
    if n==5:
        for fs in itertools.combinations([edge(*p) for p in itertools.combinations(vs,2)],2):
            assert any(all(not m&sum(fs) for t,m in p) for p in packs)
        assert not any(all(not ts[i][1]&ts[j][1] for i in range(3) for j in range(i)) for ts in itertools.combinations(tt,3))
    else:
        for v in vs:
            star=sum(edge(v,w) for w in vs if w!=v)
            assert any(all(not m&star for t,m in p) for p in packs)
    minsize=2*r
    covers=[]
    es=[edge(*p) for p in itertools.combinations(vs,2)]
    for size in range(minsize+1):
        covers_at_size=[sum(fs) for fs in itertools.combinations(es,size) if all(m&sum(fs) for t,m in tt)]
        if size<minsize:assert not covers_at_size
        else:covers=covers_at_size
    assert covers and all(any(c&e for c in covers) for e in es)
    cliques[str(n)]={'nu':r,'tau':minsize,'maximum_packings':len(packs),'minimum_covers':len(covers)}
result={'status':'PASS','utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'source_sha256':hashlib.sha256(frozen.read_bytes()).hexdigest(),'vertices':8,'edges':23,'triangles':32,'source_pair_witnesses_checked':45,'independently_reconstructed_pair_witnesses':45,'packing_search_nodes':search_nodes,'cliques':cliques,'scope':'Fixed final core and K4/K5 local certificate checks only; arbitrary attachments handled by symbolic ordinary proof, not this computation.','pair_witnesses':independent}
(root/'checks/independent_final_core_results.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='pair_witnesses'},indent=2))
