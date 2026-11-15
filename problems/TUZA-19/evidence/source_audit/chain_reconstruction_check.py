"""TUZA-19 continuation check of the frozen chain and the plateau corollary.
Authored after reading the frozen proof, review, and earlier checker. No earlier
checker is imported or executed. This is not fresh-context or Lean verification.
"""
from pathlib import Path
from itertools import combinations, product
from datetime import datetime, timezone
from hashlib import sha256
import json, platform, sys
START=datetime.now(timezone.utc)
STOP=datetime(2026,11,15,9,23,58,tzinfo=timezone.utc)
assert START<STOP and platform.system()=='Darwin'
D=Path(__file__).resolve().parent
labels=(0,1,2,3,4,5,7)
base_edges=set(combinations(labels,2))-{(0,5),(5,7),(1,3),(2,4)}
pack=((2,3,7),(0,1,2),(1,4,7),(3,4,5))
def edges(t):return set(combinations(sorted(t),2))
def triangles(V,E):return [t for t in combinations(sorted(V),3) if edges(t)<=E]
base_triangles=triangles(labels,base_edges)
support=set().union(*(edges(t) for t in pack))
initial={(3,7),(1,2),(4,7),(3,4),(0,1),(0,2),(1,4),(2,3)}
assert len(base_edges)==17 and len(base_triangles)==16 and len(support)==12
assert sum(sum(v in e for e in base_edges)%2 for v in labels)==6
for k in range(13):
    local=[set(c) for c in combinations(sorted(support),k) if all(set(c)&edges(t) for t in base_triangles)]
    if local:break
assert k==8 and len(local)==9 and initial in local

def build(n):
    ids={(i,v):7*i+j for i in range(n) for j,v in enumerate(labels)}
    parent=list(range(7*n))
    def root(x):
        while parent[x]!=x:
            parent[x]=parent[parent[x]];x=parent[x]
        return x
    def union(a,b):parent[root(a)]=root(b)
    for i in range(n-1):
        union(ids[i,0],ids[i+1,5]);union(ids[i,7],ids[i+1,1])
    maps=[{v:root(ids[i,v]) for v in labels} for i in range(n)]
    def transfer(es,m):return {tuple(sorted((m[a],m[b]))) for a,b in es}
    Es=[transfer(base_edges,m) for m in maps]
    Bs=[transfer(support,m) for m in maps]
    Ps=[tuple(sorted(m[v] for v in t)) for m in maps for t in pack]
    V=set().union(*(set(m.values()) for m in maps));E=set().union(*Es)
    Ts=triangles(V,E)
    assert (len(V),len(E),len(Ts),len(Ps))==(5*n+2,16*n+1,16*n,4*n)
    assert len(set().union(*(edges(t) for t in Ps)))==12*n
    assert all(sum(edges(t)<=e for e in Es)==1 for t in Ts)
    assert all(not Bs[i]&Es[j] for i in range(n) for j in range(n) if i!=j)
    reached={0};front=[0]
    while front:
        i=front.pop()
        for j in range(len(Ts)):
            if j not in reached and edges(Ts[i])&edges(Ts[j]):reached.add(j);front.append(j)
    assert len(reached)==len(Ts)
    B=set().union(*Bs)
    for p in Ps:
        private={next(iter(edges(t)&B)) for t in Ts if t!=p and len(edges(t)&B)==1 and edges(t)&B<=edges(p)}
        assert len(private)==1
    starts=[transfer(initial,m) for m in maps]
    minima=[[transfer(c,m) for c in local] for m in maps]
    return {'n':n,'V':V,'E':E,'T':Ts,'P':Ps,'starts':starts,'minima':minima,'maps':maps,'transfer':transfer}

def deficiency(graph,cover):
    costs=[len(cover&edges(t)) for t in graph['P']]
    H=[i for i,c in enumerate(costs) if c==3];L=[i for i,c in enumerate(costs) if c==1]
    assert all(1<=c<=3 for c in costs)
    adj={h:[l for l in L if set(graph['P'][h])&set(graph['P'][l])] for h in H}
    mate={}
    def add(h,seen):
        for l in adj[h]:
            if l in seen:continue
            seen.add(l)
            if l not in mate or add(mate[l],seen):mate[l]=h;return True
        return False
    for h in H:add(h,set())
    return len(H)-len(mate)

g=build(3);start=set().union(*g['starts'])
assert deficiency(g,start)==1
hist={};mind=None;compatible=0
for choices in product(*g['minima']):
    c=set().union(*choices)
    assert len(c)==24 and all(c&edges(t) for t in g['T'])
    d=deficiency(g,c);hist[d]=hist.get(d,0)+1
    if d==0:
        compatible+=1;distance=len(c^start);mind=distance if mind is None else min(mind,distance)
        changed={i for i in range(3) if choices[i]!=g['starts'][i]}
        assert 0 in changed and all(i in changed or i+1 in changed for i in range(2))
assert sum(hist.values())==729 and compatible==560 and mind==4
plateaux=[]
for n in range(2,11):
    q=build(n);c=set().union(*q['starts']);ds=[deficiency(q,c)]
    for i in range(0,n,2):
        m=q['maps'][i]
        before=set(c);c.remove(tuple(sorted((m[2],m[3]))));c.add(tuple(sorted((m[3],m[5]))))
        assert len(c^before)==2 and len(c)==8*n and all(c&edges(t) for t in q['T'])
        ds.append(deficiency(q,c))
    assert ds==[1]*((n+1)//2)+[0]
    plateaux.append({'N':n,'pivoted_blocks':list(range(1,n+1,2)),'deficiency_sequence':ds,'moves':(n+1)//2})
FINISH=datetime.now(timezone.utc);assert FINISH<STOP
out={'status':'PASS','started_utc':START.isoformat(),'finished_utc':FINISH.isoformat(),'platform':platform.platform(),'python':sys.version,'script_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),'verification_level':'Finite continuation check; all-N arguments are ordinary proofs, not Lean or human review.','N3':{'vertices':len(g['V']),'edges':len(g['E']),'triangles':len(g['T']),'maximum_packing':12,'packing_upper_certificate':'Each triangle uniquely belongs to one block; six odd vertices and seventeen edges forbid five edge-disjoint triangles in a block.','support_cover_minimum':24,'minimum_states':729,'compatible_states':compatible,'minimum_symmetric_difference':mind,'deficiency_histogram':hist},'plateau_checks':plateaux,'scope':'Only the fixed chain construction; no global graph search or unrestricted plateau lemma.'}
(D/'chain_reconstruction_check.json').write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
print(json.dumps({'status':'PASS','N3':out['N3'],'plateau_N_range':[2,10],'seconds':(FINISH-START).total_seconds()},sort_keys=True))
