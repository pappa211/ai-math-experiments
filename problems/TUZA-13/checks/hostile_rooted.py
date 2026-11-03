#!/usr/bin/env python3
"""Find low-slack rooted gadgets with root edge in no minimum triangle cover."""
from pathlib import Path
from itertools import combinations
import json,time,signal,fcntl,datetime
import networkx as nx
from core import Graph,BudgetExceeded,bits
from hostile_families import generate_hostile
ROOT=Path(__file__).resolve().parents[1]
class Stop(Exception):pass

def candidates():
    for i,g in enumerate(nx.graph_atlas_g()):
        if g.number_of_nodes()>=3:yield 'atlas'+str(i),g.number_of_nodes(),tuple(g.edges())
    for k in [4,5,6]:
        es=list(combinations(range(k),2))
        # At most four distinct supported pages; rooted attachment search, not all graphs.
        for j in range(1,min(5,len(es)+1)):
            for chosen in combinations(es,j):
                edges=list(es)
                for i,(a,b) in enumerate(chosen):edges.extend([(a,k+i),(b,k+i)])
                yield f'K{k}_pages_'+str(chosen),k+j,edges
    for row in generate_hostile():
        if row['n']<=12:yield row['name'],row['n'],row['edges']

def main():
    rows=[];interesting=[];timeouts=[];seen=set();start=time.monotonic();complete=True
    signal.signal(signal.SIGALRM,lambda *_:(_ for _ in ()).throw(Stop()))
    with (ROOT/'evidence/compute.lock').open('a+') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX);signal.alarm(120);compute_start=time.monotonic()
        try:
            for name,n,es in candidates():
                key=(n,tuple(sorted(tuple(sorted(e)) for e in es)))
                if key in seen:continue
                seen.add(key);g=Graph(n,es,seconds=.5)
                try:
                    tau,Cs,allC=g.covers(limit=20000);nu=len(g.packing());slack=2*nu-tau
                    union=0
                    for C in Cs:union|=C
                    absent=[i for i,e in enumerate(g.edges) if not union>>i&1 and g.inc[i]]
                    rows.append({'name':name,**g.literal(),'tau':tau,'nu':nu,'slack':slack,'cover_count':len(Cs),'all_covers':allC,'edges_outside_cover_union':[g.edges[i] for i in absent]})
                    if allC and slack<=1 and absent:
                        for i in absent:
                            without=len(g.packing(g.full&~g.inc[i]));q={'name':name,**g.literal(),'tau':tau,'nu':nu,'slack':slack,'root_edge':g.edges[i],'nu_without_root':without,'cover_count':len(Cs),'all_covers':[ [g.edges[j] for j in bits(C)] for C in Cs]};interesting.append(q)
                            if without<nu:
                                (ROOT/'witnesses/hostile_rooted_promising.json').write_text(json.dumps(q,indent=2)+'\n')
                except BudgetExceeded:timeouts.append({'name':name,'n':n,'edges':g.edges,'seconds':.5})
        except Stop:complete=False
        finally:
            signal.alarm(0);out={'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'generator_complete':complete,'tested_graphs':len(rows),'candidate_graphs_seen':len(seen),'all_cover_graphs':sum(r['all_covers'] for r in rows),'low_slack_root_count':len(interesting),'mandatory_low_slack_roots':sum(q['nu_without_root']<q['nu'] for q in interesting),'timeouts':timeouts,'wall_seconds':time.monotonic()-start,'compute_seconds':time.monotonic()-compute_start,'graphs':rows,'interesting_roots':interesting};(ROOT/'evidence/hostile_rooted_results.json').write_text(json.dumps(out,separators=(',',':'))+'\n');print({k:v for k,v in out.items() if k not in ['graphs','interesting_roots','timeouts']},flush=True)
if __name__=='__main__':main()
