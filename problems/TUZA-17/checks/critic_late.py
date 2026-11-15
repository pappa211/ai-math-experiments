"""New late critic reconstruction; imports no producer or previous checker."""
from pathlib import Path
from itertools import combinations
from functools import lru_cache
import json,time,hashlib,resource
R=Path(__file__).resolve().parents[1];start=time.monotonic()
def edge(a,b):return tuple(sorted((a,b)))
def tris(n,E):return [tuple(edge(a,b) for a,b in combinations(V,2)) for V in combinations(range(n),3) if all(edge(a,b) in E for a,b in combinations(V,2))]
def exact(n,E):
    es=sorted(E);T=tris(n,E);index={e:i for i,e in enumerate(es)};tm=[sum(1<<index[e] for e in t) for t in T]
    conflict=[sum(1<<j for j,u in enumerate(tm) if t&u) for t in tm]
    @lru_cache(None)
    def packing(A):
        if not A:return 0
        i=(A&-A).bit_length()-1
        return max(packing(A&~(1<<i)),1+packing(A&~conflict[i]))
    def nu_without(e=None):
        return packing(sum(1<<i for i,t in enumerate(T) if e not in t))
    C=[]
    for k in range(len(es)+1):
        for I in combinations(range(len(es)),k):
            s=sum(1<<i for i in I)
            if all(s&t for t in tm):C.append(set(es[i] for i in I))
        if C:break
    return {'nu':nu_without(),'tau':k,'covers':C,'triangles':T,'nu_without':nu_without}
def vc(n,E):
    for k in range(n+1):
        for U in combinations(range(n),k):
            if all(a in U or b in U for a,b in E):return k
def lam(n,E,X,C):
    L={e for e in E if set(e)<=X}
    return min(vc(n,L-c) for c in C)
def ear(E,u,v,a,b):return E|{edge(u,a),edge(u,b),edge(v,a),edge(v,b),edge(a,b)}

# Exact W5 SLS witness, all minimum covers, and stability.
W={edge(i,(i+1)%5) for i in range(5)}|{(i,5) for i in range(5)}
w=exact(6,W);X=set(range(5));G=W|{(i,6) for i in X};g=exact(7,G)
col=dict(zip(sorted(W),[2,1,0,2,1,2,0,0,1,2]))
assert all({col[e] for e in t}=={0,1,2} for t in w['triangles'])
values=[vc(6,{e for e in W-c if set(e)<=X}) for c in w['covers']]
assert (w['nu'],w['tau'],len(w['covers']),min(values),g['nu'],g['tau'])==(2,3,10,2,4,5)
assert all(w['nu_without'](e)==2 for e in W)
wrow={'nu_H':2,'tau_H':3,'D':1,'lambda_supported':2,'nu_G':4,'tau_G':5,'minimum_covers':[{'edges':sorted(c),'residual_vc':v} for c,v in zip(w['covers'],values)],'all_edge_packing_stable':True}

# Rebuild finite SMALL-CORE counterexamples and the precise iteration stopping point.
E=set(combinations([0,1,2,3],2))|set(combinations([0,1,4,5],2));cores=[]
for n,attach in [(6,None),(8,(0,2,6,7)),(10,(0,3,8,9))]:
    if attach:E=ear(E,*attach)
    ex=exact(n,E);forbidden=sorted(set(E)-set().union(*ex['covers']))
    assert ex['tau']==2*ex['nu']-1
    assert all(ex['nu_without'](e)==ex['nu'] for e in E)
    cores.append({'vertices':n,'edges':sorted(E),'triangles':ex['triangles'],'nu':ex['nu'],'tau':ex['tau'],'minimum_cover_count':len(ex['covers']),'minimum_covers':[sorted(c) for c in ex['covers']],'edges_in_no_minimum_cover':forbidden,'all_edge_packing_stable':True})
assert [(c['nu'],c['tau'],c['minimum_cover_count']) for c in cores]==[(2,3,1),(3,5,7),(4,7,33)]
assert cores[1]['edges_in_no_minimum_cover']==[(0,3)] and not cores[2]['edges_in_no_minimum_cover']

# Exhaust all four-vertex old graphs, every marked old edge, every eligible X
# in the six-vertex ear extension. Every old graph is properly four-colourable,
# and its colouring extends over the ear, so every tested pair is eligible.
base=list(combinations(range(4),2));count=exceptional=ordinary=0;deltas={}
for mask in range(64):
    E={e for i,e in enumerate(base) if mask>>i&1}
    old=exact(4,E)
    for u,v in sorted(E):
        Ep=ear(E,u,v,4,5);J=E-{(u,v)};ex=exact(6,Ep);jx=exact(4,J)
        assert ex['tau']==jx['tau']+2 and ex['nu']==old['nu']+1
        for bits in range(64):
            X={i for i in range(6) if bits>>i&1};L={e for e in Ep if set(e)<=X}
            if tris(6,L):continue
            count+=1;xo=X&set(range(4));lp=lam(6,Ep,X,ex['covers'])
            Gp=Ep|{(i,6) for i in X};p=exact(7,Gp)['nu']
            tips=X&{4,5};ends=X&{u,v}
            if len(tips)==len(ends)==1:
                exceptional+=1;endpoint=next(iter(ends));X0=xo-{endpoint}
                jlam=lam(4,J,X0,jx['covers']);R0=J|{(i,4) for i in X0};r=exact(5,R0)['nu']
                assert lp<=jlam+1 and p>=r+2
                assert jx['tau']+jlam<=2*r
                assert ex['tau']+lp<=2*p-1
            else:
                ordinary+=1;jlam=lam(4,J,xo,jx['covers']);Rs=J|{(i,4) for i in xo};r=exact(5,Rs)['nu']
                assert lp==jlam and p>=r+1
                assert jx['tau']+jlam<=2*r
                assert ex['tau']+lp<=2*p
            d=2*p-ex['tau']-lp;deltas[str(d)]=deltas.get(str(d),0)+1
out={'status':'PASS','scope':'independent exact finite reconstruction; late critic contributed simplified exceptional-case proof, so not blind review of that final step','W5':wrow,'core_stages':cores,'ear_cases':{'old_graph_order':4,'eligible_marked_instances':count,'exceptional_leaf_cases':exceptional,'other_cases':ordinary,'compatibility_slack_histogram':deltas},'elapsed_seconds':time.monotonic()-start,'peak_rss_Darwin_bytes':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,'independent_final_verification':'NOT_RUN'}
(R/'evidence/critic_late.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k not in ['W5','core_stages']},indent=2))
