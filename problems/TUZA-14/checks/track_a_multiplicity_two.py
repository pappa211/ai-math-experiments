"""Directed cone construction for frozen A4; 25-second one-CPU cap."""
from pathlib import Path
from itertools import combinations
import random,time,json
start=time.monotonic();deadline=start+25
r=6
pairs=list(combinations(range(r),2));m=len(pairs)
qedges=[(i,j) for i,j in combinations(range(m),2) if set(pairs[i]).isdisjoint(pairs[j])]
qtri=[(i,j,k) for i,j,k in combinations(range(m),3) if all((a,b) in qedges for a,b in combinations((i,j,k),2))]
assert len(qedges)==45 and len(qtri)==15
randomizer=random.Random(140602)
trials=0;best=100;witness=None

def largest_defect(q):
    adj=[0]*m
    for a,b in q:adj[a]|=1<<b;adj[b]|=1<<a
    maxdef=0;arg=0
    # Branch only through actual independent subsets; the union inequality is exact.
    def visit(avail,chosen,union,count):
        nonlocal maxdef,arg
        d=count-union.bit_count()
        if d>maxdef:maxdef=d;arg=chosen
        while avail:
            bit=avail&-avail;i=bit.bit_length()-1;avail^=bit
            visit(avail&~adj[i],chosen|bit,union|(1<<pairs[i][0])|(1<<pairs[i][1]),count+1)
    visit((1<<m)-1,0,0,0)
    return maxdef,arg
while time.monotonic()<deadline:
    removed=set(randomizer.choice(list(combinations(t,2))) for t in qtri)
    q=[e for e in qedges if e not in removed]
    assert len(q)==30
    defect,arg=largest_defect(q);trials+=1
    if defect<best:best=defect
    if defect==0:
        edges=[(a,r+i) for i,p in enumerate(pairs) for a in p]+[(r+a,r+b) for a,b in q]
        cone=2*r+len(pairs) # choose fresh label below normalized
        apex=r+len(pairs)
        gedges=edges+[(a,apex) for a in range(apex)]
        cover=[(r+i,apex) for i in range(m)]
        witness={'n':apex+1,'edges':gedges,'cover':cover,'base_n':apex,'base_edges':edges,'independent_I':list(range(r)),'pairs':pairs,'Q_edges':q,'Q_removed':sorted(removed),'alpha_base':r,'private_multiplicity':2,'private_packing_upper':r,'tau_cone':m,'criterion':'All Q-independent A satisfy |A|<=|union(A)|; enumerated all independent subsets.'}
        break
result={'candidate':'A4 frozen in notes/TRACK_A.md','trials':trials,'elapsed_seconds':time.monotonic()-start,'best_union_defect':best,'witness':witness,'status':'FOUND' if witness else 'NO_WITNESS_WITHIN_BUDGET'}
path=Path(__file__).resolve().parents[1]/'evidence'/'track_a_multiplicity_two.json'
path.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='witness'}))
