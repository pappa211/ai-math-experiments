"""Independent, dependency-free finite certificate checks for TUZA-02.

This uses direct subset enumeration, independently of the research stream's
recursive packing/cover solver. It checks named constructions only.
Run: python3 TUZA-02/checks/independent_certificates.py
"""
from itertools import combinations
from pathlib import Path
import json


def clique(vertices):
    return set(combinations(sorted(vertices), 2))


def triangles(edges):
    vertices = sorted({v for e in edges for v in e})
    return [t for t in combinations(vertices, 3) if clique(t) <= edges]


def packing_of_size(ts, size):
    masks = [clique(t) for t in ts]
    for indices in combinations(range(len(ts)), size):
        used = set()
        for i in indices:
            if used & masks[i]:
                break
            used |= masks[i]
        else:
            return [ts[i] for i in indices]
    return None


def exact(edges, family=None):
    ts = triangles(edges) if family is None else family
    active = sorted(set().union(*(clique(t) for t in ts))) if ts else []
    packing = []
    for size in range(1, len(active) // 3 + 1):
        found = packing_of_size(ts, size)
        if found is None:
            break
        packing = found
    masks = [clique(t) for t in ts]
    cover = None
    for size in range(len(active) + 1):
        for candidate in combinations(active, size):
            c = set(candidate)
            if all(c & t for t in masks):
                cover = list(candidate)
                break
        if cover is not None:
            break
    return dict(nu=len(packing), tau=len(cover), packing=packing, cover=cover,
                triangles=ts)


def star_core(r):
    edges = clique(range(4))
    colors = {i: i for i in range(4)}
    for i in range(1, r + 1):
        p, q = 2 * i + 2, 2 * i + 3
        edges |= clique([0, i, p, q])
        colors[p], colors[q] = sorted(set(range(4)) - {0, i})
    return edges, colors


def main():
    out = {"method": "direct subset enumeration; named graphs only", "star_cores": []}
    for r in (1, 2, 3):
        edges, vc = star_core(r)
        answer = exact(edges)
        assert (answer["nu"], answer["tau"]) == (r + 1, 2 * r + 1)
        survivors = []
        for e in sorted(edges):
            packing = packing_of_size(triangles(edges - {e}), r + 1)
            assert packing is not None
            survivors.append({"deleted_edge": e, "packing": packing})
        labels = {e: vc[e[0]] ^ vc[e[1]] for e in edges}
        assert all({labels[e] for e in clique(t)} == {1, 2, 3}
                   for t in answer["triangles"])
        out["star_cores"].append(dict(leaves=r, edges=sorted(edges), **answer,
            vertex_colors=vc, edge_labels=[[*e, labels[e]] for e in sorted(edges)],
            deletion_packings=survivors))

    # A definition counterexample: full-G incident families versus individual ones.
    edges = clique(range(5)) | {(1, 5), (3, 5)}
    t1, t2 = (0, 1, 2), (0, 3, 4)
    d1, d2 = clique(t1), clique(t2)
    old = edges - d1 - d2
    tg = triangles(edges)
    one1, one2 = triangles(old | d1), triangles(old | d2)
    result = dict(edges=sorted(edges), t1=t1, t2=t2, H=exact(old), G=exact(edges),
        full_F1=exact(edges, [t for t in tg if clique(t) & d1]),
        full_F2=exact(edges, [t for t in tg if clique(t) & d2]),
        individual_F1=exact(edges, [t for t in one1 if clique(t) & d1]),
        individual_F2=exact(edges, [t for t in one2 if clique(t) & d2]))
    assert (result["H"]["nu"], result["H"]["tau"], result["G"]["nu"]) == (1, 1, 3)
    assert result["full_F1"]["tau"] == result["full_F2"]["tau"] == 3
    assert result["individual_F1"]["tau"] == result["individual_F2"]["tau"] == 1
    out["definition_counterexample"] = result
    target = Path(__file__).with_name("independent_certificates.json")
    target.write_text(json.dumps(out, indent=2) + "\n")
    print(json.dumps({"status": "PASS", "star_cores": [(r["nu"], r["tau"])
        for r in out["star_cores"]], "definition_example_G":
        (result["G"]["nu"], result["G"]["tau"]), "output": str(target)}))


if __name__ == "__main__":
    main()
