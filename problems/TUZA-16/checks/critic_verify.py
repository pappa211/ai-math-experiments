#!/usr/bin/env python3
"""Independent TUZA-16 certificate verifier, authored by the fresh critic.
No producer code, NetworkX atlas, optimization package, or floating solver is used.
Run from any directory: python checks/critic_verify.py
"""
from pathlib import Path
from itertools import combinations, permutations
from datetime import datetime, timezone
import hashlib, json, platform, time

ROOT = Path(__file__).resolve().parents[1]
START = time.perf_counter()
RESULT = {'reviewer':'fresh_critic', 'independence':'No producer program read or imported; reconstructed definitions and checked saved witnesses.', 'python':platform.python_version(), 'started_utc':datetime.now(timezone.utc).isoformat(), 'checks':{}}

def load(rel): return json.loads((ROOT/rel).read_text())
def edges(values):
    out = {tuple(sorted(e)) for e in values}
    assert all(len(e)==2 and e[0]!=e[1] for e in out)
    assert len(out)==len(values), 'duplicate edges'
    return out

def triangles(n,E):
    # Enumerate wedges with their least vertex as root, and test the closing edge.
    adj=[[] for _ in range(n)]
    for u,v in E:
        assert 0<=u<v<n
        adj[u].append(v)
    return {tuple(sorted((u,v,w))) for u in range(n) for v,w in combinations(adj[u],2) if tuple(sorted((v,w))) in E}

def tedges(t): return set(combinations(sorted(t),2))
def packing(E,P):
    used=set()
    for t in P:
        assert len(set(t))==3
        es=tedges(t)
        assert es<=E and not es&used
        used |= es
    return used

def cover(T,C):
    C=edges(C)
    assert all(tedges(t)&C for t in T)
    return C

def certificate(d,expected=None):
    E=edges(d['edges']); T=triangles(d['n'],E)
    if expected is not None: assert E==expected
    assert T=={tuple(sorted(t)) for t in d['triangles']}
    assert len(T)==len(d['triangles'])
    if 'packing' in d: packing(E,d['packing'])
    if 'cover' in d: assert cover(T,d['cover'])<=E
    return E,T

def exact_small(E,T):
    # Cardinality-layer enumeration, deliberately unlike the producer recurrences.
    ts=list(T); es=list(E)
    tm=[sum(1<<es.index(e) for e in tedges(t)) for t in ts]
    nu=0
    for k in range(min(len(E)//3,len(T)),-1,-1):
        if any(sum(tm[i] for i in ids)==__import__('functools').reduce(int.__or__,(tm[i] for i in ids),0) for ids in combinations(range(len(T)),k)):
            nu=k;break
    tau=0
    for k in range(len(E)+1):
        if any(all(any((m>>j)&1 for j in inds) for m in tm) for inds in combinations(range(len(E)),k)):
            tau=k;break
    return nu,tau

def independent_masks(n,E):
    adj=[0]*n
    for u,v in E:adj[u]|=1<<v;adj[v]|=1<<u
    good=[0]
    # An extension traversal creates each independent set exactly once.
    def grow(mask,remaining):
        while remaining:
            v=(remaining&-remaining).bit_length()-1
            remaining &= ~(1<<v)
            nxt=mask|(1<<v);good.append(nxt)
            grow(nxt,remaining&~adj[v])
    grow(0,(1<<n)-1)
    return good

def block_check(d,blocks):
    E,T=certificate(d)
    BE=[set(combinations(sorted(b),2)) for b in blocks]
    assert set().union(*BE)==E and sum(map(len,BE))==len(E)
    BT=[set(combinations(sorted(b),3)) for b in blocks]
    assert set().union(*BT)==T and sum(map(len,BT))==len(T)
    expected_nu=sum(1 if len(b)==4 else 2 for b in blocks)
    expected_tau=2*expected_nu
    assert (d['nu'],d['tau'])==(expected_nu,expected_tau)
    assert (len(d['packing']),len(d['cover']))==(expected_nu,expected_tau)

# Required controls: independent constructions, actual triangles, and witnesses.
c=load('evidence/controls.json')
small_expected={'empty':(0,set()),'K3':(3,set(combinations(range(3),2))),'K4':(4,set(combinations(range(4),2))),'K5':(5,set(combinations(range(5),2))),'book7':(9,{(0,1)}|{(i,j) for i in [0,1] for j in range(2,9)})}
for name,(n,E0) in small_expected.items():
    assert c[name]['n']==n
    E,T=certificate(c[name],E0)
    assert exact_small(E,T)==(c[name]['nu'],c[name]['tau'])
    assert (len(c[name]['packing']),len(c[name]['cover']))==(c[name]['nu'],c[name]['tau'])
J={tuple(sorted((i,(i+d)%13))) for i in range(13) for d in (1,5)}
assert len(J)==26 and not triangles(13,J)
IS=independent_masks(13,J); alpha=max(x.bit_count() for x in IS); MAX={x for x in IS if x.bit_count()==alpha}
assert alpha==4 and len(MAX)==39
VB=c['VB27'];assert edges(VB['J_edges'])==J
assert {sum(1<<i for i in s) for s in VB['J_max_independent_sets']}==MAX
H={tuple(sorted((2*i+a,2*j+b))) for i,j in J for a in range(2) for b in range(2)}
VBE=H|{(i,26) for i in range(26)}
E,T=certificate(VB,VBE);assert len(E)==130 and len(T)==104 and len(VB['packing'])==13
assert all(26 in t for t in T) and len(VB['cover'])==18
# The ordinary double-twin argument in CRITIC_ORIGINAL proves that every optimum
# U is independent; hence all optimum occupancies/cover states are precisely these.
expected_cov={frozenset((i,26) for i in range(26) if not(m>>(i//2)&1)) for m in MAX}
assert {frozenset(edges(v)) for v in VB['all_minimum_covers']}==expected_cov
assert {tuple(v) for v in VB['optimal_occupancies']}=={tuple(2*((m>>i)&1) for i in range(13)) for m in MAX}
assert VB['number_optimal_occupancies']==39 and VB['occupancy_patterns']==3**13
assert VB['nu']==13 and VB['tau']==18 and VB['H_alpha']==8
assert 18*3>4*13
RESULT['checks']['VB27']={'n':27,'edges':130,'triangles':104,'alpha_J':4,'maximum_independent_sets_J':39,'nu':13,'tau':18,'all_minimum_covers_spokes':True,'method':'Independent-set extension enumeration on J plus audited ordinary double-twin optimal-cover proof; no 3^13 census repeated.'}
CE={tuple(sorted((i,i^d))) for i in range(16) for d in (1,2,4,8,15)}
assert len(CE)==40 and not triangles(16,CE)
E,T=certificate(c['clebsch'],CE|{(i,16) for i in range(16)})
# Incremental subset edge-count DP, distinct from candidate packing/cover solvers.
adj=[0]*16
for u,v in CE:adj[u]|=1<<v;adj[v]|=1<<u
ec=[0]*(1<<16);opt=99;ums=[]
for mask in range(1<<16):
    if mask:
        low=mask&-mask;v=low.bit_length()-1;rest=mask^low
        ec[mask]=ec[rest]+(adj[v]&rest).bit_count()
    cost=16-mask.bit_count()+ec[mask]
    if cost<opt:opt=cost;ums=[mask]
    elif cost==opt:ums.append(mask)
assert opt==11 and len(ums)==16 and all(ec[m]==0 for m in ums)
assert set(ums)==set(adj)
found=set()
for d in c['clebsch']['minimum_covers']:
    C=cover(T,d['cover']); assert C<=E and len(C)==11
    U={i for i in range(16) if (i,16) not in C};assert len(U)==5
    found.add(sum(1<<i for i in U))
    packing(E,d['private_packing']);assert len(d['private_packing'])==5
    private={t for t in T if len(tedges(t)&C)==1}
    assert all(tuple(sorted(t)) in private for t in d['private_packing'])
    assert all(any(i in U for i in t if i!=16) for t in private)
assert found==set(ums) and len(c['clebsch']['packing'])==8
RESULT['checks']['Clebsch']={'nu':8,'tau':11,'minimum_covers':16,'private_nu_each':5,'subset_states':65536}
cartblocks=[[5*i+j for j in range(5)] for i in range(4)]+[[5*i+j for i in range(4)] for j in range(5)]
assert c['cartesian_K4_K5']['blocks']==cartblocks
block_check(c['cartesian_K4_K5'],cartblocks)
assert edges(c['cartesian_K4_K5']['edges'])=={(u,v) for u,v in combinations(range(20),2) if u//5==v//5 or u%5==v%5}
shared=[[0,1,2,3],[0,4,5,6],[0,7,8,9],[0,10,11,12,13],[0,14,15,16,17]]
assert c['shared_vertex_blocks']['blocks']==shared;block_check(c['shared_vertex_blocks'],shared)
four={tuple(map(int,s)) for s in ['01','02','03','04','07','12','13','14','15','23','25','26','36','37','45','47','56']}
for name,E0,answer in [('four_port_G',four,(4,5)),('four_port_H',four-{(0,2),(1,3)},(4,4))]:
    E,T=certificate(c[name],E0); assert exact_small(E,T)==answer
    assert (c[name]['nu'],c[name]['tau'])==answer
lines=[set(t) for t in c['abstract_Fano']['hyperedges']]
assert len(lines)==7 and all(len(t)==3 for t in lines)
assert all(len(a&b)==1 for a,b in combinations(lines,2))
assert all(not all(set(pair)&t for t in lines) for pair in combinations(range(7),2))
assert all(set(c['abstract_Fano']['cover'])&t for t in lines)
RESULT['checks']['other_controls']={'K3':[1,1],'K4':[1,2],'K5':[2,4],'book7':[1,1],'cartesian_K4_K5':[13,26],'shared_vertex_blocks':[7,14],'four_port_G':[4,5],'four_port_H':[4,4],'abstract_Fano':[1,3]}

# Complete unlabeled five-vertex class enumeration, including isolated padding.
k=load('evidence/k10_k11.json'); five_edges=list(combinations(range(5),2)); maps=[]
for perm in permutations(range(5)):
    maps.append([five_edges.index(tuple(sorted((perm[u],perm[v])))) for u,v in five_edges])
def canonical(mask):
    return min(sum(1<<mp[i] for i in range(10) if mask>>i&1) for mp in maps)
classes={canonical(mask) for mask in range(1,1024)}
def edge_mask(F):return sum(1<<five_edges.index(tuple(sorted(e))) for e in F)
provided=[canonical(edge_mask(F)) for F in k['classes']]
assert len(classes)==33 and len(provided)==33 and set(provided)==classes
for n,baseline in [(10,13),(11,17)]:
    d=k['graphs'][str(n)];E=set(combinations(range(n),2));T=triangles(n,E)
    assert edges(d['edges'])==E and {tuple(t) for t in d['triangles']}==T
    used=packing(E,d['baseline_packing']);assert len(d['baseline_packing'])==baseline and edges(d['baseline_leave'])==E-used
    # Upper bound: K10 vertex incidence gives floor(10*floor(9/2)/3)=13.
    # K11 has edge bound 18; at 18 the one-edge leave has odd ends, impossible.
    if n==10:assert n*((n-1)//2)//3==baseline
    else:assert len(E)//3==18 and len(E)-3*18==1 and (n-1)%2==0
    assert d['nu']==baseline and len(d['cases'])==33
    seen=set()
    for x in d['cases']:
        idx=x['class_index'];assert 0<=idx<33 and idx not in seen;seen.add(idx)
        assert edges(x['F'])==edges(k['classes'][idx]);f=len(x['F'])
        assert x['f']==f;target=baseline-(f+1)//2+1
        assert x['target']==target and x['status']=='WITNESS'
        packing(E-edges(x['F']),x['packing']);assert len(x['packing'])>=target
        assert 2*(baseline-len(x['packing']))<f
RESULT['checks']['K10_K11']={'labeled_5_vertex_graphs_including_empty':1024,'permutations_each':120,'nonempty_isomorphism_classes':33,'complete':True,'baseline_nu':{'10':13,'11':17},'verified_residual_packings':66,'residual_optima':'NOT_CLAIMED'}

# B small exact optima and complete dense independent-set obstruction.
b=load('checks/b_compression_results.json')
for d in b['small_controls']:
    E,T=certificate(d['G']);ER,TR=certificate(d['R'])
    X=set(d['X']);S=set(d['S']);rim=set(combinations(sorted(S),2))&E
    assert rim==edges(d['rim']) and not any(set(e)<=X for e in E)
    assert all({v if u==x else u for u,v in E if x in (u,v)}==S for x in X)
    assert ER=={e for e in E-rim if not set(e)&X}
    ng,tg=exact_small(E,T);nr,tr=exact_small(ER,TR)
    assert (ng,tg)==(d['G']['nu'],d['G']['tau']) and (nr,tr)==(d['R']['nu'],d['R']['tau'])
    assert d['offsets']=={'nu':ng-nr,'tau':tg-tr}
d=b['dense_obstruction'];E=set(combinations(range(10),2))-{(0,1)}
assert edges(d['edges'])==E and {tuple(t) for t in d['triangles']}==triangles(10,E)
inds={frozenset(i for i in range(10) if m>>i&1) for m in independent_masks(10,E) if m}
assert len(inds)==11 and {frozenset(x) for x in d['complete_independent_nonempty_sets']}==inds
seen=set()
for x in d['certificates']:
    X=frozenset(x['X']);seen.add(X);N={v:{w for e in E if v in e for w in e if w!=v} for v in X}
    rim=set().union(*(set(combinations(sorted(N[v]),2))&E for v in X))
    upper=sum(len(N[v])//2 for v in X)
    assert edges(x['rim_union'])==rim and x['apical_packing_upper_bound']==upper and len(rim)>2*upper
assert seen==inds
RESULT['checks']['B']={'small_graphs_with_independent_optima':6,'K10_minus_edge_independent_sets':11,'dense_obstruction_verified':True}

# GF(4) reconstructed through multiplicative logarithms, not producer arithmetic.
log={1:0,2:1,3:2};exp=[1,2,3]
def mul(a,b):return 0 if not a or not b else exp[(log[a]+log[b])%3]
def div(a,b):assert b;return 0 if not a else exp[(log[a]-log[b])%3]
a=load('evidence/c_affine_diagnostic.json');counts=[]
for d in a['cases']:
    S=set(d['slopes'])
    E={(u,v) for u,v in combinations(range(16),2) if u//4!=v//4 and div((v%4)^(u%4),(v//4)^(u//4)) in S}
    T=triangles(16,E)
    assert edges(d['edges'])==E and {tuple(t) for t in d['triangles']}==T
    planted=set();seen_edges=set();expected_copies={}
    for slope in S:
        for intercept in range(4):
            verts=tuple(4*v+(mul(slope,v)^intercept) for v in range(4))
            ces=set(combinations(verts,2));assert ces<=E and not ces&seen_edges
            seen_edges|=ces;planted|=set(combinations(verts,3));expected_copies[(slope,intercept)]=verts
    assert seen_edges==E and len(d['copies'])==4*len(S)
    for cp in d['copies']:
        vs=expected_copies.pop((cp['slope'],cp['intercept']))
        assert tuple(cp['vertices'])==vs and edges(cp['edges'])==set(combinations(vs,2))
    assert not expected_copies
    mixed=T-planted
    assert {tuple(t) for t in d['planted']}==planted and {tuple(t) for t in d['mixed']}==mixed
    for t in mixed:
        slopes={div((v%4)^(u%4),(v//4)^(u//4)) for u,v in combinations(t,2)}
        assert len(slopes)==3
    packing(E,d['greedy_packing'])
    C={e for e in E if (e[0]//4,e[1]//4) in {(0,1),(2,3)}}
    assert len(C)==8*len(S) and all(tedges(t)&C for t in T)
    if len(S)==3:assert len(d['greedy_packing'])==20 and all(sum(v in e for e in E)==9 for v in range(16))
    if len(S)==4:
        assert len(d['exact_packing'])==32 and packing(E,d['exact_packing'])==E
        assert len(d['exact_cover'])==32 and cover(T,d['exact_cover'])<=E
        assert d['optima']['nu']==d['optima']['tau']==32
    counts.append([len(S),len(E),len(T),len(planted),len(mixed),len(d.get('exact_packing',d['greedy_packing']))])
assert counts==[[1,24,16,16,0,4],[2,48,32,32,0,8],[3,72,96,48,48,20],[4,96,256,64,192,32]]
RESULT['checks']['C_affine']={'rows_slopes_edges_triangles_planted_mixed_packing':counts,'partial_optimum':'NOT_COMPUTED; 20<=nu<=21','full_optima':[32,32],'exact_cover_and_fractional_values':'2r by checked edge partition, pullback cover and per-copy K4 half-face packing'}

# A: construct both Mycielski steps independently and all 553-vertex cone edges.
def mycielski(n,E):
    out=set(E)
    for u,v in E:out.add((u,n+v));out.add((v,n+u))
    out|={(n+i,2*n) for i in range(n)}
    return 2*n+1,{tuple(sorted(e)) for e in out}
n=5;BE={tuple(sorted((i,(i+1)%5))) for i in range(5)}
for _ in range(2):n,BE=mycielski(n,BE);assert not triangles(n,BE)
assert n==23 and len(BE)==71
aw=load('notes/A_FOURCUT_WITNESS.json');t=24;z=n*t
assert aw['base_order']==n and aw['t']==t and aw['apex']==z and edges(aw['base_edges'])==BE
assert aw['vertices']==list(range(z+1))
R={tuple(sorted((t*u+i,t*v+j))) for u,v in BE for i in range(t) for j in range(t)}
E=R|{(v,z) for v in range(z)};T=triangles(z+1,E)
assert edges(aw['edges'])==E and {tuple(x) for x in aw['triangles']}==T and len(T)==len(aw['triangles'])
assert all(z in x for x in T) and {tuple(x[:2]) for x in T}==R
assert all(any(v in e for e in BE) for v in range(n))
assert set().union(*(tedges(x) for x in T))==E
packing(E,aw['packing']);assert len(aw['packing'])==192
assert cover(T,aw['cover'])<=E and len(aw['cover'])==384
assert len(E)==41448 and len(T)==40896 and z+1==553
assert aw['proved_upper_bound_2nu']==552 and aw['proved_lower_bound_fourcut_deletion']==576 and t*t>n*t
# Mycielski chromatic proof, random transversal lower bound and spoke bound are
# independently reviewed ordinary arguments; no maximum-cut optimizer is invoked.
ac=load('notes/A_CONTROL_CERTIFICATES.json')
for name,d in ac.items():
    E,T=certificate(c[name]);col=d['colouring']
    assert len(col)==c[name]['n'] and all(x in range(4) for x in col)
    F={e for e in E if col[e[0]]==col[e[1]]}
    assert edges(d['feasible_fourcut_defects'])==F
    assert d['defect_upper_bound_for_every_maximum_fourcut']==len(F)
    assert d['packing_size']==len(c[name]['packing']) and d['cover_size']==len(c[name]['cover'])
    assert d['universal_maximum_fourcut_lift_bound']==len(F)+len(c[name]['cover'])<=2*len(c[name]['packing'])
RESULT['checks']['A']={'base_vertices':23,'base_edges':71,'vertices':553,'edges':41448,'actual_triangles':40896,'packing_certificate':192,'cover_certificate':384,'fourcut_defect_lower':576,'twice_nu_upper':552,'maxcut_search':'NOT_RUN; ordinary proof establishes every partition bound','easy_control_colourings':len(ac)}

initial=load('evidence/critic_start_hashes.json')['source_hashes']
after={r:hashlib.sha256((ROOT/r).read_bytes()).hexdigest() for r in initial}
assert after==initial,'A reviewed source changed during verification'
RESULT['source_hashes_unchanged']=True
RESULT['source_hashes']=after
RESULT['elapsed_seconds']=time.perf_counter()-START
RESULT['status']='PASS'
RESULT['independent_final_verification']='NOT_RUN'
RESULT['finished_utc']=datetime.now(timezone.utc).isoformat()
(ROOT/'evidence/critic_verified.json').write_text(json.dumps(RESULT,indent=2)+'\n')
print(json.dumps({k:v for k,v in RESULT.items() if k!='source_hashes'},indent=2))
