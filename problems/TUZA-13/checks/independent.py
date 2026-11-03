#!/usr/bin/env python3
"""TUZA-13 independent exact adjudicator, standard library only.
Authored without reading the discovery checker. Uses literal frozenset edges,
uncovered-triangle deletion for covers and include/exclude packing recursion.
Every completed optimization is exhaustive; a TimeoutError is not a pass.
"""
from itertools import combinations
from functools import lru_cache
from pathlib import Path
import argparse, datetime, fcntl, hashlib, json, random, signal, time

ROOT = Path(__file__).resolve().parents[1]

def utc():
    return datetime.datetime.now(datetime.timezone.utc).isoformat()

class ExactGraph:
    def __init__(self, vertices, edges):
        self.vertices = tuple(sorted(vertices))
        assert len(set(self.vertices)) == len(self.vertices)
        self.edges = tuple(sorted(tuple(sorted(e)) for e in edges))
        assert len(set(self.edges)) == len(self.edges)
        assert all(len(e) == 2 and e[0] != e[1] and set(e) <= set(self.vertices) for e in self.edges)
        actual = set(self.edges)
        self.triangles = tuple(t for t in combinations(self.vertices, 3)
                               if all(e in actual for e in combinations(t, 2)))
        self.resources = tuple(frozenset(combinations(t, 2)) for t in self.triangles)
        self.cover_nodes = self.packing_nodes = 0

    def min_cover(self):
        resources = self.resources
        @lru_cache(None)
        def solve(left):
            self.cover_nodes += 1
            if not left:
                return ()
            counts = {}
            for i in left:
                for e in resources[i]:
                    counts[e] = counts.get(e, 0) + 1
            pivot = max(left, key=lambda i: sum(counts[e] for e in resources[i]))
            best = None
            for edge in sorted(resources[pivot], key=lambda e: (-counts[e], e)):
                rest = tuple(i for i in left if edge not in resources[i])
                candidate = (edge,) + solve(rest)
                if best is None or len(candidate) < len(best):
                    best = candidate
            return best
        cover = tuple(sorted(solve(tuple(range(len(resources))))))
        assert len(cover) == len(set(cover)) and all(set(cover) & r for r in resources)
        return cover

    def all_min_covers(self, optimum=None):
        """Exhaustive disjoint branches at first unhit triangle; dedup sets."""
        if optimum is None:
            optimum = len(self.min_cover())
        found = set()
        resources = self.resources
        def visit(left, chosen, forbidden):
            if not left:
                if len(chosen) == optimum:
                    found.add(tuple(sorted(chosen)))
                return
            if len(chosen) >= optimum:
                return
            # A greedy disjoint triangle family is a certified remaining LB.
            used, lower = set(), 0
            for i in left:
                if not used & resources[i]:
                    used.update(resources[i]); lower += 1
            if len(chosen) + lower > optimum:
                return
            pivot = min(left, key=lambda i: len(resources[i] - forbidden))
            candidates = sorted(resources[pivot] - forbidden)
            earlier = set()
            for edge in candidates:
                visit(tuple(i for i in left if edge not in resources[i]),
                      chosen | {edge}, forbidden | earlier)
                earlier.add(edge)
        visit(tuple(range(len(resources))), set(), set())
        return tuple(sorted(found))

    def max_packing(self, eligible=None):
        resources = self.resources
        if eligible is None:
            eligible = tuple(range(len(resources)))
        else:
            eligible = tuple(sorted(eligible))
        @lru_cache(None)
        def solve(left):
            self.packing_nodes += 1
            if not left:
                return ()
            # Choose high-conflict triangle; both exhaustive branches retained.
            pivot = max(left, key=lambda i: sum(bool(resources[i] & resources[j]) for j in left))
            others = tuple(i for i in left if i != pivot)
            take = (pivot,) + solve(tuple(i for i in others if not resources[i] & resources[pivot]))
            skip = solve(others)
            return take if len(take) >= len(skip) else skip
        answer = tuple(sorted(solve(eligible)))
        assert all(not resources[a] & resources[b] for a, b in combinations(answer, 2))
        return answer

    def classify(self, cover):
        C = frozenset(tuple(sorted(e)) for e in cover)
        assert C <= set(self.edges)
        counts = [len(C & r) for r in self.resources]
        assert all(counts), 'specified edges do not cover every actual triangle'
        return {k: tuple(i for i, c in enumerate(counts) if c == k) for k in (1, 2, 3)}

    def certify(self, cover, all_covers=False):
        start = time.monotonic()
        optimum = self.min_cover()
        C = tuple(sorted(tuple(sorted(e)) for e in cover))
        classes = self.classify(C)
        eligible = tuple(sorted(classes[1] + classes[2]))
        allowed = self.max_packing(eligible)
        full = self.max_packing()
        assert len(allowed) <= len(full)
        result = dict(vertices=self.vertices, edges=self.edges, triangles=self.triangles,
                      specified_cover=C, minimum_cover=optimum, tau=len(optimum),
                      specified_cover_is_minimum=len(C) == len(optimum),
                      triangle_classes={str(k): [self.triangles[i] for i in v] for k, v in classes.items()},
                      eligible_packing=[self.triangles[i] for i in allowed],
                      nu_eligible=len(allowed), nu=len(full),
                      full_packing=[self.triangles[i] for i in full],
                      threshold=(len(C)+1)//2,
                      deficiency=(len(C)+1)//2-len(allowed),
                      ordinary_Tuza=len(optimum) <= 2*len(full),
                      cover_search_nodes=self.cover_nodes, packing_search_nodes=self.packing_nodes,
                      exhaustive_status='COMPLETED_EXACT', elapsed_seconds=time.monotonic()-start)
        if all_covers:
            covers = self.all_min_covers(len(optimum))
            profiles = []
            for c in covers:
                types = self.classify(c)
                p = self.max_packing(types[1] + types[2])
                profiles.append(dict(cover=c, nu_eligible=len(p),
                                     packing=[self.triangles[i] for i in p]))
            result['all_minimum_covers'] = profiles
            result['all_minimum_cover_count'] = len(profiles)
            result['minimum_eligible_over_all_covers'] = min((x['nu_eligible'] for x in profiles), default=0)
        return result

def brute_cover(g):
    for k in range(len(g.edges)+1):
        found = tuple(c for c in combinations(g.edges, k) if all(set(c)&r for r in g.resources))
        if found:
            return found
    raise AssertionError('finite graph has no cover')

def brute_packing(g, eligible):
    # This independent algorithm enumerates all fixed-size triangle subsets.
    best = ()
    for k in range(len(eligible)+1):
        found = None
        for selection in combinations(eligible, k):
            flat = [e for i in selection for e in g.resources[i]]
            if len(flat) == len(set(flat)):
                found = selection; break
        if found is None:
            return best
        best = found
    return best

def controls():
    start = utc(); t0 = time.monotonic(); results = []
    examples = [(f'K{n}', n, list(combinations(range(n), 2))) for n in range(4, 8)]
    eight = [(0,1),(0,2),(0,3),(0,4),(0,7),(1,2),(1,3),(1,4),(1,5),(2,3),(2,5),(2,6),(3,6),(3,7),(4,5),(4,7),(5,6)]
    examples += [('restoration8',8,eight), ('residual8',8,[e for e in eight if e not in ((0,2),(1,3))])]
    for name, n, edges in examples:
        g = ExactGraph(range(n), edges)
        result = g.certify(g.min_cover(), all_covers=True)
        result['name'] = name
        # Direct edge-subset enumeration is algorithmically distinct from recursion.
        if n <= 6 or name.startswith(('restoration','residual')):
            brute = brute_cover(g)
            assert len(brute[0]) == result['tau']
            assert set(brute) == {tuple(map(tuple,x['cover'])) for x in result['all_minimum_covers']}
            if len(g.triangles) <= 20:
                assert len(brute_packing(g, tuple(range(len(g.triangles))))) == result['nu']
        results.append(result)
        print(name, result['tau'], result['nu'], result['all_minimum_cover_count'], result['minimum_eligible_over_all_covers'], flush=True)
    invariants = []
    rng = random.Random(2026110213)
    for name, n, edges in examples:
        if name == 'K7':
            continue
        g = ExactGraph(range(n),edges); C = g.min_cover(); c = g.classify(C)
        eligible = c[1]+c[2]
        a = len(g.max_packing(eligible)); v = len(g.max_packing())
        permutation = list(range(n)); rng.shuffle(permutation)
        h = ExactGraph(range(n), [(permutation[u],permutation[w]) for u,w in edges])
        H = [(permutation[u],permutation[w]) for u,w in C]
        hc = h.classify(H)
        assert len(h.min_cover()) == len(C)
        assert len(h.max_packing(hc[1]+hc[2])) == a
        invariants.append([name,'relabeling'])
        # Add pendant edge at vertex 0 and a disjoint isolated edge. Neither can
        # participate in an actual triangle, as independently reenumerated.
        h = ExactGraph(range(n+3), edges+[(0,n),(n+1,n+2)])
        assert h.triangles == g.triangles
        assert len(h.min_cover()) == len(C) and len(h.max_packing()) == v
        assert len(h.max_packing(h.classify(C)[1]+h.classify(C)[2])) == a
        invariants.append([name,'triangle_free_background_add_and_remove'])
        subset = tuple(sorted(eligible))[::2]
        assert len(g.max_packing(subset)) <= a <= v
        invariants.append([name,'eligibility_monotonicity_and_nu_bound'])
        # Componentwise identities: original graph disjoint union a K4.
        e4 = [(n+u,n+w) for u,w in combinations(range(4),2)]
        h = ExactGraph(range(n+4),edges+e4)
        H = list(C)+[(n,n+1),(n+2,n+3)]
        hc = h.classify(H)
        assert len(h.min_cover()) == len(C)+2
        assert len(h.max_packing()) == v+1
        assert len(h.max_packing(hc[1]+hc[2])) == a+1
        invariants.append([name,'disjoint_union_componentwise'])
    return dict(started_utc=start, ended_utc=utc(), elapsed_seconds=time.monotonic()-t0,
                algorithm='standard-library frozenset exact recursive enumeration; brute subsets on listed small controls',
                examples=results, invariant_tests=invariants,
                status='PASS', source_code_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--controls', action='store_true')
    parser.add_argument('--input')
    parser.add_argument('--output', required=True)
    parser.add_argument('--seconds', type=int, default=180)
    parser.add_argument('--all-covers', action='store_true')
    args=parser.parse_args()
    def timed_out(sig, frame):
        raise TimeoutError('independent checker wall-clock cap')
    signal.signal(signal.SIGALRM,timed_out)
    signal.alarm(args.seconds)
    with (ROOT/'evidence'/'compute.lock').open('a+') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX)
        try:
            if args.controls:
                result=controls()
            else:
                path=Path(args.input); raw=json.loads(path.read_text())
                g=ExactGraph(raw.get('vertices',range(raw['n'])) if 'n' in raw else raw['vertices'],raw['edges'])
                C=raw.get('cover',raw.get('C',raw.get('specified_cover')))
                assert C is not None
                result=g.certify(C,args.all_covers)
                result['input_sha256']=hashlib.sha256(path.read_bytes()).hexdigest()
            Path(args.output).write_text(json.dumps(result,indent=2)+'\n')
        except TimeoutError as exc:
            Path(args.output).write_text(json.dumps(dict(status='TIMEOUT_UNRESOLVED',ended_utc=utc(),error=str(exc)),indent=2)+'\n')
            raise
        finally:
            signal.alarm(0)

if __name__ == '__main__':
    main()
