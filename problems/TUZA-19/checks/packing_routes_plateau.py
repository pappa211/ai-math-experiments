"""Exact new reconfiguration gate on frozen TUZA-18 literal type-1 corpus.
Standalone standard-library implementation; never imports producer code.
"""
import gzip, json, time, hashlib
from pathlib import Path
from itertools import combinations
from collections import Counter, deque
ROOT=Path(__file__).resolve().parents[1]
SOURCE=Path('ARCHIVE/TUZA-18/evidence/apex_type1_directed_ledger.json.gz')

def rows():
    d=json.JSONDecoder();buf=''
    with gzip.open(SOURCE,'rt') as f:
        while True:
            buf=buf.lstrip(' \n\r\t[,]')
            try: obj,end=d.raw_decode(buf)
            except json.JSONDecodeError:
                chunk=f.read(65536)
                if not chunk:
                    assert not buf;return
                buf+=chunk;continue
            yield obj;buf=buf[end:]

def deficiency(P,loads):
    H=[i for i,a in enumerate(loads) if a==3]
    L=[i for i,a in enumerate(loads) if a==1]
    adj={i:[j for j in L if set(P[i])&set(P[j])] for i in H}
    matched={}
    def aug(i,seen):
        for j in adj[i]:
            if j in seen:continue
            seen.add(j)
            if j not in matched or aug(matched[j],seen):matched[j]=i;return True
        return False
    m=sum(aug(i,set()) for i in H)
    return len(H)-m

def inspect(row):
    E=set(map(tuple,row['edges']));P=list(map(tuple,row['P']))
    ts=[tuple(t) for t in combinations(range(row['n']),3) if set(combinations(t,2))<=E]
    assert sorted(ts)==sorted(map(tuple,row['triangles']))
    B=set().union(*(set(combinations(t,2)) for t in P))
    assert len(B)==3*len(P)
    private=[]
    for t in P:
        part=set(combinations(t,2)); q={next(iter(set(combinations(q,2))&B)) for q in ts if len(set(combinations(q,2))&B)==1 and set(combinations(q,2))&B<=part}
        assert len(q)==1
        private.append(next(iter(q)))
    R=set(private);U=sorted(B-R);uix={e:i for i,e in enumerate(U)}
    constraints={sum(1<<uix[e] for e in set(combinations(t,2))&set(U)) for t in ts if not set(combinations(t,2))&R}
    optimum=row['constrained_cover']-len(P)
    states=[];deltas={};loads={}
    owner={e:i for i,t in enumerate(P) for e in combinations(t,2)}
    for chosen in combinations(range(len(U)),optimum):
        mask=sum(1<<i for i in chosen)
        if all(mask&q for q in constraints):
            states.append(mask)
            load=[1]*len(P)
            for i in chosen:load[owner[U[i]]]+=1
            loads[mask]=load;deltas[mask]=deficiency(P,load)
    assert states
    state_set=set(states)
    adjacency={m:[] for m in states}
    for m in states:
        for a in range(len(U)):
            if not m>>a&1:continue
            for b in range(len(U)):
                if m>>b&1:continue
                n=m^(1<<a)^(1<<b)
                if n in state_set:adjacency[m].append(n)
    good={m for m in states if deltas[m]==0}
    reach=set(good);queue=deque(good)
    while queue:
        m=queue.popleft()
        for n in adjacency[m]:
            if n not in reach and deltas[n]>=deltas[m]:reach.add(n);queue.append(n)
    unreachable=state_set-reach
    anypath=set(good);queue=deque(good)
    while queue:
        m=queue.popleft()
        for n in adjacency[m]:
            if n not in anypath:anypath.add(n);queue.append(n)
    stats={'states':len(states),'bad_states':len(state_set-good),'monotone_traps':len(unreachable),'component_traps':len(state_set-anypath),'sum_of_row_max_deficiency':max(deltas.values())}
    if not unreachable:return stats,None
    bad=min(unreachable)
    def cover(m):return sorted(R|{e for i,e in enumerate(U) if m>>i&1})
    return stats,{'row':row,'private_bases':private,'U':U,'residual_constraints':[[U[i] for i in range(len(U)) if q>>i&1] for q in sorted(constraints)],'bad_cover':cover(bad),'bad_mask':bad,'states':[{'mask':m,'cover':cover(m),'loads':loads[m],'deficiency':deltas[m],'neighbors':adjacency[m],'monotone_reachable':m in reach,'reachable':m in anypath} for m in states]}

if __name__=="__main__":
    start=time.monotonic();total=Counter();first=None;seen=0;last_index=None
    for i,row in enumerate(rows()):
        seen+=1;last_index=i
        if row['status']!='COMPLETE':continue
        s,bad=inspect(row);total.update(s);total['eligible_rows']+=1
        if bad is not None:first={'source_row_index':i,**bad};break
        if time.monotonic()-start>90:break
    result={'gate':'Every minimum B-cover of a maximum all-type1 P can reach Hall deficiency zero by equal-cost single-edge swaps with nonincreasing deficiency.','source':str(SOURCE),'source_sha256':hashlib.sha256(SOURCE.read_bytes()).hexdigest(),'seen_rows':seen,'last_index':last_index,'totals':dict(total),'elapsed_seconds':time.monotonic()-start,'first_failure':first,'stop':'FIRST_FAILURE' if first else ('TIME_LIMIT' if time.monotonic()-start>90 else 'SOURCE_END'),'qualification':'New exact gate on old retained inputs. Source optimum/max-P status is imported; any decisive witness must be independently reconstructed.'}
    out=ROOT/'evidence/packing_routes/plateau_corpus.json';out.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k!='first_failure'}));print('FAILURE_ROW',None if first is None else first['source_row_index'])
