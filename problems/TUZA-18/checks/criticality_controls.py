#!/usr/bin/env python3
"""Exact finite controls of stated criticality SURROGATES, not actual violations.

Use --census 7 for all 2^21 labelled graphs; default checks the explicit controls.
All graph triangle families are independently generated from actual edge lists.
"""
from itertools import combinations
from functools import lru_cache
from collections import Counter
from pathlib import Path
import argparse, hashlib, json, resource, subprocess, time

class ExactGraph:
    def __init__(self,n):
        self.n=n
        self.edges=list(combinations(range(n),2))
        self.eid={e:i for i,e in enumerate(self.edges)}
        self.triangles=[sum(1<<self.eid[e] for e in combinations(t,2))
                        for t in combinations(range(n),3)]
        self.tau=lru_cache(None)(self._tau)
        self.packing=lru_cache(None)(self._packing)
    def mask(self,edges):
        return sum(1<<self.eid[tuple(sorted(e))] for e in edges)
    def valid(self,g):
        return [t for t in self.triangles if g&t==t]
    def _tau(self,g):
        t=next((t for t in self.triangles if g&t==t),0)
        if not t:return 0
        return 1+min(self.tau(g&~(1<<i)) for i in range(len(self.edges)) if t>>i&1)
    def _packing(self,g):
        ts=self.valid(g)
        if not ts:return ()
        i=max(range(len(self.edges)),key=lambda i:sum(bool(t>>i&1) for t in ts))
        return max([self.packing(g&~(1<<i))]+
                   [(t,)+self.packing(g&~t) for t in ts if t>>i&1],key=len)
    def unpack(self,g):return [e for i,e in enumerate(self.edges) if g>>i&1]
    def q(self,g):
        a=self.tau(g)
        return all(self.tau(g&~t)==a-3 for t in self.valid(g))
    def record(self,g):
        ids=[i for i in range(len(self.edges)) if g>>i&1]
        p=self.packing(g);k=len(p);a=self.tau(g)
        blockers=[self.unpack((1<<i)|(1<<j)) for i,j in combinations(ids,2)
                  if len(self.packing(g&~(1<<i)&~(1<<j)))<k]
        return {'n':self.n,'edges':self.unpack(g),'tau':a,'nu':k,
                'maximum_packing':[self.unpack(t) for t in p],
                'Q_every_triangle_in_a_minimum_cover':self.q(g),
                'edge_cover_critical':all(self.tau(g&~(1<<i))==a-1 for i in ids),
                'packing_resilient_under_at_most_two_edge_deletions':
                    not blockers and all(len(self.packing(g&~(1<<i)))==k for i in ids),
                'two_edge_blocker_count':len(blockers),'first_two_edge_blocker':next(iter(blockers),None)}

def controls():
    F=ExactGraph(5);g=(1<<10)-1
    k5=F.record(g)
    assert (k5['tau'],k5['nu'])==(4,2)
    assert k5['edge_cover_critical'] and k5['packing_resilient_under_at_most_two_edge_deletions']
    F=ExactGraph(8)
    E=set(combinations(range(5),2))|set(combinations([0,1,5,6,7],2))
    glued=F.record(F.mask(E))
    assert (glued['tau'],glued['nu'])==(7,4)
    assert glued['edge_cover_critical'] and glued['packing_resilient_under_at_most_two_edge_deletions']
    F=ExactGraph(7)
    E={(0,1),(1,2),(2,3),(3,4),(0,4)}|{(i,j) for i in range(5) for j in (5,6)}|{(5,6)}
    g=F.mask(E);doublewheel=F.record(g)
    assert (doublewheel['tau'],doublewheel['nu'])==(6,4)
    assert doublewheel['Q_every_triangle_in_a_minimum_cover'] and doublewheel['edge_cover_critical']
    assert not doublewheel['packing_resilient_under_at_most_two_edge_deletions']
    for C in [ {(0,1),(0,5),(1,5),(2,6),(3,5),(4,6)},
               {(0,5),(0,6),(1,2),(2,3),(3,4),(5,6)} ]:
        cm=F.mask(C)
        assert len(C)==6 and all(cm&t for t in F.valid(g))
    S=F.mask({(0,1),(2,3)})
    assert len(F.packing(g&~S))==3
    # Fano-minus-line: incidence counterexample to generic rank-three arguments.
    fano=[{0,1,2},{0,3,4},{0,5,6},{1,3,5},{1,4,6},{2,3,6},{2,4,5}]
    triples=fano[1:]
    assert all(a&b for a,b in combinations(triples,2))
    assert all(any(not(set(S)&t) for t in triples) for S in combinations(range(7),2))
    return {'K5':k5,'two_K5s_glued_on_one_edge':glued,'K2_join_C5':doublewheel,
            'Fano_minus_line':{'triples':[sorted(t) for t in triples],
            'nu':1,'tau':3,'minimum_degree':min(sum(v in t for t in triples) for v in range(7)),
            'two_vertex_deletion_resilience':True,'not_a_graph_triangle_family':True}}

def census(n):
    F=ExactGraph(n);summary=Counter();examples={};total_q=0
    for g in range(1<<len(F.edges)):
        a=F.tau(g)
        if a<3:continue
        ts=F.valid(g)
        if not all(F.tau(g&~t)==a-3 for t in ts):continue
        total_q+=1
        support=0
        for t in ts:support|=t
        if support!=g:continue
        active=len(set(v for e in F.unpack(g) for v in e))
        cd=min(sum(bool(t>>i&1) for t in ts) for i in range(len(F.edges)) if g>>i&1)
        row=(g.bit_count(),active,a,cd)
        summary[row]+=1;examples[row]=g
    return {'n':n,'labelled_graphs_examined':1<<len(F.edges),'triangleful_Q_count':total_q,
            'invariant_columns':['edges','active_vertices','tau','minimum_triangle_codegree'],
            'no_triangle_free_edges_types':[{'invariants':row,'labelled_count':count,
                'edges_example':F.unpack(examples[row])} for row,count in sorted(summary.items())],
            'scope':'Finite surrogate control; not a census of actual minimal Tuza violations.'}

def source_ids():
    requests=[('ARCHIVE',
      'd4029fbafc3dffc250b50ed237ad81c3206cd1a0',['problems/TUZA-07/notes/CRITICALITY_PACKAGE.md']),
      ('ARCHIVE/TUZA-17',
      'aa0de600d7fb0cfe4134e82ad056f02e4c465eb6',['REPORT.md','STATUS_MATRIX.json',
      'notes/A_CRITICAL_NONSATURATION.md','notes/A_ELEMENTARY_MATCHING_BLOCKER.md'])]
    rows=[]
    for repo,commit,paths in requests:
        for path in paths:
            data=subprocess.check_output(['git','-c','core.optionalLocks=false','show',commit+':'+path],cwd=repo)
            rows.append({'repository':repo,'commit':commit,'path':path,'sha256':hashlib.sha256(data).hexdigest()})
    return rows

if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--census',type=int,choices=[6,7]);parser.add_argument('--output')
    args=parser.parse_args();start=time.monotonic()
    result={'status':'PASS','scope':'Explicit graph and hypergraph controls; unrestricted Tuza is unresolved.',
            'controls':controls(),'source_identities':source_ids()}
    if args.census:result['census']=census(args.census)
    result['seconds']=time.monotonic()-start
    result['peak_rss_bytes_darwin']=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss
    data=json.dumps(result,indent=2)+'\n'
    if args.output:Path(args.output).write_text(data)
    else:print(data,end='')
