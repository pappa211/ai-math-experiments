#!/usr/bin/env python3
"""Exact outward MPFR exponent enclosure + exact GMP suffix exclusions.
Computational evidence only. No fixed point is reported without exact full
core digit sum AND length checks. Partial runs certify only last_completed_k.
"""
import argparse,ctypes,hashlib,json,math,resource,signal,time
from datetime import datetime,timezone
from pathlib import Path
from gmp_suffix import MPZ,Ptr,fn,libc,calculate,version as gmp_version

class MPFR(ctypes.Structure):
    _fields_=[('precision',ctypes.c_long),('sign',ctypes.c_int),('exponent',ctypes.c_long),('limbs',ctypes.c_void_p)]
FP=ctypes.POINTER(MPFR)
lib=ctypes.CDLL('libmpfr.so.6')
lib.mpfr_get_version.restype=ctypes.c_char_p
mpfr_version=lib.mpfr_get_version().decode();assert mpfr_version=='4.2.1'
assert ctypes.sizeof(MPFR)==32
spec={'init2':([FP,ctypes.c_long],None),'clear':([FP],None),
 'set_ui':([FP,ctypes.c_ulong,ctypes.c_int],ctypes.c_int),
 'log10':([FP,FP,ctypes.c_int],ctypes.c_int),
 'ui_div':([FP,ctypes.c_ulong,FP,ctypes.c_int],ctypes.c_int),
 'get_ui':([FP,ctypes.c_int],ctypes.c_ulong),
 'number_p':([FP],ctypes.c_int),'sgn':([FP],ctypes.c_int),
 'print_rnd_mode':([ctypes.c_int],ctypes.c_char_p)}
mp={}
for name,(args,ret) in spec.items():
    f=getattr(lib,'mpfr_'+name);f.argtypes=args;f.restype=ret;mp[name]=f
modes={mp['print_rnd_mode'](i).decode():i for i in range(6)}
DOWN=modes['MPFR_RNDD'];UP=modes['MPFR_RNDU'];NEAREST=modes['MPFR_RNDN']

class Enclosure:
    def __init__(self):
        self.items=[MPFR() for _ in range(5)]
        self.ptr=[ctypes.byref(x) for x in self.items]
        for p in self.ptr:mp['init2'](p,128)
    def bounds(self,k):
        x,lo,hi,a,b=self.ptr
        assert mp['set_ui'](x,k,NEAREST)==0
        assert mp['log10'](lo,x,DOWN)<=0
        assert mp['log10'](hi,x,UP)>=0
        assert mp['number_p'](lo) and mp['sgn'](lo)>0
        assert mp['ui_div'](a,k-1,hi,DOWN)<=0
        assert mp['ui_div'](b,k,lo,UP)>=0
        left=mp['get_ui'](a,UP);right=mp['get_ui'](b,UP)-1
        assert 0<=left<=k*9 and right<=k*9
        return left,right
    def close(self):
        for p in self.ptr:mp['clear'](p)

def weight(buf):
    raw=buf.raw
    return sum(d*raw.count(bytes([48+d])) for d in range(1,10))
def full_core(u,s):
    x=MPZ();fn['init'](ctypes.byref(x))
    try:
        fn['ui_pow_ui'](ctypes.byref(x),u,s)
        buf=ctypes.create_string_buffer(fn['sizeinbase'](ctypes.byref(x),10)+2)
        fn['get_str'](buf,10,ctypes.byref(x));return buf,libc.strlen(buf)
    finally:fn['clear'](ctypes.byref(x))

def selftest(enc):
    # Independent integer endpoint correction checks EVERY k in this range.
    exact=outer=extras=0
    for k in range(2,10001):
        lo,hi=enc.bounds(k);outer+=max(0,hi-lo+1)
        s=max(0,int((k-1)/math.log10(k)));n=k**s;low=10**(k-1);high=10*low
        while n<low:s+=1;n*=k
        while s>0 and n//k>=low:s-=1;n//=k
        while n<high:
            assert lo<=s<=hi;exact+=1;n*=k;s+=1
        for e in range(lo,hi+1):
            # Enclosure extras are safe, but record them explicitly.
            if not low<=k**e<high:extras+=1
    for u,e,m in [(2,5,1),(2,70,22),(6,700,100),(17,333,200),(101,400,700)]:
        buf,length=calculate(u,e,m);n=pow(u,e,10**m)
        assert bytes(buf[:length]).decode()==str(n)
        assert weight(buf)==sum(map(int,str(n)))
    assert outer==exact+extras
    return dict(exact_length_candidates=exact,enclosed_candidates=outer,enclosure_extras=extras)

def main():
    ap=argparse.ArgumentParser();ap.add_argument('--start',type=int,default=100001)
    ap.add_argument('--limit',type=int,required=True);ap.add_argument('--seconds',type=float,default=5400)
    ap.add_argument('--output',required=True);ap.add_argument('--selftest',action='store_true');a=ap.parse_args()
    assert 2<=a.start<=a.limit<=10000000 and 0<a.seconds<=5400
    cap=512*1024*1024;resource.setrlimit(resource.RLIMIT_AS,(cap,cap))
    resource.setrlimit(resource.RLIMIT_CPU,(5500,5510))
    stopping=[False]
    def stop(sig,frame):stopping[0]=True
    signal.signal(signal.SIGTERM,stop);signal.signal(signal.SIGINT,stop)
    enc=Enclosure();outpath=Path(a.output);start=time.monotonic()
    out=dict(start_utc=datetime.now(timezone.utc).isoformat(),start_k=a.start,requested_limit=a.limit,
        last_completed_k=a.start-1,complete=False,enclosed_exponent_candidates=0,mod9_survivors=0,
        suffix_exclusions=0,pure_ten_exclusions=0,full_core_checks=0,known=[],additional_candidates=[],
        gmp_version=gmp_version,mpfr_version=mpfr_version,precision_bits=128,
        source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        gmp_helper_sha256=hashlib.sha256(Path(__file__).with_name('gmp_suffix.py').read_bytes()).hexdigest(),
        scope='MPFR/GMP computational evidence, not Lean kernel verification.')
    def save():
        out['elapsed_seconds']=time.monotonic()-start
        out['max_rss_kib']=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss
        temp=outpath.with_suffix(outpath.suffix+'.tmp');temp.write_text(json.dumps(out,indent=2));temp.replace(outpath)
    save()
    try:
        if a.selftest:out['selftest']=selftest(enc);save()
        for k in range(a.start,a.limit+1):
            if stopping[0] or time.monotonic()-start>=a.seconds:break
            lo,hi=enc.bounds(k)
            for s in range(lo,hi+1):
                out['enclosed_exponent_candidates']+=1
                if pow(k,s,9)!=s%9:continue
                out['mod9_survivors']+=1
                u=k;t=0
                while u%10==0:u//=10;t+=1
                if u==1:out['pure_ten_exclusions']+=1;continue
                m=(s+3)//4+32
                buf,length=calculate(u,s,m)
                if weight(buf)>s:
                    out['suffix_exclusions']+=1;continue
                # A short residue string does NOT certify a full core.
                out['full_core_checks']+=1
                buf,length=full_core(u,s)
                if weight(buf)!=s or length+t*s!=k:continue
                item=dict(k=k,s=s,u=u,t=t,core_digits=length)
                if k==2 and s==5 and t==0:out['known'].append(item);continue
                path=outpath.parent/('found_core_k'+str(k)+'.txt')
                path.write_bytes(memoryview(buf).cast('B')[:length]);item['core_file']=str(path)
                out['additional_candidates'].append(item)
            out['last_completed_k']=k
            if k%10000==0 or out['additional_candidates']:
                save();print(json.dumps(dict(k=k,elapsed=out['elapsed_seconds'],survivors=out['mod9_survivors'],found=len(out['additional_candidates']))),flush=True)
            if out['additional_candidates']:break
        out['complete']=out['last_completed_k']==a.limit
        save();print(json.dumps(out),flush=True)
    finally:enc.close()
if __name__=='__main__':main()
