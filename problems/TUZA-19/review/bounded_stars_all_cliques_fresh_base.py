"""Independent literal CP5 base verification, with no producer-code import."""
from itertools import combinations
import json
from pathlib import Path
rows = [
    (["046","058","079","147","168","159","248","257","269","349","356","378"], [0,2,1,3]),
    (["036","058","079","156","139","178","357","259","247","268","348","469"], [0,2,1,4]),
    (["034","058","079","149","478","127","268","138","156","259","357","369"], [0,2,4,6]),
]
edges = {tuple(e) for e in combinations(range(10), 2) if e[0]//2 != e[1]//2}
assert len(edges) == 40
out = []
for words, cycle in rows:
    used = set()
    for word in words:
        vertices = tuple(map(int, word))
        assert len(set(vertices)) == 3
        tri_edges = {tuple(sorted(e)) for e in combinations(vertices, 2)}
        assert tri_edges <= edges
        assert not (tri_edges & used)
        used |= tri_edges
    target = {tuple(sorted((cycle[i],cycle[(i+1)%4]))) for i in range(4)}
    assert edges-used == target
    assert len(words) == 12 and len(used) == 36
    counts = sorted([sum(v//2 == part for v in cycle) for part in set(v//2 for v in cycle)], reverse=True)
    out.append({"triangles":len(words),"used_edges":len(used),"leave":sorted(target),"twin_part_multiplicities":counts})
assert [r["twin_part_multiplicities"] for r in out] == [[2,2],[2,1,1],[1,1,1,1]]
print(json.dumps({"status":"PASS","scope":"Only the three literal CP5 base packing certificates; no search or producer import","rows":out}, indent=2))
