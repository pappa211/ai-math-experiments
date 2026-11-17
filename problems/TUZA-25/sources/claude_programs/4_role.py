"""Role-assignment test (Aharoni bridge).

For each triangle T choose a bijection rho_T : E(T) -> {0,1,2}.  The hypergraph H_rho on E x {0,1,2}
with one hyperedge {(e, rho_T(e))} per triangle is 3-partite, so Aharoni's theorem gives
    tau(G) <= tau(H_rho) <= 2 nu(H_rho) =: 2 nu_rho(G),
where nu_rho = max family of triangles no two of which share an edge IN THE SAME ROLE.
Question: does some rho achieve nu_rho(G) = nu(G)?   (Then Tuza for G follows from Aharoni.)

CEGAR: find rho; compute a max role-disjoint family; if larger than nu, forbid it and repeat.
Usage: role.py < graph6 lines   (prints failures and a summary)   or   role.py --complete N
"""
import sys, itertools
from ortools.sat.python import cp_model

PERMS = list(itertools.permutations(range(3)))

def tri_data(n, E):
    adj = [set() for _ in range(n)]
    for u, v in E: adj[u].add(v); adj[v].add(u)
    T = [t for t in itertools.combinations(range(n), 3) if t[1] in adj[t[0]] and t[2] in adj[t[0]] and t[2] in adj[t[1]]]
    te = [[(t[0], t[1]), (t[0], t[2]), (t[1], t[2])] for t in T]
    share = {}
    for i, j in itertools.combinations(range(len(T)), 2):
        c = set(te[i]) & set(te[j])
        if c:
            e = next(iter(c)); share[(i, j)] = (te[i].index(e), te[j].index(e))
    return T, te, share

def max_family(nT, conflicts, limit=60):
    m = cp_model.CpModel(); z = [m.NewBoolVar('') for _ in range(nT)]
    for i, j in conflicts: m.AddBoolOr([z[i].Not(), z[j].Not()])
    m.Maximize(sum(z)); s = cp_model.CpSolver(); s.parameters.num_workers = 2; s.parameters.max_time_in_seconds = limit
    st = s.Solve(m)
    return [i for i in range(nT) if s.Value(z[i])], st == cp_model.OPTIMAL

def role_test(n, E, max_iter=4000, verbose=False):
    T, te, share = tri_data(n, E)
    if not T: return ('ok', 0, 0, None)
    P, _ = max_family(len(T), list(share.keys())); nu = len(P)
    M = cp_model.CpModel()
    p = [M.NewIntVar(0, 5, '') for _ in T]
    M.Add(p[0] == 0)
    s = {}
    for (i, j), (a, b) in share.items():
        v = M.NewBoolVar(''); s[(i, j)] = v
        M.AddAllowedAssignments([p[i], p[j], v],
                                [(x, y, int(PERMS[x][a] == PERMS[y][b])) for x in range(6) for y in range(6)])
    solver = cp_model.CpSolver(); solver.parameters.num_workers = 2; solver.parameters.max_time_in_seconds = 120
    for it in range(max_iter):
        st = solver.Solve(M)
        if st == cp_model.INFEASIBLE: return ('FAIL', nu, it, None)
        if st not in (cp_model.OPTIMAL, cp_model.FEASIBLE): return ('unknown', nu, it, None)
        rho = [solver.Value(x) for x in p]
        conf = [(i, j) for (i, j), (a, b) in share.items() if PERMS[rho[i]][a] == PERMS[rho[j]][b]]
        F, opt = max_family(len(T), conf)
        if len(F) <= nu:
            return ('ok' if opt else 'unknown', nu, it, {T[i]: {te[i][k]: PERMS[rho[i]][k] for k in range(3)} for i in range(len(T))})
        F = F[:nu + 1]
        lits = [s[(i, j)] for i, j in itertools.combinations(F, 2) if (i, j) in s]
        M.AddBoolOr(lits)
        if verbose and it % 50 == 0: print('  iter', it, flush=True)
    return ('unknown', nu, max_iter, None)

def parse(line):
    data = [ord(c) - 63 for c in line]; n = data[0]; bits = []
    for x in data[1:]: bits += [(x >> k) & 1 for k in range(5, -1, -1)]
    E = []; idx = 0
    for j in range(1, n):
        for i in range(j):
            if bits[idx]: E.append((i, j))
            idx += 1
    return n, E

if __name__ == '__main__':
    if len(sys.argv) > 2 and sys.argv[1] == '--complete':
        n = int(sys.argv[2]); E = list(itertools.combinations(range(n), 2))
        r = role_test(n, E, verbose=True)
        print('K%d' % n, r[0], 'nu', r[1], 'iterations', r[2])
        if r[3] and n <= 5:
            for t, d in r[3].items(): print('  ', t, d)
        sys.exit()
    tot = ok = fail = unk = 0; fails = []
    for line in sys.stdin:
        line = line.strip()
        if not line: continue
        n, E = parse(line); r = role_test(n, E); tot += 1
        if r[0] == 'ok': ok += 1
        elif r[0] == 'FAIL': fail += 1; fails.append((line, r[1])); print('FAIL', line, 'nu', r[1], flush=True)
        else: unk += 1; print('UNKNOWN', line, flush=True)
    print('graphs', tot, 'ok', ok, 'fail', fail, 'unknown', unk)
