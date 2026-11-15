# Critical graphs cannot attain full apex packing capacity

Frozen addendum to Track A; the earlier A_RESULTS.md is unchanged. Status: PROVED_USING_PUBLISHED_INPUT (classical Tutte–Berge formula), with the blocker and apex deductions proved below. Originality UNESTABLISHED. Internal AI criticism pending; independent_final_verification NOT_RUN. This is a necessary structural consequence, not a repair operation or a proof of unrestricted Tuza.

## Exact claim and definitions

For a finite simple graph G, write nu(G) for its maximum number of edge-disjoint triangles. For an ordinary graph L, write mu(L) for its maximum ordinary matching size. Suppose G is an edge-minimal ACTUAL Tuza counterexample:

    tau(G)>2nu(G), and every proper edge-subgraph satisfies Tuza.

Ignore isolated vertices. Then at every vertex v, with H=G-v and L=G[N_G(v)],

    nu(G) <= nu(H)+mu(L)-1.                         (NS)

Moreover, for EVERY maximum matching M of L,

    nu(H-M) <= nu(H)-1.                             (NS-state)

Here H-M deletes the matching EDGES, not its vertices. Equivalently every maximum L matching meets the edge support of every maximum triangle packing of H. This is an unavoidable interaction between old triangles and the apex link.

The premise is not merely minimum codegree, and no known actual graph is claimed to instantiate it. The lemma uses the known critical consequence that deleting any one or two graph edges preserves nu, and the known fact that every edge belongs to a triangle. It assumes neither unrestricted equality structure nor S/E.

## Declared classical input

For every finite ordinary graph F,

    2mu(F) = min_{S subset V(F)} ( |V(F)|+|S|-o(F-S) ),

where o counts odd-order connected components. This is the classical Tutte–Berge formula. It is a KNOWN_INPUT, not a new TUZA-17 theorem.

Statement/edition checked in Irena Penev, *Combinatorics and Graph Theory 1 & 2*, September 2022, Section 9.3, printed p.148, author's Charles University PDF:
https://iuuk.mff.cuni.cz/~ipenev/KGLectureNotes.pdf
The formula and its short deduction from the preceding Gallai–Edmonds results were inspected; the full classical theorem was not independently re-proved or formally verified in this mission. The theorem statement also appears as Theorem 1.1 in Youri Tamitegama, *A proof of the Tutte-Berge formula*, 25 September 2018, https://www.cs.mcgill.ca/~ytamit/files/proof-tutte-berge.pdf. The latter notes contain unfinished diagram text in their proof and are not used as a completed proof audit. The standard classical theorem is the declared dependency; priority of the present corollary was not established.

## Lemma: a matching blocker of one or two vertices always exists

If F has at least one edge, there is a vertex set U with 1<=|U|<=2 such that

    mu(F-U) <= mu(F)-1.

Proof. Set n=|V(F)| and choose a minimizing S in Tutte–Berge.

If S is nonempty, choose u in S and apply the formula as an upper bound to F-u with test set S minus {u}. The graph left after this test-set deletion is still F-S, so

    2mu(F-u) <= (n-1)+(|S|-1)-o(F-S)=2mu(F)-2.

If S is empty, then 2mu(F)=n-o(F). Choose a component C containing an edge. If C has even order, delete any one vertex u of C. The remaining part of C has odd order, hence has at least one odd component; all other components are unchanged. Thus o(F-u)>=o(F)+1 and the empty-set bound gives 2mu(F-u)<=n-1-o(F-u)<=2mu(F)-2.

If C has odd order, it has at least three vertices. Delete any two distinct vertices U of C. The remaining part has positive odd order, so contributes at least one odd component, just as C did. Therefore o(F-U)>=o(F) and the empty-set bound gives 2mu(F-U)<=n-2-o(F-U)<=2mu(F)-2. These cases exhaust F with an edge. QED.

The lemma is not a statement about deleting one or two ordinary edges of F; it deletes vertices of the LINK graph. They become one or two spokes in the original graph G.

## Proof of NS

Every nonisolated vertex v of the critical G belongs to a triangle, so L has an edge. Choose the blocker U in L. Delete only the graph spokes vu for u in U, obtaining G'. Every packing in G' splits into old triangles in H, of which there are at most nu(H), and apex triangles, whose bases form a matching in L-U, of which there are at most mu(L-U). Cross-conflicts can only decrease the packing size. Hence

    nu(G') <= nu(H)+mu(L-U) <= nu(H)+mu(L)-1.

The known critical one/two-edge deletion resilience says nu(G')=nu(G). This proves NS.

For a maximum matching M in L, its mu(L) apex pages form an edge-disjoint family compatible with every triangle packing of H-M. Thus

    mu(L)+nu(H-M) <= nu(G) <= nu(H)+mu(L)-1,

which proves NS-state. All deletions and packing-bound directions are explicit. QED.

## What this excludes, and what it does not

The strengthened Track A blow-ups have full capacity at each selected independent apex: nu(G)=nu(G-v)+mu(L), as witnessed by the q rim perfect matchings. NS therefore rejects them using a necessary critical property that their high codegree, high connectivity and one/two-triangle extension fail to capture. This explains a real distinction, not a rescue of the already-refuted prescribed colour deletion rule.

On the other hand K4 and K5 already have a strict apex-capacity gap at every vertex. Indeed K4 gives 1<1+1 and K5 gives 2<1+2. Therefore absence of full capacity is far from characterizing actual counterexamples. A claim that some vertex of every critical G attains full capacity would need a new graph-specific existence theorem, with no supporting argument here; it must not be called a proven reduction or treated as easier than Tuza.

The graph-specific input is that apex triangles are ordinary matchings in a vertex link and deleting a link vertex corresponds to deleting one spoke. An arbitrary 3-uniform hypergraph, such as the abstract Fano plane, has no supplied graph vertex/link/spoke realization. The argument does not rule out Fano merely by generic criticality arithmetic and does not purport to prove no Tuza counterexample exists.

Global assessment: NS and NS-state give precise mandatory old/new packing conflict at every possible apex. They are useful diagnostics for future proposals and distinguish the strengthened obstruction from the full critical object. No cover-saving operation is provided, no such operation's global availability is proved, and no positive campaign recommendation follows from this necessary condition alone.

## Finite evidence and reproduction of earlier limitation checks

No computation filters for actual Tuza violations, and no nonempty dataset of actual minimal counterexamples is claimed. The matching blocker is proved unboundedly from Tutte–Berge. The finite Track A controls test the independent relaxed examples and construction only.

From the mission workspace:

    source LOCAL_ENVIRONMENT
    python checks/a_constructive_checks.py
    python checks/a_verify.py

The producer checked 116 prescribed-packing completions and 59,049 clone-count colour states. The separate-source verifier reconstructed all 14,640 actual triangles of three finite graphs and checked every packing certificate. Both use exact integers and no solver. They are separately written by the same Track A agent, not independent AI contexts. Actual Python/runtime/RSS details are recorded in evidence/a_constructive_checks.json and evidence/a_verified.json. A 60-second CPU and alarm bound was applied. Darwin rejected the producer's attempted 1536 MiB RLIMIT_AS; it is explicitly recorded NOT_AVAILABLE, not a successful memory cap. Observed producer/verifier peaks were about 17.6/24.1 MB and runtimes about 0.08/0.51 seconds. No background process remains from these checks.
