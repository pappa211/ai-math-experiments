#!/usr/bin/env python3
"""Exact standard-library diagnostic; writes only the requested output path."""
import argparse,itertools,json,platform,datetime,random

def mul(a,b):
    c=0
    while b:
        if b&1:c^=a
        b>>=1;a<<=1
        if a&4:a^=7
    return c

def edge(a,b):return tuple(sorted((a,b)))
def graph(slopes):
    copies=[];owners={}
    for a in slopes:
        for b in range(4):
            vs=[4*i+(mul(a,i)^b) for i in range(4)]
            es=[edge(vs[i],vs[j]) for i,j in itertools.combinations(range(4),2)]
            ci=len(copies)
            for e in es:
                assert e not in owners
                owners[e]=ci
            copies.append({'slope':a,'intercept':b,'vertices':vs,'edges':es})
    edges=sorted(owners)
    triangles=[t for t in itertools.combinations(range(16),3) if all(edge(a,b) in owners for a,b in itertools.combinations(t,2))]
    planted=[];mixed=[]
    for t in triangles:
        os={owners[edge(a,b)] for a,b in itertools.combinations(t,2)}
        (planted if len(os)==1 else mixed).append(t)
        assert len(os) in (1,3), 'two-origin closure impossible for affine lines'
    # Fixed deterministic greedy witness, no optimum claim except when edge upper bound meets it.
    used=set();packing=[]
    for t in mixed+planted:
        es={edge(a,b) for a,b in itertools.combinations(t,2)}
        if not es&used:packing.append(t);used|=es
    for seed in range(32):
        order=list(triangles);random.Random(seed).shuffle(order)
        cur=[];seen=set()
        for t in order:
            es={edge(a,b) for a,b in itertools.combinations(t,2)}
            if not es&seen:cur.append(t);seen|=es
        if len(cur)>len(packing):packing=cur
    return {'slopes':slopes,'n':16,'edges':edges,'copies':copies,'triangles':triangles,'planted':planted,'mixed':mixed,'greedy_packing':packing}

def small_decomp():
    es={edge(a,b) for a,b in itertools.combinations(range(8),2) if a//2!=b//2}
    ts=[t for t in itertools.combinations(range(8),3) if all(edge(a,b) in es for a,b in itertools.combinations(t,2))]
    byedge={e:[t for t in ts if e[0] in t and e[1] in t] for e in es}
    def rec(rem,out):
        if not rem:return out
        e=min(rem,key=lambda e:sum(all(edge(a,b) in rem for a,b in itertools.combinations(t,2)) for t in byedge[e]))
        for t in byedge[e]:
            te={edge(a,b) for a,b in itertools.combinations(t,2)}
            if te<=rem:
                z=rec(rem-te,out+[t])
                if z is not None:return z
    return rec(es,[])

def main():
    p=argparse.ArgumentParser();p.add_argument('--output',required=True);a=p.parse_args()
    cases=[graph(list(range(s))) for s in (1,2,3,4)]
    d=small_decomp();assert len(d)==8
    # Lift each K4[2] decomposition triangle through cyclic Latin square of order 2.
    packed=[]
    for t in d:
        for x in range(2):
            for y in range(2):
                packed.append(tuple(4*(v//2)+2*(v%2)+z for v,z in zip(t,(x,y,(x+y)%2))))
    cases[-1]['exact_packing']=packed
    cases[-1]['exact_cover']=[e for e in cases[-1]['edges'] if {e[0]//4,e[1]//4} in ({0,1},{2,3})]
    cases[-1]['optima']={'nu':32,'tau':32,'nu_upper':'96 edges / 3','tau_lower':'Uniformly random one representative per fiber: each induced K4 needs >=2 cover edges; each edge selected with probability 1/16.'}
    data={'created_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'python':platform.python_version(),'solver':'none','finite_field':'GF(4)=F2[x]/(x^2+x+1), elements binary 0,1,x,x+1','cases':cases,'K4_2_decomposition':d}
    with open(a.output,'w') as f:json.dump(data,f,indent=2);f.write('\n')
    for c in cases:print({'slopes':c['slopes'],'copies':len(c['copies']),'edges':len(c['edges']),'triangles':len(c['triangles']),'planted':len(c['planted']),'mixed':len(c['mixed']),'greedy_packing':len(c['greedy_packing'])})
if __name__=='__main__':main()
