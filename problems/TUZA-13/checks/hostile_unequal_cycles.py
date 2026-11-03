#!/usr/bin/env python3
"""Bounded streaming exact cycle/unequal-apex census, all minimum covers.
Every tested graph's full actual edge list is retained in a JSONL manifest.
"""
from pathlib import Path
from itertools import combinations,combinations_with_replacement,product
from functools import lru_cache
from collections import Counter
import argparse,json,datetime,time,signal,fcntl,math,hashlib
ROOT=Path(__file__).resolve().parents[1]
class Deadline(Exception):pass

def main():
    ap=argparse.ArgumentParser();ap.add_argument('--cycle',type=int,default=5);ap.add_argument('--apices',type=int,default=4);ap.add_argument('--seconds',type=int,default=120);args=ap.parse_args()
    b=args.cycle;r=args.apices;M=1<<b;full=M-1
    ES=tuple(sorted(tuple(sorted((i,(i+1)%b))) for i in range(b)))
    EM=tuple((1<<a)|(1<<c) for a,c in ES)
    IM=[sum(1<<i for i,p in enumerate(EM) if U&p==p) for U in range(M)]
    matchings=tuple(F for F in range(M) if all(sum(bool(F>>i&1 and v in e) for i,e in enumerate(ES))<=1 for v in range(b)))
    subsetmatch=[tuple(F for F in matchings if not F&~A) for A in range(M)]
    opts={};sizes=[N.bit_count() for N in range(M)]
    for F in range(M):
        for N in range(M):
            can=[U for U in range(M) if not U&~N and not IM[U]&~F]
            alpha=max(sizes[U] for U in can);opts[F,N]=(sizes[N]-alpha,tuple(U for U in can if sizes[U]==alpha))
    @lru_cache(None)
    def layers(ls,available):
        if not ls:return (0,())
        best=(-1,())
        for MM in subsetmatch[ls[0]&available]:
            v,tail=layers(ls[1:],available^MM);v+=sizes[MM]
            if v>best[0]:best=(v,(MM,)+tail)
        return best
    @lru_cache(None)
    def solve(allowed):
        order=sorted(range(len(allowed)),key=lambda i:allowed[i]);v,ws=layers(tuple(allowed[i] for i in order),full);out=[0]*len(order)
        for i,MM in zip(order,ws):out[i]=MM
        return v,tuple(out)
    signal.signal(signal.SIGALRM,lambda *_:(_ for _ in ()).throw(Deadline()))
    tag=f'C{b}_apices{r}';manifest=ROOT/'evidence'/f'hostile_{tag}_graphs.jsonl';summary=ROOT/'evidence'/f'hostile_{tag}_summary.json';started=time.monotonic();startutc=datetime.datetime.now(datetime.timezone.utc).isoformat();graphs=0;covers=0;exceptions=[];hist=Counter();worst={};T3graphs=0;lossgraphs=0;maxT3=0;expected=math.comb(M+r-1,r);candidate=None;lastNs=None
    with (ROOT/'evidence/compute.lock').open('a+') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX);signal.alarm(args.seconds);compute_start=time.monotonic()
        with manifest.open('w') as output:
            try:
                for Ns in combinations_with_replacement(range(M),r):
                    lastNs=Ns
                    cs=[sizes[F]+sum(opts[F,N][0] for N in Ns) for F in range(M)];tau=min(cs);Fs=[F for F in range(M) if cs[F]==tau];target=(tau+1)//2
                    E=tuple(sorted(ES+tuple((v,b+i) for i,N in enumerate(Ns) for v in range(b) if N>>v&1)))
                    eset=set(E);ts=tuple(t for t in combinations(range(b+r),3) if all(e in eset for e in combinations(t,2)))
                    assert ts==tuple(sorted((a,c,b+i) for i,N in enumerate(Ns) for j,(a,c) in enumerate(ES) if IM[N]>>j&1))
                    num=0;minnu=999;gmax3=0;nearest=None;fullnu,_=solve(tuple(IM[N] for N in Ns));expectedcovers=sum(math.prod(len(opts[F,N][1]) for N in Ns) for F in Fs)
                    for F in Fs:
                        for Us in product(*(opts[F,N][1] for N in Ns)):
                            allowed=tuple(IM[N]&~(F&IM[N&~U]) for N,U in zip(Ns,Us));nu,MMs=solve(allowed);t3=sum((IM[N]&~A).bit_count() for N,A in zip(Ns,allowed));num+=1
                            assert nu<=fullnu
                            if nu<minnu or (nu==minnu and t3>(nearest['T3'] if nearest else -1)):
                                C=tuple(sorted(tuple(e for j,e in enumerate(ES) if F>>j&1)+tuple((v,b+i) for i,(N,U) in enumerate(zip(Ns,Us)) for v in range(b) if N>>v&1 and not U>>v&1)))
                                assert len(C)==tau
                                Cset=set(C);red=[len(Cset&set(combinations(t,2))) for t in ts];assert all(red) and red.count(3)==t3
                                P=tuple((a,c,b+i) for i,MM in enumerate(MMs) for j,(a,c) in enumerate(ES) if MM>>j&1)
                                assert len(P)==nu and len(set(e for t in P for e in combinations(t,2)))==3*nu
                                minnu=nu;nearest={'cover':C,'T3':t3,'T_class_sizes':[red.count(i) for i in [1,2,3]],'packing':P,'nu_eligible':nu,'D':target-nu}
                            gmax3=max(gmax3,t3)
                            if nu<target:break
                        if minnu<target:break
                    complete=num==expectedcovers;graphs+=1;covers+=num;T3graphs+=gmax3>0;lossgraphs+=minnu<fullnu;maxT3=max(maxT3,gmax3);hist[(tau,minnu-target,gmax3)]+=1
                    rec={'Ns':Ns,'n':b+r,'edges':E,'tau':tau,'target':target,'nu_full':fullnu,'min_eligible_nu':minnu,'margin':minnu-target,'max_T3':gmax3,'all_cover_count':expectedcovers,'tested_cover_count':num,'all_covers_complete':complete}
                    output.write(json.dumps(rec,separators=(',',':'))+'\n')
                    key=(tau,minnu-target,gmax3)
                    if key not in worst or len(E)<len(worst[key]['edges']):worst[key]={**rec,'triangles':ts,'nearest':nearest}
                    if graphs%25000==0:output.flush();print({'graphs':graphs,'covers':covers,'seconds':time.monotonic()-compute_start},flush=True)
                    if minnu<target:
                        candidate={**rec,'triangles':ts,'nearest':nearest};(ROOT/'witnesses'/f'hostile_{tag}_candidate.json').write_text(json.dumps(candidate,indent=2)+'\n');break
            except Deadline:exceptions.append({'kind':'campaign_alarm_timeout','pending_neighborhood_multiset':lastNs})
            finally:
                signal.alarm(0);output.flush()
        out={'started_utc':startutc,'ended_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'base_cycle':b,'apices':r,'expected_neighborhood_multisets':expected,'graphs_completed':graphs,'covers_completed':covers,'complete_generator':graphs==expected,'all_completed_graphs_cover_enumeration_complete':candidate is None,'max_T3':maxT3,'graphs_with_T3':T3graphs,'graphs_with_eligible_packing_loss':lossgraphs,'minimum_margin':min((k[1] for k in hist),default=None),'exceptions':exceptions,'compute_seconds':time.monotonic()-compute_start,'wall_seconds_including_lock_wait':time.monotonic()-started,'graph_manifest':str(manifest.relative_to(ROOT)),'manifest_sha256':hashlib.sha256(manifest.read_bytes()).hexdigest(),'counts_by_tau_margin_maxT3':[{'tau':k[0],'margin':k[1],'max_T3':k[2],'graphs':v} for k,v in sorted(hist.items())],'packing_cache':str(layers.cache_info()),'candidate':candidate is not None}
        import gzip,shutil
        compressed=manifest.with_suffix(manifest.suffix+'.gz')
        with manifest.open('rb') as src,compressed.open('wb') as dst:
            with gzip.GzipFile(filename='',mode='wb',fileobj=dst,mtime=0) as zipped:shutil.copyfileobj(src,zipped)
        out['manifest_uncompressed_sha256']=out['manifest_sha256'];out['manifest_sha256']=hashlib.sha256(compressed.read_bytes()).hexdigest();out['graph_manifest']=str(compressed.relative_to(ROOT));out['manifest_compression']='gzip, lossless, zero metadata timestamp';manifest.unlink()
        summary.write_text(json.dumps(out,indent=2)+'\n');(ROOT/'witnesses'/f'hostile_{tag}_nearest.json').write_text(json.dumps(list(worst.values()),indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k!='counts_by_tau_margin_maxT3'},indent=2),flush=True)
if __name__=='__main__':main()
