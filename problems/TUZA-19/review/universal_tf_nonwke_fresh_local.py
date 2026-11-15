"""Independent literal K11 certificate check; no producer checker or optimizer."""
import itertools
import json
import pathlib
import platform

assert platform.system() == 'Darwin'
triangles = [
    (0,1,4), (0,2,8), (0,5,6), (0,7,10), (1,2,10),
    (1,3,9), (1,5,8), (1,6,7), (2,3,7), (2,4,5),
    (2,6,9), (3,5,10), (3,6,8), (4,6,10), (4,7,8),
    (5,7,9), (8,9,10),
]
all_edges = set(itertools.combinations(range(11), 2))
used = set()
for t in triangles:
    assert len(set(t)) == 3 and set(t) <= set(range(11))
    edges = set(itertools.combinations(sorted(t), 2))
    assert edges <= all_edges and not (used & edges)
    used |= edges
assert len(triangles) == 17 and len(used) == 51
unused = all_edges - used
assert unused == {(0,3), (0,9), (3,4), (4,9)}
vertices = set().union(*(set(e) for e in unused))
assert len(vertices) == 4
assert all(sum(v in e for e in unused) == 2 for v in vertices)
report = {'host': platform.system(), 'packing_size': len(triangles),
          'used_edges': len(used), 'unused_edges': sorted(unused),
          'unused_graph': 'C4', 'triangles': triangles,
          'scope': 'Literal positive K11 packing certificate only; optimum and all-size reductions proved ordinarily in audit.'}
out = pathlib.Path('evidence/universal_tf_nonwke_fresh/k11_literal.json')
out.parent.mkdir(exist_ok=True)
out.write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps({k: v for k, v in report.items() if k != 'triangles'}))
