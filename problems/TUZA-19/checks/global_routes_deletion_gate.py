#!/usr/bin/env python3
"""Exact finite attacks on simultaneous triangle-deletion tightness.
All triangles are rebuilt from the literal simple graph edges. No remote calls.
"""
from itertools import combinations
from functools import lru_cache
from pathlib import Path
import argparse, json, time, platform, random
import networkx as nx

class Exact:
    def __init__(self,G):
        self.n=len(G); self.edges=sorted(tuple(sorted(e)) for e in G.edges())
        self.eid={e:i for i,e in enumerate(self.edges)}
        self.triples=[t for t in combinations(range(self.n),3) if all(e in self.eid for e in combinations(t,2))]
        self.tri=[sum(1<<self.eid[e] for e in combinations(t,2)) for t in self.triples]
        self.full=(1<<len(self.edges))-1
        self.nu=lru_cache(None)(self._nu)
        self.tau=lru_cache(None)(self._tau)
    def live(self,g): return [t for t in self.tri if g&t==t]
    def _nu(self,g):
        ts=self.live(g)
        if not ts:return 0
        union=0
        for t in ts:union|=t
        if union!=g:return self.nu(union)
        counts={i:sum((t>>i)&1 for t in ts) for i in range(len(self.edges)) if g>>i&1}
        e=max(counts,key=counts.get)
        if counts[e]==1:
            t=next(t for t in ts if t>>e&1)
            # A degree-one hypervertex does not force its triangle into a maximum packing.
        return max(self.nu(g&~(1<<e)),max(1+self.nu(g&~t) for t in ts if t>>e&1))
    def _tau(self,g):
        ts=self.live(g)
        if not ts:return 0
        t=min(ts,key=lambda t:sum(sum(bool(s&(1<<i)) for s in ts) for i in range(len(self.edges)) if t>>i&1))
        return 1+min(self.tau(g&~(1<<i)) for i in range(len(self.edges)) if t>>i&1)
    def inspect(self):
        if not self.tri:return None
        k=self.nu(self.full)
        if k==1:return {'nu':1,'trivial_intersecting_family':True}
        rows=[]
        for xyz,t in zip(self.triples,self.tri):
            kr=self.nu(self.full&~t)
            if kr!=k-1:return None
            ar=self.tau(self.full&~t)
            if ar!=2*k-2:return None
            rows.append({'triangle':xyz,'nu_remainder':kr,'tau_remainder':ar})
        blockers=[]
        for i,j in combinations(range(len(self.edges)),2):
            kr=self.nu(self.full&~(1<<i)&~(1<<j))
            if kr<k:
                blockers.append([self.edges[i],self.edges[j]])
        return {'n':self.n,'edges':self.edges,'triangles':self.triples,'nu':k,'tau':self.tau(self.full),
                'deletion_rows':rows,'two_edge_blockers':blockers,'counterexample_H_D':not blockers,
                'graph6':nx.to_graph6_bytes(nx.Graph([(u,v) for u,v in self.edges]),header=False).decode().strip()}

def main():
    ap=argparse.ArgumentParser();ap.add_argument('--output',required=True);args=ap.parse_args()
    assert platform.system()=='Darwin'
    start=time.time(); checked=0;qual=[];k1=0
    for G in nx.graph_atlas_g():
        G=nx.convert_node_labels_to_integers(G)
        checked+=1; r=Exact(G).inspect()
        if r:
            if r['nu']==1:k1+=1
            else:qual.append(r)
    out={'hypothesis':'H-D','scope':'Every NetworkX graph_atlas_g graph (one representative through seven vertices), actual triangles, exact recursion.',
         'checked':checked,'nu1_qualifiers':k1,'nontrivial_qualifiers':qual,'seconds':time.time()-start,
         'status':'REFUTED' if any(r['counterexample_H_D'] for r in qual) else 'NO_COUNTEREXAMPLE_IN_FINITE_DOMAIN'}
    Path(args.output).write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({k:v for k,v in out.items() if k!='nontrivial_qualifiers'},indent=2));print('nontrivial_qualifiers',len(qual))
if __name__=='__main__':main()
