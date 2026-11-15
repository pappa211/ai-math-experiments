"""Fresh critic code: no producer imports, exact integer checks, stdlib only."""
from pathlib import Path
from itertools import combinations, product
from functools import lru_cache
import json, hashlib, time, resource, random, sys, platform
ROOT=Path(__file__).resolve().parents[1]
START=time.monotonic()
INPUTS=['MISSION.txt','notes/A_RESULTS.md','notes/B_FROZEN_v1.md','sources/published/problems/TUZA-01/manuscript/README.md','sources/published/problems/TUZA-03/CONSOLIDATED_MANUSCRIPT.md','sources/published/problems/TUZA-07/notes/CRITICALITY_PACKAGE.md','sources/published/problems/TUZA-12/notes/FOUR_PORT_RESTORATION_COUNTEREXAMPLE.md','sources/literature/hns2018.pdf']

def edge(u,v): return (min(u,v),max(u,v))
def triangles(n,E):
    return [tuple(edge(a,b) for a,b in combinations(vs,2)) for vs in combinations(range(n),3) if all(edge(a,b) in E for a,b in combinations(vs,2))]
def exact(n,E):
    es=sorted(E); ids={e:i for i,e in enumerate(es)}
    ts=triangles(n,E); masks=[sum(1<<ids[e] for e in t) for t in ts]
    conflicts=[sum(1<<j for j,u in enumerate(masks) if t&u) for t in masks]
    @lru_cache(None)
    def pack(avail):
        if not avail: return 0
        i=(avail&-avail).bit_length()-1
        return max(pack(avail&~(1<<i)),1+pack(avail&~conflicts[i]))
    def packing_removed(R=0): return pack(sum(1<<i for i,t in enumerate(masks) if not t&R))
    covers=[]; tau=None
    for k in range(len(es)+1):
        for S in combinations(range(len(es)),k):
            c=sum(1<<i for i in S)
            if all(c&t for t in masks): covers.append(c)
        if covers: tau=k; break
    return es,ids,ts,masks,packing_removed,tau,covers

def vertex_cover(n,es):
    for k in range(n+1):
        for U in combinations(range(n),k):
            s=set(U)
            if all(u in s or v in s for u,v in es): return k

def matching_sets(es):
    ans=[]
    def visit(i,used,chosen):
        if i==len(es): ans.append(tuple(chosen)); return
        visit(i+1,used,chosen)
        u,v=es[i]
        if u not in used and v not in used: visit(i+1,used|{u,v},chosen+[es[i]])
    visit(0,set(),[]);return ans

def vertex_colouring(n,E):
    order=sorted(range(n), key=lambda v:-sum(v in e for e in E)); c={}
    def go(i):
        if i==n:return [c[v] for v in range(n)]
        v=order[i];bad={c[w] for w in c if edge(v,w) in E}
        for x in range(4):
            if x not in bad:
                c[v]=x;r=go(i+1)
                if r is not None:return r
                del c[v]
        return None
    return go(0)

def analyze_apex(n,E,X,check_all_covers=False):
    es,ids,ts,tms,pack,tau,cs=exact(n,E)
    L=[e for e in es if set(e)<=X]
    assert not triangles(n,set(L))
    # Enumerate all link matchings directly and delete their graph EDGES.
    ms=matching_sets(L);m=max(map(len,ms),default=0)
    state_p=max(len(M)+pack(sum(1<<ids[e] for e in M)) for M in ms)
    GE=E|{edge(n,v) for v in X};gexact=exact(n+1,GE)
    p=gexact[4]();gtau=gexact[5];assert p==state_p
    h=pack();b=2*p-tau;a=p-h;D=2*h-tau
    vals=[]
    for C in cs:
        vals.append(vertex_cover(n,[e for e in L if not C>>ids[e]&1]))
    lam=min(vals);assert m<=b and tau+lam<=2*p
    if m==b: assert lam<=2*a
    if check_all_covers:
        best=10**6
        for C in range(1<<len(es)):
            if all(C&t for t in tms):
                val=C.bit_count()+vertex_cover(n,[e for e in L if not C>>ids[e]&1]);best=min(best,val)
        assert best==gtau
    return {'nu_H':h,'tau_H':tau,'nu_G':p,'tau_G':gtau,'lambda':lam,'minimum_cover_count':len(cs),'m':m,'b':b,'a':a,'D':D,'X':sorted(X),'status':'PASS'}

FOURPORT={(0,1),(0,2),(0,3),(0,4),(0,7),(1,2),(1,3),(1,4),(1,5),(2,3),(2,5),(2,6),(3,6),(3,7),(4,5),(4,7),(5,6)}
four=[]
for z in range(8):
    old=[v for v in range(8) if v!=z];mp={v:i for i,v in enumerate(old)}
    E={edge(mp[u],mp[v]) for u,v in FOURPORT if u!=z and v!=z}
    X={mp[v] for v in old if edge(v,z) in FOURPORT};L={e for e in E if set(e)<=X}
    col=vertex_colouring(7,E);assert col is not None
    for T in triangles(7,E):assert len({col[u]^col[v] for u,v in T})==3
    if triangles(7,L): four.append({'apex':z,'eligible':False,'reason':'induced link contains triangle'});continue
    row=analyze_apex(7,E,X,True);row['apex']=z;row['eligible']=True;row['vertex4colouring']=col;four.append(row)

# All labelled five-vertex H, all induced triangle-free links, restricted
# to an explicitly found proper four-colouring (sufficient, not necessary).
small={'H_count':0,'eligible_link_count':0,'tight_H_count':0,'saturated_link_count':0,'b_counts':{}}
base=list(combinations(range(5),2))
for mask in range(1<<len(base)):
    E={e for i,e in enumerate(base) if mask>>i&1};col=vertex_colouring(5,E)
    if col is None:continue
    small['H_count']+=1
    ex=exact(5,E)
    for xmask in range(1<<5):
        X={v for v in range(5) if xmask>>v&1};L={e for e in E if set(e)<=X}
        if triangles(5,L):continue
        row=analyze_apex(5,E,X)
        small['eligible_link_count']+=1;small['tight_H_count']+=row['D']==0;small['saturated_link_count']+=row['m']==row['b']
        key=str(row['b']);small['b_counts'][key]=small['b_counts'].get(key,0)+1

# Independent A implementation. Base labels (layer, C5 vertex, clone).
def Agraph(q,t):
    rim=[(l,v,i) for l in range(2) for v in range(5) for i in range(t)]
    idx={x:j for j,x in enumerate(rim)};N=len(rim)
    E=set()
    for x,y in combinations(rim,2):
        l,v,i=x;ll,w,j=y
        if (l==ll and (v-w)%5 in (1,4)) or (l!=ll and v==w):E.add(edge(idx[x],idx[y]))
    G=E|{edge(a,u) for a in range(N,N+q) for u in range(N)}
    return rim,idx,E,G

def extend(q,t,rim,idx,R):
    # R contains (apex index, unordered rim edge). Generic augmenting paths
    # complete independently constructed balanced backbone subgraphs.
    reserved={e for a,e in R};used=set();out=[]
    for a in range(q):
        own=[e for aa,e in R if aa==a];future={e for aa,e in R if aa>a}
        forbidden=used|future;Q=list(own);occupied={u for e in own for u in e}
        allprescribed={u for aa,e in R for u in e}
        for u,v in own:
            lx,x,ix=rim[u];ly,y,iy=rim[v]
            if lx==ly:
                candidates=[edge(idx[(1-lx,x,i)],idx[(1-lx,y,j)]) for i in range(t) for j in range(t)]
                e=next(e for e in candidates if not set(e)&(occupied|allprescribed) and e not in forbidden)
                Q.append(e);occupied.update(e)
        for v in range(5):
            left=[idx[(0,v,i)] for i in range(t) if idx[(0,v,i)] not in occupied]
            right=[idx[(1,v,i)] for i in range(t) if idx[(1,v,i)] not in occupied]
            assert len(left)==len(right);assigned={}
            def augment(u,seen):
                for w in right:
                    if w in seen or edge(u,w) in forbidden:continue
                    seen.add(w)
                    if w not in assigned or augment(assigned[w],seen):assigned[w]=u;return True
                return False
            for u in left:assert augment(u,set())
            Q.extend(edge(u,w) for w,u in assigned.items())
        assert len(Q)==5*t and len({u for e in Q for u in e})==10*t
        assert not set(Q)&forbidden and set(own)<=set(Q)
        used.update(Q);out.append(Q)
    return out

A=[];rng=random.Random(170417)
for q,t in [(1,10),(2,12),(3,14)]:
    rim,idx,E,G=Agraph(q,t);N=len(rim)
    # Actual triangle census via adjacency intersections, separately from formula.
    adj=[set() for _ in range(N+q)]
    for u,v in G:adj[u].add(v);adj[v].add(u)
    actual=[];codegree={e:0 for e in G}
    for u,v in sorted(G):
        for w in sorted(adj[u]&adj[v]):
            if w>v:
                T=(edge(u,v),edge(u,w),edge(v,w));actual.append(T)
                for e in T:codegree[e]+=1
    assert len(actual)==q*15*t*t and min(codegree.values())==q
    prescriptions=[[]]
    choices=[(a,e) for a in range(q) for e in sorted(E)]
    prescriptions += [[choices[rng.randrange(len(choices))]] for _ in range(12)]
    while len(prescriptions)<110:
        x,y=rng.sample(choices,2)
        if x[1]==y[1] or (x[0]==y[0] and set(x[1])&set(y[1])):continue
        prescriptions.append([x,y])
    witness_digest=hashlib.sha256()
    for R in prescriptions:
        matchings=extend(q,t,rim,idx,R);seen=set();pages=[]
        for a,M in enumerate(matchings):
            for u,v in M:
                T={edge(u,v),edge(N+a,u),edge(N+a,v)}
                assert len(T)==3 and T<=G and not seen&T;seen|=T;pages.append(sorted(T))
        assert len(pages)==q*5*t
        assert sum(N<=max(e) for e in seen)==q*N
        witness_digest.update(json.dumps(pages).encode())
    A.append({'q':q,'t':t,'graph_order':N+q,'actual_triangle_count':len(actual),'minimum_codegree':min(codegree.values()),'max_packing_size':q*5*t,'new_prescriptions_extended':len(prescriptions),'witnesses_sha256':witness_digest.hexdigest(),'status':'PASS'})

# Literal Mycielski reconstruction and large-example arithmetic.
n=5;E={edge(i,(i+1)%5) for i in range(5)}
for _ in range(2):
    E=E|{edge(u,n+v) for u,v in E}|{edge(v,n+u) for u,v in E}|{(n+i,2*n) for i in range(n)}
    n=2*n+1;assert not triangles(n,E)
assert n==23 and len(E)==71
b=2*n;q=4;t=93
large={'B0_n':n,'B0_edges':len(E),'B_edges':2*len(E)+n,'G_order':q+b*t,'triangle_count':q*(2*len(E)+n)*t*t,'nu':q*b*t//2,'two_nu':q*b*t,'colour_cost_lower_bound':2*t*t,'explicit_cover':q*(b-1)*t,'nu_spoke_deleted':q*b*t//2-1,'large_graph_enumerated':False}
assert large['colour_cost_lower_bound']>large['two_nu']

out={'status':'PASS','authorship':'fresh no-history internal AI critic; no producer imports','requested_configuration':'Astra / Ultra; serving configuration not exposed','independent_final_verification':'NOT_RUN','input_sha256':{f:hashlib.sha256((ROOT/f).read_bytes()).hexdigest() for f in INPUTS},'four_port':four,'five_vertex_scope':small,'A_new_witnesses':A,'A_large_arithmetic':large,'elapsed_seconds':time.monotonic()-START,'peak_rss_darwin_bytes':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,'python':sys.version,'platform':platform.platform(),'time_limit_seconds':60,'memory_watchdog_MiB':512}
(ROOT/'evidence/critic_independent.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k not in ['input_sha256','four_port']},indent=2))
