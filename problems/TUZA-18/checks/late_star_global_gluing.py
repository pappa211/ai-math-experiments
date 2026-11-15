"""Test a new star-quota claim on frozen existing literal controls; stop at first failure."""
import gzip,json,time
from pathlib import Path
from itertools import combinations,product
from collections import Counter
ROOT=Path(__file__).resolve().parents[1]

def rows(path):
    dec=json.JSONDecoder();buf='';eof=False
    with gzip.open(path,'rt') as f:
        while True:
            buf=buf.lstrip(' \n\r\t[,]')
            if not buf and eof:return
            try:
                obj,end=dec.raw_decode(buf)
            except json.JSONDecodeError:
                chunk=f.read(65536)
                if not chunk:
                    eof=True
                    if not buf:return
                    raise
                buf+=chunk;continue
            yield obj;buf=buf[end:]

def solve(row):
    E={tuple(e) for e in row['edges']};P=[tuple(t) for t in row['P']]
    B=set().union(*(set(combinations(t,2)) for t in P))
    tris=[set(combinations(t,2)) for t in combinations(range(row['n']),3) if set(combinations(t,2))<=E]
    assert set(map(frozenset,tris))=={frozenset(combinations(t,2)) for t in row['triangles']}
    bases=[];tips=[]
    for t in P:
        F=set(combinations(t,2));private={next(iter(Q&B)) for Q in tris if len(Q&B)==1 and Q&B<=F}
        assert len(private)==1
        b=next(iter(private));bases.append(b);tips.append(next(iter(set(t)-set(b))))
    R=set(bases);U=sorted(B-R);p=len(P);owner={e:i for i,t in enumerate(P) for e in combinations(t,2)}
    residual=[Q for Q in tris if not Q&R]
    states=[]
    for mask in range(1<<len(U)):
        if mask.bit_count()>p:continue
        D={e for i,e in enumerate(U) if mask>>i&1}
        if all(D&Q for Q in residual):
            load=tuple(sum(owner[e]==i for e in D) for i in range(p))
            states.append((mask,load))
    def allowed(centres,load):
        cap=Counter(centres);used=Counter()
        for i,c in enumerate(centres):used[c]+=load[i]
        return all(used[c]<=cap[c] for c in cap)
    canonical=[(mask,load) for mask,load in states if allowed(tips,load)]
    if canonical:return None
    repair=None;assignments=0
    for centres in product(*P):
        assignments+=1
        for mask,load in states:
            if allowed(centres,load):
                repair={'centres':centres,'D':[e for i,e in enumerate(U) if mask>>i&1],'loads':load};break
        if repair:break
    return {'graph':row,'bases':bases,'canonical_centres':tips,'U':U,'residual_triangles':[[list(e) for e in sorted(Q)] for Q in residual], 'all_global_residual_cover_states':[{'D':[e for i,e in enumerate(U) if mask>>i&1],'loads':load} for mask,load in states], 'canonical_compatible':False,'arbitrary_centres_repair':repair,'centre_assignments_examined':assignments}

start=time.monotonic();tested=0;seen=0;bad=None;canonical_failures=0;first_canonical_failure=None
for i,row in enumerate(rows(ROOT/'evidence/apex_type1_directed_ledger.json.gz')):
    seen+=1
    if row['status']!='COMPLETE':continue
    tested+=1;candidate=solve(row)
    if candidate:
        canonical_failures+=1
        if first_canonical_failure is None:first_canonical_failure=i
        if candidate['arbitrary_centres_repair'] is None:
            bad=candidate;bad['source_row_index']=i;break
    if time.monotonic()-start>90:break
result={'claim':'Pure type1 existential-centre star quota gluing','canonical_failures':canonical_failures,'first_canonical_failure_row':first_canonical_failure,'source':'evidence/apex_type1_directed_ledger.json.gz','rows_seen':seen,'eligible_tested':tested,'elapsed_seconds':time.monotonic()-start,'first_failure':bad,'stop':'FIRST_FAILURE' if bad else 'TIME_OR_SOURCE_END','scope':'New constrained-cover discriminator; no universal claim from finite survival'}
(ROOT/'evidence/late_star_global_gluing.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'rows_seen':seen,'tested':tested,'elapsed':result['elapsed_seconds'],'bad':bad is not None,'repair':None if bad is None else bad['arbitrary_centres_repair']}))
