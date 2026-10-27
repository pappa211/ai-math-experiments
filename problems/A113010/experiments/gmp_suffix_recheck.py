#!/usr/bin/env python3
"""Recompute the target suffix by full power then division.
This is a second arithmetic path in the SAME GMP library, not an independent
kernel or a formal certificate. Address/CPU caps remain mandatory.
"""
import ctypes,hashlib,json,resource
from pathlib import Path
from gmp_suffix import MPZ,Ptr,gmp,fn,libc,emit,version
fdiv=getattr(gmp,'__gmpz_fdiv_r');fdiv.argtypes=[Ptr,Ptr,Ptr];fdiv.restype=None

def full_path(e,m,progress=False):
    full,mod,tail=MPZ(),MPZ(),MPZ()
    for x in (full,mod,tail):fn['init'](ctypes.byref(x))
    try:
        fn['ui_pow_ui'](ctypes.byref(full),6,e)
        if progress:emit('full_power_ready',estimated_digits=fn['sizeinbase'](ctypes.byref(full),10))
        fn['ui_pow_ui'](ctypes.byref(mod),10,m)
        fdiv(ctypes.byref(tail),ctypes.byref(full),ctypes.byref(mod))
        if progress:emit('remainder_ready')
        size=fn['sizeinbase'](ctypes.byref(tail),10)+2
        buf=ctypes.create_string_buffer(size)
        assert fn['get_str'](buf,10,ctypes.byref(tail))==ctypes.addressof(buf)
        length=libc.strlen(buf)
        if progress:emit('decimal_ready',digits=length)
        return buf,length
    finally:
        for x in (full,mod,tail):fn['clear'](ctypes.byref(x))

def main():
    cap=1536*1024*1024;resource.setrlimit(resource.RLIMIT_AS,(cap,cap));resource.setrlimit(resource.RLIMIT_CPU,(900,910))
    e=613612926;m=140000000
    emit('start',base=6,exponent=e,tail_digits=m,memory_mib=1536,gmp_version=version,
        method='full mpz_ui_pow_ui then mpz_fdiv_r',
        source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
    for a,b in [(1,1),(2,1),(17,3),(70,9),(99,24),(1000,300)]:
        buf,length=full_path(a,b);assert bytes(buf[:length]).decode()==str(pow(6,a,10**b))
    emit('selftest_pass',cases=6)
    buf,length=full_path(e,m,True)
    raw=buf.raw;weight=sum(d*raw.count(bytes([48+d])) for d in range(1,10))
    digest=hashlib.sha256(memoryview(buf).cast('B')[:length]).hexdigest()
    records=[json.loads(x) for x in Path('experiments/gmp_suffix_u6_t9.jsonl').read_text().splitlines()]
    expected=records[-1]
    assert expected['type']=='finish' and expected['exponent']==e and expected['tail_digits']==m
    assert (length,weight,digest)==(expected['digits'],expected['suffix_digit_sum'],expected['sha256'])
    emit('finish',digits=length,suffix_digit_sum=weight,sha256=digest,
        matches_modular_exponentiation_path=True,excludes_core_equality=weight>e,
        scope='Second numerical path using same GMP library; not a Lean certificate.')
if __name__=='__main__':main()
