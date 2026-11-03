"""Independent tiny exhaustive checks of frozen B5/B8; no source execution."""
from itertools import combinations
from pathlib import Path
import json,time

ROOT=Path(__file__).resolve().parents[1]
start=time.monotonic()

def graph(n,edges):
    edges=sorted(set(tuple(sorted(e)) for e in edges));ei={e:i for i,e in enumerate(edges)}
    triangles=[t for t in combinations(range(n),3) if all(e in ei for e in combinations(t,2))]
    masks=[sum(1<<ei[e] for e in combinations(t,2)) for t in triangles]
    return edges,triangles,masks

def opt_covers(edges,masks):
    for size in range(len(edges)+1):
        ans=[]
        for c in combinations(range(len(edges)),size):
            mask=sum(1<<i for i in c)
            if all(mask&t for t in masks):ans.append(mask)
        if ans:return size,ans

def packing(masks,ids):
    best=[]
    def visit(position,used,chosen):
        nonlocal best
        if len(chosen)+len(ids)-position<=len(best):return
        if position==len(ids):
            best=chosen[:];return
        i=ids[position]
        if not masks[i]&used:visit(position+1,used|masks[i],chosen+[i])
        visit(position+1,used,chosen)
    visit(0,0,[])
    return best

def literal_cover(edges,C):return [e for i,e in enumerate(edges) if (C>>i)&1]

# B5: complementary C5s in K5.
edges,tris,masks=graph(5,list(combinations(range(5),2)))
C=sum(1<<edges.index(tuple(sorted((i,(i+1)%5)))) for i in range(5))
tau,cs=opt_covers(edges,masks)
p=packing(masks,list(range(len(tris))))
star_costs=[]
for v in range(5):
    others=[u for u in range(5) if u!=v]
    H=[(x,y) for x,y in combinations(others,2) if not (C>>edges.index((x,y)))&1]
    cost=next(s for s in range(5) if any(all(x in S or y in S for x,y in H) for S in combinations(others,s)))
    actual=sum((C>>i)&1 for i,e in enumerate(edges) if v in e)
    assert actual==cost==2
    star_costs.append(cost)
assert tau==4 and len(p)==2 and C.bit_count()==5
b5={'n':5,'edges':edges,'triangles':tris,'cover':literal_cover(edges,C),'tau':tau,'specified_cover_size':5,'all_red_count':sum((C&t).bit_count()==3 for t in masks),'k':len(p),'packing':[tris[i] for i in p],'star_minima':star_costs,'status':'REFUTED_EXACT_AUXILIARY'}

# B8: forced apex star, freely rotating unique-private base red edge.
es=list(combinations(range(4),2));pages=[]
for i in range(3):
    for j in range(2):
        v=4+2*i+j
        es.extend([(3,v),(i,v)]);pages.append((i,3,v))
edges,tris,masks=graph(10,es)
tau,cs=opt_covers(edges,masks)
expected={sum(1<<edges.index(tuple(sorted(e))) for e in [(0,3),(1,3),(2,3),b]) for b in combinations(range(3),2)}
assert tau==4 and set(cs)==expected
rows=[]
for C in cs:
    counts=[(C&t).bit_count() for t in masks]
    ids=[i for i,x in enumerate(counts) if x<3]
    p=packing(masks,ids)
    assert len(p)==4 and counts.count(3)==1
    transitions=[]
    for D in cs:
        if (C^D).bit_count()==2:
            removed=C&~D;added=D&~C
            transitions.append({'to_cover':literal_cover(edges,D),'removed':literal_cover(edges,removed),'added':literal_cover(edges,added),'all_red_after':[tris[i] for i,t in enumerate(masks) if (D&t).bit_count()==3]})
    assert len(transitions)==2
    # Test the stated scope limitation against every maximum eligible packing.
    T=masks[counts.index(3)]
    avoiding=packing(masks,[i for i in ids if not masks[i]&T])
    assert len(avoiding)<4
    rows.append({'cover':literal_cover(edges,C),'k':len(p),'packing':[tris[i] for i in p],'all_red':[tris[i] for i,x in enumerate(counts) if x==3],'max_packing_avoiding_all_red':len(avoiding),'transitions':transitions})
b8={'n':10,'edges':edges,'triangles':tris,'tau':tau,'minimum_covers_complete':True,'minimum_cover_count':len(cs),'covers':rows,'status':'REFUTED_EXACT_AUXILIARY','scope':'Does not satisfy free-all-red-triangle hypothesis for any maximum eligible packing.'}
result={'frozen_statements':'notes/TRACK_B.md B5 and B8 before execution','B5':b5,'B8':b8,'elapsed_seconds':time.monotonic()-start}
(ROOT/'evidence'/'track_b_small.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'B5':{'tau':tau if False else b5['tau'],'specified_cover_size':5,'k':2,'star_minima':star_costs},'B8':{'tau':tau,'minimum_covers':len(cs),'all_k': [r['k'] for r in rows],'all_red_counts':[len(r['all_red']) for r in rows],'free_all_red_maxima':[r['max_packing_avoiding_all_red'] for r in rows]},'elapsed_seconds':result['elapsed_seconds']}))
