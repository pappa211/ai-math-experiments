#!/usr/bin/env python3
"""Literal type0 control: maximum-packing premise cannot be dropped."""
from itertools import combinations
from pathlib import Path
from collections import Counter
import json,time,resource

start=time.monotonic();D={1,2,4,8,15}
F={tuple(sorted((x,x^d))) for x in range(16) for d in D}
assert len(F)==40
assert not any(set(combinations(t,2))<=F for t in combinations(range(16),3))
independent=[]
for mask in range(1<<16):
 if all(not(mask>>u&1 and mask>>v&1) for u,v in F):independent.append(mask)
alpha=max(m.bit_count() for m in independent)
assert alpha==5
N={(16*i+u,16*i+v) for i in range(3) for u,v in F}
B={(16*i+u,16*j+v) for i,j in combinations(range(3),2) for u in range(16) for v in range(16)}
E=N|B
def edges(t):return set(combinations(sorted(t),2))
triangles=[t for t in combinations(range(48),3) if edges(t)<=E]
P=[(x,16+y,32+(x^y)) for x in range(16) for y in range(16)]
counts=Counter(e for t in P for e in edges(t))
assert len(P)==256 and set(counts)==B and set(counts.values())=={1}
assert all(len(edges(t)&B)>=2 for t in triangles)
# Cyclic STS(13): all translates of two difference-family base triples.
sts={tuple(sorted(((x+a)%13 for a in base))) for x in range(13) for base in [(0,1,4),(0,2,7)]}
assert len(sts)==26
sc=Counter(e for t in sts for e in edges(t))
assert len(sc)==78 and set(sc.values())=={1}
removed=[t for t in sts if 12 in t]
missing_pairs=sorted(tuple(v for v in t if v!=12) for t in removed)
target_pairs=[(i+0,i+3) for i in (0,16,32)]+[(i+1,i+2) for i in (0,16,32)]
mapping={}
for pair,target in zip(missing_pairs,target_pairs):
 for v,w in zip(pair,target):mapping[v]=w
assert len(mapping)==12 and len(set(mapping.values()))==12
replacement=[tuple(sorted(mapping[v] for v in t)) for t in sorted(sts) if 12 not in t]
S={i+j for i in (0,16,32) for j in range(4)}
old=[t for t in P if set(t)<=S]
assert len(old)==16 and len(replacement)==20
local_edges={e for e in E if set(e)<=S}
rc=Counter(e for t in replacement for e in edges(t))
assert set(rc)==local_edges and len(local_edges)==60 and set(rc.values())=={1}
augmented=[t for t in P if not set(t)<=S]+replacement
ac=Counter(e for t in augmented for e in edges(t))
assert len(augmented)==260 and set(ac)<=E and set(ac.values())=={1}
# Ordinary Tuza certificate uses all N edges and the B-C complete bipartite pair.
cover=N|{(16+u,32+v) for u in range(16) for v in range(16)}
assert len(cover)==376 and all(edges(t)&cover for t in triangles)
lower=len(B)+len(N)-48*(3*alpha)//2
assert lower==528 and lower>2*len(P)
out={'status':'PASS','scope':'No-private-page condition WITHOUT maximum packing; exact maximum-P type0 gate remains unresolved.',
 'vertices':48,'edges':sorted(E),'N_edges':sorted(N),'B_edges':sorted(B),
 'actual_triangle_count':len(triangles),'B_edges_per_actual_triangle':dict(Counter(len(edges(t)&B) for t in triangles)),
 'base_Clebsch_alpha':alpha,'base_independent_subsets_checked':1<<16,
 'prescribed_packing':P,'prescribed_size':len(P),'B_only_cover_lower_bound':lower,
 'twice_prescribed_size':2*len(P),'P_is_maximum':False,
 'STS13_base_triples':[(0,1,4),(0,2,7)],'STS13_deleted_vertex':12,
 'STS13_missing_pairs':missing_pairs,'STS13_local_mapping':mapping,
 'old_local_triangles':old,'replacement_local_triangles':replacement,
 'larger_packing':augmented,'larger_packing_size':len(augmented),
 'ordinary_triangle_cover':sorted(cover),'ordinary_cover_size':len(cover),
 'ordinary_Tuza_certified':len(cover)<=2*len(augmented),
 'seconds':time.monotonic()-start,'peak_rss_bytes_darwin':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss}
Path('evidence/criticality_type0_nonmaximum.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:out[k] for k in ['status','vertices','actual_triangle_count','B_edges_per_actual_triangle',
 'prescribed_size','B_only_cover_lower_bound','larger_packing_size','ordinary_cover_size','seconds']}))
