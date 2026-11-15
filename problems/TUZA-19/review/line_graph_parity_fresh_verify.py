#!/usr/bin/env python3
"""Independent constructive tests of the frozen line-graph parity argument.
No producer imports or results. No exact global optimum is inferred from tests.
Every reported cover and packing is checked against literal line-graph edges
and actual triangles. The all-size conclusion belongs to the separate proof.
"""
from collections import Counter
from itertools import combinations
from pathlib import Path
import datetime, hashlib, json, platform, random, sys

ROOT=Path(__file__).resolve().parents[1]
INPUT=ROOT/'evidence/line_graph_parity_fresh/input_statement.md'
EXPECTED='65f65ed45fb9920b39c72491243eccc7ba880add1a1f1256b4e86c65d1ebd0f1'
assert hashlib.sha256(INPUT.read_bytes()).hexdigest()==EXPECTED
assert platform.system()=='Darwin'

def pair(a,b):return tuple(sorted((a,b)))
def faces(t):return set(combinations(sorted(t),2))
def q(d):
    a=d//2;b=d-a
    return a*(a-1)//2+b*(b-1)//2

def clique_packing(vs,avoid=None):
    vs=list(vs);d=len(vs);t=d//2
    if d<3:return []
    if d%2==0 and avoid is not None:
        assert set(avoid)<=set(vs)
        B=list(avoid)
        rem=[v for v in vs if v not in B]
        B+=rem[:t-2];A=rem[t-2:]
    else:A=vs[:t];B=vs[t:2*t]
    out=[tuple(sorted((A[i],A[j],B[(i+j)%t]))) for i,j in combinations(range(t),2)]
    if d%2:
        w=vs[-1]
        inds=range(t) if t%2 else range(t//2)
        out += [tuple(sorted((w,A[i],B[(2*i)%t]))) for i in inds]
    return out

def check_local(vs,pk,avoid=None):
    used=set()
    for t in pk:
        assert len(set(t))==3 and set(t)<=set(vs)
        f=faces(t);assert used.isdisjoint(f);used|=f
    assert 2*len(pk)>=q(len(vs))
    if len(vs)%2==0:assert 2*len(pk)==q(len(vs))
    if avoid is not None:assert tuple(sorted(avoid)) not in used

local_cases=0
for d in range(101):
    vs=range(d)
    pk=clique_packing(vs);check_local(vs,pk);local_cases+=1
    if d%2==0 and d>=2:
        av=list(combinations(vs,2)) if d<=16 else [(0,1),(0,d-1),(d//2,d-1)]
        for e in av:check_local(vs,clique_packing(vs,e),e);local_cases+=1

def components(n,es):
    adj=[set() for _ in range(n)]
    for a,b in es:adj[a].add(b);adj[b].add(a)
    unseen=set(range(n));out=[]
    while unseen:
        start=min(unseen);unseen.remove(start);stack=[start];comp={start}
        while stack:
            v=stack.pop()
            for w in adj[v]:
                if w in unseen:unseen.remove(w);comp.add(w);stack.append(w)
        out.append((sorted(comp),[e for e in es if e[0] in comp]))
    return out

def euler_edges(vs,es,start):
    adj={v:[] for v in vs}
    for i,(a,b) in enumerate(es):adj[a].append(i);adj[b].append(i)
    used=[False]*len(es);stack=[(start,None)];reverse=[]
    while stack:
        v,_=stack[-1]
        while adj[v] and used[adj[v][-1]]:adj[v].pop()
        if not adj[v]:
            _,incoming=stack.pop()
            if incoming is not None:reverse.append(incoming)
        else:
            i=adj[v].pop();assert not used[i];used[i]=True
            a,b=es[i];w=b if a==v else a
            stack.append((w,i))
    tour=reverse[::-1]
    assert len(tour)==len(es) and len(set(tour))==len(es)
    v=start
    for i in tour:
        a,b=es[i];assert v in (a,b);v=b if a==v else a
    assert v==start
    return tour

def construct_component(vs,es):
    if not es:return {'case':'isolated','vertices':vs,'edges':es,'cover':[],'packing':[],
                      'triangles':[],'line_edges':[],'qsum':0}
    es=list(sorted(es));m=len(es);star={v:[] for v in vs}
    for i,(a,b) in enumerate(es):star[a].append(i);star[b].append(i)
    le=set().union(*(faces(star[v]) for v in vs))
    actual=[t for t in combinations(range(m),3) if faces(t)<=le]
    # Independent classification from literal line triangles.
    star_count=cycle_count=0
    for t in actual:
        common=set(es[t[0]])&set(es[t[1]])&set(es[t[2]])
        if common:
            assert len(common)==1;star_count+=1
        else:
            union=set().union(*(set(es[i]) for i in t))
            assert len(union)==3 and set(es[i] for i in t)==faces(union)
            cycle_count+=1
    roots=[t for t in combinations(vs,3) if faces(t)<=set(es)]
    assert cycle_count==len(roots)
    assert star_count==sum(len(list(combinations(star[v],3))) for v in vs)
    odd=[v for v in vs if len(star[v])%2]
    special=not odd and m%2
    triangle=roots[0] if special and roots else None
    edge_index={e:i for i,e in enumerate(es)}
    avoidance={}
    extra=[]
    if triangle is not None:
        extra=tuple(sorted(edge_index[e] for e in faces(triangle)))
        for v in triangle:
            avoidance[v]=tuple(i for i in extra if v in es[i])
            assert len(avoidance[v])==2
    pk=[]
    for v in vs:pk+=clique_packing(star[v],avoidance.get(v))
    if extra:pk.append(extra)
    if special and not roots:
        case='Eulerian_odd_triangle_free'
        cover=set()
        for v in vs:
            t=len(star[v])//2
            cover|=faces(star[v][:t])|faces(star[v][t:])
    else:
        augmented=list(es);av=list(vs)
        if odd:
            case='odd_degree_dummy'
            dummy=max(vs)+1;av.append(dummy);start=dummy
            augmented += [(v,dummy) for v in odd]
        else:
            case='Eulerian_odd_with_triangle' if special else 'Eulerian_even'
            start=vs[0]
        tour=euler_edges(av,augmented,start)
        colors={eid:i%2 for i,eid in enumerate(tour)}
        cover={e for e in le if colors[e[0]]==colors[e[1]]}
        for v in vs:
            r=sum(colors[i]==0 for i in star[v]);b=len(star[v])-r
            expected=2 if special and v==start else len(star[v])%2
            assert abs(r-b)==expected
    # Validate constructed objects without using their construction rationale.
    used=set()
    for t in pk:
        f=faces(t);assert len(set(t))==3 and f<=le and used.isdisjoint(f);used|=f
    assert cover<=le
    assert all(len(cover&faces(t)) in (1,3) for t in actual)
    assert len(cover)<=2*len(pk)
    qsum=sum(q(len(star[v])) for v in vs)
    assert len(cover)==qsum+(1 if special and roots else 0)
    if special:
        assert len(pk)==qsum//2+(1 if roots else 0)
    return {'case':case,'vertices':vs,'edges':es,'cover':sorted(cover),'packing':pk,
            'triangles':actual,'line_edges':sorted(le),'qsum':qsum,
            'star_triangle_count':star_count,'cycle_triangle_count':cycle_count}

counts=Counter();witnesses={};total_graphs=0;total_triangles=0;max_root_n=0

def verify_graph(n,es,category):
    global total_graphs,total_triangles,max_root_n
    results=[construct_component(vs,edges) for vs,edges in components(n,es)]
    counts['graphs_'+category]+=1;total_graphs+=1;max_root_n=max(max_root_n,n)
    for r in results:
        counts['components_'+r['case']]+=1;total_triangles+=len(r['triangles'])
        if r['case'] not in witnesses or len(r['edges'])>len(witnesses[r['case']]['edges']):
            if len(r['edges'])<=40:witnesses[r['case']]=r
    assert sum(len(r['cover']) for r in results)<=2*sum(len(r['packing']) for r in results)

for n in range(7):
    possible=list(combinations(range(n),2))
    for mask in range(1<<len(possible)):
        es=[e for i,e in enumerate(possible) if mask>>i&1]
        verify_graph(n,es,'exhaustive_n_le_6')

rng=random.Random(20261115)
for i in range(300):
    n=7+i%10;p=(.1,.2,.35,.45)[i%4]
    es=[e for e in combinations(range(n),2) if rng.random()<p]
    verify_graph(n,es,'seeded_random')
# Large even-degree odd-edge examples force the extra cycle-triangle branch.
for n in (3,7,11,15):verify_graph(n,list(combinations(range(n),2)),'complete_odd_Eulerian')
# Odd triangle-free Eulerian cycles test the local, non-global coloring branch.
for n in (5,7,9,15,31):
    verify_graph(n,sorted({pair(i,(i+1)%n) for i in range(n)}),'odd_cycles')
assert counts['graphs_exhaustive_n_le_6']==33868
for case in ('odd_degree_dummy','Eulerian_even','Eulerian_odd_with_triangle','Eulerian_odd_triangle_free'):
    assert counts['components_'+case]>0
out={
 'status':'PASS independent finite constructive verification',
 'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),
 'host':platform.platform(),'python':sys.version,'input_sha256':EXPECTED,
 'verifier_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
 'local_clique_cases':local_cases,'local_degrees_tested':'0 through 100',
 'root_graphs_checked':total_graphs,'literal_line_triangles_checked':total_triangles,
 'max_root_order':max_root_n,'counts':dict(counts),'representative_certificates':witnesses,
 'scope':'Finite construction checks support the separately audited all-size proof. Covers and packings are certificates; neither pi nor nu is computed exactly. The exhaustive census concerns all labelled simple root graphs of order at most six, not all line graphs of order at most six.'}
path=ROOT/'evidence/line_graph_parity_fresh/verification.json'
path.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='representative_certificates'},indent=2))
