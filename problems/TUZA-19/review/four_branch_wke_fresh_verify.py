#!/usr/bin/env python3
"""Independent domain reconstruction and literal witness verification.
Does not import or read the producer's kernel-search code. The JSON is treated
only as untrusted M,Q certificates, checked against independently built graphs.
"""
from itertools import combinations,product
from collections import Counter
from pathlib import Path
import json,hashlib,datetime,platform
assert platform.system()=='Darwin'
ROOT=Path(__file__).resolve().parents[1]
INPUT=ROOT/'evidence/four_branch_wke_fresh/canonical_witnesses_input.json'
EXPECTED='e69818bb2599b6b934dd945f3b6cd0305f6718c3d2fe165ea9f7f6d1bfe17cc1'
assert hashlib.sha256(INPUT.read_bytes()).hexdigest()==EXPECTED
raw=json.loads(INPUT.read_text())
def edge(a,b):return tuple(sorted((a,b)))
def verify(vs,es,M,Q):
    vs=set(vs);es=set(es);M=set(M);Q=set(Q)
    assert all(len(e)==2 and e[0]!=e[1] and set(e)<=vs for e in es)
    assert M<=es and Q<=vs
    used=set()
    for e in M:assert not used&set(e);used.update(e)
    assert len(Q)<=len(M)
    assert all(set(e)&Q for e in es-M)

def construct(b,states):
    es=set();nextv=b
    for (u,v),s in zip(combinations(range(b),2),states):
        assert s in range(5)
        if s in (1,4):es.add((u,v))
        if s in (2,4):
            x=nextv;nextv+=1;es|={edge(u,x),edge(x,v)}
        if s==3:
            x,y=nextv,nextv+1;nextv+=2;es|={edge(u,x),edge(x,y),edge(y,v)}
    deg=Counter(v for e in es for v in e)
    valid=all(deg[v]>=3 for v in range(b))
    assert all(deg[v]==2 for v in range(b,nextv))
    return set(range(nextv)),es,valid

cert={}
for row in raw['kernels']:
    key=(row['branches'],tuple(row['states']))
    assert key not in cert;cert[key]=row
expected={};raw_count=0;bybranches=Counter()
for b in range(1,5):
    for states in product(range(5),repeat=b*(b-1)//2):
        raw_count+=1;vs,es,valid=construct(b,states)
        if valid:expected[(b,states)]=(vs,es);bybranches[b]+=1
assert raw_count==15756
assert len(expected)==5375 and bybranches=={3:10,4:5365}
assert set(cert)==set(expected)
slack=Counter();subdivision_cases=Counter();maxorder=0;maxedges=0

def subdivide(vs,es,M,Q,e):
    a,b=e;x=max(vs,default=-1)+1;y=x+1
    newvs=set(vs)|{x,y};newes=(set(es)-{e})|{edge(a,x),edge(x,y),edge(y,b)}
    newM=set(M);newQ=set(Q)
    if e in newM:
        newM.remove(e);newM|={edge(a,x),edge(y,b)};newQ.add(x);case='edge_in_matching'
    else:
        assert a in Q or b in Q
        newM.add((x,y))
        if a not in Q:newQ.add(x);case='only_second_endpoint_selected'
        elif b not in Q:newQ.add(y);case='only_first_endpoint_selected'
        else:case='both_endpoints_selected'
    assert newQ&set(vs)==set(Q)
    assert len(newM)==len(M)+1 and len(newQ)-len(Q)<=1
    verify(newvs,newes,newM,newQ)
    subdivision_cases[case]+=1
    return newvs,newes,newM,newQ

for key,(vs,es) in expected.items():
    row=cert[key];assert row['n']==len(vs) and {tuple(e) for e in row['edges']}==es
    M={tuple(e) for e in row['witness']['M']};Q=set(row['witness']['Q'])
    assert len(M)==len(row['witness']['M']) and len(Q)==len(row['witness']['Q'])
    verify(vs,es,M,Q)
    slack[len(M)-len(Q)]+=1;maxorder=max(maxorder,len(vs));maxedges=max(maxedges,len(es))
    for e in sorted(es):subdivide(vs,es,M,Q,e)

# Independently specified marked local bases. Q contains every boundary vertex
# through which deleted interiors can have any connection to the remainder.
local=[
 ('loop_odd',3,{(0,1),(1,2),(0,2)},{(1,2)},{0},{0}),
 ('loop_even',4,{(0,1),(1,2),(2,3),(0,3)},{(0,1),(2,3)},{0,2},{0}),
 ('parallel_even_even',4,{(0,2),(1,2),(0,3),(1,3)},{(0,2),(1,3)},{0,1},{0,1}),
 ('parallel_even_odd',5,{(0,2),(1,2),(0,3),(3,4),(1,4)},{(0,2),(3,4)},{0,1},{0,1}),
 ('parallel_odd_odd',6,{(0,2),(2,3),(1,3),(0,4),(4,5),(1,5)},{(2,3),(4,5)},{0,1},{0,1}),
 ('direct_and_odd',4,{(0,1),(0,2),(2,3),(1,3)},{(0,1),(2,3)},{0,1},{0,1})]
local_receipts=[]
for name,n,es,M,Q,boundary in local:
    vs=set(range(n));verify(vs,es,M,Q);assert boundary<=Q
    # Iterated lift verifies preservation of the required old boundary vertices.
    seq=[]
    for _ in range(20):
        e=min(es);vs,es,M,Q=subdivide(vs,es,M,Q,e);assert boundary<=Q
        seq.append([len(vs),len(M),len(Q)])
    local_receipts.append({'base':name,'boundary':sorted(boundary),'twenty_subdivisions':seq})
# The retained direct+even triangle really cannot have a marked-endpoint witness.
tri={(0,1),(0,2),(1,2)}
assert max(len(M) for k in range(4) for M in combinations(sorted(tri),k)
           if len(set(v for e in M for v in e))==2*k)==1
assert len({0,1})==2
result={'status':'PASS independently regenerated complete kernel domain and all literal certificates',
 'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'host':platform.platform(),
 'input_certificate_sha256':EXPECTED,'verifier_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
 'raw_state_vectors':raw_count,'valid_kernels':len(expected),'valid_by_branch_count':dict(bybranches),
 'largest_kernel_order':maxorder,'largest_kernel_edge_count':maxedges,'witness_slack_histogram':dict(slack),
 'subdivision_cases':dict(subdivision_cases),'marked_local_bases':local_receipts,
 'scope':'Finite literal verification of all five-state kernels on at most four labelled degree-at-least-three branches, plus marked local bases and subdivision lifting. All-size completeness is the separately audited reduction proof. No producer search code read/imported.'}
out=ROOT/'evidence/four_branch_wke_fresh/verification.json';out.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='marked_local_bases'},indent=2))
