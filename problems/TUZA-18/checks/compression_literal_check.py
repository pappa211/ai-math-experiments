"""Independent fixed-certificate audit of the compression gate.
No producer checker, optimizer, or graph corpus is imported.
"""
from datetime import datetime,timezone
from hashlib import sha256
from itertools import combinations
from pathlib import Path
import json

STOP=datetime(2026,11,14,21,0,10,tzinfo=timezone.utc)
started=datetime.now(timezone.utc);assert started<STOP
root=Path('SCRATCH_OUTPUT')
def load(n):return json.loads((root/('tuza18_compression_input_'+n)).read_text())
small=load('late_compression_verified.json')['records']
rook=load('late_compression_rook_verified.json')
cone=load('late_compression_cone_verified.json')
def e(a,b):return tuple(sorted((a,b)))
def te(t):return frozenset(combinations(sorted(t),2))
def triangles(V,E):return tuple(t for t in combinations(sorted(V),3) if te(t)<=E)
def degree(V,E):return {v:sum(v in f for f in E) for v in V}
def move(V,E,a,b):
    deg=degree(V,E);assert a!=b and deg[a]>=deg[b]
    Na={x for x in V if e(a,x) in E};Nb={x for x in V if e(b,x) in E}
    R=Nb-Na-{a}
    assert R
    out=(E-{e(b,x) for x in R})|{e(a,x) for x in R}
    assert len(out)==len(E)
    newdeg=degree(V,out)
    dq=sum(x*x for x in newdeg.values())-sum(x*x for x in deg.values())
    assert dq==2*len(R)*(deg[a]-deg[b])+2*len(R)**2>0
    return out,R
def allowed(V,E):
    deg=degree(V,E)
    return [(a,b) for a in sorted(V) for b in sorted(V) if a!=b and deg[a]>=deg[b] and
            any(e(b,x) in E and x!=a and e(a,x) not in E for x in V)]
def certificate(V,E,d):
    T=triangles(V,E);P=tuple(tuple(sorted(t)) for t in d['packing']);C=frozenset(map(tuple,d['cover']))
    assert set(V)==set(d['vertices']) and E==frozenset(map(tuple,d['edges']))
    assert set(T)==set(map(tuple,d['triangles']))
    assert all(t in T for t in P)
    assert len(frozenset().union(*(te(t) for t in P)))==3*len(P)
    assert C<=E and all(te(t)&C for t in T)
    if 'packing_lower_bound' in d:assert d['packing_lower_bound']==len(P)
    if 'cover_upper_bound' in d:assert d['cover_upper_bound']==len(C)
    if 'defect_upper_bound' in d:assert d['defect_upper_bound']==len(C)-2*len(P)
    return {'vertices':len(V),'edges':len(E),'triangles':len(T),'packing':len(P),'cover':len(C),'defect_upper':len(C)-2*len(P)}
def tiny_optima(V,E):
    T=triangles(V,E);nu=0
    for k in range(len(T)+1):
        if any(len(frozenset().union(*(te(t) for t in Q)))==3*k for Q in combinations(T,k)):nu=k
        else:break
    for k in range(len(E)+1):
        if any(all(te(t)&set(C) for t in T) for C in combinations(E,k)):return nu,k
    raise AssertionError

V6=set(range(6));E6=frozenset(combinations(range(4),2))|frozenset(combinations((0,1,4,5),2))
assert tiny_optima(V6,E6)==(2,3)
initial=certificate(V6,E6,small['edge_glued_K4s']['original'])
moves6=allowed(V6,E6);assert len(moves6)==8
small_rows={(q['receiver'],q['donor']):q for q in small['edge_glued_K4s']['compressions']}
for a,b in moves6:
    E,R=move(V6,E6,a,b);certificate(V6,E,small_rows[(a,b)])
    assert tiny_optima(V6,E)==(3,3)

# The three cyclic-distance representatives cover all ordered C7-square moves
# under rotation/reflection; only these fixed representatives are replayed.
V7=set(range(7));E7=frozenset(e(i,(i+d)%7) for i in V7 for d in (1,2))
assert tiny_optima(V7,E7)==(3,4) and len(allowed(V7,E7))==42
c7rows={(q['receiver'],q['donor']):q for q in small['C7square']['compressions']}
c7=[]
for b in (1,2,3):
    E,R=move(V7,E7,0,b);r=certificate(V7,E,c7rows[(0,b)])
    opt=tiny_optima(V7,E);assert opt==((3,4) if b==2 else (4,4))
    c7.append({'receiver':0,'donor':b,'nu':opt[0],'tau':opt[1]})
E,_=move(V7,E7,0,2)
P=((0,1,2),(0,3,5),(0,4,6))
assert len(frozenset().union(*(te(t) for t in P)))==9 and all(te(t)<=E for t in P)

V=set(range(16));H=frozenset((a,b) for a,b in combinations(V,2) if a//4==b//4 or a%4==b%4)
blocks=[tuple(4*i+j for j in range(4)) for i in range(4)]+[tuple(4*i+j for i in range(4)) for j in range(4)]
blockE=[te(K) for K in blocks]
assert len(H)==48 and frozenset().union(*blockE)==H and sum(map(len,blockE))==48
assert all(sum(set(t)<=set(K) for K in blocks)==1 for t in triangles(V,H))
rr=certificate(V,H,rook['original']);assert (rr['packing'],rr['cover'])==(8,16)
am=allowed(V,H);assert len(am)==240
assert sum(e(a,b) in H for a,b in am)==96
rookrows={}
for label,b in [('adjacent',1),('nonadjacent',5)]:
    E,R=move(V,H,0,b);d=rook[label];r=certificate(V,E,d)
    assert sorted(R)==d['moved_neighbours']
    union=set(tuple(sorted(t)) for K in d['transported_blocks'] for t in combinations(K,3))|set(map(tuple,d['extra_triangles']))
    assert union==set(triangles(V,E))
    assert r['triangles']==(35 if b==1 else 36)
    assert r['defect_upper']<0
    rookrows[label]=r

# Independently check all sixteen U subsets in K4 and every possible rim cover.
K=frozenset(combinations(range(4),2));KT=triangles(set(range(4)),K)
f={}
for mask in range(16):
    U={i for i in range(4) if mask>>i&1};forced=frozenset(combinations(sorted(U),2))
    for k in range(7):
        valid=[set(C) for C in combinations(K,k) if forced<=set(C) and all(te(t)&set(C) for t in KT)]
        if valid:break
    f.setdefault(len(U),set()).add(k)
assert f=={0:{2},1:{2},2:{2},3:{3},4:{6}}
assert all(2*next(iter(vals))-t>=2 for t,vals in f.items())
assert all(sum(v in K for K in blocks)==2 for v in V)

z=16;JV=V|{z};J=H|frozenset((v,z) for v in V)
cr=certificate(JV,J,cone['original']);assert (cr['triangles'],cr['packing'],cr['cover'])==(80,16,24)
assert len([t for t in cone['original']['packing'] if z in t])==8
assert len([t for t in cone['original']['packing'] if z not in t])==8
# Unique old-block ownership and 16 spokes give upper bound8+8=16;
# f(t)-t/2>=1 and two blocks per vertex give tau>=16+8=24.
T=triangles(JV,J);seen={T[0]};todo=[T[0]]
while todo:
    t=todo.pop()
    for q in T:
        if q not in seen and te(q)&te(t):seen.add(q);todo.append(q)
assert seen==set(T)
jm=allowed(JV,J);assert len(jm)==240 and all(a!=z and b!=z for a,b in jm)
assert set(jm)==set(am)
assert set(degree(JV,J).values())=={7,16}
conerows={}
for label,b in [('adjacent',1),('nonadjacent',5)]:
    E,R=move(JV,J,0,b);d=cone['compressions'][label];r=certificate(JV,E,d)
    assert r['triangles']==(83 if b==1 else 84)
    assert r['defect_upper']< -8
    rimP=tuple(map(tuple,d['compressed_rim_packing']));M=frozenset(map(tuple,d['residual_rim_matching']))
    assert len(M)==6 and len({v for f in M for v in f})==12
    assert M<=E and not M&frozenset().union(*(te(t) for t in rimP))
    assert {tuple(sorted(t)) for t in d['packing']}==set(rimP)|{tuple(sorted((*f,z))) for f in M}
    mono={f for f in E if z not in f and ((f[0]//4+f[0]%4)%2)==((f[1]//4+f[1]%4)%2)}
    C=frozenset(map(tuple,d['cover']));assert C-{f for f in C if z in f}==mono
    assert len(mono)==(17 if b==1 else 16) and sum(z in f for f in C)==8
    conerows[label]=r
finished=datetime.now(timezone.utc);assert finished<STOP
out={'status':'PASS','started_utc':started.isoformat(),'finished_utc':finished.isoformat(),
     'script_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),
     'input_sha256':{p.name:sha256(p.read_bytes()).hexdigest() for p in sorted(root.glob('tuza18_compression_input_*'))},
     'two_K4_original':initial,'two_K4_moves_checked':8,'C7_representatives':c7,
     'rook_original':rr,'rook_allowed_moves':240,'rook_orbit_counts':[96,144],'rook_compressions':rookrows,
     'K4_forced_cover_costs':[next(iter(f[t])) for t in range(5)],
     'cone_original':cr,'cone_nu_exact':16,'cone_tau_exact':24,'cone_triangle_components':1,
     'cone_allowed_moves':240,'cone_compressions':conerows,
     'limitations':['Compressed rook and cone values are feasible bounds, not asserted exact optima.',
                    'Only supplied fixed graphs/orbit certificates are checked; no graph census.',
                    'Original cone exactness combines the finite local-cost audit with the ordinary block-incidence proof.',
                    'Published threshold theorem is a separately verified statement-level dependency, not reproved here.']}
(root/'tuza18_compression_literal_check.json').write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
print(json.dumps({k:v for k,v in out.items() if k in ['status','finished_utc','script_sha256','rook_compressions','cone_original','cone_compressions','K4_forced_cover_costs']},sort_keys=True))
