#!/usr/bin/env python3
"""Independent role obstruction check by equality merging and exact 3-coloring.
No discovery code is read or imported. This search differs from role-permutation
variable domains: it branches on the equality disjunctions themselves.
"""
from collections import Counter
from itertools import combinations
from pathlib import Path
import hashlib,json,platform,sys,time
ROOT=Path(__file__).resolve().parents[1]
START=time.monotonic(); TIME_LIMIT=30
stats=Counter()
def require(ok,msg):
    if not ok:raise ValueError(msg)
def tick():
    if time.monotonic()-START>TIME_LIMIT:raise TimeoutError('UNKNOWN_TIMEOUT')
def edge(a,b):return tuple(sorted((a,b)))
def tri_edges(t):return tuple(combinations(sorted(t),2))
require(platform.system()=='Darwin','Mac required')
require(sys.executable=='PRIVATE_PATH_REMOVED','pinned Python required')
E=frozenset({edge(i,(i+1)%5) for i in range(5)}|{edge(i,h) for i in range(5) for h in (5,6)}|{(5,6)})
T=tuple(t for t in combinations(range(7),3) if set(tri_edges(t))<=E)
TE=tuple(frozenset(tri_edges(t)) for t in T)
# Exact ordinary packing and cover, entirely separate from role optimization.
nu=0; packing=[]
for size in range(len(E)//3+1):
    for fam in combinations(range(len(T)),size):
        used=frozenset().union(*(TE[i] for i in fam))
        if len(used)==3*size:nu=size;packing=list(fam);break
cover=None
for size in range(len(E)+1):
    cover=next((c for c in combinations(sorted(E),size) if all(set(c)&t for t in TE)),None)
    if cover is not None:break
tau=len(cover)
require(nu==4 and tau==6,'ordinary values differ from frozen claim')
# One variable for every occurrence of a graph edge in an actual triangle.
occurrence_edges=tuple(tri_edges(t) for t in T)
triangle_occurrences=tuple(tuple(3*i+j for j in range(3)) for i in range(len(T)))
pair_to_atom={}
for i,j in combinations(range(len(T)),2):
    common=TE[i]&TE[j]
    require(len(common)<=1,'simple graph triangle overlap error')
    if common:
        e=next(iter(common));p=occurrence_edges[i].index(e);q=occurrence_edges[j].index(e)
        pair_to_atom[(i,j)]=(3*i+p,3*j+q)
raw=set()
for fam in combinations(range(len(T)),nu+1):
    clause=frozenset(pair_to_atom[p] for p in combinations(fam,2) if p in pair_to_atom)
    require(clause,'ordinary packing exceeds computed maximum')
    raw.add(clause)
minimal=[]
for clause in sorted(raw,key=lambda c:(len(c),sorted(c))):
    if not any(old<=clause for old in minimal):minimal.append(clause)
clauses=tuple(minimal)
# Verify author certificate contents rather than trusting counts or its verdict.
cert_bytes=(ROOT/'evidence/role_k2c5_csp.json').read_bytes();cert=json.loads(cert_bytes)
require(tuple(map(tuple,cert['triangles']))==T,'certificate triangles mismatch')
require(set(map(tuple,cert['edges']))==E,'certificate edges mismatch')
cert_atoms=[]
for i,j,p,q in cert['pairs']:
    require(occurrence_edges[i][p]==occurrence_edges[j][q],'certificate occurrence index mismatch')
    cert_atoms.append((3*i+p,3*j+q))
require(set(cert_atoms)==set(pair_to_atom.values()),'certificate shared pairs mismatch')
cert_clauses={frozenset(cert_atoms[i] for i in c) for c in cert['clauses']}
require(cert_clauses==set(clauses),'certificate minimal clauses mismatch')
require(cert['all_five_families']==3003 and cert['raw_distinct_clauses']==len(raw) and cert['minimal_clauses']==len(clauses),'certificate counts mismatch')

def incompatible(state):
    conflicts=set()
    for tri in triangle_occurrences:
        roots=[state[x] for x in tri]
        if len(set(roots))<3:return None
        conflicts.update(tuple(sorted(p)) for p in combinations(roots,2))
    return conflicts

def merge(state,a,b):
    x,y=sorted((state[a],state[b]))
    return tuple(x if z==y else z for z in state)

color_cache={}
def coloring(state):
    if state in color_cache:return color_cache[state]
    conflicts=incompatible(state)
    if conflicts is None:return None
    adj={v:set() for v in set(state)}
    for a,b in conflicts:adj[a].add(b);adj[b].add(a)
    # Global role symmetry: assign the first actual triangle colors 0,1,2.
    colors={state[i]:i for i in range(3)}
    def search():
        tick();stats['color_search_nodes']+=1
        if len(colors)==len(adj):return dict(colors)
        node=max((v for v in adj if v not in colors),
                 key=lambda v:(len({colors[w] for w in adj[v] if w in colors}),len(adj[v]),-v))
        forbidden={colors[w] for w in adj[node] if w in colors}
        for c in range(3):
            if c in forbidden:continue
            colors[node]=c
            result=search()
            if result is not None:return result
            del colors[node]
        return None
    result=search();color_cache[state]=result
    return result

# Exhaustively branch over equality choices in an unsatisfied disjunction.
# A satisfying role assignment must make one such equality true, so these
# merges cover every possible assignment; each branch uses exact 3-coloring.
seen=set();trace=[]
def solve(state,depth=0):
    tick();stats['equality_search_nodes']+=1
    while True:
        conflicts=incompatible(state)
        if conflicts is None:
            stats['triangle_collision_leaves']+=1;return None
        residual=[]
        forced=None
        for clause in clauses:
            if any(state[a]==state[b] for a,b in clause):continue
            viable=sorted({tuple(sorted((state[a],state[b]))) for a,b in clause
                           if tuple(sorted((state[a],state[b]))) not in conflicts})
            if not viable:
                stats['empty_clause_leaves']+=1;return None
            if len(viable)==1:forced=viable[0];break
            residual.append(viable)
        if forced is None:break
        # Roots are occurrence identifiers and remain fixed points.
        state=merge(state,*forced);stats['forced_merges']+=1
    if state in seen:stats['memoized_failures']+=1;return None
    colors=coloring(state)
    if colors is None:
        stats['non_three_colorable_leaves']+=1;seen.add(state);return None
    if not residual:
        return [colors[state[i]] for i in range(3*len(T))]
    branch=min(residual,key=lambda c:(len(c),c))
    trace.append({'depth':depth,'components':len(set(state)),'alternatives':[list(p) for p in branch]})
    for a,b in branch:
        result=solve(merge(state,a,b),depth+1)
        if result is not None:return result
    seen.add(state);return None

initial=tuple(range(3*len(T)))
# The unit-equality relaxation really is satisfiable; preserve a witness.
unit_state=initial
for c in clauses:
    if len(c)==1:unit_state=merge(unit_state,*next(iter(c)))
unit_coloring=coloring(unit_state)
require(unit_coloring is not None,'claimed satisfiable relaxation is not satisfiable')
unit_roles=[[unit_coloring[unit_state[3*i+j]] for j in range(3)] for i in range(len(T))]
require(all(len(set(r))==3 for r in unit_roles),'invalid unit relaxation roles')
for clause in clauses:
    if len(clause)==1:
        a,b=next(iter(clause));require(unit_roles[a//3][a%3]==unit_roles[b//3][b%3],'unit witness fails')
status='UNKNOWN';assignment=None
try:
    assignment=solve(initial)
    status='UNSAT_EXHAUSTIVE' if assignment is None else 'SAT'
except TimeoutError:
    status='UNKNOWN_TIMEOUT'
require(status=='UNSAT_EXHAUSTIVE',f'role obstruction not verified: {status}')
result={
 'status':status,'method':'Independent equality-disjunction branching, component merging, and exact DSATUR 3-color search; no permutation-domain search/import.',
 'graph':'K2 joined to C5','n':7,'edges':sorted(E),'triangles':T,'ordinary_nu':nu,'ordinary_tau':tau,
 'ordinary_packing':[T[i] for i in packing],'ordinary_cover':cover,
 'all_five_families':sum(1 for _ in combinations(T,5)),
 'raw_distinct_clauses':len(raw),'minimal_clauses':len(clauses),
 'minimal_clause_lengths':dict(Counter(map(len,clauses))),
 'independent_search_stats':dict(stats),'equality_branch_trace':trace,
 'unit_relaxation_status':'SAT','unit_relaxation_roles':unit_roles,
 'scope':'One graph; all role assignments ruled out by complete exact search over necessary-and-sufficient no-five-family clauses. Not a role census.',
 'certificate_sha256':hashlib.sha256(cert_bytes).hexdigest(),
 'frozen_note_sha256':hashlib.sha256((ROOT/'notes/role_audit_frozen.md').read_bytes()).hexdigest(),
 'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
 'python':sys.version,'python_executable':sys.executable,'platform':platform.platform(),
 'elapsed_seconds':time.monotonic()-START,'timeout_seconds':TIME_LIMIT,
}
(ROOT/'reviews/critic_role_check.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ('status','ordinary_nu','ordinary_tau','all_five_families','raw_distinct_clauses','minimal_clauses','independent_search_stats','elapsed_seconds')}))
