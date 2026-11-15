# TUZA-18 criticality track: working evidence

Status: active research, no unrestricted theorem. Originality unestablished. All computations below are finite controls of independently stated surrogate hypotheses; no actual Tuza counterexample is supplied or sampled.

## Frozen dependencies read

- `https://github.com/pappa211/ai-math-experiments/blob/main`, commit `d4029fbafc3dffc250b50ed237ad81c3206cd1a0`, `problems/TUZA-07/notes/CRITICALITY_PACKAGE.md`.
- `https://github.com/pappa211/ai-math-experiments/blob/main/problems/TUZA-17`, commit `aa0de600d7fb0cfe4134e82ad056f02e4c465eb6`, `REPORT.md`, `STATUS_MATRIX.json`, `notes/A_CRITICAL_NONSATURATION.md`, `notes/A_ELEMENTARY_MATCHING_BLOCKER.md`.
- Canonical `AGENTS.md` and migration operating handoff/report read. Historical sources were accessed via `GIT_OPTIONAL_LOCKS=0 git show`/`git grep`; no historical worktree was edited.

## A. Simpler proof and exact scope of apex nonsaturation

Let G be an edge-minimal actual Tuza violation, k=nu(G), v a nonisolated vertex, H=G-v, h=nu(H), L=G[N(v)], D=2h-tau(H). Minimality gives D>=0 and tau(G)=2k+1. Extending a minimum H triangle-edge cover by spokes indexed by a minimum ordinary vertex cover of L gives

    2k+1 <= tau(H)+vc(L) = 2h-D+vc(L).

Consequently

    vc(L) >= 2(k-h)+D+1,
    k <= h+mu(L)-1,

because the endpoints of a maximum matching cover L, so vc(L)<=2mu(L). This is an ordinary cover proof of the prior NS result; no matching-blocker lemma is needed. Appending all apex triangles based on any maximum matching M of L to a maximum packing of H-M gives mu(L)+nu(H-M)<=k, hence the prior NS-state assertion. This observation is a simplification, not a new route to unrestricted Tuza and not stronger than the exact critical cover-extension inequality already available.

## B. First candidate and decisive failure

Candidate B0: every finite simple graph for which deleting any edge lowers tau has a set of at most two edges meeting every maximum triangle packing.

This would contradict the two-edge packing resilience of an actual minimal violation, but it is FALSE. K5 has tau=4, nu=2, tau(K5-e)=3 for every edge e, and nu(K5-S)=2 for every |S|<=2. For incident deleted edges 01,02 use triangles 034 and 123; for disjoint deleted edges 01,23 use triangles 024 and 134. Symmetry covers the two possible two-edge types; one/zero deletions follow. The cover values follow Mantel on five vertices and balanced 2+3 cuts (or direct finite enumeration). Therefore B0 is abandoned.

Oddness of tau alone does not repair B0. Glue two K5s along a single common edge e. Its tau is 7: covers in both blocks require four edges, and overlap is at most the common edge; compatible covers containing e attain seven. Every edge deletion lowers tau by one, and deletion of any two edges preserves nu=4, since each K5 after its affected at-most-two-edge deletion still packs two triangles. No cross-block triangle exists. For deletion of a noncommon edge f, a minimum three-cover of its K5-f can be selected to contain e because tau(K5-{e,f})=2; the other K5 has a minimum four-cover containing e. Thus all required cover drops occur. This graph satisfies Tuza with slack one; it is not an actual critical violation.

## C. Exact stronger cover condition and a control

Actual criticality implies

    Q(G): for every triangle T, tau(G-E(T))=tau(G)-3.

Equivalently every triangle T is contained in some minimum triangle-edge cover C of G. Indeed a minimum residual cover plus E(T) supplies such C, and removing E(T) from a minimum cover containing it gives the reverse equivalence.

A proposed structural shortcut that Q forces clique triangle components, or Q forces minimum triangle codegree at least three, is FALSE. The graph K2 join C5 has seven vertices and sixteen edges, tau=6, nu=4, and Q; all five rim edges have triangle codegree two. It is edge-cover-critical but has two-edge packing blockers (e.g. two disjoint rim edges), and so fails actual criticality. A reproducible exact control script is to be saved beside this note.

Preliminary exhaustive labelled graph check: all 32768 graphs on six vertices and all 2097152 graphs on seven vertices were enumerated. The Q graphs with no edges outside triangles have, on seven vertices, the following invariant types (m, active vertices, tau, minimum triangle codegree):

- (10,5,4,3): 21 labelled copies, K5 plus isolated vertices.
- (15,6,6,4): 7 labelled copies, K6 plus an isolated vertex.
- (16,7,6,2): 252 labelled copies, K2 join C5.
- (20,7,8,4): 21 labelled copies, K7-e.
- (21,7,9,5): 1 labelled copy, K7.

This finite classification is only a surrogate-control computation; it supplies no evidence that an actual critical graph exists or does not exist. The all-labelled seven-vertex run used about 249 MB peak RSS and 2.9 seconds on pinned local Python 3.12, with no files written during that initial read-only stage.

## D. Codegree-two interface and its limitation

Suppose uv is an edge in exactly two triangles uvx and uvy of an actual minimal violation G. Put H=G-uv, Fx={ux,vx}, Fy={uy,vy}. Then H is tight with nu(H)=k and tau(H)=2k, every maximum H packing meets Fx and Fy, and no minimum H cover meets both Fx and Fy (otherwise it covers G). Deleting any choice of one edge from each pair in G preserves nu=k; since all uv-triangles are then destroyed, this yields a maximum H packing avoiding the selected two edges and meeting the opposite two.

When xy is absent, no actual H triangle can meet both Fx and Fy. The same-side cross pairs ux,uy and vx,vy would require xy; the other cross pairs are vertex-disjoint graph edges and cannot lie in a triangle. Thus the opposite two edges in each of the four avoiding maximum packings belong to two different packed triangles. This is genuine graph geometry, unlike arbitrary rank-three clutters.

A theorem ruling out this exact interface would exclude codegree-two edges in actual minimal violations. It would NOT prove unrestricted Tuza: minimum codegree>=2 does not force an edge with equality, and no global availability statement has been proved. This scope barrier is explicit, and work will switch if the interface does not yield a mechanism applying at arbitrary codegree.

Generic hypergraph reasoning is inadequate. The Fano plane with one line removed is a linear 3-uniform hypergraph with nu=1, tau=3, minimum vertex degree two, Q, and resilience under deletion of any two hypergraph vertices. Its six pairwise-intersecting triples cannot be realized as the full triangle-edge hypergraph of a simple graph: an edge-intersecting family of actual graph triangles either has a common edge or lies in a K4, and has at most four members in the latter case. No graph conclusion is inferred from this hypergraph control.
