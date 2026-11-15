"""One fixed cone over the 4x4 rook graph; explicit certificates only."""
from pathlib import Path
from itertools import combinations
import hashlib,json
ROOT=Path(__file__).resolve().parent
if ROOT.name=="checks" and (ROOT.parent/"evidence").is_dir():
    ROOT=ROOT.parent/"evidence"
Z=16
V=set(range(17))
def e(a,b):return tuple(sorted((a,b)))
def tri(t):return frozenset(e(*x) for x in combinations(t,2))
def actual(E):return tuple(t for t in combinations(sorted(V),3) if tri(t)<=E)
def color(a):return (a//4+a%4)%2

def check(rim,P,C):
    E=rim|{e(Z,v) for v in range(16)};ts=actual(E)
    assert len(E)==64
    expected={tuple(sorted((Z,*x))) for x in rim}
    expected|={t for t in combinations(range(16),3) if tri(t)<=rim}
    assert set(ts)==expected
    used=set()
    for t in P:
        assert tuple(sorted(t)) in ts and not used&tri(t)
        used|=tri(t)
    assert C<=E and all(C&tri(t) for t in ts)
    return {'vertices':sorted(V),'edges':sorted(E),'triangles':ts,'packing':P,
            'packing_lower_bound':len(P),'cover':sorted(C),'cover_upper_bound':len(C),
            'defect_upper_bound':len(C)-2*len(P)}

def bipartition_cover(rim):
    return {xy for xy in rim if color(xy[0])==color(xy[1])}|{e(Z,v) for v in range(16) if color(v)==0}

def main():
    source=ROOT/'late_compression_rook_verified.json';r=json.loads(source.read_text())
    blocks=[tuple(4*i+j for j in range(4)) for i in range(4)]
    blocks += [tuple(4*i+j for i in range(4)) for j in range(4)]
    rim=set(map(tuple,r['original']['edges']))
    M=[(0,1),(6,7),(8,10),(13,15),(4,12),(5,9),(2,14),(3,11)]
    assert len(set().union(*(set(x) for x in M)))==16
    P=[]
    for b in blocks:
        es={e(*x) for x in combinations(b,2)}
        assert sum(e(*x) in es for x in M)==1
        P.append(next(t for t in combinations(b,3) if not tri(t)&{e(*x) for x in M}))
    P += [(Z,*x) for x in M]
    original=check(rim,P,bipartition_cover(rim))
    assert len(original['triangles'])==80 and (len(P),len(original['cover']))==(16,24)
    original.update({'nu':16,'tau':24,'defect':-8,
      'nu_upper_reason':'At most8 old block faces and at most8 apex triangles using disjoint spoke pairs.',
      'tau_lower_reason':'For uncovered-spoke set U, tau>=16-|U|+sum_B f(|U intersect B|), f=(2,2,2,3,6); every rim vertex is in2 blocks, so this is16+sum_B(f(t)-t/2)>=24.',
      'max_common_vertex_packing_upper_bounds':{'apex':8,'every_rim_vertex':3},
      'covered_by_prior_one_apex_literal_block_theorem':True})
    # Reconstruct the actual shared-edge triangle component, not vertex connectivity alone.
    ts=original['triangles']; unseen=set(range(len(ts)));seen={unseen.pop()}
    changed=True
    while changed:
        changed=False;edges=set().union(*(tri(ts[i]) for i in seen))
        add={i for i in unseen if tri(ts[i])&edges}
        if add:seen|=add;unseen-=add;changed=True
    assert not unseen
    original['shared_edge_triangle_components']=1
    cases={}
    for key in ('adjacent','nonadjacent'):
        row=r[key];F=set(map(tuple,row['edges']));P=[tuple(t) for t in row['packing']]
        if key=='adjacent':
            assert (3,7,11) in P
            P[P.index((3,7,11))]=(3,7,15)
            M=[(0,3),(2,14),(5,6),(7,11),(9,10),(13,15)]
        else:
            M=[(0,1),(4,5),(6,10),(7,15),(9,11),(13,14)]
        used=set().union(*(tri(t) for t in P))
        assert len(set().union(*(set(x) for x in M)))==2*len(M)
        assert all(e(*x) in F-used for x in M)
        P += [(Z,*x) for x in M]
        out=check(F,P,bipartition_cover(F))
        expected=(17,25,-9,83) if key=='adjacent' else (18,24,-12,84)
        assert (len(P),len(out['cover']),out['defect_upper_bound'],len(out['triangles']))==expected
        # All cone edges are obtained from the stated allowed rim compression.
        a,b=row['receiver'],row['donor'];base=set(map(tuple,original['edges']))
        ns=lambda x:{y if w==x else w for w,y in base if x in (w,y)}
        moved=ns(b)-ns(a)-{a};assert len(ns(a))==len(ns(b))==7
        target=(base-{e(b,x) for x in moved})|{e(a,x) for x in moved}
        assert target==set(map(tuple,out['edges']))
        out.update({'receiver':a,'donor':b,'residual_rim_matching':M,
                    'compressed_rim_packing':P[:-len(M)],'moved_neighbours':sorted(moved)})
        cases[key]=out
    result={'status':'PASS','scope':'one fixed cone and two representative compressions; no optimizer or graph census',
      'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
      'rook_input_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
      'original':original,'compressions':cases,
      'symmetry_argument':'All nontrivial degree-directed compressions are between rim vertices, with the same adjacent/nonadjacent ordered-pair orbits as the rook graph. Apex receiver moves are empty and apex donor moves fail the degree condition.',
      'claims':{'componentwise_threshold_or_common_vertex_terminal_availability':False,
        'availability_also_exempting_all_one_apex_literal_block_graphs':'UNRESOLVED',
        'ordinary_Tuza_counterexample':False}}
    path=ROOT/'late_compression_cone_verified.json';path.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({'status':'PASS','original_nu_tau':(16,24),'adjacent_nu_lower_tau_upper':(17,25),'nonadjacent_nu_lower_tau_upper':(18,24),'output':str(path)}))
if __name__=='__main__':main()
