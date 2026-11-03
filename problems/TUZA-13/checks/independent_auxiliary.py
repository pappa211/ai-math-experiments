#!/usr/bin/env python3
"""Independently adjudicate only the auxiliary eligible-cover-drop witness."""
from independent import ExactGraph
from pathlib import Path
from itertools import combinations
import datetime,fcntl,hashlib,json,sys,time
ROOT=Path(__file__).resolve().parents[1]

def run(path):
    raw=json.loads(path.read_text()); data=raw['input']
    g=ExactGraph(range(data['n']),data['edges'])
    C=raw['minimum_C'];F=frozenset(map(tuple,raw['eligible_cover_F']))
    result=g.certify(C)
    assert result['specified_cover_is_minimum']
    cls=g.classify(C);eligible=cls[1]+cls[2]
    assert F<=set(g.edges) and all(F&g.resources[i] for i in eligible)
    assert len(F)<result['tau']
    assert len(F)==result['nu_eligible']
    assert all(not F&g.resources[i] for i in cls[3]) # explicit missed all-red triangle(s)
    tested=0
    for candidate in combinations(g.edges,result['tau']-1):
        tested+=1
        assert not all(set(candidate)&r for r in g.resources)
    result.update(status='AUXILIARY_REFUTATION_EXACT_ONLY',
                  warning='Not a refutation of the two-red packing conjecture',
                  eligible_cover=list(sorted(F)),eligible_cover_number=len(F),
                  one_smaller_cover_subsets_exhausted=tested,
                  source_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
                  checked_utc=datetime.datetime.now(datetime.timezone.utc).isoformat())
    return result

if __name__=='__main__':
    source=Path(sys.argv[1]) if len(sys.argv)>1 else ROOT/'witnesses/theory_tau_drop.json'
    dest=Path(sys.argv[2]) if len(sys.argv)>2 else ROOT/'evidence/independent_tau_drop.json'
    with (ROOT/'evidence/compute.lock').open('a+') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX)
        result=run(source)
        dest.write_text(json.dumps(result,indent=2)+'\n')
        print(json.dumps({k:result[k] for k in ['status','tau','nu','nu_eligible','eligible_cover_number','deficiency','one_smaller_cover_subsets_exhausted']}))
