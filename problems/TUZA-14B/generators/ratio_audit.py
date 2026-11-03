#!/usr/bin/env python3
"""Recount frozen TUZA-13 receipts; no optimization, enumeration, or source writes.
Run: PYTHONDONTWRITEBYTECODE=1 python checks/ratio_audit.py --source OLD --out NEW
Only RATIO_AUDIT.json and evidence/ratio_hard_candidates.json are written.
"""
import argparse, collections, datetime, gzip, hashlib, json, os, pathlib, subprocess, time
STRATA=('nu_zero','automatic_2tau_le_3nu','hard_3nu_lt_2tau_and_tau_lt_2nu','tight_tau_eq_2nu','beyond_tau_gt_2nu','unknown')

def triangle_components(n,edges):
    from itertools import combinations
    es=set(map(tuple,edges));ts=[tuple(combinations(t,2)) for t in combinations(range(n),3) if all(e in es for e in combinations(t,2))]
    remain=set(range(len(ts)));comps=[]
    while remain:
        frontier={remain.pop()};component=set(frontier)
        while frontier:
            resources={e for i in frontier for e in ts[i]};frontier={j for j in remain if resources.intersection(ts[j])};remain-=frontier;component|=frontier
        resources=sorted({e for i in component for e in ts[i]});vertices=sorted({v for e in resources for v in e})
        comps.append(dict(vertices=vertices,edges=resources,triangle_count=len(component),is_K4=len(vertices)==4 and len(resources)==6,is_K5=len(vertices)==5 and len(resources)==10))
    return comps

def sha(path):
    h=hashlib.sha256()
    with path.open('rb') as f:
        for b in iter(lambda:f.read(1<<20),b''):h.update(b)
    return h.hexdigest()

def identity(n,edges):
    es=sorted(tuple(sorted(e)) for e in edges)
    assert len(es)==len(set(es)) and all(0<=a<b<n<256 for a,b in es)
    # Injection: first byte n; subsequent bytes are sorted pairs of vertices.
    return bytes([n]+[x for e in es for x in e])

def stratum(tau,nu):
    if nu==0: assert tau==0;return STRATA[0]
    if 2*tau<=3*nu:return STRATA[1]
    if tau<2*nu:return STRATA[2]
    if tau==2*nu:return STRATA[3]
    return STRATA[4]

def table():
    return {s:dict(unique_labelled_graphs=0,unique_graph_minimum_cover_pairs=0,
        graphs_with_all_red_triangle_in_some_minimum_cover=0,
        covers_with_all_red_lower=0,covers_with_all_red_upper=0,
        covers_with_all_red_count_exact=True,graphs_with_positive_loss=0,
        covers_with_positive_loss=0,loss_range=None,allowance_range=None,
        deficit_range=None,all_red_triangles_per_cover_range=None,
        automatic_graphs=0,automatic_pairs=0,integer_bound_sufficient_graphs=0,integer_bound_sufficient_pairs=0,
        one_off_tau_eq_2nu_minus_1_graphs=0,one_off_tau_eq_2nu_minus_1_pairs=0,one_off_all_red_graphs=0,one_off_all_red_covers_lower=0,one_off_all_red_covers_upper=0,
        ratio_histogram={}) for s in STRATA}

def extend(r,key,a,b):
    if r[key] is None:r[key]=[a,b]
    else:r[key]=[min(r[key][0],a),max(r[key][1],b)]

def add(tab,g):
    tau,nu,count=g['tau'],g['nu'],g['count'];r=tab[stratum(tau,nu)]
    r['unique_labelled_graphs']+=1;r['unique_graph_minimum_cover_pairs']+=count
    r['graphs_with_all_red_triangle_in_some_minimum_cover']+=g['t3max']>0
    r['covers_with_all_red_lower']+=g['t3lo'];r['covers_with_all_red_upper']+=g['t3hi']
    r['covers_with_all_red_count_exact'] &= g['t3lo']==g['t3hi']
    r['graphs_with_positive_loss']+=g['lossmax']>0;r['covers_with_positive_loss']+=g['losspositive']
    extend(r,'loss_range',g['lossmin'],g['lossmax'])
    allowance=nu-(tau+1)//2;extend(r,'allowance_range',allowance,allowance)
    extend(r,'deficit_range',g['lossmin']-allowance,g['lossmax']-allowance)
    # Only extrema over known range; aggregate manifests have unknown minimum T3.
    if g['t3min'] is not None:extend(r,'all_red_triangles_per_cover_range',g['t3min'],g['t3max'])
    if 2*tau<=3*nu:r['automatic_graphs']+=1;r['automatic_pairs']+=count
    if nu-(tau-nu)//2 >= (tau+1)//2:
        r['integer_bound_sufficient_graphs']+=1;r['integer_bound_sufficient_pairs']+=count
    if nu>0 and tau==2*nu-1:
        r['one_off_tau_eq_2nu_minus_1_graphs']+=1;r['one_off_tau_eq_2nu_minus_1_pairs']+=count
        r['one_off_all_red_graphs']+=g['t3max']>0;r['one_off_all_red_covers_lower']+=g['t3lo'];r['one_off_all_red_covers_upper']+=g['t3hi']
    rat=f'{tau}/{nu}';r['ratio_histogram'][rat]=r['ratio_histogram'].get(rat,0)+1

def compact_table(t):
    return {s:{k:v for k,v in r.items() if k!='ratio_histogram'} for s,r in t.items()}

def run(src,out):
    out.mkdir(parents=True,exist_ok=False)
    (out/"evidence").mkdir()
    start=time.monotonic()
    for nu in range(101):
        for tau in range(nu,3*nu+1):
            lower=nu-(tau-nu)//2
            assert lower == (3*nu-tau+1)//2
            assert (lower >= (tau+1)//2) == (2*tau <= 3*nu+int(tau%2==0))
            assert (nu-(tau+1)//2 == 0) == (tau in (2*nu-1,2*nu))
    now=lambda:datetime.datetime.now(datetime.timezone.utc).isoformat()
    coverage=json.loads((src/'SEARCH_COVERAGE.json').read_text())
    hashes={'SEARCH_COVERAGE.json':sha(src/'SEARCH_COVERAGE.json')};graphs={};unknown={};stages=[];candidates=[]
    generic_table=table();generic_graphs=0;generic_pairs=0;generic_jobs=0;generic_checks=0
    for stage in coverage['generic_stages']:
        rel=stage['ledger'];p=src/rel;hashes[rel]=sha(p);op=gzip.open if p.suffix=='.gz' else open
        attempts=exact=checks=0;jobtab=table()
        with op(p,'rt') as f:
            for line_no,line in enumerate(f,1):
                r=json.loads(line);inp=r['input'];key=identity(inp['n'],inp['edges']);attempts+=1
                if r['status']!='EXACT':
                    unknown.setdefault(key,[]).append({'source':rel,'line':line_no,'status':r['status'],'name':inp.get('name',inp.get('chain'))})
                    continue
                exact+=1;assert r['cover_scope']=='all optima' and len(r['records'])==r['cover_count']
                tau,nu=r['tau'],r['nu'];count=r['cover_count'];checks+=count
                cover_values={};losses=[];t3s=[]
                for c in r['records']:
                    ck=identity(inp['n'],c['cover']);k=c['eligible_nu'];t3=c['class_sizes'][2]
                    assert ck not in cover_values and c['tau']==tau and len(c['cover'])==tau
                    assert c['target']==(tau+1)//2 and c['D']==(tau+1)//2-k and 0<=k<=nu
                    assert k>=nu-(tau-nu)//2 # independently reconstructed bound
                    cover_values[ck]=(k,t3,c['private_nu']);losses.append(nu-k);t3s.append(t3)
                signature=hashlib.sha256(repr(sorted(cover_values.items())).encode()).hexdigest()
                g=dict(tau=tau,nu=nu,count=count,t3min=min(t3s),t3max=max(t3s),
                    t3lo=sum(x>0 for x in t3s),t3hi=sum(x>0 for x in t3s),
                    lossmin=min(losses),lossmax=max(losses),losspositive=sum(x>0 for x in losses),
                    signature=signature,source=rel,line=line_no,precision='literal_per_cover')
                add(jobtab,g)
                if key in graphs:
                    old=graphs[key];assert all(old[x]==g[x] for x in ['tau','nu','count','signature'])
                else:
                    graphs[key]=g;add(generic_table,g);generic_graphs+=1;generic_pairs+=count
                    if stratum(tau,nu) in STRATA[2:4] and (max(t3s)>0 or max(losses)>0):
                        selected=max(r['records'],key=lambda c:(nu-c['eligible_nu'],c['class_sizes'][2]))
                        candidates.append(dict(source=rel,line=line_no,graph_sha256=hashlib.sha256(key).hexdigest(),
                            input=inp,tau=tau,nu=nu,cover_count=count,stratum=stratum(tau,nu),
                            allowance=nu-(tau+1)//2,loss_range=[min(losses),max(losses)],
                            all_red_covers=sum(x>0 for x in t3s),max_T3=max(t3s),record=selected))
        assert attempts==stage['counts']['attempts'] and exact==stage['counts']['exact_graph_jobs'] and checks==stage['counts']['cover_checks']
        generic_jobs+=exact;generic_checks+=checks
        stages.append({'stage':stage['stage'],'source':rel,'attempts':attempts,'exact_graph_jobs':exact,'cover_checks':checks,'not_deduplicated_by_stage':compact_table(jobtab)})
    assert generic_graphs==coverage['generic_unique_labelled_graphs']
    assert generic_pairs==coverage['generic_unique_graph_cover_pairs']
    assert len(set(unknown)-set(graphs))==coverage['generic_unique_unresolved_graphs']
    print(json.dumps({'generic_unique_ratio_table':compact_table(generic_table),'hard_all_red_candidate_graphs':len(candidates)}),flush=True)
    specialized=[];overlaps=[];specialized_unique_keys=set()
    specs=[(src/'evidence'/x['source']) for x in coverage['specialized_cycle_domains']]
    specs.append(src/coverage['specialized_C5_r3_summary_source'])
    for summary_path in specs:
        relsum=str(summary_path.relative_to(src));hashes[relsum]=sha(summary_path)
        summary=json.loads(summary_path.read_text());domain=summary_path.stem
        if 'graph_manifest' in summary:
            rel=summary['graph_manifest'];p=src/rel;hashes[rel]=sha(p)
            assert hashes[rel]==summary['manifest_sha256']
            rows=(json.loads(line) for line in gzip.open(p,'rt'))
            # The previous independent receipt already validates uncompressed hashes.
            expected_g=summary['graphs_completed'];expected_c=summary['covers_completed']
        else:
            rel=relsum;rows=summary['graphs'];expected_g=summary['graphs_tested'];expected_c=summary['covers_tested']
        tab=table();overlap=0;overlap_pairs=0;added=0;counts=0
        seen=set()
        for line_no,r in enumerate(rows,1):
            key=identity(r['n'],r['edges']);assert key not in seen;seen.add(key);specialized_unique_keys.add(key)
            assert r.get('all_covers_complete',r.get('complete')) and r['all_cover_count']==r['tested_cover_count']
            tau,nu,count=r['tau'],r['nu_full'],r['all_cover_count'];counts+=count
            if 'distribution' in r:
                d=r['distribution'];assert sum(x['covers'] for x in d)==count
                lo=hi=sum(x['covers'] for x in d if x['T3']>0)
                losses=[nu-x['nu_eligible'] for x in d];t3min=min(x['T3'] for x in d)
                losspositive=sum(x['covers'] for x in d if x['nu_eligible']<nu)
                assert min(x['nu_eligible'] for x in d)-(tau+1)//2==r['minimum_margin']
            else:
                assert r['min_eligible_nu']==nu # hence all covers have k=nu, not merely one
                assert r['margin']==nu-(tau+1)//2
                losses=[0];losspositive=0;lo=int(r['max_T3']>0);hi=count if lo else 0;t3min=0 if not lo else None
            g=dict(tau=tau,nu=nu,count=count,t3min=t3min,t3max=r['max_T3'],t3lo=lo,t3hi=hi,
                lossmin=min(losses),lossmax=max(losses),losspositive=losspositive,
                source=rel,line=line_no,precision='distribution' if 'distribution' in r else 'cover_aggregates')
            assert g['lossmin']==g['lossmax']==0
            add(tab,g)
            if key in graphs:
                old=graphs[key];assert all(old[x]==g[x] for x in ['tau','nu','count','lossmin','lossmax','t3max'])
                assert lo<=old['t3lo']<=old['t3hi']<=hi
                overlap+=1;overlap_pairs+=count
                # Retain the most informative receipt for overlapping exact graph identity.
                if old['t3lo']!=old['t3hi'] and lo==hi:graphs[key]=g
            else:graphs[key]=g;added+=1
        assert line_no==expected_g and counts==expected_c
        specialized.append(dict(domain=domain,source=rel,graphs=line_no,cover_checks=counts,table=tab))
        overlaps.append(dict(domain=domain,already_in_earlier_domains_graphs=overlap,already_in_earlier_domains_pairs=overlap_pairs,new_unique_graphs=added))
        del rows,summary,seen
    combined=table()
    for g in graphs.values():add(combined,g)
    remaining=set(unknown)-set(graphs)
    combined['unknown']['unique_labelled_graphs']=len(remaining)
    combined['unknown']['unique_graph_minimum_cover_pairs']='UNKNOWN'
    for field in ['graphs_with_all_red_triangle_in_some_minimum_cover','covers_with_all_red_lower','covers_with_all_red_upper',
        'graphs_with_positive_loss','covers_with_positive_loss','one_off_tau_eq_2nu_minus_1_graphs','one_off_tau_eq_2nu_minus_1_pairs',
        'integer_bound_sufficient_graphs','integer_bound_sufficient_pairs','one_off_all_red_graphs','one_off_all_red_covers_lower','one_off_all_red_covers_upper']:
        combined['unknown'][field]='UNKNOWN'
    combined['unknown']['covers_with_all_red_count_exact']=False
    combined['unknown']['automatic_graphs']='UNKNOWN';combined['unknown']['automatic_pairs']='UNKNOWN'
    candidates.sort(key=lambda r:(-r['loss_range'][1],-r['tau']/r['nu'],r['input']['n'],len(r['input']['edges'])))
    selected=candidates[:40]
    seed_groups={
        'all_positive_loss_hard_labelled_graphs':[g for g in candidates if g['loss_range'][1]>0],
        'tight_with_T3_examples':sorted([g for g in candidates if g['tau']==2*g['nu']],key=lambda g:(g['input']['n'],len(g['input']['edges']),-g['max_T3']))[:12],
        'one_off_hard_with_T3_examples':sorted([g for g in candidates if g['tau']==2*g['nu']-1],key=lambda g:(g['input']['n'],len(g['input']['edges']),-g['max_T3']))[:12]}
    for group in seed_groups.values():
        for g in group:
            g['n']=g['input']['n'];g['edges']=g['input']['edges'];g['cover']=g['record']['cover'];g['k']=g['record']['eligible_nu']
            g['integer_bound_sufficient']=g['nu']-(g['tau']-g['nu'])//2 >= (g['tau']+1)//2
            g['triangle_conflict_components']=triangle_components(g['n'],g['edges'])
            g['triangle_conflict_connected']=len(g['triangle_conflict_components'])==1
    (out/'evidence/ratio_hard_seeds.json').write_text(json.dumps(dict(status='REUSED_EXACT_TUZA13_RECEIPTS_NEW_COMPONENT_CLASSIFICATION_NO_OPTIMIZER',source_edition='public-TUZA-13-2026-11-03',groups=seed_groups),indent=2)+'\n')
    candidate_path=out/'evidence/ratio_hard_candidates.json';candidate_path.parent.mkdir(exist_ok=True)
    candidate_path.write_text(json.dumps(dict(status='REUSED_COMPLETED_TUZA13_RECEIPTS_NOT_REOPTIMIZED',
        all_hard_graphs_with_T3=len(candidates),selection='first 40 by descending loss, ratio, ascending order and size',graphs=selected),indent=2)+'\n')
    unknown_rows=[]
    for key in sorted(remaining):
        unknown_rows.append(dict(n=key[0],edges=[list(key[i:i+2]) for i in range(1,len(key),2)],attempts=unknown[key]))
    generic_table['unknown']=dict(combined['unknown'])
    result=dict(status='RECEIPT_RATIO_RECLASSIFICATION_PASS_NOT_SOLVER_REPLAY',generated_utc=now(),
        elapsed_seconds=time.monotonic()-start,source_edition='public-TUZA-13-2026-11-03',integer_formula_check='PASS on 0<=nu<=100, nu<=tau<=3nu (sanity check, not universal proof)',script_sha256=sha(pathlib.Path(__file__)),
        metric_definitions={'deficit':'ceil(tau/2)-k = loss-allowance; positive means S failure',
            'loss':'nu-k','allowance':'nu-ceil(tau/2)','ratio':'tau/nu; nu=0 separate',
            'pair_count':'sum of number of all distinct globally minimum covers over unique exact (n, sorted edges) graphs',
            'all_red_bounds':'literal/dist records exact; aggregate max_T3>0 gives [1,all_cover_count] per graph',
            'all_red_triangles_per_cover_range':'extrema over known per-cover ranges only; excluded UNKNOWN minimum if aggregate max_T3>0'},
        reexecution={'reused_generic_exact_graphs':generic_graphs,'reused_generic_exact_pairs':generic_pairs,
            'reused_specialized_graph_representatives':sum(s['graphs'] for s in specialized),
            'reused_specialized_cover_checks':sum(s['cover_checks'] for s in specialized),
            'newly_reoptimized_graphs':0,'newly_reoptimized_covers':0,'new_work':'source hash, status, exact identity and ratio/arithmetic audit only'},
        generic_unique_table=generic_table,generic_stage_job_tables=stages,specialized_domain_tables=specialized,
        combined_unique_table=combined,combined_unique_completed_graphs=len(graphs),
        combined_unique_completed_pairs=sum(g['count'] for g in graphs.values()),
        overlap_accounting=overlaps,specialized_unique_graphs=len(specialized_unique_keys),
        generic_timeout_jobs=sum(len(v) for v in unknown.values()),unresolved_unique_graphs=len(remaining),unresolved=unknown_rows,
        source_sha256=hashes,limitations=[
            'Exact optima and completeness are reused from TUZA-13, whose independent checker sampled them; no universal new optimizer rerun.',
            'Graphs are labelled including isolated vertices, not isomorphism classes.',
            'Cross-domain overlap is deduplicated by injective n+sorted-edge bytes, not hashes or names. Complete all-optimum cover sets make pair count additive once each graph appears only once.',
            'All-red cover counts in three specialized manifests are bounds; exact incidence is UNKNOWN unless zero or a more detailed overlapping receipt exists.',
            'Other separate cone, uniform-apex, rooted auxiliary and threshold-only clique receipts are excluded from combined count; no addition of overlapping unstratified totals.',
            'Generic timeouts remain unknown unless the exact same labelled graph occurs in a completed ledger; K10 analytic threshold result is separate and does not silently provide exact nu.'])
    (out/'RATIO_AUDIT.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({'elapsed_seconds':result['elapsed_seconds'],'combined':compact_table(combined),'unique_completed_graphs':len(graphs),'unique_completed_pairs':result['combined_unique_completed_pairs'],'overlaps':overlaps}),flush=True)

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--source',required=True,type=pathlib.Path);p.add_argument('--out',required=True,type=pathlib.Path);a=p.parse_args();run(a.source,a.out)
