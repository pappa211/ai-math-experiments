"""Two explicit rook-graph Kelmans certificates; no optimization or census."""
from pathlib import Path
from itertools import combinations
import hashlib,json
ROOT=Path(__file__).resolve().parent
if ROOT.name=="checks" and (ROOT.parent/"evidence").is_dir():
    ROOT=ROOT.parent/"evidence"
V=set(range(16))
def v(i,j):return 4*i+j
def e(x,y):return tuple(sorted((x,y)))
def tri(t):return frozenset(e(*x) for x in combinations(t,2))
def actual(E):return tuple(t for t in combinations(sorted(V),3) if tri(t)<=E)
def compress(E,a,b):
    N=lambda x:{y if z==x else z for z,y in E if x in (z,y)}
    A,B=N(a),N(b);R=B-A-{a}
    assert len(A)>=len(B) and R
    F=(E-{e(b,x) for x in R})|{e(a,x) for x in R}
    assert len(E)==len(F)==48
    return F,R

def check(E,P,C,expected):
    ts=actual(E);assert set(ts)==set(expected)
    used=set()
    for t in P:
        assert tuple(sorted(t)) in ts
        assert not used&tri(t)
        used|=tri(t)
    assert C<=E and all(C&tri(t) for t in ts)
    return {'vertices':sorted(V),'edges':sorted(E),'triangles':ts,
            'packing':P,'packing_lower_bound':len(P),'cover':sorted(C),
            'cover_upper_bound':len(C),'defect_upper_bound':len(C)-2*len(P)}

def faces(blocks):return set(tuple(sorted(t)) for block in blocks for t in combinations(block,3))

def main():
    blocks=[tuple(v(i,j) for j in range(4)) for i in range(4)]
    blocks += [tuple(v(i,j) for i in range(4)) for j in range(4)]
    E=set().union(*(set(combinations(block,2)) for block in blocks))
    assert len(E)==48 and len(actual(E))==32
    edge_blocks=[set(combinations(b,2)) for b in blocks]
    assert sum(len(x) for x in edge_blocks)==len(E)
    assert all(sum(set(t)<=set(b) for b in blocks)==1 for t in actual(E))
    P=[tuple(b[:3]) for b in blocks]
    C=set().union(*({e(b[0],b[1]),e(b[2],b[3])} for b in blocks))
    original=check(E,P,C,faces(blocks))
    original.update({'nu':8,'tau':16,'defect':0,
      'optimality_reason':'Every actual triangle lies in a unique edge-disjoint K4 block; each block packs at most1 triangle and needs at least2 cover edges.',
      'maximum_common_vertex_packing_upper_bound':3,'threshold_terminal':False,
      'common_vertex_maximum_packing_terminal':False,'literal_K4_triangle_component_terminal':True})
    a=v(0,0)
    F,R=compress(E,a,v(0,1));assert R=={v(i,1) for i in (1,2,3)}
    new_blocks=list(blocks);new_blocks[5]=(a,v(1,1),v(2,1),v(3,1))
    extra=[(a,v(i,0),v(i,1)) for i in (1,2,3)]
    P=[(v(0,0),v(0,1),v(0,2))]
    P += [(v(i,0),v(i,2),v(i,3)) for i in (1,2,3)]
    P += [(v(1,j),v(2,j),v(3,j)) for j in (0,1)]
    P += [(v(0,j),v(1,j),v(2,j)) for j in (2,3)]
    P += extra
    C=set().union(*({e(b[0],b[1]),e(b[2],b[3])} for b in new_blocks))
    adj=check(F,P,C,faces(new_blocks)|set(tuple(sorted(t)) for t in extra))
    assert (len(adj['triangles']),len(P),len(C))==(35,11,16)
    adj.update({'receiver':a,'donor':v(0,1),'moved_neighbours':sorted(R),
                'symmetry_orbit':'ordered adjacent pair','orbit_size':96,
                'transported_blocks':new_blocks,'extra_triangles':extra})
    F,R=compress(E,a,v(1,1));assert R=={v(1,2),v(1,3),v(2,1),v(3,1)}
    new_blocks=list(blocks);new_blocks[1]=(a,v(1,0),v(1,2),v(1,3));new_blocks[5]=(a,v(0,1),v(2,1),v(3,1))
    extra=[(a,v(2,0),v(2,1)),(a,v(3,0),v(3,1)),(a,v(0,2),v(1,2)),(a,v(0,3),v(1,3))]
    P=[(v(0,1),v(0,2),v(0,3)),(v(1,0),v(1,2),v(1,3)),
       (v(2,0),v(2,2),v(2,3)),(v(3,0),v(3,2),v(3,3)),
       (v(1,0),v(2,0),v(3,0)),(v(0,1),v(2,1),v(3,1)),
       (v(0,2),v(2,2),v(3,2)),(v(0,3),v(2,3),v(3,3))]+extra
    C=set().union(*({e(b[0],b[1]),e(b[2],b[3])} for b in new_blocks))
    nonadj=check(F,P,C,faces(new_blocks)|set(tuple(sorted(t)) for t in extra))
    assert (len(nonadj['triangles']),len(P),len(C))==(36,12,14)
    nonadj.update({'receiver':a,'donor':v(1,1),'moved_neighbours':sorted(R),
       'symmetry_orbit':'ordered nonadjacent pair','orbit_size':144,
       'transported_blocks':new_blocks,'extra_triangles':extra})
    result={'status':'PASS','scope':'one fixed 4x4 rook graph and exactly two representative compressions; no optimization or census',
      'labels':'vertex (i,j) has integer label 4*i+j, with 0<=i,j<=3',
      'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
      'original':original,'adjacent':adj,'nonadjacent':nonadj,
      'symmetry_argument':'Independent row and column permutations and transposition are graph automorphisms; they act transitively on each ordered-pair orbit. Every vertex has degree6, so all240 oriented distinct pairs are permitted. Adjacent pairs move3 neighbours, nonadjacent pairs move4.',
      'claims':{'threshold_plus_whole_graph_common_vertex_terminal_availability':False,
                'availability_also_exempting_all_literal_K4_components':'UNRESOLVED',
                'ordinary_Tuza_counterexample':False}}
    output=ROOT/'late_compression_rook_verified.json';output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({'status':'PASS','adjacent_nu_lower_tau_upper':(11,16),'nonadjacent_nu_lower_tau_upper':(12,14),'output':str(output)}))
if __name__=='__main__':main()
