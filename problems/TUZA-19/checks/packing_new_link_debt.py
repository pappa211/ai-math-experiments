#!/usr/bin/env python3
"""Fixed literal controls for packing_new_link_debt.md; no graph census."""
from itertools import combinations, permutations
from functools import lru_cache
from pathlib import Path
from datetime import datetime, timezone
import hashlib,json

def edges(t): return set(combinations(sorted(t),2))
def triangles(V,E): return [t for t in combinations(sorted(V),3) if edges(t)<=E]
def validate_pack(P,E):
    used=[e for t in P for e in edges(t)]
    assert len(used)==len(set(used)) and set(used)<=E
    return set(used)
def valid_cover(C,T): return all(edges(t)&C for t in T)

def covering(family,all_edges):
    idx={e:i for i,e in enumerate(all_edges)}
    masks=tuple(sum(1<<idx[e] for e in edges(t)) for t in family)
    @lru_cache(None)
    def rec(rem):
        if not rem:return ()
        t=next(i for i in range(len(masks)) if rem>>i&1)
        candidates=[]
        for e in range(len(all_edges)):
            if masks[t]>>e&1:
                nxt=rem
                for j,m in enumerate(masks):
                    if m>>e&1:nxt&=~(1<<j)
                candidates.append((e,)+rec(nxt))
        return min(candidates,key=lambda z:(len(z),z))
    return [all_edges[i] for i in rec((1<<len(masks))-1)]

def packing(family,all_edges):
    idx={e:i for i,e in enumerate(all_edges)}
    masks=tuple(sum(1<<idx[e] for e in edges(t)) for t in family)
    @lru_cache(None)
    def rec(rem):
        choices=[(j,)+rec(rem^m) for j,m in enumerate(masks) if rem&m==m]
        return max(choices,key=len) if choices else ()
    return [family[j] for j in rec((1<<len(all_edges))-1)]

def complete_family():
    result=[];n=5;P=[(0,1,2),(0,3,4)]
    for stage in range(3):
        V=list(range(n));E=set(combinations(V,2));T=list(combinations(V,3))
        used=validate_pack(P,E);leave=E-used
        assert leave=={(1,3),(1,4),(2,3),(2,4)}
        assert len(P)==(n*(n-1)-8)//6
        A=set(range((n+1)//2));C={e for e in E if (e[0] in A)==(e[1] in A)}
        assert len(C)==(n-1)**2//4 and valid_cover(C,T) and edges((0,1,2))<=C
        controls=[]
        for forbidden,target in [({(0,1),(0,2)},{(0,1),(0,2),(1,3),(2,3)}),
                                  ({(0,1),(2,3)},{(0,1),(2,3),(0,2),(1,3)})]:
            source=sorted(set(sum((list(e) for e in leave),[])))
            for dest in permutations(range(4)):
                mp=dict(zip(source,dest))
                if {tuple(sorted((mp[a],mp[b]))) for a,b in leave}==target:break
            else:raise AssertionError('C4 mapping')
            remaining_source=[v for v in V if v not in mp]
            remaining_target=[v for v in V if v not in mp.values()]
            mp.update(zip(remaining_source,remaining_target))
            PP=[tuple(sorted(mp[x] for x in t)) for t in P]
            assert not(validate_pack(PP,E)&forbidden) and len(PP)==len(P)
            controls.append({'deleted':sorted(forbidden),'packing':PP})
        result.append({'n':n,'edges':sorted(E),'triangles':T,'packing':P.copy(),
          'leave':sorted(leave),'minimum_cover':sorted(C),'tau':len(C),'nu':len(P),
          'two_edge_orbit_certificates':controls,'minimum_reducible_size_lower_bound':(2*n-1+12)//13})
        oldn=n
        newP=P.copy()
        for j in range(oldn):
            newP.append(tuple(sorted((j,2*oldn,oldn+j))))
            for t in range(1,(oldn-1)//2+1):
                newP.append(tuple(sorted((j,oldn+(j+t)%oldn,oldn+(j-t)%oldn))))
        n=2*oldn+1;P=newP
    return result

family=complete_family()
f11=family[1];V=set(range(11));E=set(map(tuple,f11['edges']));P=list(map(tuple,f11['packing']))
v=next(x for x in sorted(V) if all(x not in e for e in f11['leave']))
M={tuple(sorted(set(t)-{v})) for t in P if v in t}
assert len(M)==5 and set(sum((list(e) for e in M),[]))==V-{v}
HE={e for e in E if v not in e and e not in M};HT=triangles(V-{v},HE)
HP=[t for t in P if v not in t]
assert len(HP)==12 and HE-validate_pack(HP,HE)==set(map(tuple,f11['leave']))
A=set(sum((list(e) for e in sorted(M)[:2]),[]));HC={e for e in HE if (e[0] in A)==(e[1] in A)}
assert len(A)==4 and len(HC)==16 and valid_cover(HC,HT)
Q=(V-{v})-set(next(iter(M)))
assert len(Q)==8 and all(set(e)&Q for e in HE)
X=M|{tuple(sorted((v,x))) for x in Q};C=HC|X
assert len(X)==13 and len(C)==29 and valid_cover(C,list(combinations(range(11),3)))
residual={'vertex':v,'matching':sorted(M),'link_cover':sorted(Q),'residual_edges':sorted(HE),
 'residual_triangles':HT,'residual_packing':HP,'residual_cover':sorted(HC),
 'lifted_cover':sorted(C),'m':5,'q_link':8,'local_deficit':3,'nu_H':12,'tau_H':16,'slack':8,'extra_gain':0}

# All partitions of four fixed K5 neighbors, using restricted-growth labels.
def partitions(prefix=(0,)):
    if len(prefix)==4:
        yield prefix;return
    for x in range(max(prefix)+2):yield from partitions(prefix+(x,))
oldV=range(5);oldE=sorted(combinations(oldV,2));oldT=list(combinations(oldV,3));split_rows=[]
for labels in partitions():
    clone={x:5+labels[x-1] for x in range(1,5)}
    SE=set(combinations(range(1,5),2))|{tuple(sorted((x,clone[x]))) for x in range(1,5)}
    SV=set(sum((list(e) for e in SE),[]));ST=triangles(SV,SE)
    def back_vertex(x):return 0 if x>=5 else x
    projected=[tuple(sorted(back_vertex(x) for x in t)) for t in ST]
    lost=[t for t in oldT if t not in projected]
    expected=[(0,a,b) for a,b in combinations(range(1,5),2) if labels[a-1]!=labels[b-1]]
    assert lost==expected
    SP=packing(ST,sorted(SE));SC=covering(ST,sorted(SE));LC=covering(lost,oldE)
    validate_pack(SP,SE);assert valid_cover(set(SC),ST) and valid_cover(set(LC),lost)
    sizes=tuple(sorted((labels.count(i) for i in set(labels)),reverse=True))
    expected_values={(4,):(2,4,0),(3,1):(2,3,1),(2,2):(2,2,2),(2,1,1):(2,2,2),(1,1,1,1):(1,2,3)}
    assert (len(SP),len(SC),len(LC))==expected_values[sizes]
    if len(sizes)>1:assert len(LC)>2*(2-len(SP))
    split_rows.append({'partition_labels':labels,'part_sizes':sizes,'split_edges':sorted(SE),
     'split_triangles':ST,'destroyed_triangles':lost,'maximum_packing':SP,'minimum_split_cover':SC,
     'minimum_destroyed_cover':LC,'nu_split':len(SP),'tau_split':len(SC),'h':len(LC),
     'packing_credit':2*(2-len(SP))})
assert len(split_rows)==15

source=Path('evidence/codegree_two/tf_lift_witness.json');W=json.loads(source.read_text())
WE=set(map(tuple,W['edges']));WV=set(sum((list(e) for e in WE),[]));WT=triangles(WV,WE)
assert WT==list(map(tuple,W['triangles'])) and len(WT)==240
fresh=[]
for w in sorted(x for x in WV if x>=12):
    N=sorted(b if a==w else a for a,b in WE if w in (a,b))
    assert len(N)==4 and set(combinations(N,2))<=WE
    mm=[tuple(N[:2]),tuple(N[2:])];qq=set(N[:2])
    assert all(set(e)&qq for e in set(combinations(N,2))-set(mm))
    fresh.append({'v':w,'neighbors':N,'matching':mm,'link_cover':sorted(qq),'deficit':0})
assert len(fresh)==60
result={'status':'PASS; all-size arguments are ordinary proofs, independent review pending',
 'utc':datetime.now(timezone.utc).isoformat(),'scope':'fixed complete constructions, all K5 neighbor partitions, one retained decorated control',
 'complete_family':family,'K11_residual':residual,'K5_split_partitions':split_rows,
 'decorated_control':{'source':str(source),'sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
  'counts':W['counts'],'all_actual_triangles_reconstructed':len(WT),'fresh_WKE_links':fresh}}
out=Path('evidence/packing_routes/packing_new_link_debt.json');out.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'status':'PASS','complete_orders':[x['n'] for x in family],'K5_partitions':len(split_rows),
 'K11_residual':{k:residual[k] for k in ('m','q_link','local_deficit','nu_H','tau_H','slack','extra_gain')},
 'decorated_fresh_WKE_links':len(fresh),'receipt':str(out)},indent=2))
