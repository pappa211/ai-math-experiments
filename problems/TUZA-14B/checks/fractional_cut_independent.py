#!/usr/bin/env python3
"""Independent finite audit; no historical code imports or old verdict inputs.

The only supplied mathematical data are three edge lists extracted from author
track_b_fractional.json; all other graphs, LPs, covers, clauses and cuts are new.
Fractions are used throughout LP optimization and certificate validation.
"""
from __future__ import annotations
from collections import Counter, deque
from fractions import Fraction as Q
from functools import lru_cache
from itertools import combinations
from pathlib import Path
import argparse, hashlib, json, time

KERNEL_EDGES = {
'4c21554d63d3': [[0,1],[0,2],[0,4],[0,7],[0,8],[0,10],[0,11],[1,4],[1,6],[1,8],[2,7],[2,10],[2,11],[3,4],[3,5],[3,6],[3,7],[3,9],[4,6],[4,7],[4,8],[5,6],[5,9],[5,10],[6,8],[6,9],[6,10],[7,10],[7,11],[9,10],[10,11]],
'85fe064961fd': [[0,1],[0,2],[0,4],[0,7],[0,8],[0,10],[0,11],[1,4],[1,6],[1,8],[2,7],[2,10],[2,11],[3,4],[3,5],[3,6],[3,7],[3,9],[3,10],[4,6],[4,7],[4,8],[5,6],[5,9],[5,10],[6,8],[6,9],[6,10],[7,11],[9,10],[10,11]],
'1299d6e8bd49': [[0,1],[0,2],[0,6],[0,7],[0,8],[0,10],[0,11],[1,4],[1,6],[1,8],[2,7],[2,10],[2,11],[3,4],[3,5],[3,6],[3,7],[3,9],[3,10],[4,6],[4,7],[4,8],[5,6],[5,9],[5,10],[6,8],[6,9],[7,10],[7,11],[9,10],[10,11]]}

def bits(mask):
    while mask:
        x = mask & -mask
        yield x.bit_length()-1
        mask -= x

def rat(x): return [x.numerator, x.denominator]
def ceil(x): return -((-x.numerator)//x.denominator)
def emask(indices): return sum(1 << i for i in indices)

class Graph:
    def __init__(self, edges, n=None):
        self.edges = sorted(set(tuple(sorted(e)) for e in edges))
        assert all(u != v for u,v in self.edges)
        self.n = n if n is not None else 1+max((v for e in self.edges for v in e), default=-1)
        index = {e:i for i,e in enumerate(self.edges)}
        self.vertices = [t for t in combinations(range(self.n),3)
                         if all(e in index for e in combinations(t,2))]
        self.triangles = [tuple(index[e] for e in combinations(t,2)) for t in self.vertices]
        self.tm = [emask(t) for t in self.triangles]
        self.hits = [emask(i for i,t in enumerate(self.tm) if t >> e & 1)
                     for e in range(len(self.edges))]
        self.conflicts = [emask(j for j,u in enumerate(self.tm) if u&t) for t in self.tm]
        self.alltri = (1 << len(self.tm))-1
        self.alledge = (1 << len(self.edges))-1
        self.pack_value = lru_cache(None)(self._pack_value)
        self.cover_value = lru_cache(None)(self._cover_value)

    def _pack_value(self, avail):
        if not avail: return 0
        # Choose a high-degree triangle to shrink the include branch.
        t = max(bits(avail), key=lambda j:(self.conflicts[j]&avail).bit_count())
        yes = 1+self.pack_value(avail & ~self.conflicts[t])
        no = self.pack_value(avail & ~(1<<t))
        return max(yes,no)

    def packing(self, avail=None):
        avail = self.alltri if avail is None else avail
        result=[]
        while avail:
            t = max(bits(avail), key=lambda j:(self.conflicts[j]&avail).bit_count())
            if self.pack_value(avail)==1+self.pack_value(avail & ~self.conflicts[t]):
                result.append(t); avail &= ~self.conflicts[t]
            else: avail &= ~(1<<t)
        assert all(not self.tm[t]&self.tm[u] for t,u in combinations(result,2))
        return result

    def _cover_value(self, uncovered):
        if not uncovered: return 0
        # Every solution hits this actual triangle. Branch only on its edges.
        t = max(bits(uncovered), key=lambda j:sum((self.hits[e]&uncovered).bit_count() for e in self.triangles[j]))
        es=sorted(self.triangles[t], key=lambda e:-(self.hits[e]&uncovered).bit_count())
        return 1+min(self.cover_value(uncovered & ~self.hits[e]) for e in es)

    def mincovers(self):
        @lru_cache(None)
        def collect(uncovered):
            if not uncovered: return (0,)
            value=self.cover_value(uncovered)
            t = max(bits(uncovered), key=lambda j:sum((self.hits[e]&uncovered).bit_count() for e in self.triangles[j]))
            out=set()
            for e in self.triangles[t]:
                new=uncovered & ~self.hits[e]
                if 1+self.cover_value(new)==value:
                    out.update(c | (1<<e) for c in collect(new))
            return tuple(sorted(out))
        cs=list(collect(self.alltri))
        assert all(c.bit_count()==self.cover_value(self.alltri) and self.iscover(c) for c in cs)
        return cs

    def iscover(self,c): return all(t&c for t in self.tm)
    def eligible(self,c): return emask(i for i,t in enumerate(self.tm) if 1 <= (t&c).bit_count() <= 2)


def rational_lp(g, avail=None):
    """Primal dictionary simplex with exact Fractions and Bland tie rules.

    A separate incidence-based verifier below checks the emitted primal/dual
    certificate and does not inspect any pivot dictionary.
    """
    tids=list(bits(g.alltri if avail is None else avail))
    m,n=len(g.edges),len(tids)
    if not n:
        return {'triangle_indices':[], 'primal':[], 'dual':[rat(Q(0)) for _ in range(m)],
                'value':rat(Q(0)), 'pivots':0, 'certificate_verified':True}
    rows=[]
    for e in range(m):
        rows.append([Q(int(e in g.triangles[t])) for t in tids]
                    +[Q(int(e==i)) for i in range(m)]+[Q(1)])
    reduced=[Q(1)]*n+[Q(0)]*m
    basis=list(range(n,n+m)); objective=Q(0); pivots=0
    while True:
        entering=next((j for j,r in enumerate(reduced) if r>0),None)
        if entering is None: break
        candidates=[i for i in range(m) if rows[i][entering]>0]
        assert candidates, 'Unbounded fractional triangle packing is impossible'
        leaving=min(candidates,key=lambda i:(rows[i][-1]/rows[i][entering],basis[i]))
        divisor=rows[leaving][entering]
        rows[leaving]=[z/divisor for z in rows[leaving]]
        for i in range(m):
            if i != leaving and rows[i][entering]:
                mult=rows[i][entering]
                rows[i]=[a-mult*b for a,b in zip(rows[i],rows[leaving])]
        r=reduced[entering]
        objective += r*rows[leaving][-1]
        reduced=[a-r*b for a,b in zip(reduced,rows[leaving][:-1])]
        basis[leaving]=entering; pivots+=1
        assert pivots<100000
    primal=[Q(0)]*n
    for i,j in enumerate(basis):
        if j<n: primal[j]=rows[i][-1]
    dual=[-reduced[n+e] for e in range(m)]
    verify_lp(g,tids,primal,dual,objective)
    return {'triangle_indices':tids,'primal':[rat(x) for x in primal],
            'dual':[rat(x) for x in dual],'value':rat(objective),
            'pivots':pivots,'certificate_verified':True}


def verify_lp(g,tids,primal,dual,value):
    assert len(primal)==len(tids) and len(dual)==len(g.edges)
    assert all(w>=0 for w in primal) and all(z>=0 for z in dual)
    for e in range(len(g.edges)):
        assert sum((w for t,w in zip(tids,primal) if e in g.triangles[t]),Q(0)) <= 1
    for t in tids: assert sum((dual[e] for e in g.triangles[t]),Q(0)) >= 1
    assert sum(primal,Q(0)) == sum(dual,Q(0)) == value


def attachment(core, roots):
    edges=set(core.edges); blocks=[]; nxt=core.n
    for root,size in roots:
        root=tuple(sorted(root)); assert root in edges
        vs=list(root)+list(range(nxt,nxt+size-2)); nxt+=size-2
        block=set(combinations(sorted(vs),2)); edges.update(block)
        blocks.append({'root':root,'size':size,'edges':sorted(block)})
    return Graph(edges,nxt),blocks


def book(r):
    assert isinstance(r,int) and r>=1
    return Graph([(0,1)]+[(v,tip) for tip in range(2,r+2) for v in (0,1)],r+2)


def petersen_cone():
    base={(i,(i+1)%5) for i in range(5)}|{(i,i+5) for i in range(5)}|{(5+i,5+(i+2)%5) for i in range(5)}
    return Graph(base|{(10,i) for i in range(10)},11)


def direct_graph_record(name,g, designated=None):
    full=rational_lp(g); t=Q(*full['value'])
    cs=g.mincovers(); c=g.cover_value(g.alltri); nu=g.pack_value(g.alltri)
    if designated is not None: assert designated in cs
    weights={ti:Q(*w) for ti,w in zip(full['triangle_indices'],full['primal'])}
    evals=[]
    for cov in cs:
        mass=[Q(0)]*4
        for i,tri in enumerate(g.tm): mass[(tri&cov).bit_count()]+=weights[i]
        assert mass[0]==0 and sum(mass)==t
        redload=sum((j*mass[j] for j in range(4)),Q(0))
        assert redload<=c and mass[2]+2*mass[3]<=c-t
        eligible=g.eligible(cov); k=g.pack_value(eligible)
        assert k>=ceil((3*t-c)/4)
        evals.append({'cover_indices':list(bits(cov)),'a_j':[rat(x) for x in mass],
                      'eligible_integral_optimum':k})
    worst=max(cs,key=lambda cov:sum((weights[i] for i,tri in enumerate(g.tm) if tri&cov==tri),Q(0)))
    chosen=designated if designated is not None else worst
    elp=rational_lp(g,g.eligible(chosen))
    target=ceil(Q(c,2)); hist=Counter(row['eligible_integral_optimum'] for row in evals)
    out={'name':name,'n':g.n,'edges':[list(e) for e in g.edges],
         'triangles_vertices':[list(t) for t in g.vertices],
         'tau':c,'nu':nu,'number_of_minimum_covers':len(cs),'k_histogram':dict(sorted(hist.items())),
         'full_lp':full,'gap':rat(Q(c)-t),'fractional_lower_bound':ceil((3*t-c)/4),
         'S_threshold':target,'all_minima_S':min(hist)>=target,
         'selected_cover_indices':list(bits(chosen)),'selected_packing_triangle_indices':g.packing(g.eligible(chosen)),
         'selected_eligible_lp':elp,'minimum_cover_mass_checks':evals}
    if designated is not None:
        out['designated_k']=g.pack_value(g.eligible(designated))
    return out


def attachment_record(name,core,roots, expect_distinct=True):
    g,blocks=attachment(core,roots)
    rootset={tuple(sorted(r)) for r,s in roots}; b=sum(s-3 for r,s in roots)
    residual=Graph(set(core.edges)-rootset,core.n)
    cs=g.mincovers(); expected_tau=2*b+residual.cover_value(residual.alltri)
    data={'name':name,'core_edges':core.edges,'roots':roots,'n':g.n,'edges':g.edges,
          'actual_tau':g.cover_value(g.alltri),'naive_formula_tau':expected_tau,
          'actual_nu':g.pack_value(g.alltri),'formula_nu':b+core.pack_value(core.alltri),
          'minimum_cover_count':len(cs),'distinct_roots':len(rootset)==len(roots)}
    if not expect_distinct:
        assert data['actual_tau']!=expected_tau
        data['negative_control_detected']=True
        return data
    assert len(rootset)==len(roots)
    assert data['actual_tau']==expected_tau and data['actual_nu']==data['formula_nu']
    rows=[]
    for c in cs:
        ce={g.edges[i] for i in bits(c)}
        cr=emask(i for i,e in enumerate(residual.edges) if e in ce)
        sh=emask(i for i,e in enumerate(core.edges) if e in ce)
        assert residual.iscover(cr) and cr.bit_count()==residual.cover_value(residual.alltri)
        assert core.iscover(sh)
        for block in blocks:
            local=Graph(block['edges'])
            cl=emask(i for i,e in enumerate(local.edges) if e in ce)
            assert cl.bit_count()==2*(block['size']-3) and local.iscover(cl)
            root_index=local.edges.index(tuple(block['root']))
            avail=local.eligible(cl)&~local.hits[root_index]
            assert local.pack_value(avail)==block['size']-3
        kg=g.pack_value(g.eligible(c)); kh=core.pack_value(core.eligible(sh))
        assert kg==b+kh and kg>=b+residual.pack_value(residual.eligible(cr))
        rows.append({'cover_indices':list(bits(c)),'k_G':kg,'k_H_core_restriction':kh,
                     'core_restriction_size':sh.bit_count(),'residual_restriction_size':cr.bit_count()})
    data['all_minimum_cover_identity_checks']=rows
    data['passed']=True
    return data


def clauses(g,c,packing,s):
    assert not s&~c
    allred=[t for t in g.tm if t&c==t]
    admissible=not any(t&s==t for t in allred) and all(g.tm[i]&s for i in packing if g.tm[i]&c==g.tm[i])
    if not admissible: return None
    pos=set(); neg=set(); forced_one=set(); forced_zero=set()
    for i,t in enumerate(g.tm):
        reds=t&c; blues=t&~c; count=reds.bit_count()
        if count==1 and reds&s:
            pos.add(tuple(bits(blues)))
        if count==2 and reds&s==reds:
            forced_one.update(bits(blues))
        if i in packing:
            if count==2 and not reds&s: forced_zero.update(bits(blues))
            if count==1 and not reds&s: neg.add(tuple(bits(blues)))
    return pos,neg,forced_one,forced_zero


def satisfies(system,b):
    pos,neg,ones,zero=system
    return (all((b>>u&1) or (b>>v&1) for u,v in pos)
            and all(not ((b>>u&1) and (b>>v&1)) for u,v in neg)
            and all(b>>u&1 for u in ones) and all(not (b>>u&1) for u in zero))


def cut_solve(blue,system):
    pos,neg,ones,zero=system
    adj={v:set() for v in blue}
    for u,v in pos|neg: adj[u].add(v);adj[v].add(u)
    color={}
    for v in blue:
        if v in color: continue
        color[v]=0; todo=[v]
        while todo:
            u=todo.pop()
            for w in adj[u]:
                if w not in color: color[w]=1-color[u];todo.append(w)
                elif color[w]==color[u]: return {'bipartite':False}
    ix={v:i for i,v in enumerate(blue)}; source=len(blue);sink=source+1
    cap={}; M=len(blue)+1
    def arc(u,v,c):cap[u,v]=cap.get((u,v),0)+c
    for v in blue:
        if color[v]==0: arc(ix[v],sink,1)
        else: arc(source,ix[v],1)
    for u,v in pos:
        l,r=(u,v) if color[u]==0 else (v,u)
        arc(ix[r],ix[l],M)
    for u,v in neg:
        l,r=(u,v) if color[u]==0 else (v,u)
        arc(ix[l],ix[r],M)
    for v in ones|zero:
        # Both opposite forced values are retained and make min-cut >=M.
        for x in (1 if v in ones else None,0 if v in zero else None):
            if x is None: continue
            y=x if color[v]==0 else 1-x
            arc(source,ix[v],M) if y else arc(ix[v],sink,M)
    residual=dict(cap)
    for u,v in list(cap):residual.setdefault((v,u),0)
    flow=0
    while True:
        prev={source:None}; q=deque([source])
        while q and sink not in prev:
            u=q.popleft()
            for v in range(sink+1):
                if v not in prev and residual.get((u,v),0)>0:prev[v]=u;q.append(v)
        if sink not in prev: break
        v=sink; amount=10**9
        while prev[v] is not None:amount=min(amount,residual[prev[v],v]);v=prev[v]
        v=sink
        while prev[v] is not None:
            u=prev[v];residual[u,v]-=amount;residual[v,u]=residual.get((v,u),0)+amount;v=u
        flow+=amount
    reachable={source}; todo=[source]
    while todo:
        u=todo.pop()
        for v in range(sink+1):
            if v not in reachable and residual.get((u,v),0)>0:reachable.add(v);todo.append(v)
    value=sum(c for (u,v),c in cap.items() if u in reachable and v not in reachable)
    assert value==flow
    # Verify a feasible integral net flow certificate, including antiparallel arcs.
    net={(u,v):cap.get((u,v),0)-residual.get((u,v),0) for u in range(sink+1) for v in range(sink+1)}
    for u in range(sink+1):
        for v in range(sink+1):
            assert net[u,v]==-net[v,u]
            assert net[u,v]<=cap.get((u,v),0)
        assert sum(net[u,v] for v in range(sink+1))==(flow if u==source else -flow if u==sink else 0)
    b=emask(v for v in blue if (int(ix[v] in reachable) if color[v]==0 else 1-int(ix[v] in reachable)))
    feasible=value<M
    if feasible:assert satisfies(system,b) and b.bit_count()==value
    return {'bipartite':True,'feasible':feasible,'value':value,'M':M,
            'selected_blue_indices':list(bits(b)) if feasible else None,
            'source_side':sorted(reachable),'left_blue_indices':[v for v in blue if color[v]==0],
            'arcs':[[u,v,c] for (u,v),c in sorted(cap.items())],
            'net_flow':[[u,v,f] for (u,v),f in sorted(net.items()) if f>0],
            'verified_flow_equals_cut':True}


def cut_audit(name,g,c,p):
    assert g.iscover(c)
    assert all(not g.tm[t]&g.tm[u] for t,u in combinations(p,2))
    blue=list(bits(g.alledge & ~c)); red=list(bits(c)); rows=[]; assignment_count=0
    assert len(blue)<=12
    for ss in range(1<<len(red)):
        s=emask(red[i] for i in range(len(red)) if ss>>i&1)
        system=clauses(g,c,p,s)
        if system is None:continue
        min_direct=None; feasible_count=0
        for bb in range(1<<len(blue)):
            b=emask(blue[i] for i in range(len(blue)) if bb>>i&1)
            new=(c & ~s)|b
            direct=g.iscover(new) and all(1<=(g.tm[t]&new).bit_count()<=2 for t in p)
            claim=satisfies(system,b)
            assert claim==direct
            assignment_count+=1
            if direct:
                feasible_count+=1
                min_direct=b.bit_count() if min_direct is None else min(min_direct,b.bit_count())
        cut=cut_solve(blue,system)
        if cut['bipartite']:
            assert cut['feasible']==(min_direct is not None)
            if min_direct is not None:assert cut['value']==min_direct and min_direct>=s.bit_count()
        pos,neg,ones,zero=system
        rows.append({'deleted_red_indices':list(bits(s)),'positive_pairs':sorted(pos),'negative_pairs':sorted(neg),
                     'forced_one':sorted(ones),'forced_zero':sorted(zero),
                     'mixed_clause_signs':bool(pos and neg),'direct_optimum':min_direct,
                     'direct_feasible_assignment_count':feasible_count,'cut':cut})
    return {'name':name,'edges':g.edges,'triangles':g.vertices,'cover_indices':red,
            'packing_triangle_indices':p,'admissible_deletion_count':len(rows),
            'direct_assignment_equivalence_checks':assignment_count,'rows':rows}


def main(output):
    start=time.time(); graphs=[]; books=[]
    for r in (1,2):
        h=book(r); g,blocks=attachment(h,[(e,4) for e in h.edges])
        index={e:i for i,e in enumerate(g.edges)}
        c=0
        for block in blocks:
            fresh=set(v for e in block['edges'] for v in e)-set(block['root'])
            c |= 1<<index[tuple(block['root'])]
            c |= 1<<index[tuple(sorted(fresh))]
        row=direct_graph_record('K4_decorated_book_'+str(r),g,c)
        assert (row['tau'],row['nu'],row['designated_k'])==(4*r+2,2*r+2,2*r+1)
        assert row['number_of_minimum_covers']==9**r+2*5**r
        assert len(g.edges)==12*r+6 and len(g.tm)==9*r+4 and g.n==5*r+4
        seen={0};todo=[0]
        while todo:
            t=todo.pop()
            for j in bits(g.conflicts[t]):
                if j not in seen:seen.add(j);todo.append(j)
        assert len(seen)==len(g.tm)
        row['triangle_conflict_connected']=True
        graphs.append(row); books.append((g,c))
    for n in (5,6):graphs.append(direct_graph_record('K'+str(n),Graph(combinations(range(n),2),n)))
    graphs.append(direct_graph_record('Petersen_cone',petersen_cone()))
    even_endpoint=direct_graph_record('even_endpoint_two_disjoint_K5s',Graph(list(combinations(range(5),2))+list(combinations(range(5,10),2)),10))
    assert even_endpoint['tau']==8 and even_endpoint['gap']==[4,3] and even_endpoint['fractional_lower_bound']==3 and even_endpoint['k_histogram']=={4:100}
    graphs.append(even_endpoint)
    wheel=Graph([(i,(i+1)%5) for i in range(5)]+[(5,i) for i in range(5)],6)
    graphs.append(direct_graph_record('independently_selected_C5_wheel',wheel))
    for key,edges in KERNEL_EDGES.items():
        row=direct_graph_record('endpoint_'+key,Graph(edges,12))
        assert row['tau']==11 and Q(*row['full_lp']['value'])==Q(31,3)
        assert row['gap']==[2,3] and row['fractional_lower_bound']==5 and row['S_threshold']==6
        assert row['number_of_minimum_covers']==210 and row['k_histogram']=={7:210}
        graphs.append(row)
    ats=[attachment_record('one_K4_on_K4',Graph(combinations(range(4),2),4),[((0,1),4)]),
         attachment_record('mixed_K5_K4_on_triangle',Graph(combinations(range(3),2),3),[((0,1),5),((1,2),4)]),
         attachment_record('repeated_root_negative_control',Graph([(0,1)],2),[((0,1),4),((0,1),4)],False)]
    # Actual-graph cut controls: mixed positive/negative clauses and forced values.
    cutrows=[]
    g=Graph(combinations(range(4),2),4);ci={e:i for i,e in enumerate(g.edges)}
    c=emask(ci[e] for e in [(0,1),(2,3)])
    p=[g.vertices.index((0,2,3))]
    cutrows.append(cut_audit('K4_mixed_sign_control',g,c,p))
    wi={e:i for i,e in enumerate(wheel.edges)}
    wc=emask(wi[tuple(sorted((5,i)))] for i in (0,2,4))
    wp=[wheel.vertices.index(tuple(sorted(t))) for t in [(0,4,5),(1,2,5)]]
    assert wc in wheel.mincovers()
    cutrows.append(cut_audit('wheel_forced_values_and_pairs',wheel,wc,wp))
    g=Graph(combinations(range(5),2),5); cs=g.mincovers()
    for j,c in enumerate(cs[:2]):cutrows.append(cut_audit('K5_cover_'+str(j),g,c,g.packing()))
    assert any(r['mixed_clause_signs'] and r['cut']['bipartite'] for a in cutrows for r in a['rows'])
    assert any(r['forced_one'] for a in cutrows for r in a['rows'])
    assert any(r['forced_zero'] for a in cutrows for r in a['rows'])
    # Explicit abstract pair/unit systems exercise infeasibility and opposing
    # implications. They test the cut representation itself, not graph existence.
    abstract=[]
    systems=[({(0,1)},set(),set(),{0,1}),
             (set(),{(0,1)},{0,1},set()),
             (set(),set(),{0},{0}),
             ({(0,1)},{(0,1)},{0},set())]
    for j,system in enumerate(systems):
        valid=[b for b in range(4) if satisfies(system,b)]
        direct=min((b.bit_count() for b in valid),default=None)
        cut=cut_solve([0,1],system)
        assert cut['bipartite'] and cut['feasible']==(direct is not None)
        if direct is not None:assert cut['value']==direct
        abstract.append({'name':'abstract_pair_unit_'+str(j),'positive_pairs':sorted(system[0]),
                         'negative_pairs':sorted(system[1]),'forced_one':sorted(system[2]),
                         'forced_zero':sorted(system[3]),'direct_optimum':direct,'cut':cut})
    assert sum(not r['cut']['feasible'] for r in abstract)==3
    # Analytic rational certificates provide a distinct solver-free control.
    uniform=[]
    for n in (5,6):
        g=Graph(combinations(range(n),2),n)
        primal=[Q(1,n-2)]*len(g.tm);dual=[Q(1,3)]*len(g.edges)
        value=Q(n*(n-1),6);verify_lp(g,list(range(len(g.tm))),primal,dual,value)
        uniform.append({'graph':'K'+str(n),'primal_weight':rat(Q(1,n-2)),
                        'dual_weight':rat(Q(1,3)),'value':rat(value),'verified':True})
    # A distinct solver-free certificate for every decorated book: each leaf
    # contributes its four faces at weight 1/2; a minimum cover is a dual.
    for r,(g,c) in enumerate(books,1):
        h=book(r); core_triangles=set(h.vertices)
        primal=[Q(0) if t in core_triangles else Q(1,2) for t in g.vertices]
        dual=[Q(int(c>>e&1)) for e in range(len(g.edges))]
        verify_lp(g,list(range(len(g.tm))),primal,dual,Q(c.bit_count()))
        uniform.append({'graph':'K4_decorated_book_'+str(r),'certificate':'weight 1/2 on each leaf face, zero on core; dual designated minimum cover','value':rat(Q(c.bit_count())),'verified':True})
    # Dropping a negative clause from an actual K4 permits a cover making P all-red.
    kg=Graph(combinations(range(4),2),4); ki={e:i for i,e in enumerate(kg.edges)}
    kc=emask(ki[e] for e in [(0,1),(2,3)]); kp=[kg.vertices.index((0,2,3))]
    ks=1<<ki[0,1]; system=clauses(kg,kc,kp,ks)
    assert system is not None and system[0] and system[1]
    weakened=(system[0],set(),system[2],system[3]); kb=None
    blue=list(bits(kg.alledge & ~kc))
    for bb in range(1<<len(blue)):
        b=emask(blue[i] for i in range(len(blue)) if bb>>i&1)
        if satisfies(weakened,b) and not satisfies(system,b):kb=b;break
    assert kb is not None
    new=(kc & ~ks)|kb
    assert kg.iscover(new) and any((kg.tm[t]&new).bit_count()==3 for t in kp)
    negative_clause_control={'graph':'K4','edges':kg.edges,'C':list(bits(kc)),
       'S':list(bits(ks)),'P_triangle_indices':kp,'B':list(bits(kb)),
       'cover_preserved':True,'packing_eligibility_failed':True}
    # Certificate corruption must fail independently of simplex execution.
    g=Graph(combinations(range(5),2),5)
    try:verify_lp(g,list(range(len(g.tm))),[Q(1)]*len(g.tm),[Q(1,3)]*len(g.edges),Q(10,3))
    except AssertionError:corruption_detected=True
    else:raise AssertionError('Corrupt certificate accepted')
    data={'scope':'Independent fixed T4/T5 controls; no general S/E claim.',
          'input_provenance':{'kernel_data_only':'S/evidence/track_b_fractional.json name,n,edges fields; no LP or integral outputs imported',
                              'kernel_edge_literal_sha256':hashlib.sha256(json.dumps(KERNEL_EDGES,sort_keys=True).encode()).hexdigest(),
                              'old_code_imports':False,
                              'author_edge_data_container_sha256':'303eef782f2d1d2938b7d5a4bf3e2e9792555c6c91a3b557594719ed4110a48c'},
          'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
          'arithmetic':'fractions.Fraction only; no floating candidate locator or optimizer',
          'graphs':graphs,'attachments':ats,'cut_audits':cutrows,'abstract_cut_audits':abstract,'uniform_rational_controls':uniform,
          'negative_LP_certificate_detected':corruption_detected,
          'omitting_negative_clause_control':negative_clause_control,
          'elapsed_seconds':time.time()-start,'status':'PASS'}
    Path(output).write_text(json.dumps(data,indent=2)+'\n')
    print(json.dumps({'status':'PASS','graph_count':len(graphs),'graphs':[{k:g[k] for k in ['name','tau','nu','number_of_minimum_covers','gap','fractional_lower_bound','k_histogram']} for g in graphs],
                      'cut_assignments':sum(a['direct_assignment_equivalence_checks'] for a in cutrows),
                      'cut_systems':sum(a['admissible_deletion_count'] for a in cutrows),
                      'elapsed_seconds':data['elapsed_seconds'],'output':str(output)},indent=2))

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--output',required=True)
    args=p.parse_args();main(args.output)
