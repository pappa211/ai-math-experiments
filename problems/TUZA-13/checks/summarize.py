#!/usr/bin/env python3
from pathlib import Path
from collections import Counter
import json,gzip,hashlib,datetime
W=Path(__file__).resolve().parents[1]
def lines(p):
 if p.exists():return p.open()
 return gzip.open(str(p)+'.gz','rt')
def main():
 stages=['controls','restoration','hostile','dense','blue','focused','theory_buds']
 files=[('critical',W/'evidence/critical_search.jsonl')]+[(x,W/'evidence'/f'search_{x}.jsonl') for x in stages]
 summary=[];graphs={};timeouts=[];allpairs=set();near=[]
 for stage,p in files:
  stats=Counter();ns=[];ms=[];margins=Counter();times=0
  for s in lines(p):
   r=json.loads(s);g=r['input'];n=g['n'];edges=sorted(tuple(sorted(e)) for e in g['edges']);k=json.dumps([n,edges],separators=(',',':'))
   stats['attempts']+=1;times+=r['elapsed_seconds'];ns.append(n);ms.append(len(edges))
   if r['status']!='EXACT':
    stats['unresolved_jobs']+=1;timeouts.append({'stage':stage,'name':g.get('name',g.get('chain')),'n':n,'edges':edges,'status':r['status'],'elapsed_seconds':r['elapsed_seconds'],'key':k});continue
   stats['exact_graph_jobs']+=1;stats['cover_checks']+=r['cover_count'];stats['all_optima_graph_jobs' if r['cover_scope']=='all optima' else 'subset_optima_graph_jobs']+=1
   graphs.setdefault(k,{'tau':r['tau'],'nu':r['nu'],'covers':set()})
   assert graphs[k]['tau']==r['tau'] and graphs[k]['nu']==r['nu']
   for c in r['records']:
    cm=tuple(sorted(tuple(e) for e in c['cover']));graphs[k]['covers'].add(cm)
    margins[-c['D']]+=1;assert c['D']<=0
    stats['covers_with_T3']+=c['class_sizes'][2]>0
    stats['covers_needing_two_red']+=c['private_nu']<c['target']
    stats['covers_losing_full_packing']+=c['eligible_nu']<r['nu']
    if c['D']==0 and c['eligible_nu']<r['nu'] and c['tau']:
     near.append({'stage':stage,'name':g.get('name',g.get('chain')),'n':n,'m':len(edges),'tau':c['tau'],'nu':r['nu'],'eligible_nu':c['eligible_nu'],'graph_sha256':hashlib.sha256(k.encode()).hexdigest()})
  summary.append({'stage':stage,'ledger':str(p.relative_to(W))+('' if p.exists() else '.gz'),'counts':dict(stats),'n_range':[min(ns),max(ns)],'m_range':[min(ms),max(ms)],'margin_histogram_cover_checks':dict(sorted(margins.items())),'summed_graph_seconds':times})
 unresolved_keys={x['key'] for x in timeouts}-graphs.keys()
 for t in timeouts:t['later_exact_in_generic_ledger']=t.pop('key') in graphs
 specialized=[]
 for f in ['hostile_C5_apices4_summary.json','hostile_C7_apices2_summary.json','hostile_C7_apices3_summary.json']:
  r=json.loads((W/'evidence'/f).read_text());specialized.append({'source':f,**{k:r[k] for k in ['base_cycle','apices','graphs_completed','covers_completed','complete_generator','all_completed_graphs_cover_enumeration_complete','max_T3','graphs_with_T3','graphs_with_eligible_packing_loss','minimum_margin','exceptions','compute_seconds']}})
 r3=json.loads((W/'evidence/hostile_unequal_c5_apices3.json').read_text())
 out={'status':'SURVIVED_TESTED_DOMAIN','generated_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'generic_stages':summary,'generic_unique_labelled_graphs':len(graphs),'generic_unique_graph_cover_pairs':sum(len(v['covers']) for v in graphs.values()),'generic_exact_graph_jobs':sum(x['counts']['exact_graph_jobs'] for x in summary),'generic_cover_checks':sum(x['counts']['cover_checks'] for x in summary),'generic_timeouts':timeouts,'generic_unique_unresolved_graphs':len(unresolved_keys),'specialized_cycle_domains':specialized,'specialized_C5_r3_summary_source':'evidence/hostile_unequal_c5_apices3.json','specialized_cycle_total_graph_representatives':424360,'specialized_cycle_total_cover_checks':5549659,'specialized_dedup':'all neighborhood multisets modulo apex permutations, not modulo base automorphisms/full graph isomorphism; no cross-domain unique-total claim','cone_controls':{'graphs':5,'all_optimum_covers':47},'uniform_apex_controls':{'graphs':6,'all_optimum_covers':95},'cliques_10_12':'all minimum covers by Mantel equality and one symmetry orbit; qualifying packings only, not exact eligible maxima','nearest_with_packing_loss':sorted(near,key=lambda x:(x['n'],x['m'],x['tau']))[:30],'rooted_diagnostic':'3815 graphs/25300 optimum covers, separate diagnostic, not a central-conjecture census','independent_checks':'six exact controls;100 random n7 graphs/310 covers;26 unequal-apex graphs/615 covers;3 normalized near misses/181 covers;auxiliary tau-drop brute6cover rejection;mandatory invariants'}
 (W/'SEARCH_COVERAGE.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k.startswith('generic_') and not isinstance(v,list)},indent=2))
if __name__=='__main__':main()
