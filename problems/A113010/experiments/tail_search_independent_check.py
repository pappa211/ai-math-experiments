#!/usr/bin/env python3
"""Bounded independent-Python arithmetic checks of sampled large tail-search cases.
Not a complete search, not a Lean certificate. Stage/run only in the serial slot.
"""
import argparse, hashlib, json, math, resource, signal, sys, time
from datetime import datetime, timezone
from pathlib import Path
from tail_search import Enclosure
from gmp_suffix import calculate


def exact_exponents(k):
    # Float is only a seed; Python integer inequalities correct both boundaries.
    low=10**(k-1); high=10*low
    s=max(0,int((k-1)/math.log10(k))); n=k**s
    while n<low:
        s+=1; n*=k
    while s and n//k>=low:
        s-=1; n//=k
    found=[]
    while n<high:
        found.append(s); s+=1; n*=k
    return found


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--coverage-json',required=True)
    ap.add_argument('--output',required=True)
    ap.add_argument('--seconds',type=float,default=540)
    ap.add_argument('--small-selftest',action='store_true')
    args=ap.parse_args()
    assert 0<args.seconds<=540
    cap=512*1024*1024
    resource.setrlimit(resource.RLIMIT_AS,(cap,cap))
    resource.setrlimit(resource.RLIMIT_CPU,(590,600))
    sys.set_int_max_str_digits(0)
    stopping=[False]
    def stop(sig,frame): stopping[0]=True
    signal.signal(signal.SIGTERM,stop); signal.signal(signal.SIGINT,stop)
    start=time.monotonic(); enc=Enclosure(); outpath=Path(args.output)
    source=Path(__file__)
    out=dict(start_utc=datetime.now(timezone.utc).isoformat(),
        scope='Sampled CPython-integer cross-check, not exhaustive coverage or Lean verification',
        source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
        tail_source_sha256=hashlib.sha256(source.with_name('tail_search.py').read_bytes()).hexdigest(),
        gmp_helper_sha256=hashlib.sha256(source.with_name('gmp_suffix.py').read_bytes()).hexdigest(),
        python_version=sys.version,complete=False,cases=[])
    def save():
        out['elapsed_seconds']=time.monotonic()-start
        out['max_rss_kib']=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss
        tmp=outpath.with_suffix(outpath.suffix+'.tmp')
        tmp.write_text(json.dumps(out,indent=2)); tmp.replace(outpath)
    try:
        if args.small_selftest:
            samples=[(k,False) for k in [2,9,10,11,99,100,101,999,1000]]
            samples += [(121,True),(122,True)]
        else:
            coverage=Path(args.coverage_json)
            record=json.loads(coverage.read_text())
            limit=record['last_completed_k']
            assert limit>=5000000 and record['complete']
            assert record['source_sha256']==out['tail_source_sha256']
            assert record['gmp_helper_sha256']==out['gmp_helper_sha256']
            out['coverage_record_sha256']=hashlib.sha256(coverage.read_bytes()).hexdigest()
            out['coverage_record_path']=str(coverage)
            out['coverage_interval']=[record['start_k'],limit]
            samples=[]
            # Deterministically select six actual mod9 survivors across the run.
            for anchor in [1200000,1960000,2720000,3480000,4240000,5000000]:
                for k in range(anchor,anchor-1024,-1):
                    lo,hi=enc.bounds(k)
                    if any(pow(k,s,9)==s%9 for s in range(lo,hi+1)):
                        samples.append((k,True)); break
                else:
                    raise AssertionError('No survivor near planned anchor')
            samples += [(k,False) for k in [1000001,1000002,1999999,2000000,5000000]]
            assert all(record['start_k']<=k<=limit for k,_ in samples)
        out['planned_cases']=[dict(k=k,check_suffix=check) for k,check in samples]
        save()
        for k,check in samples:
            if stopping[0] or time.monotonic()-start>=args.seconds: break
            tick=time.monotonic()
            exact=exact_exponents(k); lo,hi=enc.bounds(k)
            assert all(lo<=s<=hi for s in exact), (k,exact,lo,hi)
            case=dict(k=k,exact_exponents=exact,enclosure=[lo,hi],suffixes=[])
            if check:
                valid=[s for s in exact if pow(k,s,9)==s%9]
                assert valid, (k,exact)
                for s in valid:
                    u=k; t=0
                    while u%10==0: u//=10; t+=1
                    m=(s+3)//4+32
                    # This modular exponentiation and decimal conversion use
                    # CPython integers, independent of GMP's arithmetic path.
                    residue=pow(u,s,10**m); decimal=str(residue)
                    buf,length=calculate(u,s,m)
                    assert bytes(buf[:length])==decimal.encode(), (k,s,m)
                    digit_sum=sum(ord(c)-48 for c in decimal)
                    case['suffixes'].append(dict(s=s,u=u,t=t,width=m,
                        digits=len(decimal),digit_sum=digit_sum,
                        excludes=digit_sum>s,
                        sha256=hashlib.sha256(decimal.encode()).hexdigest()))
            case['seconds']=time.monotonic()-tick
            out['cases'].append(case); save()
            print(json.dumps(case),flush=True)
        out['complete']=len(out['cases'])==len(samples)
        save(); print(json.dumps(out),flush=True)
    except BaseException as error:
        out['error']=type(error).__name__+': '+str(error)
        save(); raise
    finally:
        enc.close()

if __name__=='__main__': main()
