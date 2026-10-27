#!/usr/bin/env python3
"""Bounded exact GMP suffix computation; numerical evidence, not kernel proof.
Uses the public GMP6.x mpz ABI (two int fields and a limb pointer), checked
against installed version/limb width and independent Python self-tests.
GMP manual: Integer-Internals, Converting-Integers, Integer-Exponentiation.
"""
import argparse,ctypes,hashlib,json,random,resource,time
from datetime import datetime,timezone
from pathlib import Path
class MPZ(ctypes.Structure):
    _fields_=[('alloc',ctypes.c_int),('size',ctypes.c_int),('limbs',ctypes.c_void_p)]
Ptr=ctypes.POINTER(MPZ)
gmp=ctypes.CDLL('libgmp.so.10')
version=ctypes.c_char_p.in_dll(gmp,'__gmp_version').value.decode()
assert version=='6.3.0' and ctypes.c_int.in_dll(gmp,'__gmp_bits_per_limb').value==64
assert ctypes.sizeof(MPZ)==16 and ctypes.sizeof(ctypes.c_ulong)==8
spec={
 'init':([Ptr],None),'clear':([Ptr],None),'set_ui':([Ptr,ctypes.c_ulong],None),
 'ui_pow_ui':([Ptr,ctypes.c_ulong,ctypes.c_ulong],None),
 'powm_ui':([Ptr,Ptr,ctypes.c_ulong,Ptr],None),
 'sizeinbase':([Ptr,ctypes.c_int],ctypes.c_size_t),
 'get_str':([ctypes.c_void_p,ctypes.c_int,Ptr],ctypes.c_void_p),
 'fdiv_ui':([Ptr,ctypes.c_ulong],ctypes.c_ulong)}
fn={}
for key,(args,result) in spec.items():
    f=getattr(gmp,'__gmpz_'+key);f.argtypes=args;f.restype=result;fn[key]=f
libc=ctypes.CDLL(None);libc.strlen.argtypes=[ctypes.c_void_p];libc.strlen.restype=ctypes.c_size_t
start=time.monotonic()
def emit(kind,**kw):
    print(json.dumps(dict(type=kind,elapsed=time.monotonic()-start,
        max_rss_kib=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,**kw)),flush=True)
def calculate(u,e,m,progress=False):
    base,mod,out=MPZ(),MPZ(),MPZ()
    for x in (base,mod,out):fn['init'](ctypes.byref(x))
    try:
        fn['set_ui'](ctypes.byref(base),u)
        fn['ui_pow_ui'](ctypes.byref(mod),10,m)
        if progress:emit('modulus_ready')
        fn['powm_ui'](ctypes.byref(out),ctypes.byref(base),e,ctypes.byref(mod))
        if progress:emit('power_ready')
        assert fn['fdiv_ui'](ctypes.byref(out),10**min(9,m))==pow(u,e,10**min(9,m))
        size=fn['sizeinbase'](ctypes.byref(out),10)+2
        buf=ctypes.create_string_buffer(size)
        assert fn['get_str'](buf,10,ctypes.byref(out))==ctypes.addressof(buf)
        length=libc.strlen(buf)
        assert length<=m or m==0
        if progress:emit('decimal_ready',digits=length)
        return buf,length
    finally:
        for x in (base,mod,out):fn['clear'](ctypes.byref(x))
def selftest():
    rng=random.Random(113010)
    for _ in range(100):
        u=rng.randrange(2,1000);e=rng.randrange(1,2000);m=rng.randrange(1,3000)
        buf,length=calculate(u,e,m)
        assert bytes(buf[:length]).decode()==str(pow(u,e,10**m))
    emit('selftest_pass',cases=100)
def main():
    p=argparse.ArgumentParser();p.add_argument('--exponent',type=int,required=True)
    p.add_argument('--tail-digits',type=int,required=True);p.add_argument('--memory-mib',type=int,default=1536)
    p.add_argument('--selftest',action='store_true');a=p.parse_args()
    assert 1<=a.exponent<=613612926 and 1<=a.tail_digits<=140000000
    assert 128<=a.memory_mib<=1536
    cap=a.memory_mib*1024*1024;resource.setrlimit(resource.RLIMIT_AS,(cap,cap))
    resource.setrlimit(resource.RLIMIT_CPU,(900,910))
    emit('start',utc=datetime.now(timezone.utc).isoformat(),base=6,exponent=a.exponent,
        tail_digits=a.tail_digits,memory_mib=a.memory_mib,gmp_version=version,
        source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
    if a.selftest:selftest()
    buf,length=calculate(6,a.exponent,a.tail_digits,True)
    raw=buf.raw
    weight=sum(d*raw.count(bytes([48+d])) for d in range(1,10))
    view=memoryview(buf).cast('B')[:length]
    emit('finish',base=6,exponent=a.exponent,tail_digits=a.tail_digits,digits=length,
        suffix_digit_sum=weight,excludes_core_equality=(weight>a.exponent),
        sha256=hashlib.sha256(view).hexdigest(),first30=bytes(view[:30]).decode(),
        last30=bytes(view[-30:]).decode(),scope='Exact numerical suffix; not a Lean certificate.')
if __name__=='__main__':main()
