"""Bounded TUZA-22 targeted search, NOT a census and NOT Claude replay."""
from exact_graph import *
import random,json,time,signal,sys
from pathlib import Path
W=Path(__file__).resolve().parents[1]; rng=random.Random(2215112026)
start=time.monotonic(); rows=[]; cases=[]; seen=set(); deadline=240

def alarm(*_):raise TimeoutError('per-instance 0.75 second wall deadline')
signal.signal(signal.SIGALRM,alarm)

def base(n,i):
    E=set(); blocks=[]
    # Mixed shared-vertex chains and disconnected clique components, plus free vertices.
    first=4+(i%2); b=list(range(first));blocks.append(b);E|=clique(b); fresh=first
    while fresh+3<=n and len(blocks)<3:
        size=4+int(rng.random()<.4)
        overlap=int(rng.random()<.7)
        need=size-overlap
        if fresh+need>n:break
        b=([rng.randrange(fresh)] if overlap else [])+list(range(fresh,fresh+need));fresh+=need
        cand=E|clique(b)
        if all(g['literal_B'] for g in triangle_components(n,cand)):E=cand;blocks.append(b)
    missing=list(clique(range(n))-E);rng.shuffle(missing)
    # Background edges are accepted only if no actual triangle is created.
    for e in missing:
        if rng.random()<.45 and len(triangles(n,E|{e}))==len(triangles(n,E)):E.add(e)
    assert all(g['literal_B'] for g in triangle_components(n,E))
    return E,blocks

def run(name,n,H,F,blocks):
    G=H|F; key=(n,tuple(sorted(G)))
    if key in seen:return
    seen.add(key);idx=len(rows)
    row={'id':idx,'name':name,'n':n,'H_edges':sorted(H),'added_edges':sorted(F),'base_blocks':blocks,'graph_edges':sorted(G)}
    signal.setitimer(signal.ITIMER_REAL,.75)
    try:
        o=optimize(n,G);row.update({k:v for k,v in o.items() if k not in ('edges','triangles','packing_cache','cover_cache')});row['triangle_count']=len(o['triangles']);row['status']='EXACT_FINITE_RECURRENCE'
        if o['tau']>=2*o['nu'] or 2*o['nu']-o['tau']==1:cases.append({**row,'triangles':o['triangles']})
        if o['tau']>2*o['nu'] or o['tau']==2*o['nu'] and not o['literal_B']:
            (W/'evidence/restoration_exception.json').write_text(json.dumps({**row,'triangles':o['triangles']},indent=2)+'\n');print('EXCEPTION',idx,flush=True)
    except TimeoutError as e:row.update(status='UNKNOWN',reason=str(e))
    finally:signal.setitimer(signal.ITIMER_REAL,0)
    rows.append(row)
    with (W/'evidence/restoration_cases.jsonl').open('a') as out:out.write(json.dumps(row)+'\n')

for n in range(11,15):
    for i in range(24):
        H,blocks=base(n,i); M=sorted(clique(range(n))-H)
        # One-edge, adjacent/disjoint two-edge, and full-triangle restoration; no arbitrary omission.
        for j in range(3):
            if not M:break
            e=rng.choice(M);run('one',n,H,{e},blocks)
            for kind in ('adjacent','disjoint'):
                opts=[f for f in M if f!=e and bool(set(e)&set(f))==(kind=='adjacent')]
                if opts:run('two_'+kind,n,H,{e,rng.choice(opts)},blocks)
        triples=[t for t in combinations(range(n),3) if clique(t).isdisjoint(H)]
        rng.shuffle(triples)
        for t in triples[:3]:run('triangle',n,H,clique(t),blocks)
        if time.monotonic()-start>deadline:break
    print('order_done',n,'cases',len(rows),'seconds',round(time.monotonic()-start,2),flush=True)
    if time.monotonic()-start>deadline:break
summary={'identity':'TUZA22 independent targeted restoration discriminator v1','seed':2215112026,'elapsed_seconds':time.monotonic()-start,'case_count':len(rows),'unknown':sum(r['status']=='UNKNOWN' for r in rows),'tight':sum(r.get('tau')==2*r.get('nu',-1) for r in rows),'tight_non_B':sum(r.get('tau')==2*r.get('nu',-1) and not r.get('literal_B',True) for r in rows),'domain':'Sampled B bases on11-14 vertices with actual triangle-free background and one/two/triangle-three added edges; NOT exhaustive','per_instance_seconds':.75,'internal_search_seconds':deadline}
(W/'evidence/restoration_summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(W/'evidence/restoration_neartight.json').write_text(json.dumps(cases,indent=2)+'\n');print(json.dumps(summary),flush=True)
