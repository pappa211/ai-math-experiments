#!/usr/bin/env python3
"""Exact attack on H-E: extend some old minimum cover by at most two edges."""
from itertools import combinations
from pathlib import Path
import json,time,platform,argparse
import networkx as nx
from global_routes_deletion_gate import Exact

def mincovers(F):
    a=F.tau(F.full);seen=set()
    def gen(g,c):
        if c in seen:return
        seen.add(c)
        ts=F.live(g)
        if not ts:
            if c.bit_count()==a:yield c
            return
        if c.bit_count()+F.tau(g)>a:return
        t=ts[0]
        for i in range(len(F.edges)):
            if t>>i&1:yield from gen(g&~(1<<i),c|(1<<i))
    yield from gen(F.full,0)

def two_cover(ts):
    if not ts:return 0
    t=ts[0]
    for i in range(t.bit_length()):
        if not t>>i&1:continue
        remaining=[u for u in ts if not u>>i&1]
        if not remaining:return 1<<i
        common=remaining[0]
        for u in remaining[1:]:common&=u
        if common:return (1<<i)|(common&-common)
    return None

def inspect(H,abc):
    F=Exact(H);k=F.nu(F.full);a=F.tau(F.full)
    assert a==2*k and all(not H.has_edge(*e) for e in combinations(abc,2))
    G=H.copy();G.add_edges_from(combinations(abc,2));A=Exact(G);kg=A.nu(A.full)
    if kg>=k+2:return {'outcome':'PACKING_GAIN','nu_H':k,'nu_G':kg}
    count=0
    for c in mincovers(F):
        count+=1
        old=[F.edges[i] for i in range(len(F.edges)) if c>>i&1]
        cm=sum(1<<A.eid[e] for e in old)
        extra=two_cover([t for t in A.tri if not t&cm])
        if extra is not None:
            return {'outcome':'MINIMUM_COVER_EXTENDS','nu_H':k,'nu_G':kg,'old_covers_checked':count,
                    'old_cover':old,'added_cover_edges':[A.edges[i] for i in range(len(A.edges)) if extra>>i&1]}
    return {'outcome':'COUNTEREXAMPLE_H_E','n':len(G),'H_edges':F.edges,'independent_triple':abc,
            'G_edges':A.edges,'G_triangles':A.triples,'nu_H':k,'tau_H':a,'nu_G':kg,'tau_G':A.tau(A.full),
            'minimum_old_covers_checked':count}

def main():
    ap=argparse.ArgumentParser();ap.add_argument('--output',required=True);args=ap.parse_args()
    assert platform.system()=='Darwin';start=time.time();ledger=[];fail=[];tight=0
    for idx,H in enumerate(nx.graph_atlas_g()):
        H=nx.convert_node_labels_to_integers(H);F=Exact(H);k=F.nu(F.full)
        if k==0 or F.tau(F.full)!=2*k:continue
        tight+=1
        for abc in combinations(range(len(H)),3):
            if any(H.has_edge(*e) for e in combinations(abc,2)):continue
            r=inspect(H,abc);r['atlas_index']=idx;r['independent_triple']=abc
            ledger.append(r)
            if r['outcome']=='COUNTEREXAMPLE_H_E':fail.append(r)
    out={'hypothesis':'H-E','domain':'All nontrianglefree Tuza-tight NetworkX atlas H on at most7vertices, every independent triple; νH0 excluded by the elementary νG1 intersecting-triangle theorem.',
         'tight_H_count':tight,'instance_count':len(ledger),'counterexamples':fail,'ledger':ledger,'seconds':time.time()-start}
    Path(args.output).write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k not in ('ledger','counterexamples')},indent=2));print('counterexamples',len(fail))
if __name__=='__main__':main()
