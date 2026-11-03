"""Targeted A3/A4 checks on fixed controls; never writes source workspace."""
from pathlib import Path
import sys,json,time
SOURCE=Path(__file__).resolve().parents[2]/'TUZA-13'
sys.path.insert(0,str(SOURCE/'checks'))
from core import Graph,bits,BudgetExceeded
from itertools import combinations
OUT=Path(__file__).resolve().parents[1]/'evidence'/'track_a_controls.json'
start=time.monotonic()
records=[]
controls=[]
for name in ['independent_nearest_9_normalized','independent_nearest_3_normalized','independent_nearest_0_normalized','clebsch_two_red_required','theory_maximal_packing']:
    d=json.loads((SOURCE/'witnesses'/f'{name}.json').read_text())
    controls.append((name,d['n'],d['edges']))
for n in (4,5,7):controls.append((f'K{n}',n,list(combinations(range(n),2))))
for name,n,edges in controls:
    g=Graph(n,edges,seconds=3)
    try:
        tau,cs,complete=g.covers(limit=10000)
        assert complete
        tests=[]
        for C in cs:
            counts=[(m&C).bit_count() for m in g.masks]
            private={e:[i for i,m in enumerate(g.masks) if counts[i]==1 and (m>>e)&1] for e in bits(C)}
            unique=sorted(v[0] for v in private.values() if len(v)==1)
            used=0
            for t in unique:
                assert not used&g.masks[t]
                used|=g.masks[t]
            eligible=sum(1<<i for i,x in enumerate(counts) if x<3)
            rest=sum(1<<i for i in bits(eligible) if not (g.masks[i]&used))
            k=len(g.packing(eligible));forced=len(unique)+len(g.packing(rest))
            one=sum(1<<i for i,x in enumerate(counts) if x==1)
            pmax=max(map(len,private.values()),default=0)
            k1=len(g.packing(one)) if pmax<=2 else None
            tests.append({'cover':[g.edges[e] for e in bits(C)],'private_multiplicities':[len(v) for v in private.values()], 'unique_witnesses':[g.triangles[t] for t in unique], 'eligible_k':k,'forced_unique_k':forced,'A3_pass':forced==k,'A4_applicable':pmax<=2,'private_k':k1,'A4_pass':None if k1 is None else 2*k1>=tau})
        records.append({'name':name,'n':n,'edges':g.edges,'tau':tau,'covers_complete':complete,'cover_tests':tests})
    except BudgetExceeded:
        records.append({'name':name,'status':'TIMEOUT'})
res={'candidates':'A3 and A4 frozen in notes/TRACK_A.md before run','elapsed_seconds':time.monotonic()-start,'records':records}
OUT.write_text(json.dumps(res,indent=2)+'\n')
print(json.dumps({'elapsed_seconds':res['elapsed_seconds'],'graphs':len(records),'covers':sum(len(r.get('cover_tests',[])) for r in records),'A3_failures':[(r['name'],i) for r in records for i,t in enumerate(r.get('cover_tests',[])) if not t['A3_pass']],'A4_failures':[(r['name'],i) for r in records for i,t in enumerate(r.get('cover_tests',[])) if t['A4_pass'] is False],'timeouts':[r['name'] for r in records if r.get('status')=='TIMEOUT']}))
