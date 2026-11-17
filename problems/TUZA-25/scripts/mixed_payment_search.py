"""Falsification of explicitly frozen page-surcharge candidates, not a Tuza census."""
from mixed_exact import Graph,solve,controls
import networkx as nx,json,time
from itertools import combinations

def examine(G,N,rows,summary,source):
    base=solve(G,N)
    if base['status']!='EXACT':return
    k=base['nu']
    for e in range(len(G.edges)):
        if N>>e&1:continue
        child=solve(G,N|(1<<e))
        if child['status']=='INADMISSIBLE':
            summary['inadmissible_branches']+=1;continue
        deletion=solve(G,N,1<<e)
        summary['admissible_branches']+=1
        if deletion['nu']!=k:continue
        summary['packing_stable_branches']+=1
        delta=child['nu']-k
        if delta>0:summary['packing_stable_positive_jump']+=1
        surcharge=child['tau']-deletion['tau']
        summary['max_surcharge']=max(summary['max_surcharge'],surcharge)
        bad=[]
        if surcharge>1:bad.append('stable_surcharge_at_most_one')
        if child['tau']>2*k:bad.append('stable_full_payment')
        if delta>0 and child['tau']>2*child['nu']-2*delta:bad.append('jump_payment')
        if bad:
            if len(rows)<100: rows.append({'failed':bad,'source':source,'n':G.n,'edges':G.edges,'triangles':G.vertices,'N':N,'e':e,'edge':G.edges[e],'base':base,'deletion':deletion,'forbid':child,'delta':delta,'surcharge':surcharge})
            for b in bad:summary['failures'][b]=summary['failures'].get(b,0)+1

start=time.time();rows=[];summary={'graph_universe':'networkx graph_atlas_g, at most 7 vertices, one isomorphism representative; all graph edges for N empty. Named controls: N empty and every singleton N, each admissible e.','graphs':0,'admissible_branches':0,'inadmissible_branches':0,'packing_stable_branches':0,'packing_stable_positive_jump':0,'max_surcharge':0,'failures':{}}
for idx,g in enumerate(nx.graph_atlas_g()):
    G=Graph(g.number_of_nodes(),g.edges())
    if not G.triangles:continue
    summary['graphs']+=1;examine(G,0,rows,summary,f'atlas_{idx}')
for name,G in controls().items():
    for N in [0]+[1<<e for e in range(len(G.edges))]:examine(G,N,rows,summary,name)
summary['elapsed_seconds']=time.time()-start
json.dump({'summary':summary,'witnesses':rows},open('evidence/mixed_payment_search.json','w'),indent=2)
print(json.dumps(summary,indent=2));print('first witnesses',json.dumps(rows[:2],indent=2))
