#!/usr/bin/env python3
"""All C5 + r independent apex neighborhood multisets, exact all minimum covers.
No SciPy, graph solver, or coordinator core imports. Integer-only family reduction.
"""
from pathlib import Path
from itertools import combinations,combinations_with_replacement,product
from functools import lru_cache
from collections import Counter
import argparse,json,datetime,time,signal,fcntl,math
ROOT=Path(__file__).resolve().parents[1]
ES=tuple(sorted(tuple(sorted((i,(i+1)%5))) for i in range(5)))
EDGE_MASK=[(1<<a)|(1<<b) for a,b in ES]
INDUCED=[sum(1<<i for i,p in enumerate(EDGE_MASK) if U&p==p) for U in range(32)]
MATCHINGS=tuple(F for F in range(32) if all(sum(bool(F>>i&1 and v in e) for i,e in enumerate(ES))<=1 for v in range(5)))
MATCHING_SUBSETS={A:tuple(M for M in MATCHINGS if not M&~A) for A in range(32)}
OPTIONS={}
for F in range(32):
    for N in range(32):
        candidates=[U for U in range(32) if not U&~N and not INDUCED[U]&~F]
        alpha=max(U.bit_count() for U in candidates)
        OPTIONS[F,N]=(alpha,tuple(U for U in candidates if U.bit_count()==alpha))

@lru_cache(None)
def layer_optimum(layers,available=31):
    if not layers:return (0,())
    best=(-1,())
    for M in MATCHING_SUBSETS[layers[0]&available]:
        val,tail=layer_optimum(layers[1:],available^M);val+=M.bit_count()
        if val>best[0]:best=(val,(M,)+tail)
    return best

def solve(allowed):
    order=sorted(range(len(allowed)),key=lambda i:allowed[i]);val,w=layer_optimum(tuple(allowed[i] for i in order));out=[0]*len(order)
    for i,M in zip(order,w):out[i]=M
    return val,out

def E_and_T(Ns):
    es=tuple(sorted(ES+tuple((v,5+i) for i,N in enumerate(Ns) for v in range(5) if N>>v&1)))
    E=set(es);ts=tuple(t for t in combinations(range(5+len(Ns)),3) if all(e in E for e in combinations(t,2)))
    expected=tuple(sorted((a,b,5+i) for i,N in enumerate(Ns) for j,(a,b) in enumerate(ES) if INDUCED[N]>>j&1))
    assert ts==expected
    return es,ts

def evaluate(Ns):
    r=len(Ns);costs=[F.bit_count()+sum(N.bit_count()-OPTIONS[F,N][0] for N in Ns) for F in range(32)]
    tau=min(costs);Fs=[F for F in range(32) if costs[F]==tau];target=(tau+1)//2
    es,ts=E_and_T(Ns);count=0;stats=Counter();minmargin=99;worst=None;max3=0;choices=[]
    for F in Fs:
        opts=[OPTIONS[F,N][1] for N in Ns];choices.append({'base_Fmask':F,'apex_U_options':opts})
        for Us in product(*opts):
            C=tuple(sorted(tuple(e for j,e in enumerate(ES) if F>>j&1)+tuple((v,5+i) for i,(N,U) in enumerate(zip(Ns,Us)) for v in range(5) if N>>v&1 and not U>>v&1)))
            assert len(C)==tau
            Cset=set(C);red=[len(Cset&set(combinations(t,2))) for t in ts];assert all(red)
            allowed=[]
            for N,U in zip(Ns,Us):
                selected=N&~U
                excluded=sum(1<<j for j,p in enumerate(EDGE_MASK) if F>>j&1 and selected&p==p)
                allowed.append(INDUCED[N]&~excluded)
            eligible,Ms=solve(allowed);margin=eligible-target;count+=1;stats[(eligible,red.count(3))]+=1;max3=max(max3,red.count(3))
            if margin<minmargin or (margin==minmargin and (worst is None or red.count(3)>worst['T_class_sizes'][2])):
                minmargin=margin
                worst={'cover':C,'base_Fmask':F,'apex_Umasks':Us,'T_class_sizes':[red.count(i) for i in [1,2,3]],'nu_eligible':eligible,'maximum_eligible_packing':[(a,b,5+i) for i,M in enumerate(Ms) for j,(a,b) in enumerate(ES) if M>>j&1],'D':-margin}
            if margin<0:break
        if minmargin<0:break
    fullnu,fullMs=solve([INDUCED[N] for N in Ns]);assert worst['nu_eligible']<=fullnu
    expected=sum(math.prod(len(OPTIONS[F,N][1]) for N in Ns) for F in Fs)
    row={'apex_neighborhood_masks':Ns,'n':5+r,'edges':es,'triangles':ts,'tau':tau,'target':target,'nu_full':fullnu,'all_cover_count':expected,'tested_cover_count':count,'complete':count==expected,'minimum_margin':minmargin,'max_T3':max3,'distribution':[{'nu_eligible':k[0],'T3':k[1],'covers':v} for k,v in sorted(stats.items())],'all_cover_parameterization':choices,'nearest':worst}
    if minmargin<0:
        row['status']='CANDIDATE_UNCONFIRMED';(ROOT/'witnesses/hostile_unequal_c5_candidate.json').write_text(json.dumps(row,indent=2)+'\n')
    return row

class Deadline(Exception):pass

def main():
    ap=argparse.ArgumentParser();ap.add_argument('--apices',type=int,default=3);ap.add_argument('--seconds',type=int,default=180);args=ap.parse_args()
    signal.signal(signal.SIGALRM,lambda *_:(_ for _ in ()).throw(Deadline()))
    started=time.monotonic();rows=[];exception=None;start=datetime.datetime.now(datetime.timezone.utc).isoformat();output=ROOT/'evidence'/f'hostile_unequal_c5_apices{args.apices}.json'
    with (ROOT/'evidence/compute.lock').open('a+') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX);signal.alarm(args.seconds);compute_start=time.monotonic()
        try:
            for Ns in combinations_with_replacement(range(32),args.apices):
                row=evaluate(Ns);rows.append(row)
                if len(rows)%1000==0:print({'graphs':len(rows),'covers':sum(r['tested_cover_count'] for r in rows),'elapsed':time.monotonic()-compute_start},flush=True)
                if row['minimum_margin']<0:break
        except Deadline:exception='campaign_alarm_timeout'
        finally:
            signal.alarm(0)
            total=math.comb(32+args.apices-1,args.apices)
            out={'started_utc':start,'ended_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'generator':'C5 fixed on 0..4; one canonical apex order per neighborhood multiset of the 32 base subsets; all neighborhood assignments up to apex-label permutation','apices':args.apices,'expected_neighborhood_multisets':total,'graphs_tested':len(rows),'all_cover_count_sum':sum(r['all_cover_count'] for r in rows),'covers_tested':sum(r['tested_cover_count'] for r in rows),'generator_complete':len(rows)==total,'all_finished_graph_cover_enumerations_complete':all(r['complete'] for r in rows),'minimum_margin':min((r['minimum_margin'] for r in rows),default=None),'maximum_T3':max((r['max_T3'] for r in rows),default=None),'graphs_with_T3':sum(r['max_T3']>0 for r in rows),'exception':exception,'wall_seconds':time.monotonic()-started,'compute_seconds':time.monotonic()-compute_start,'packing_cache':str(layer_optimum.cache_info()),'graphs':rows}
            output.write_text(json.dumps(out,separators=(',',':'))+'\n')
            print(json.dumps({k:v for k,v in out.items() if k!='graphs'},indent=2),flush=True)
if __name__=='__main__':main()
