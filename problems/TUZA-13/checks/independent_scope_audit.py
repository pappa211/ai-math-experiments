#!/usr/bin/env python3
"""Read-only arithmetic/scope audit; validates stored witnesses, no reoptimization."""
from pathlib import Path
from itertools import combinations
from collections import Counter
import datetime,fcntl,gzip,hashlib,json,signal,time
ROOT=Path(__file__).resolve().parents[1]

def run():
    start=time.monotonic(); coverage=json.loads((ROOT/'SEARCH_COVERAGE.json').read_text())
    graphids={};pairs=set();unresolved=set();statuscounts=Counter();stages=[];hashes={}
    for stage in coverage['generic_stages']:
        path=ROOT/stage['ledger'];c=Counter();digest=hashlib.sha256()
        opener=gzip.open if path.suffix=='.gz' else open
        with opener(path,'rb') as stream:
            for line in stream:
                digest.update(line);r=json.loads(line);data=r['input']
                es=tuple(sorted(tuple(sorted(e)) for e in data['edges']));assert len(es)==len(set(es))
                key=(data['n'],es);c['attempts']+=1
                if r['status']!='EXACT':
                    c['unresolved_jobs']+=1;unresolved.add(key);continue
                c['exact_graph_jobs']+=1
                assert r['cover_scope']=='all optima'
                c['all_optima_graph_jobs']+=1
                c['cover_checks']+=len(r['records']);assert len(r['records'])==r['cover_count']
                if key not in graphids:graphids[key]=len(graphids)
                gid=graphids[key];ix={e:i for i,e in enumerate(es)}
                triangles=tuple(t for t in combinations(range(data['n']),3) if all(e in ix for e in combinations(t,2)))
                assert list(map(list,triangles))==r['triangles']
                tr={t:tuple(combinations(t,2)) for t in triangles}
                resources=[sum(1<<ix[e] for e in ee) for ee in tr.values()]
                local=set()
                for row in r['records']:
                    C=tuple(map(tuple,row['cover']));assert len(set(C))==len(C)==r['tau']==row['tau']
                    cm=sum(1<<ix[e] for e in C);local.add(cm);pairs.add((gid,cm))
                    counts=[(cm&m).bit_count() for m in resources];assert all(counts)
                    assert [counts.count(k) for k in (1,2,3)]==row['class_sizes']
                    P=tuple(map(tuple,row['eligible_packing']));assert len(P)==row['eligible_nu']
                    used=set();redcounts=[]
                    for t in P:
                        ee=tr[t];assert not used&set(ee);used.update(ee)
                        redcounts.append(sum(bool(cm>>ix[e]&1) for e in ee))
                    assert redcounts==row['packing_red_counts'] and all(1<=z<=2 for z in redcounts)
                    assert row['target']==(len(C)+1)//2 and row['D']==row['target']-len(P)<=0
                    assert len(P)<=r['nu']
                    c['covers_with_T3']+=counts.count(3)>0
                    c['covers_needing_two_red']+=row['private_nu']<row['target']
                    c['covers_losing_full_packing']+=len(P)<r['nu']
                assert len(local)==len(r['records'])
        for k,v in stage['counts'].items():assert c[k]==v,(stage['stage'],k,c[k],v)
        hashes[stage['ledger']]={'stored_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'uncompressed_sha256':digest.hexdigest()}
        stages.append({'stage':stage['stage'],'counts':dict(c),'status':'COUNTS_AND_LITERAL_WITNESSES_VALID'})
        statuscounts.update(c)
    assert len(graphids)==coverage['generic_unique_labelled_graphs']
    assert len(pairs)==coverage['generic_unique_graph_cover_pairs']
    assert len(unresolved-set(graphids))==coverage['generic_unique_unresolved_graphs']
    assert statuscounts['exact_graph_jobs']==coverage['generic_exact_graph_jobs']
    assert statuscounts['cover_checks']==coverage['generic_cover_checks']
    specialized=[]
    for row in coverage['specialized_cycle_domains']:
        summary=json.loads((ROOT/'evidence'/row['source']).read_text());path=ROOT/summary['graph_manifest']
        graphs=covers=0;rawsha=hashlib.sha256()
        with gzip.open(path,'rb') as stream:
            for line in stream:
                rawsha.update(line);r=json.loads(line);graphs+=1;covers+=r['tested_cover_count']
                assert r['all_covers_complete'] and r['all_cover_count']==r['tested_cover_count'] and r['margin']>=0
        assert graphs==row['graphs_completed']==summary['expected_neighborhood_multisets']
        assert covers==row['covers_completed']
        assert rawsha.hexdigest()==summary['manifest_uncompressed_sha256']
        assert hashlib.sha256(path.read_bytes()).hexdigest()==summary['manifest_sha256']
        specialized.append({'domain':[summary['base_cycle'],summary['apices']],'graphs':graphs,'covers':covers,'status':'COUNTS_HASHES_AND_COMPLETENESS_FLAGS_VALID'})
    c5=json.loads((ROOT/coverage['specialized_C5_r3_summary_source']).read_text())
    assert len(c5['graphs'])==c5['graphs_tested']==c5['expected_neighborhood_multisets']
    assert all(r['complete'] and r['all_cover_count']==r['tested_cover_count'] and r['minimum_margin']>=0 for r in c5['graphs'])
    assert sum(r['tested_cover_count'] for r in c5['graphs'])==c5['covers_tested']
    assert sum(x['graphs'] for x in specialized)+c5['graphs_tested']==coverage['specialized_cycle_total_graph_representatives']
    assert sum(x['covers'] for x in specialized)+c5['covers_tested']==coverage['specialized_cycle_total_cover_checks']
    return dict(status='PASS',checked_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),elapsed_seconds=time.monotonic()-start,
                scope='Every generic stored literal triangle list, cover, qualifying packing and count validated; objective optimality remains based on audited exhaustive solver. Specialized manifests recounted, hashes and completeness flags checked, no global unique total inferred.',
                coverage_sha256=hashlib.sha256((ROOT/'SEARCH_COVERAGE.json').read_bytes()).hexdigest(),
                code_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                generic_stages=stages,generic_totals=dict(statuscounts),unique_exact_labelled_graphs=len(graphids),
                unique_exact_graph_cover_pairs=len(pairs),unique_unresolved_graphs=len(unresolved-set(graphids)),
                specialized_cycle_domains=specialized,specialized_total_graph_representatives=coverage['specialized_cycle_total_graph_representatives'],
                specialized_total_cover_checks=coverage['specialized_cycle_total_cover_checks'],generic_ledger_hashes=hashes)

if __name__=='__main__':
    with (ROOT/'evidence/compute.lock').open('a+') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX)
        signal.signal(signal.SIGALRM,lambda s,f:(_ for _ in ()).throw(TimeoutError('90-second receipt audit cap')))
        signal.alarm(90)
        try:
            result=run()
        except Exception as exc:
            (ROOT/'evidence/independent_scope_audit_failure.json').write_text(json.dumps({'status':'FAIL_OR_TIMEOUT','error':repr(exc)},indent=2)+'\n');raise
        finally:signal.alarm(0)
        (ROOT/'evidence/independent_scope_audit.json').write_text(json.dumps(result,indent=2)+'\n')
        print(json.dumps({k:result[k] for k in ['status','elapsed_seconds','unique_exact_labelled_graphs','unique_exact_graph_cover_pairs','unique_unresolved_graphs','specialized_total_graph_representatives','specialized_total_cover_checks']},indent=2))
