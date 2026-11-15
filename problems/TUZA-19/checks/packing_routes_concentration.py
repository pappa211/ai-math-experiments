"""Test canonical centre compatibility under a proved packing selection condition."""
import json,time,gzip,hashlib
from itertools import combinations
from pathlib import Path
from collections import Counter
from packing_routes_plateau import rows, SOURCE
ROOT=Path(__file__).resolve().parents[1]

def inspect(row):
    E=set(map(tuple,row['edges']));P=list(map(tuple,row['P']));B=set().union(*(set(combinations(t,2)) for t in P))
    ts=[tuple(t) for t in combinations(range(row['n']),3) if set(combinations(t,2))<=E]
    assert ts==list(map(tuple,row['triangles']))
    degree=Counter(v for t in P for v in t); R=set();centres=[];pages=[]
    for t in P:
        part=set(combinations(t,2));private=[q for q in ts if len(set(combinations(q,2))&B)==1 and set(combinations(q,2))&B<=part]
        bases={next(iter(set(combinations(q,2))&B)) for q in private};assert len(bases)==1
        b=next(iter(bases));c=next(iter(set(t)-set(b)));tips={next(iter(set(q)-set(b))) for q in private}
        if any(degree[c]<=degree[z] for z in tips):return 'NOT_LOCALLY_CONCENTRATED',None
        R.add(b);centres.append(c);pages.append(private)
    U=sorted(B-R);uix={e:i for i,e in enumerate(U)};owner={e:i for i,t in enumerate(P) for e in combinations(t,2)}
    constraints={sum(1<<uix[e] for e in set(combinations(t,2))&set(U)) for t in ts if not set(combinations(t,2))&R}
    opt=row['constrained_cover']-len(P);states=[]
    for chosen in combinations(range(len(U)),opt):
        m=sum(1<<i for i in chosen)
        if not all(m&q for q in constraints):continue
        cost=Counter()
        for i in chosen:cost[centres[owner[U[i]]]]+=1
        compatible=all(cost[v]<=p for v,p in Counter(centres).items())
        states.append({'mask':m,'cover':sorted(R|{U[i] for i in chosen}),'centre_costs':dict(cost),'compatible':compatible})
    if any(s['compatible'] for s in states):return 'PASS',None
    return 'FAIL',{'row':row,'packing_degrees':dict(degree),'centres':centres,'private_pages':pages,'bases':sorted(R),'U':U,'all_minimum_states':states}

def maximum_concentration(row):
    E=sorted(map(tuple,row['edges']));ix={e:i for i,e in enumerate(E)}
    ts=[tuple(t) for t in combinations(range(row['n']),3) if all(e in ix for e in combinations(t,2))]
    masks=[sum(1<<ix[e] for e in combinations(t,2)) for t in ts]
    p=len(row['P']);degree=[0]*row['n'];best=-1;bestP=None;counts=Counter();start=time.monotonic()
    def dfs(next_i,used,chosen):
        nonlocal best,bestP
        if len(chosen)==p:
            counts['maximum_packings']+=1;value=sum(d*d for d in degree)
            if value>best:best=value;bestP=[ts[i] for i in chosen]
            return
        if len(ts)-next_i<p-len(chosen):return
        for i in range(next_i,len(ts)):
            if masks[i]&used:continue
            for v in ts[i]:degree[v]+=1
            dfs(i+1,used|masks[i],chosen+[i])
            for v in ts[i]:degree[v]-=1
    dfs(0,0,[])
    return {'max_sum_squared_degrees':best,'witness_packing':bestP,**dict(counts),'elapsed_seconds':time.monotonic()-start}

start=time.monotonic();counts=Counter();failure=None;seen=0
for i,row in enumerate(rows()):
    seen+=1
    if row['status']!='COMPLETE':continue
    state,detail=inspect(row);counts[state]+=1
    if state=='FAIL':
        detail['source_row_index']=i;detail['concentration_optimum']=maximum_concentration(row)
        failure=detail;break
    if time.monotonic()-start>90:break
result={'claim':'Every all-type1 maximum packing with d_P(c_T)>d_P(z) for every private apex z admits a canonical-centre compatible minimum support cover.','source':str(SOURCE),'source_sha256':hashlib.sha256(SOURCE.read_bytes()).hexdigest(),'seen_rows':seen,'counts':dict(counts),'elapsed_seconds':time.monotonic()-start,'failure':failure,'stop':'FIRST_FAILURE' if failure else ('TIME_LIMIT' if time.monotonic()-start>90 else 'SOURCE_END'),'scope':'The degree inequalities follow from globally maximizing sum_v d_P(v)^2 among maximum packings. The tested relaxation might still be stronger than actual optimality.'}
(ROOT/'evidence/packing_routes/concentration_corpus.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='failure'}));print('FAILURE_ROW',None if failure is None else failure['source_row_index']);print('OPTIMUM',None if failure is None else failure['concentration_optimum'])
