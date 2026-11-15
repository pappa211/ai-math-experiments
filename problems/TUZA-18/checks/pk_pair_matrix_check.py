"""Independent exhaustive local classification for the maximum-star argument.

This checks the exact two-page replacement implication, not the unbounded
functional-component theorem and not availability of a common-vertex packing.
"""
from datetime import datetime, timezone
from hashlib import sha256
from itertools import combinations, product
from pathlib import Path
import json

STOP = datetime(2026,11,14,21,0,10,tzinfo=timezone.utc)
started = datetime.now(timezone.utc)
assert started < STOP
def es(vertices):
    return frozenset(combinations(sorted(vertices),2))
cross = ((0,2),(0,3),(1,2),(1,3))
records=[]
for mask, ext_left, ext_right in product(range(16),range(2),range(2)):
    E=frozenset(e for bit,e in enumerate(cross) if mask>>bit&1)
    left=[x for x in (2,3) if {(0,x),(1,x)}<=E]
    right=[x for x in (0,1) if {(x,2),(x,3)}<=E]
    if ext_left: left.append(4)
    if ext_right: right.append(5)
    if not left or not right:
        records.append({'mask':mask,'external_flags':[ext_left,ext_right],'both_active':False})
        continue
    witnesses=[]
    for x,y in product(left,right):
        A,B=es((0,1,x)),es((2,3,y))
        unused=E-(A|B)
        if A.isdisjoint(B) and unused:
            witnesses.append({'left_tip':x,'right_tip':y,'append_rim':list(min(unused))})
    survives=not witnesses
    if not E:
        expected=True; kind='empty'
    elif len(E)==2 and len(set.intersection(*(set(e) for e in E)))==1:
        center=next(iter(set.intersection(*(set(e) for e in E))))
        expected=not (ext_left if center in (2,3) else ext_right)
        kind='directed_star'
    elif len(E)==3:
        expected=not ext_left and not ext_right;kind='P4_mutual'
    elif len(E)==4:
        expected=not ext_left and not ext_right;kind='C4_mutual'
    else:
        expected=False;kind='forbidden'
    assert survives==expected,(mask,ext_left,ext_right,left,right,witnesses,kind)
    records.append({'mask':mask,'cross_edges':sorted(E),'external_flags':[ext_left,ext_right],
                    'both_active':True,'left_tips':left,'right_tips':right,
                    'survives_two_page_test':survives,'classification':kind,
                    'augmentation_witnesses':witnesses})
assert len(records)==64
finished=datetime.now(timezone.utc)
assert finished<STOP
out={'status':'PASS','started_utc':started.isoformat(),'finished_utc':finished.isoformat(),
     'script_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),
     'states':len(records),'both_active_states':sum(r['both_active'] for r in records),
     'surviving_states':sum(r.get('survives_two_page_test',False) for r in records),
     'limitations':['External-page multiplicities collapse to a presence bit because an external tip cannot create an edge intersection between pages on these two disjoint bases.',
                    'All internal pages forced by the literal cross matrix are included.',
                    'Surviving the local necessary condition does not assert global maximum packing.',
                    'The all-size functional-component argument is an ordinary proof, not this finite check.'],
     'records':records}
Path('SCRATCH_OUTPUT/tuza18_pk_pair_matrix_check.json').write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='records'},sort_keys=True))
