#!/usr/bin/env python3
"""Literal fixed K7 check for the minimum-cover/eligible-packing route."""
from itertools import combinations
from pathlib import Path
import hashlib,json,platform,time

def edges(t): return frozenset(tuple(sorted(e)) for e in combinations(t,2))
def main():
    assert platform.system()=="Darwin"
    started=time.time(); V=range(7); E=set(combinations(V,2)); A={0,1,2}; B={3,4,5,6}
    C={e for e in E if set(e)<=A or set(e)<=B}; blue=E-C
    alltri={tuple(t):edges(t) for t in combinations(V,3)}
    eligible={t:es for t,es in alltri.items() if 1<=len(es&C)<=2}
    P={(0,3,4),(0,5,6),(1,3,5),(1,4,6),(2,3,6),(2,4,5)}
    assert len(C)==9 and len(blue)==12
    assert all(es&C for es in alltri.values())
    assert all(len(es&blue)==2 for es in eligible.values())
    assert all(Pi in eligible for Pi in P)
    assert all(not(alltri[t]&alltri[s]) for t,s in combinations(P,2))
    assert set().union(*(alltri[t]&blue for t in P))==blue
    # Hence six is the exact eligible packing maximum, from the two-blue budget.
    moves={}; witnesses={}
    for number in (1,2,3):
        moves[number]=0; witnesses[number]=[]
        for removed in combinations(sorted(P),number):
            retained=P-set(removed); blocked=set().union(*(alltri[t] for t in retained))
            available=[t for t,es in eligible.items() if not es&blocked and t not in P]
            for added in combinations(available,number):
                if all(not(alltri[t]&alltri[s]) for t,s in combinations(added,2)):
                    moves[number]+=1; witnesses[number].append(dict(removed=removed,added=added))
    assert moves[1]==moves[2]==0 and moves[3]>0
    removed={(0,3,4),(1,3,5),(2,4,5)}; added={(0,1,3),(0,2,4),(1,2,5)}
    Q=(P-removed)|added
    assert all(t in eligible for t in Q)
    assert all(not(alltri[t]&alltri[s]) for t,s in combinations(Q,2))
    unused=C-set().union(*(alltri[t] for t in P))
    assert unused==set(combinations(sorted(A),2))
    for e in unused:
        private=[t for t,es in eligible.items() if es&C=={e}]
        assert len(private)==4
        assert all(sum(bool(alltri[t]&alltri[p]) for p in P)==2 for t in private)
    out=dict(status="PASS",host=platform.system(),graph="K7",vertices=list(V),edges=sorted(E),
             minimum_cover=sorted(C),cover_minimality_certificate="Mantel: triangle-free seven-vertex graph has at most floor(49/4)=12 edges",eligible_packing=sorted(P),
             eligible_maximum=6,eligible_maximum_certificate="Every eligible triangle uses two of twelve blue edges, and the displayed packing has six triangles",unused_red=sorted(unused),
             exact_neutral_move_counts=moves,move_witnesses=witnesses,
             checker_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),elapsed_seconds=time.time()-started)
    Path("evidence/mincover_eligible/trade_results.json").write_text(json.dumps(out,indent=2)+"\n")
    print(json.dumps({k:v for k,v in out.items() if k not in ("move_witnesses","edges")},indent=2))
if __name__=="__main__": main()
