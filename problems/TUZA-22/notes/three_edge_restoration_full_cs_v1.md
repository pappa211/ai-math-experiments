> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Full combined CS after restoring at most three arbitrary edges to B

Frozen ordinary assembly candidate, 2026-11-16. All five three-edge shapes are treated by symbolic proofs with arbitrary outside attachments. No finite enumeration, bounded order, CS induction, near-tight classification or external theorem is a premise.

## Theorem

Let H be any finite simple graph satisfying B: every nonempty shared-edge-connected component of its ENTIRE actual triangle family has literal K4 or K5 support. Let F be any set of at most three distinct nonedges of H, and put G=H+F. Then

    tau(G)<=2nu(G), with equality if and only if B(G).

If equality holds and a new triangle was created, precisely one of the following occurs:

1. A new literal K4 triangle component is added, with its edge support disjoint from every old triangle component; all old components remain unchanged.
2. The three restored edges form a star, completing an old literal K4 to a K5 through one additional vertex. Its fourth spoke is an old triangle-free edge. The K5 replaces that old K4 and all other old components retain disjoint support.

Arbitrary background edges and vertex sharing remain permitted, subject throughout to all actual crossing triangles.

## 1. Elementary whole-page interface

For one missing edge uv, the union of ALL old spokes of ALL ordinary uv-pages meets any one old literal clique block in at most ONE edge. The block cannot contain both u,v. If it contained ux,uy for distinct page apices x,y, its edge xy and the old edges vx,vy would form an actual old triangle vxy sharing its edge with the block. This forces v into that same literal clique and makes uv old, contradiction.

This is stronger than a per-page statement and is used explicitly when the case proofs force uniqueness of an entire page family. Every supported old edge belongs to exactly one actual triangle component. An old triangle sharing edges with two purported blocks makes them the SAME block; these closure arguments count actual graph triangles, not an abstract hypergraph approximation.

Elementary clique facts are: K4 has (nu,tau)=(1,2), a maximum packing avoids any star, and an opposite pair is a minimum cover. K5 has (2,4), a maximum packing avoids any two prescribed edges, and every edge occurs in a minimum cover. These facts handle whole footprints and cover overlaps in every case.

## 2. Why the case proofs imply the inequality as well as equality

Put m=nu(H), so tau(H)=2m. If no new triangle is created, the theorem is immediate. Otherwise any one new triangle can be appended to a maximum H packing: its old footprint is at most one edge per old block when it uses one restored edge, at most one old edge total when it uses two, and empty when it uses three. Hence nu(G)>=m+1. Adding F to an old cover gives tau(G)<=2m+3.

If nu(G)>=m+2, then tau(G)<=2m+3<=2nu(G)-1, already strict. Thus only nu(G)=m+1 remains.

If tau(G)<=2m+1, the conclusion is again strict. Therefore assume

    nu(G)=m+1 and tau(G)>=2m+2.                         (*)

The shape proofs below use ONLY these two inequalities after their preliminary accounting. Their packing contradictions construct m+2 triangles; their cover contradictions give at most2m+1 edges (sometimes2m). They do not require tau(G)=2m+2 at any later step. Each concludes the literal B classification. That classification itself gives tau(G)=2nu(G)=2m+2, and excludes the possible inequality-violation value2m+3.

This is the explicit stronger-scope audit. The inequality is NOT inferred merely from an equality-restoration statement.

## 3. Complete shape division

Ignoring isolated vertices of the restored-edge graph, a three-edge set has exactly one of the following five shapes. With at most two edges, elementary insertion gives the inequality and accepted R2 gives its equality classification.

| restored shape | ordinary proof | result under(*) |
|---|---|---|
|triangle K3|accepted R1 page proof|one new K4 with three old background spokes|
|star K1,3|`three_star_edge_restoration_v1.md`|old K4 completed to K5; fourth old spoke background|
|path P4|`three_path_edge_restoration_v1.md`|one new K4 with its three old complementary edges background|
|two-edge path plus disjoint edge|`three_disconnected_path_edge_restoration_v1.md`|one restored edge lies in no triangle; reduce to R2|
|three-edge matching|`three_matching_edge_restoration_v1.md`|one restored edge lies in no triangle; reduce to R2|

For R1, the proof at(*) is unchanged: two disjoint pages have avoidable whole footprints because the three independent terminals give a two-edge star per block. Thus all pages intersect, forcing one full apex and the four K4 faces; a supported spoke would overlap an old minimum cover and give2m+1. No later use of exact tau is present.

For the star, two ordinary pages on adjacent bases always have avoidable footprints. The only mixed two-new/ordinary pair obstruction is an old K4 on the three new neighbors and one old neighbor of the common center. Otherwise the new family is pairwise intersecting and has a strict one-edge or overlapped two-edge cover. In the K4 case a completed K5 absorbs the local family; two-edge K5 avoidance rules out every outside page, and a supported fourth spoke gives a strict cover overlap.

For P4, the adjacent-page rule first removes middle-base ordinary pages under(*). Both end bases must then have pages. The two-new triangles constrain their apices; any disjoint end pair can be blocked only by one old K4 opposite pair. The WHOLE one-base footprint lemma then forces both families to be singletons already covered by an old minimum cover. Thus the end pages intersect, forcing exactly the new K4; every supported old edge gives a strict overlap.

For the three-edge matching, three pairwise-disjoint selected pages would require three different old K4 obstruction blocks. Their three apices form an actual old triangle joining those blocks, impossible. An intersecting pair plus a third page instead forces one old opposite pair, and old-triangle closure plus the whole-page lemma makes all three families singletons covered at old minimum cost. Hence an inactive restored edge exists and R2 applies.

For the disconnected path shape, a two-new-edge triangle and a page on the disjoint base either append or force an old opposite pair; any additional adjacent-base ordinary page makes that obstruction merge with a block containing a missing edge. Without the two-new triangle, two active adjacent bases have one common apex, and the disjoint-base pages force either a common edge cover or one old opposite cover. Thus again one edge is inactive and R2 applies.

These symbolic proofs include the full actual-triangle audit and arbitrary old-block footprint arguments. The shape split therefore proves the theorem, including its two equality outcomes.

## 4. Exact global role, without a blocker overclaim

For a minimum CS failure G, no deletion of at most three edges can yield a B residual: restoring those edges would contradict this theorem. For a three-edge deletion X that lowers packing from k to k-1, elementary cover extension and proper-subgraph CS give

    2k-3<=tau(G-X)<=2k-2.

The upper equality would make B(G-X) and is excluded by the theorem. Thus that residual has exactly tau=2k-3, deficit one. This does NOT show that packing is preserved after all three-edge deletions. Every actual triangle already supplies a three-edge packing blocker, and its residual is precisely of deficit one.

Nor does merely finding a three-edge blocker prove unrestricted CS: the restored graph theorem starts from B, whose availability must be separately proved. The earlier R2 plus TWO-edge-blocker route remains its own global chain. No such blocker or global classified residual is supplied here.

## Direct frozen dependencies

- R1 `notes/r1_proof_v1.md`, and its accepted stronger page-family scope.
- R2 `notes/r2_proof_v1.md`, especially the whole one-nonedge footprint lemma restated in Section1.
- `notes/three_star_edge_restoration_v1.md`: d5ceac18fb352cecf785237ca3c7d88a8c446730f2ee92b93a1e814941ebccb6.
- `notes/three_path_edge_restoration_v1.md`: c3b4e1ad977eae97a1849a3812dd32e37f34533eeddfcef9b7ec77f8c7fdeaad.
- `notes/three_matching_edge_restoration_v1.md`: ebfa415056ec7cb38f4beb3a357b13dee4242c90066e12892eb722431a677f01.
- `notes/three_disconnected_path_edge_restoration_v1.md`: ccbce9b980ff4d8ad99de45001d0299a1411d7c5e03d165fa5a4aaf62a63e476.
- Preliminary diagnostic `notes/three_edge_restoration_boundary_v1.md`: bab074f216f8dfc641e02182f7bf2dfed8e69156093deef4c54c4b12e6166798; its pure-triangle shortcut is independently valid but not needed for the complete shape proof.

The four new case arguments have no finite certificate or external source dependency. Their elementary clique facts agree with the pinned public `sources/public/papers/tuza-five-degenerate/main.md` Lemmas2/2A. Internal AI reconstruction is recorded separately; no external human review or new Lean proof is claimed.
