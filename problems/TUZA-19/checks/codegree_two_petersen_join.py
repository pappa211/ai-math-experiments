#!/usr/bin/env python3
"""Fixed-gadget discriminator: K2 joined to an explicit Petersen rim.
Exact cover states and all packing states by the complete apex/matching split.
Standard library, local Darwin only. No graph census.
"""
from itertools import combinations,product
from pathlib import Path
import hashlib,json,datetime,platform
assert platform.system()=='Darwin'
ROOT=Path(__file__).resolve().parents[1]
def pair(a,b):return tuple(sorted((a,b)))
def face(t):return set(combinations(sorted(t),2))
re=sorted({pair(i,(i+1)%5) for i in range(5)}|{pair(5+i,5+(i+2)%5) for i in range(5)}|{(i,5+i) for i in range(5)})
assert len(re)==15 and not any(face(t)<=set(re) for t in combinations(range(10),3))
a,b=10,11
ges=sorted(set(re)|{(v,a) for v in range(10)}|{(v,b) for v in range(10)}|{(a,b)})
ei={e:i for i,e in enumerate(ges)}
def emask(es):return sum(1<<ei[e] for e in es)
ts=[t for t in combinations(range(12),3) if face(t)<=set(ges)]
tm=[emask(face(t)) for t in ts]
assert len(ges)==36 and len(ts)==40
ri={e:i for i,e in enumerate(re)}
# All ordinary matching subsets, with used rim-edge and vertex masks.
match=[]
for mask in range(1<<15):
    vs=0;okay=True;edges=[]
    for i,(u,v) in enumerate(re):
        if not (mask>>i&1):continue
        if vs&((1<<u)|(1<<v)):okay=False;break
        vs|=(1<<u)|(1<<v);edges.append((u,v))
    if okay:
        tri_a=[tuple(sorted((a,*e))) for e in edges]
        tri_b=[tuple(sorted((b,*e))) for e in edges]
        match.append({'r':mask,'v':vs,'n':len(edges),'pa':tri_a,'pb':tri_b,
                      'ga':emask(set().union(*(face(t) for t in tri_a))) if tri_a else 0,
                      'gb':emask(set().union(*(face(t) for t in tri_b))) if tri_b else 0})
packings={}
def storep(m1,m2,v=None):
    if m1['r']&m2['r']:return
    p=m1['pa']+m2['pb'];g=m1['ga']|m2['gb']
    if v is not None:
        if (m1['v']|m2['v'])>>v&1:return
        t=(v,a,b);p=p+[t];g|=emask(face(t))
    assert g.bit_count()==3*len(p)
    packings.setdefault(g,p)
for m1 in match:
    for m2 in match:
        if m1['r']&m2['r']:continue
        storep(m1,m2)
        for v in range(10):storep(m1,m2,v)
nu=max(len(p) for p in packings.values())
maxp={g:p for g,p in packings.items() if len(p)==nu}
# Check every literal packing certificate against every actual edge.
for g,p in maxp.items():
    assert all(t in ts for t in p)
    assert emask(set().union(*(face(t) for t in p)))==g
allpairs=set(combinations(range(len(ges)),2));avoid={}
full=(1<<len(ges))-1
for g,p in maxp.items():
    free=[i for i in range(len(ges)) if not g>>i&1]
    for ij in combinations(free,2):avoid.setdefault(ij,p)
missing=sorted(allpairs-set(avoid))
blockers=[]
for ij in missing:
    d=sum(1<<i for i in ij)
    best=max((len(p),p) for g,p in packings.items() if not g&d)
    blockers.append({'deleted_edges':[ges[i] for i in ij],'nu_after':best[0],'packing_after':best[1]})
# Exact ordinary cover optimum and complete TF witnesses by split on ab.
# With ab: canonical minimum multicone states suffice for both optimum and TF
# on abv. No minimum multicone cover contains a full rim triangle.
with_ab=[]
for mask in range(1<<10):
    S={v for v in range(10) if mask>>v&1}
    C={(a,b)}|{(v,a) for v in S}|{(v,b) for v in S}|{e for e in re if not set(e)&S}
    assert all(C&face(t) for t in ts)
    with_ab.append(C)
without_ab=[]
for state in product(range(3),repeat=10): # 0 only a, 1 only b, 2 both
    C=set()
    for v,c in enumerate(state):
        if c in (0,2):C.add((v,a))
        if c in (1,2):C.add((v,b))
    C|={e for e in re if state[e[0]]==state[e[1]] and state[e[0]]!=2}
    assert all(C&face(t) for t in ts)
    without_ab.append(C)
tau=min(map(len,with_ab+without_ab))
minimum=[C for C in with_ab+without_ab if len(C)==tau]
tf={}
for C in minimum:
    for t in ts:
        if face(t)<=C:tf.setdefault(str(t),sorted(C))
missing_tf=[t for t in ts if str(t) not in tf]
# Exact odd cover by apex-relative vertex coloring: ab triangle constraints
# force all edge parities, so enumerate 2^11 vertex cuts fixing apex a.
odd=[]
for mask in range(1<<11):
    color={a:0};other=[v for v in range(12) if v!=a]
    color.update({v:(mask>>i)&1 for i,v in enumerate(other)})
    C={e for e in ges if color[e[0]]==color[e[1]]}
    assert all(len(C&face(t)) in (1,3) for t in ts)
    odd.append(C)
pi=min(map(len,odd))
codeg={str(e):sum(e in face(t) for t in ts) for e in ges}
res={'status':'FIXED GADGET EXACT DISCRIMINATOR','utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),
 'host':platform.platform(),'verifier_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
 'rim':'Petersen: outer C5, inner step2 C5, five spokes','rim_edges':re,'edges':ges,'triangles':ts,
 'matching_count':len(match),'packing_edge_masks_enumerated':len(packings),'nu':nu,'maximum_packing_masks':len(maxp),
 'tau':tau,'tau_with_apex_edge':min(map(len,with_ab)),'tau_without_apex_edge':min(map(len,without_ab)),
 'minimum_cover_states_checked':len(minimum),'minimum_canonical_covers':[sorted(C) for C in minimum],
 'edge_cover_critical':set().union(*minimum)==set(ges),'pi':pi,'codegrees':codeg,
 'TF':not missing_tf,'TF_witnesses':tf,'TF_missing_triangles':missing_tf,
 'two_edge_resilient':not missing,'deletion_pairs':len(allpairs),'avoided_pairs':len(avoid),'blockers':blockers,
 'packing_certificates_by_deleted_pair':{str([ges[i] for i in ij]):p for ij,p in avoid.items()},
 'minimum_cover':sorted(minimum[0]),'minimum_odd_cover':sorted(min(odd,key=len)),
 'scope':'Exhaustive structured states of this one literal graph. Ordinary all-size classification arguments justify completeness; not a broad graph census or formal verification.'}
p=ROOT/'evidence/codegree_two/petersen_join.json';p.write_text(json.dumps(res,indent=2)+'\n')
print(json.dumps({k:res[k] for k in ('matching_count','packing_edge_masks_enumerated','nu','maximum_packing_masks','tau','tau_with_apex_edge','tau_without_apex_edge','minimum_cover_states_checked','pi','TF','TF_missing_triangles','two_edge_resilient','deletion_pairs','avoided_pairs')},indent=2))
if blockers:print('first blocker',blockers[0])
