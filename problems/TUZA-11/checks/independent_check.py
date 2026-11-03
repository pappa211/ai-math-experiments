"""Independent standard-library finite verification; imports no discovery code.
Small graphs: exhaustive combination search, not include/exclude branching.
Clebsch: infinity/singleton/pair construction and canonical cone-cover enumeration.
"""
from itertools import combinations,product
from pathlib import Path
import json,time,datetime,sys,hashlib
W=Path(__file__).resolve().parents[1]
SOURCE=W
START=time.monotonic()
def guard():
    if time.monotonic()-START>180:raise RuntimeError('180-second process budget exceeded')
def edge(u,v):return tuple(sorted((u,v)))
def clique(vs):return set(combinations(sorted(vs),2))
def triangles(E):
    E=set(E);V=sorted({v for e in E for v in e})
    return tuple(t for t in combinations(V,3) if clique(t)<=E)
def incidence(E):
    T=triangles(E);return {e:sum(e in clique(t) for t in T) for e in E}
def certificate(E):
    guard();E=tuple(sorted(E));T=triangles(E);te=[clique(t) for t in T]
    pw=None;pack_count=0
    for k in range(min(len(T),len(E)//3),-1,-1):
        for I in combinations(range(len(T)),k):
            pack_count+=1
            used=set()
            for i in I:
                if used&te[i]:break
                used|=te[i]
            else:pw=[T[i] for i in I];break
        if pw is not None:break
    cw=None;cover_count=0
    # Every minimum cover is on triangle support; triangle-free edges are redundant.
    support=sorted(set().union(*te)) if te else []
    for k in range(len(support)+1):
        for C in combinations(support,k):
            cover_count+=1
            if all(set(C)&s for s in te):cw=list(C);break
        if cw is not None:break
    assert all(set(cw)&s for s in te)
    assert len(set().union(*(clique(t) for t in pw)))==3*len(pw) if pw else True
    return {'edges':E,'triangles':T,'nu':len(pw),'tau':len(cw),'packing':pw,'cover':cw,'packing_subsets_examined':pack_count,'cover_subsets_examined':cover_count}
def subsets(seq):
    for k in range(len(seq)+1):yield from combinations(seq,k)
def profiles(E,B):
    private=sorted(set(E)-B);T=triangles(E);cs={};ps={}
    for A in subsets(sorted(B)):
        options=[]
        for C in subsets(private):
            if all((set(C)|set(A))&clique(t) for t in T):options.append(C);break
        cs[frozenset(A)]=None if not options else options[0]
    for P in subsets(T):
        sets=[clique(t) for t in P];used=set().union(*sets) if sets else set()
        if sum(map(len,sets))!=len(used):continue
        mask=frozenset(used&B)
        if mask not in ps or len(P)>len(ps[mask]):ps[mask]=P
    return cs,ps

def check_decomposition(pieces,B):
    E=set().union(*pieces);T=set(triangles(E));PT=[set(triangles(P)) for P in pieces]
    hyp={'flat':all(max(incidence(P).values(),default=0)<=2 for P in pieces),
         'overlap_in_B':all((pieces[i]&pieces[j])<=B for i in range(len(pieces)) for j in range(i)),
         'triangle_separated':T<=set().union(*PT),'boundary_actual':B<=E}
    c=[profiles(P,B) for P in pieces]
    cover_candidates=[]
    for A in subsets(sorted(B)):
        states=[x[0][frozenset(A)] for x in c]
        if all(v is not None for v in states):cover_candidates.append((len(A)+sum(map(len,states)),A,states))
    predc=min(cover_candidates,key=lambda x:x[0]) if cover_candidates else None
    states={frozenset():(0,[])}
    for _,p in c:
        nxt={}
        for used,(val,packs) in states.items():
            for mask,pw in p.items():
                if used&mask:continue
                u=used|mask;v=val+len(pw)
                if u not in nxt or v>nxt[u][0]:nxt[u]=(v,packs+[pw])
        states=nxt
    predp=max(states.values(),key=lambda x:x[0]);actual=certificate(E)
    if all(hyp.values()):
        assert predc[0]==actual['tau'] and predp[0]==actual['nu']
        cover=set(predc[1]).union(*(set(x) for x in predc[2]));assert all(cover&clique(t) for t in T)
        P=[t for pack in predp[1] for t in pack];assert len(set().union(*(clique(t) for t in P)))==3*len(P) if P else True
    out={'hypotheses':hyp,'B':sorted(B),'pieces':[sorted(P) for P in pieces],'actual':actual,'composition_tau':None if predc is None else predc[0],'composition_nu':predp[0],
         'boundary_cover_states':[{','.join(map(str,sorted(a))):None if cw is None else list(cw) for a,cw in x[0].items()} for x in c],
         'packing_masks':[{','.join(map(str,sorted(a))):list(pw) for a,pw in x[1].items()} for x in c]}
    return out

def clebsch():
    # 0=infinity,1..5=singletons,6..15=two-subsets of[5].
    pairs=list(combinations(range(5),2));label={p:6+i for i,p in enumerate(pairs)}
    E={(0,i+1) for i in range(5)}
    for p in pairs:
        E.update(edge(i+1,label[p]) for i in p)
    E.update(edge(label[p],label[q]) for p,q in combinations(pairs,2) if not set(p)&set(q))
    assert len(E)==40 and not triangles(E)
    adj={v:{u for e in E for u in e if v in e and u!=v} for v in range(16)}
    alpha=0;independent=[];best=17;opts=[];cost_hist={}
    for U in subsets(tuple(range(16))):
        U=set(U);inside=sum(set(e)<=U for e in E);value=16-len(U)+inside
        cost_hist[value]=cost_hist.get(value,0)+1
        if value<best:best=value;opts=[U]
        elif value==best:opts.append(U)
        if not inside:
            if len(U)>alpha:alpha=len(U);independent=[U]
            elif len(U)==alpha:independent.append(U)
    assert alpha==5 and best==11 and len(opts)==len(independent)==16
    assert {frozenset(u) for u in opts}=={frozenset(adj[v]) for v in adj}
    # Independent recursive pairing only for an attaining matching, not optimum inference.
    def matching(left,available):
        if not left:return []
        u=left[0]
        for v in sorted(adj[u]&available):
            rest=matching(left[1:],available-{v})
            if rest is not None:return [(u,v)]+rest
        return None
    # Reconstruct original labels through generator pairs; no original adjacency construction used.
    D=[1,2,4,8,15];orig_to_new={0:0}|{d:i+1 for i,d in enumerate(D)}
    orig_to_new.update({D[i]^D[j]:label[(i,j)] for i,j in combinations(range(5),2)})
    new_to_orig={v:u for u,v in orig_to_new.items()};assert len(orig_to_new)==16
    old=json.loads((SOURCE/'evidence/CLEBSCH_PRIVATE_OBSTRUCTION.json').read_text())
    assert {edge(orig_to_new[u],orig_to_new[v]) for u,v in old['base_edges']}==E
    rows=[]
    for U in opts:
        M=matching(sorted(U),set(range(16))-U);assert M is not None and len(M)==5
        C={edge(16,v) for v in set(range(16))-U}
        origU=sorted(new_to_orig[u] for u in U)
        saved=[r for r in old['all_minimum_covers'] if sorted(r['I'])==origU];assert len(saved)==1
        assert {edge(16,orig_to_new[v]) for _,v in saved[0]['minimum_triangle_cover']}==C
        expected={e for e in E if set(e)&U}
        assert {edge(orig_to_new[u],orig_to_new[v]) for u,v in saved[0]['private_base_edges']}==expected
        recorded=[edge(orig_to_new[u],orig_to_new[v]) for u,v in saved[0]['private_matching']]
        assert len(recorded)==5 and all(e in expected for e in recorded)
        assert len(set().union(*map(set,recorded)))==10
        rows.append({'U':sorted(U),'cover':sorted(C),'private_matching':M,'private_upper_bound':len(U),'original_U':origU})
    # Explicit original perfect matching transformed to different construction.
    perfect=[edge(orig_to_new[u],orig_to_new[u^1]) for u in range(0,16,2)]
    assert all(e in E for e in perfect) and len(set().union(*map(set,perfect)))==16
    cone=E|{edge(16,v) for v in range(16)};assert len(triangles(cone))==40
    return {'construction':'infinity, five singletons, ten pairs; singleton-pair incidence and disjoint-pair adjacency','base_edges':sorted(E),'orig_to_new':orig_to_new,'base_alpha':alpha,'maximum_independent_sets':len(independent),'canonical_subset_domain':1<<16,'canonical_cost_histogram':cost_hist,'cone_nu':8,'cone_tau':best,'minimum_cover_count':len(opts),'cone_packing':[(16,u,v) for u,v in perfect],'minimum_covers':rows,'private_nu':5,'all_saved_minimum_covers_matched':True}

def kernel():
    old=clique([6,7,8])|{edge(0,v) for v in range(1,6)}|{edge(v,1+v%5) for v in range(1,6)}
    apex=[6]+list(range(11,18));E=old|{(9,10),(7,9)}|{edge(v,w) for v in [9,10] for w in apex}
    B={(9,10),(7,9),(9,11),(9,12),(9,13)};H=E-B;ht=set(triangles(H));S=set().union(*(clique(t) for t in ht))
    cross=[t for t in triangles(E) if t not in ht and clique(t)&S]
    nt=triangles(E-S);spine=set.intersection(*(clique(t) for t in nt));assert spine=={(9,10)};f=(9,10)
    marked=[t for t in nt if (clique(t)-{f})&B or any((clique(t)-{f})&clique(x) for x in cross)]
    generic=[t for t in nt if t not in marked];discard=generic[2:]
    deleted=[sorted(clique(t)-{f})[0] for t in discard];inc=incidence(E);assert all(inc[e]==1 for e in deleted)
    R=E-set(deleted);before=certificate(E);after=certificate(R);res=certificate(H)
    assert (res['nu'],res['tau'],before['nu'],before['tau'])==(3,4,4,5)
    assert (before['nu'],before['tau'])==(after['nu'],after['tau'])
    assert set(triangles(R-B))==ht and B<=R and max(inc[e] for e in E-B)<=2
    assert cross==[(6,7,9)] and len(marked)==4 and len(generic)==4
    assert not any(clique(vs)<=H for vs in combinations(range(18),4))
    original=json.loads((SOURCE/'evidence/KERNEL_LEAF_PROBE.json').read_text())
    assert set(map(tuple,original['before']['edges']))==E and set(map(tuple,original['after']['edges']))==R
    return {'B':sorted(B),'old_support':sorted(S),'crossing':cross,'marked':marked,'generic':generic,'deleted_edges':deleted,'global_deleted_edge_degrees':[inc[e] for e in deleted],'before':before,'after':after,'H':res,'unchanged_old_triangles':True,'forced_spine_avoidance_book_cost':[len(nt),len(triangles(R-S))]}

def small_checks():
    cases={
      'vertex_shared_K4s':([clique([0,1,2,3]),clique([0,4,5,6])],set()),
      'edge_shared_K4s_r0':([clique([0,1,2,3]),clique([0,1,4,5])],{(0,1)}),
      'duplicated_boundary_triangle':([clique([0,1,2])|{(0,3),(1,3)},clique([0,1,2])|{(0,4),(2,4)}],clique([0,1,2])),
      'isolated_K4_and_boundary_book':([clique([0,1,2])|{(0,3),(1,3),(2,3)}]+[{(0,4),edge(0,v),edge(4,v)} for v in [5,6,7]],{(0,4)}),
      'triangle_separation_negative':([{(0,1)},{(0,2)},{(1,2)}],set())}
    out={name:check_decomposition(P,B) for name,(P,B) in cases.items()}
    neg=out['triangle_separation_negative'];assert not neg['hypotheses']['triangle_separated'] and neg['composition_tau']==neg['composition_nu']==0 and neg['actual']['tau']==neg['actual']['nu']==1
    # Exhaustive fixed labelled n=5 graph domain, pieces=all triangles plus singleton uncovered edges.
    allE=list(combinations(range(5),2));admitted=0;rejected=0;aggregate={}
    for mask in range(1<<len(allE)):
        E={e for j,e in enumerate(allE) if mask>>j&1};T=triangles(E);inc=incidence(E);B={e for e,d in inc.items() if d>=2}
        if len(B)>4:rejected+=1;continue
        pieces=[clique(t) for t in T]+[{e} for e in E if inc[e]==0]
        if not pieces:pieces=[set()]
        row=check_decomposition(pieces,B);assert all(row['hypotheses'].values())
        assert row['actual']['tau']<=2*row['actual']['nu'];admitted+=1
        key=str((row['actual']['nu'],row['actual']['tau'],len(B)));aggregate[key]=aggregate.get(key,0)+1
    # Local book privacy is insufficient: each discarded leaf also supports another actual triangle.
    E={(0,1)}|{edge(z,v) for z in [0,1] for v in [2,3,4]}
    E|={edge(z,p) for z,v,p in [(0,2,5),(0,3,6),(0,4,7)] for z in [0,v]}
    badbefore=certificate(E);badafter=certificate(E-{(0,4)})
    assert (badbefore['nu'],badbefore['tau'])==(3,3) and (badafter['nu'],badafter['tau'])==(2,2)
    return {'named_cases':out,'n5_domain':1024,'admitted_B_at_most4':admitted,'rejected_B_too_large':rejected,'state_identity_histogram':aggregate,'local_privacy_negative':{'before':badbefore,'after':badafter,'deleted_edge':(0,4),'global_triangle_degree':incidence(E)[(0,4)]},'flatness_negative':{'K5':certificate(clique(range(5))),'after_removing_K4_support':certificate(clique(range(5))-clique(range(4)))}}

def secondary():
    b=[3,3,1,1,1,1];base={(0,v) for v in range(1,6)};G=base|{edge(6+i,v) for v in range(6) for i in range(b[v])}
    nested=certificate(G);assert (nested['nu'],nested['tau'])==(2,2)
    maxima=[]
    for colors in product(range(4),range(2),range(2),range(2),range(2)):
        occupied=[set() for _ in b];valid=True
        for v,c in enumerate(colors,1):
            if c and (c in occupied[0] or c in occupied[v]):valid=False;break
            if c:occupied[0].add(c);occupied[v].add(c)
        if valid and sum(c>0 for c in colors)==2:
            S={v for v in range(6) if len(occupied[v])==b[v]};cost=sum(b[v] for v in S)+sum(not(set(e)&S) for e in base)
            assert cost==5;maxima.append(colors)
    assert len(maxima)==8
    E={edge(3*i+j,3*((i+1)%5)+k) for i in range(5) for j in range(3) for k in range(3)};assert len(E)==45 and not triangles(E)
    alpha=max(len(U) for U in subsets(tuple(range(15))) if not any(set(e)<=set(U) for e in E));assert alpha==6
    best=61;cost_hist={}
    for mask in range(1<<15):
        cost=mask.bit_count()+sum(not bool((mask>>u&1)^(mask>>v&1)) for u,v in E)
        best=min(best,cost);cost_hist[cost]=cost_hist.get(cost,0)+1
    assert best==15
    M=[(1,3),(2,12),(4,6),(5,7),(8,9),(10,13),(11,14)]
    assert all(edge(*e) in E for e in M) and len(set().union(*map(set,M)))==14
    return {'nested':nested,'nested_max_colorings':maxima,'nested_assignment_domain':64,'parity':{'base_edges':sorted(E),'base_alpha':alpha,'base_matching':M,'cone_nu':7,'cone_tau':15-alpha,'odd_cover_minimum':best,'spoke_assignments':1<<15,'cost_histogram':cost_hist}}

if __name__=='__main__':
    result={'generated_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'python':sys.version,'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'method':'stdlib exhaustive combination checks; no import or execution of discovery scripts','clebsch':clebsch(),'kernel':kernel(),'small':small_checks(),'secondary':secondary()}
    result['elapsed_seconds']=time.monotonic()-START
    (W/'evidence/INDEPENDENT_RESULTS.json').write_text(json.dumps(result,indent=2))
    print(json.dumps({'elapsed':result['elapsed_seconds'],'clebsch':{k:result['clebsch'][k] for k in ['cone_nu','cone_tau','minimum_cover_count','private_nu']},'kernel_before_after':[(result['kernel'][k]['nu'],result['kernel'][k]['tau'],len(result['kernel'][k]['triangles'])) for k in ['before','after']],'n5_admitted':result['small']['admitted_B_at_most4'],'secondary_parity':{k:result['secondary']['parity'][k] for k in ['cone_nu','cone_tau','odd_cover_minimum']}}))
