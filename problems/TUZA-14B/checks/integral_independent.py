#!/usr/bin/env python3
"""Independent exact finite graph-triangle audit, authored 2026-11-02.

No historical checker is imported or executed. Only explicitly named JSON
edge lists, designated covers and block vertex lists are borrowed as input data.
All triangles are reconstructed from actual graph adjacency. All optimization
uses integer subset recursion (with a separately justified exhaustive cone
cover formula); no numerical solver, graph library or package is required.
"""
import argparse
from collections import Counter
from functools import lru_cache
from hashlib import sha256
from itertools import combinations
import json
from pathlib import Path
import signal
import resource
import platform
from datetime import datetime, timezone
import sys
import time

W = Path(__file__).resolve().parents[1]
ROOT = W.parent
SOURCE14B = ROOT / 'TUZA-14B'
SOURCE14 = ROOT / 'TUZA-14'
SOURCE13 = ROOT / 'TUZA-13'

class Incomplete(RuntimeError):
    pass

def bits(mask):
    while mask:
        bit = mask & -mask
        yield bit.bit_length()-1
        mask ^= bit

def timer_expired(signum, frame):
    raise Incomplete('wall-time cap reached; incomplete is not a pass')

class Graph:
    def __init__(self, n, edges):
        self.n = n
        self.edges = sorted(set(tuple(sorted(e)) for e in edges))
        assert all(0 <= u < v < n for u,v in self.edges)
        self.index = {e:i for i,e in enumerate(self.edges)}
        self.adj = [set() for _ in range(n)]
        for u,v in self.edges:
            self.adj[u].add(v); self.adj[v].add(u)
        self.triangles = [q for q in combinations(range(n),3)
                          if all(v in self.adj[u] for u,v in combinations(q,2))]
        self.tm = [sum(1 << self.index[e] for e in combinations(q,2))
                   for q in self.triangles]
        self.full = (1 << len(self.tm))-1
        self.edge_hits = [sum(1 << j for j,t in enumerate(self.tm) if t>>i&1)
                          for i in range(len(self.edges))]
        self.conflicts = [sum(1 << j for j,u in enumerate(self.tm) if t&u)
                          for t in self.tm]
        self.cover_value_calls = 0
        self.packing_calls = 0
        self.cover_cache_cap = 1500000
        self._value = lru_cache(None)(self._value_raw)
        self._pack = lru_cache(None)(self._pack_raw)

    def edge_mask(self, edges):
        return sum(1 << self.index[tuple(sorted(e))] for e in edges)

    def edge_list(self, mask):
        return [self.edges[i] for i in bits(mask)]

    def triangle_list(self, mask):
        return [self.triangles[i] for i in bits(mask)]

    def _value_raw(self, family):
        self.cover_value_calls += 1
        if self.cover_value_calls > self.cover_cache_cap:
            raise Incomplete('cover dynamic-program state cap reached')
        if family == 0:
            return 0
        # Any cover must choose at least one of the three actual edges of q.
        # Picking the most heavily constrained q affects speed only.
        q = max(bits(family), key=lambda j: sum((family & self.edge_hits[e]).bit_count()
                                               for e in bits(self.tm[j])))
        return 1 + min(self._value(family & ~self.edge_hits[e]) for e in bits(self.tm[q]))

    def minimum_covers(self, family=None, count_cap=250000):
        family = self.full if family is None else family
        tau = self._value(family)
        @lru_cache(None)
        def collect(f):
            if not f:
                return frozenset([0])
            val = self._value(f)
            q = next(bits(f))
            found = set()
            for e in bits(self.tm[q]):
                rest = f & ~self.edge_hits[e]
                if self._value(rest) == val-1:
                    found.update(c | (1 << e) for c in collect(rest))
                    if len(found)>count_cap:
                        raise Incomplete('all-minimum-cover enumeration cap reached')
            return frozenset(found)
        covers = sorted(collect(family))
        assert covers and all(c.bit_count()==tau and self.is_cover(c,family) for c in covers)
        return tau,covers

    def cone_minimum_covers(self):
        # Detect that EVERY actual triangle contains the same apex. Each cover
        # consists of selected spokes S and precisely the remaining uncovered
        # rim edges E(U), U=V(base)\S. An additional rim edge is redundant.
        # Thus all subsets U, not just independent U, must be enumerated.
        common = set.intersection(*(set(t) for t in self.triangles)) if self.tm else set()
        if not common:
            return self.minimum_covers()
        apex = min(common)
        base = sorted(set(v for t in self.triangles for v in t if v!=apex))
        assert len(base)<=22
        loc={v:i for i,v in enumerate(base)}
        rims=[(self.index[tuple(sorted((u,v)))],1<<loc[u],1<<loc[v])
              for t in self.triangles for u,v in [tuple(x for x in t if x!=apex)]]
        spoke=[self.index[tuple(sorted((v,apex)))] for v in base]
        best=len(self.edges)+1; answer=[]
        for U in range(1 << len(base)):
            inside=[i for i,u,v in rims if U&u and U&v]
            cost=len(base)-U.bit_count()+len(inside)
            if cost>best: continue
            c=sum(1<<spoke[j] for j in range(len(base)) if not U>>j&1)
            c |= sum(1<<i for i in inside)
            if cost<best: best=cost; answer=[]
            answer.append(c)
        answer=sorted(set(answer))
        assert all(c.bit_count()==best and self.is_cover(c) for c in answer)
        return best,answer

    def is_cover(self, cover, family=None):
        return all(cover & self.tm[j] for j in bits(self.full if family is None else family))

    def eligible(self, cover):
        return sum(1<<j for j,t in enumerate(self.tm) if 1 <= (cover&t).bit_count() <= 2)

    def private(self, cover):
        return sum(1<<j for j,t in enumerate(self.tm) if (cover&t).bit_count()==1)

    def _pack_raw(self, family):
        self.packing_calls+=1
        if self.packing_calls>2000000:
            raise Incomplete('packing dynamic-program state cap reached')
        if not family: return 0
        # Exact independent-set recurrence on the ACTUAL-edge conflict graph.
        q=max(bits(family),key=lambda j:(self.conflicts[j]&family).bit_count())
        without=self._pack(family & ~(1<<q))
        withq=(1<<q) | self._pack(family & ~self.conflicts[q])
        return withq if withq.bit_count()>without.bit_count() else without

    def packing(self, family=None):
        family=self.full if family is None else family
        if not family: return 0
        common=set.intersection(*(set(self.triangles[j]) for j in bits(family)))
        if common:
            apex=min(common)
            # Common-apex triangle packings are exactly matchings of their rim
            # edges. Vertex deletion recursion explicitly includes unmatched v.
            vertices=sorted(set(v for j in bits(family) for v in self.triangles[j] if v!=apex))
            idx={v:i for i,v in enumerate(vertices)}
            incident=[[] for v in vertices]
            for j in bits(family):
                u,v=[v for v in self.triangles[j] if v!=apex]
                incident[idx[u]].append((idx[v],j)); incident[idx[v]].append((idx[u],j))
            @lru_cache(None)
            def match(active):
                if not active: return 0
                u=next(bits(active)); rest=active & ~(1<<u)
                best=match(rest)
                for v,j in incident[u]:
                    if rest>>v&1:
                        option=(1<<j)|match(rest & ~(1<<v))
                        if option.bit_count()>best.bit_count(): best=option
                return best
            ans=match((1<<len(vertices))-1)
        else:
            ans=self._pack(family)
        used=0
        for j in bits(ans):
            assert family>>j&1 and not used & self.tm[j]
            used |= self.tm[j]
        return ans

    def stats(self):
        return {'cover_value_states':self.cover_value_calls,'packing_states':self.packing_calls}


def load_data(path, mapper):
    raw=path.read_bytes(); d=json.loads(raw)
    selected=mapper(d)
    for item in selected:
        item['provenance']={'borrowed_data_only':str(path),'sha256':sha256(raw).hexdigest(),
                            'selected_fields':'actual n, edge list, designated cover/block vertices only; old computed optima not used'}
    return selected

def inputs():
    out=[{'name':f'K{n}','n':n,'edges':list(combinations(range(n),2))} for n in range(4,8)]
    blocks=[[0,1,7,8],[0,2,3,6],[2,4,5,8]]
    out.append({'name':'nine_vertex_K4_ring','n':9,
                'edges':sorted(set(e for b in blocks for e in combinations(b,2))),
                'cover':[(0,2),(0,8),(1,7),(2,8),(3,6),(4,5)],'blocks':blocks})
    out+=load_data(SOURCE14/'witnesses/track_a_unique_prepacking.json',lambda d:[
        {'name':'unique_private_not_extendible','n':d['n'],'edges':d['edges'],
         'cover':d['cover'],'forced_private_triangle':d['unique_private_witness'],
         'blocks':list(d['blocks'][k] for k in ('K5','K4'))}])
    out+=load_data(SOURCE14/'witnesses/track_a_private_multiplicity_two_reduced.json',lambda d:[
        {'name':'twenty_vertex_private_obstruction','n':d['n'],'edges':d['edges'],'cover':d['cover']}])
    out+=load_data(SOURCE13/'witnesses/hostile_Clebsch_cone.json',lambda d:[
        {'name':'Clebsch_cone','n':d['n'],'edges':d['edges'],'cover':d['rows'][0]['cover']}])
    out+=load_data(SOURCE13/'witnesses/theory_tau_drop_minimized.json',lambda d:[
        {'name':'all_red_eligibility_drops_cover_optimum','n':d['input']['n'],'edges':d['input']['edges'],
         'cover':d['minimum_C']}])
    # Historical certificate JSON is used solely as an edge/block input file.
    out+=load_data(SOURCE14B/'evidence/one_slack_kernel_certificates.json',lambda d:[
        {'name':'twelve_vertex_one_slack_kernel','n':r['n'],'edges':r['edges'],'blocks':r['blocks']}
        for r in d['records'] if r.get('blocks')])
    # Constructed sharp two-slack interface: six edge-disjoint private crossing
    # triangles force the six-red internal-K4 cover of a K5 to be globally minimum.
    reds=list(combinations(range(4),2)); edges=list(combinations(range(5),2))
    for i,(u,v) in enumerate(reds):edges.extend([(u,5+i),(v,5+i)])
    out.append({'name':'constructed_T3_red_root_crossing_boundary','n':11,'edges':edges,
                'cover':reds,'blocks':[list(range(5))],'t3_positive':True,
                'provenance':{'construction':'Independent K5 plus one fresh degree-two private K3 on each edge of the internal K4'}})
    out+=load_data(SOURCE14B/'evidence/track_b_two_slack.json',lambda d:[
        {'name':f'twelve_vertex_two_slack_kernel_{i+1}','n':r['n'],'edges':r['edges'],'blocks':r['blocks']}
        for i,r in enumerate(d['records'])])
    return out


def check_blocks(g, cover, blocks):
    total=[]; rows=[]; used=0
    for vertices in blocks:
        e=[e for e in combinations(sorted(vertices),2)]
        assert all(x in g.index for x in e)
        support=g.edge_mask(e)
        assert not used & support, 'blocks must be EDGE-disjoint'
        used |= support
        family=sum(1<<i for i,t in enumerate(g.tm) if t & support == t)
        eligible=g.eligible(cover)&family
        p=g.packing(eligible)
        total.extend(g.triangle_list(p))
        rows.append({'vertices':vertices,'red_edges':g.edge_list(cover&support),
                     'eligible_packing':g.triangle_list(p)})
    return {'rows':rows,'local_sum':len(total),'packing':total,
            'crossing_triangles':[t for i,t in enumerate(g.triangles)
                                  if not any(set(t)<=set(b) for b in blocks)]}


def audit_graph(data):
    started=time.monotonic(); g=Graph(data['n'],data['edges'])
    common=set.intersection(*(set(t) for t in g.triangles)) if g.tm else set()
    tau,covers=g.cone_minimum_covers() if common and g.n>=12 else g.minimum_covers()
    nu=g.packing().bit_count(); rows=[]
    for c in covers:
        ef=g.eligible(c); p=g.packing(ef)
        row={'cover':g.edge_list(c),'k':p.bit_count(),'eligible_packing':g.triangle_list(p)}
        if 'blocks' in data:
            row['literal_block_check']=check_blocks(g,c,data['blocks'])
        rows.append(row)
    ks=[r['k'] for r in rows]
    result={'name':data['name'],'n':g.n,'edges':g.edges,'triangles':g.triangles,
            'provenance':data.get('provenance',{'construction':'independent explicit complete graph or stated K4-ring blocks'}),
            'tau':tau,'nu':nu,'full_packing':g.triangle_list(g.packing()),
            'all_minimum_covers_complete':True,'minimum_cover_count':len(covers),
            'k_histogram':dict(sorted(Counter(ks).items())),
            'S_every_minimum_cover':min(ks)>=(tau+1)//2,
            'E_some_minimum_cover':max(ks)>=(tau+1)//2,
            'all_minimum_cover_rows':rows}
    if 'cover' in data:
        c=g.edge_mask(data['cover']); assert c in covers
        ef=g.eligible(c); pf=g.private(c)
        result['designated']={'cover':g.edge_list(c),'k':g.packing(ef).bit_count(),
                             'private_k':g.packing(pf).bit_count(),
                             'all_red_triangles':g.triangle_list(g.full & ~ef)}
        if data.get('t3_positive'):
            local=Graph(5,combinations(range(5),2)); _,local_covers=local.minimum_covers()
            q=g.triangles.index((0,1,5)); root=g.index[(0,1)]
            assert (g.tm[q]&c).bit_count()==1 and c>>root&1
            block_edges=g.edge_mask(combinations(range(5),2))
            local_eligible=g.eligible(c)&sum(1<<j for j,t in enumerate(g.tm) if t&block_edges==t)
            p=g.packing(local_eligible & ~g.edge_hits[root]); assert p.bit_count()==2
            replacement=next(lc for lc in local_covers if not lc>>local.index[(0,1)]&1)
            new=g.edge_mask(local.edge_list(replacement))
            assert not new&g.tm[q]
            result['positive_boundary']={'B':4,'tau':tau,'slack':tau-4,
                'crossing_private_triangle':g.triangles[q],'root':g.edges[root],'root_is_RED':True,
                'local_eligible_pair_avoiding_root':g.triangle_list(p),
                'combined_threshold_packing':g.triangle_list(p | (1<<q)),
                'local_minimum_cover_replacement':g.edge_list(new),
                'replacement_uncovered_crossing_triangle':g.triangles[q],
                'global_minimum_lower_bound_packing':[(u,v,5+i) for i,(u,v) in enumerate(combinations(range(4),2))]}
            assert tau==6 and g.packing(p | (1<<q)).bit_count()==3
        if data['name']=='all_red_eligibility_drops_cover_optimum':
            eligible_tau,eligible_covers=g.minimum_covers(ef)
            result['negative_control']={'full_triangle_tau':tau,'eligible_triangle_tau':eligible_tau,
               'eligible_cover':g.edge_list(eligible_covers[0]),'strict_drop_detected':eligible_tau<tau}
            assert eligible_tau<tau
        if 'forced_private_triangle' in data:
            q=tuple(data['forced_private_triangle']);j=g.triangles.index(q)
            assert pf>>j&1
            red=g.tm[j]&c
            assert sum(1 for t in g.tm if t&c==red)==1
            forced=(1<<j)|g.packing(ef & ~g.conflicts[j])
            result['negative_control']={'unique_private_triangle':q,
                'unforced_optimum':g.packing(ef).bit_count(),'forced_optimum':forced.bit_count(),
                'forced_packing':g.triangle_list(forced),
                'excluded_from_every_maximum_eligible_packing':forced.bit_count()<g.packing(ef).bit_count()}
            assert forced.bit_count()<g.packing(ef).bit_count()
    result['stats']=g.stats(); result['seconds']=time.monotonic()-started
    return result


def brute_minimum_covers(g):
    # Separate exhaustive cardinality-by-cardinality edge-subset oracle.
    for size in range(len(g.edges)+1):
        ans=[sum(1<<i for i in choice) for choice in combinations(range(len(g.edges)),size)
             if all(any(g.tm[j]>>e&1 for e in choice) for j in range(len(g.tm)))]
        if ans:return size,set(ans)


def census(maxn):
    started=time.monotonic(); counts=Counter(); optcounts=Counter(); c_hist=Counter(); violations=[]
    for n in range(maxn+1):
        complete=list(combinations(range(n),2))
        for graph_mask in range(1<<len(complete)):
            g=Graph(n,[complete[i] for i in bits(graph_mask)])
            tau,covers=g.minimum_covers(); nu=g.packing().bit_count()
            if n<=5:
                if g.tm and set.intersection(*(set(t) for t in g.triangles)):
                    ct,cc=g.cone_minimum_covers()
                    assert ct==tau and set(cc)==set(covers)
                bt,bc=brute_minimum_covers(g)
                assert tau==bt and set(covers)==bc
                # A second independent packing oracle enumerates every triangle subset.
                naive=0
                for pf in range(1<<len(g.tm)):
                    used=0; valid=True
                    for j in bits(pf):
                        if used&g.tm[j]:valid=False;break
                        used|=g.tm[j]
                    if valid:naive=max(naive,pf.bit_count())
                assert nu==naive
            ks=[g.packing(g.eligible(c)).bit_count() for c in covers]
            c_hist[(tau,nu,min(ks),max(ks))]+=1
            counts[n]+=1; optcounts[n]+=len(covers)
            if min(ks)<(tau+1)//2:
                violations.append({'n':n,'edges':g.edges,'tau':tau,'nu':nu,
                                   'covers':[g.edge_list(c) for c in covers],'k_values':ks})
            # These checks are universally quantified only within this finite domain.
            for c,k in zip(covers,ks):
                allred=any(c&t==t for t in g.tm)
                assert not(allred and k<=3) or tau<=6
                if allred and k<=2:
                    assert nu==k==2 and tau in (3,4)
                    found=False
                    for core in combinations(range(n),5):
                        if not all(set(t)<=set(core) for t in g.triangles):continue
                        induced=sum(v in g.adj[u] for u,v in combinations(core,2))
                        if induced in (9,10):found=True;break
                    assert found, 'all-red k<=2 support must lie in induced K5 or K5-e'
                assert nu>3 or k==nu
                assert tau>8 or k>=(tau+1)//2
    return {'status':'COMPLETE','domain':f'ALL labelled simple graphs on vertex sets {{0,...,n-1}} for 0<=n<={maxn}',
            'graph_counts_by_n':dict(counts),'minimum_cover_pair_counts_by_n':dict(optcounts),
            'graph_total':sum(counts.values()),'all_minimum_cover_pairs_total':sum(optcounts.values()),
            'all_minimum_cover_enumerations_complete':True,
            'brute_force_crosscheck':{'graphs_through_n':min(maxn,5),'covers':'ALL edge subsets in increasing cardinality','packing':'ALL triangle subsets'},
            'S_every_minimum_cover_failures':len(violations),'E_some_minimum_cover_failures':sum(1 for v in violations if max(v['k_values'])<(v['tau']+1)//2),
            'counterexamples':violations,'parameter_histogram':[{ 'tau':t,'nu':v,'min_k':a,'max_k':b,'graphs':c } for (t,v,a,b),c in sorted(c_hist.items())],
            'seconds':time.monotonic()-started}


def local_tables():
    records=[]; negative=[]
    for n in [4,5]:
        g=Graph(n,combinations(range(n),2)); tau,mins=g.minimum_covers()
        for c in range(1<<len(g.edges)):
            if not g.is_cover(c): continue
            size=c.bit_count(); ef=g.eligible(c); rows=[]
            for e in range(len(g.edges)):
                family=ef & ~g.edge_hits[e]; p=g.packing(family)
                row={'avoided_edge':g.edges[e],'red_root':bool(c>>e&1),'k':p.bit_count(),'packing':g.triangle_list(p)}
                rows.append(row)
                required=((size<=tau+1) or (n==4 and size<=4) or (n==5 and size<=6 and c>>e&1))
                if required:assert p.bit_count()>=n//2-1+(n==5)
                if n==5 and size==6 and not c>>e&1 and p.bit_count()<2:
                    negative.append({'cover':g.edge_list(c),**row})
            if size<=tau+2:
                records.append({'n':n,'cover':g.edge_list(c),'size':size,'minimum':c in mins,'root_avoidance':rows})
    assert negative
    return {'status':'COMPLETE','scope':'Every actual-edge cover of labelled K4 or K5; every possible avoided edge. Rows retained through local minimum+2.',
            'tables':records,'K5_six_red_arbitrary_blue_root_failures':negative}


def t1_local_interfaces():
    # The author mathematical tables, independently encoded from their stated
    # vertex formulas. No historical checker/evidence local table is read.
    a,b,c,x,y,z=range(6)
    compulsory_red=[(a,b),(a,c),(b,c)]
    blue=[(a,x),(b,x),(c,x),(a,y),(c,y),(b,z),(c,z)]
    optional=[(x,y),(x,z),(y,z)]
    specs={'L0':[(a,c),(c,z),(b,x),(x,y)],
           'LA':[(a,x),(a,y),(b,c),(c,z),(b,x)],
           'LC1':[(c,y),(c,z),(a,c),(b,x)],
           'LC2':[(c,y),(c,z),(b,c),(a,x)],
           'LC3':[(c,y),(c,z),(a,x),(b,x),(a,b)]}
    anchor_specs=[([(c,y),(c,z)],[(a,x,y),(b,c,x)]),
                  ([(c,y),(b,z)],[(a,x,y),(b,c,x)]),
                  ([(a,y),(c,z)],[(b,x,z),(a,c,x)]),
                  ([(a,y),(b,z)],[(a,b,x),(c,x,y)])]
    covers=[]; anchors=[]
    for pattern in range(8):
        red=compulsory_red+[e for i,e in enumerate(optional) if pattern>>i&1]
        g=Graph(6,red+blue); C=g.edge_mask(red)
        conditions={'L0':True,'LA':not pattern&1,'LC1':not pattern&1 and not pattern&4,
                    'LC2':not pattern&2 and not pattern&4,'LC3':not pattern&4}
        for name,L in specs.items():
            if not conditions[name]:continue
            present=[e for e in L if tuple(sorted(e)) in g.index]
            lc=g.edge_mask(present); assert g.is_cover(lc)
            if name.startswith('LC'):assert all(lc>>g.index[tuple(sorted(e))]&1 for e in [(c,y),(c,z)])
            covers.append({'optional_red_apex_edges':[e for i,e in enumerate(optional) if pattern>>i&1],
                           'name':name,'actual_edges':g.edges,'actual_triangles':g.triangles,
                           'local_cover':g.edge_list(lc),'size':lc.bit_count(),'all_triangles_hit':True})
        for forbidden,pair in anchor_specs:
            exists=all(tuple(sorted(t)) in g.triangles for t in pair)
            row={'optional_red_apex_edges':[e for i,e in enumerate(optional) if pattern>>i&1],
                 'forbidden_anchors':forbidden,'displayed_pair':pair,'actual_pair_exists':exists,
                 'final_C_branch':pattern==3}
            if exists:
                pf=sum(1<<g.triangles.index(tuple(sorted(t))) for t in pair)
                forbidden_mask=g.edge_mask(forbidden)
                assert g.packing(pf).bit_count()==2
                assert pf & ~g.eligible(C)==0
                assert not any(g.tm[j]&forbidden_mask for j in bits(pf))
                row['pair_edge_disjoint_eligible_and_avoids_anchors']=True
            if pattern==3:assert exists
            anchors.append(row)
    assert len(covers)==20
    forbidden_pairs=[]
    for complete in [False,True]:
        red=list(combinations(range(3),2))+([(3,4)] if complete else [])
        blue=[(v,w) for v in range(3) for w in [3,4]]
        g=Graph(5,red+blue);C=g.edge_mask(red);eligible=g.eligible(C)
        for pair in combinations(blue,2):
            banned=g.edge_mask(pair)
            family=sum(1<<j for j,t in enumerate(g.tm) if eligible>>j&1 and not t&banned)
            p=g.packing(family);common=set(pair[0])&set(pair[1])
            predicted_failure=bool(common) and (not complete or next(iter(common))<3)
            assert (p.bit_count()<2)==predicted_failure
            forbidden_pairs.append({'graph':'K5' if complete else 'K5-e','edges':g.edges,
                'red_edges':g.edge_list(C),'forbidden_blue_edges':pair,'maximum_eligible_size':p.bit_count(),
                'eligible_packing':g.triangle_list(p),'exceptional_pair':predicted_failure})
    return {'status':'COMPLETE','singleton_cover_rows':covers,'singleton_cover_row_count':len(covers),
            'four_anchor_pairs_all_optional_patterns':anchors,
            'two_apex_all_forbidden_blue_pairs':forbidden_pairs,
            'scope':'Local displayed cover/pair interfaces only; no global classification proof or T1 theorem inferred from this table.'}


def subset_selfcheck():
    g=Graph(5,combinations(range(5),2))
    cover_checks=0; packing_checks=0
    for family in range(1<<len(g.tm)):
        tau,covers=g.minimum_covers(family)
        brute=[]
        for size in range(len(g.edges)+1):
            brute=[sum(1<<i for i in choice) for choice in combinations(range(len(g.edges)),size)
                   if all(any(g.tm[j]>>e&1 for e in choice) for j in bits(family))]
            if brute:break
        assert tau==size and set(covers)==set(brute)
        cover_checks+=1
        best=0
        for sub in range(1<<len(g.tm)):
            if sub & ~family: continue
            used=0; valid=True
            for j in bits(sub):
                if used&g.tm[j]:valid=False;break
                used|=g.tm[j]
            if valid:best=max(best,sub.bit_count())
        assert g.packing(family).bit_count()==best
        packing_checks+=1
    return {'status':'COMPLETE','domain':'ALL 1024 subsets of the 10 actual K5 triangles',
            'all_minimum_cover_family_checks':cover_checks,'packing_family_checks':packing_checks,
            'independent_oracles':'All edge subsets in increasing cardinality for cover; all triangle subsets for packing.'}


def main():
    parser=argparse.ArgumentParser();parser.add_argument('job',choices=['controls','census','local','selfcheck','t1local'])
    parser.add_argument('--max-n',type=int,default=6);parser.add_argument('--seconds',type=int,default=600)
    parser.add_argument('--only'); args=parser.parse_args()
    signal.signal(signal.SIGALRM,timer_expired);signal.alarm(args.seconds)
    resource.setrlimit(resource.RLIMIT_CPU,(args.seconds,args.seconds+1))
    begin=time.monotonic(); result={'job':args.job,'wall_time_cap_seconds':args.seconds,
                                   'utc_started':datetime.now(timezone.utc).isoformat(),
                                   'python_executable':sys.executable,'python_version':sys.version,
                                   'machine':platform.machine(),'checker_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),
                                   'independence':'Fresh code; no historical checker implementation, critic note, or result used as optimizer. Borrowed witness DATA are explicitly labelled.'}
    output=W/'evidence'/f'integral_{args.job}{"_"+args.only if args.only else ""}.json'
    try:
        if args.job=='controls':
            result['rows']=[]
            for data in inputs():
                if args.only and args.only not in data['name']:continue
                row=audit_graph(data);result['rows'].append(row)
                print(json.dumps({'completed':row['name'],'tau':row['tau'],'nu':row['nu'],'minima':row['minimum_cover_count'],'k_histogram':row['k_histogram'],'seconds':row['seconds']}),flush=True)
        elif args.job=='census':result['census']=census(args.max_n)
        elif args.job=='local':result['local']=local_tables()
        elif args.job=='selfcheck':result['selfcheck']=subset_selfcheck()
        elif args.job=='t1local':result['t1local']=t1_local_interfaces()
        result['status']='COMPLETE'
    except (Incomplete,AssertionError) as exc:
        result['status']='INCOMPLETE_OR_FAILED';result['reason']=str(exc)
        raise
    finally:
        signal.alarm(0);result['seconds']=time.monotonic()-begin
        result['peak_rss_darwin_bytes']=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss
        result['utc_finished']=datetime.now(timezone.utc).isoformat()
        output.write_text(json.dumps(result,indent=2)+'\n');print(str(output),flush=True)

if __name__=='__main__':main()
