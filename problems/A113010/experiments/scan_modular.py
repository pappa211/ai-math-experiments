"""Exact larger finite search, reducing mod9 before decimal digit conversion.
The power/length arithmetic remains exact; ordinary Python is not a Lean proof.
Progress is recoverable, execution is bounded, and no all-k claim is made.
"""
import argparse, json, signal, time
from pathlib import Path
from scan_candidates import candidates

p=argparse.ArgumentParser()
p.add_argument("--max-digits",type=int,default=100000)
p.add_argument("--output",type=Path,required=True)
p.add_argument("--seconds",type=float,default=1200)
a=p.parse_args()
start=time.monotonic(); stop=False

def request_stop(signum,frame):
    global stop
    stop=True
signal.signal(signal.SIGTERM,request_stop)
signal.signal(signal.SIGINT,request_stop)
r={"requested_max_digits":a.max_digits,"last_completed_k":1,"power_candidates":0,
   "mod9_survivors":0,"fixed_points":[{"k":1,"s":1,"n":"1"}],
   "smallest_ratios_among_mod9_survivors":[],"complete":False,
   "evidence_level":"exact integer computation; not Lean formal proof"}
ratios=[]

def save():
    r["elapsed_seconds"]=time.monotonic()-start
    r["smallest_ratios_among_mod9_survivors"]=sorted(ratios)[:20]
    tmp=a.output.with_suffix(a.output.suffix+".tmp")
    tmp.write_text(json.dumps(r,indent=2)+"\n")
    tmp.replace(a.output)

for k in range(2,a.max_digits+1):
    for s,n in candidates(k):
        r["power_candidates"]+=1
        if pow(k,s,9)!=s%9: continue
        r["mod9_survivors"]+=1
        u=k;t=0
        while u%10==0:
            u//=10;t+=1
        core=n if t==0 else u**s
        digits=str(core)
        assert len(digits)+t*s==k
        ds=sum(map(int,digits))
        ratios.append((ds/s,k,s,ds))
        if len(ratios)>100: ratios=sorted(ratios)[:20]
        if ds==s:
            r["fixed_points"].append({"k":k,"s":s,"u":u,"trailing_base_zeroes":t,
                "core":digits if len(digits)<100000 else "omitted; reconstruct u^s"})
            print(json.dumps({"fixed_point_found_k":k,"s":s}),flush=True)
            if k>2: stop=True
    r["last_completed_k"]=k
    if k%1000==0:
        save(); print(json.dumps({"progress_k":k,"mod9_survivors":r["mod9_survivors"],
                     "elapsed_seconds":round(time.monotonic()-start,2)}),flush=True)
    if stop or time.monotonic()-start>a.seconds: break
r["complete"]=r["last_completed_k"]==a.max_digits
save()
print(json.dumps({key:r[key] for key in ["last_completed_k","power_candidates","mod9_survivors","complete","elapsed_seconds"]}),flush=True)
