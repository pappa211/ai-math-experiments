> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# TUZA-23 frozen theorem specification v1

Frozen before substantial new implementation. Representation: public TUZA-06 finite-set edges and actual SimpleGraph triangles, copied at 4b72b6d5b4f71fcefa3f0314483bf58ce809d7b4. Independent specification review pending. No degree assumption enters the target.

## Semantics

For arbitrary V : Type u, [Fintype V] [DecidableEq V], G : SimpleGraph V, Tuza.triangles G = G.cliqueFinset 3 includes ALL unordered actual triangles. Tuza.edges t = t.powersetCard 2 consists of unordered two-element vertex sets. Packing is subset membership plus pairwise EDGE-disjoint supports; shared vertices are permitted. nu is the supremum over finite packing cardinalities; tau is the least cover cardinality. Existing witness existence and graph_min_cover show the internal Covers definition, which permits extraneous sets, has an optimum attained by actual graph edges. Add an explicit graph-edge-restricted cover/witness bridge.

B G := Tuza06.ComponentCliques G means each full actual-triangle shared-edge reachability component has support exactly edges k for k.card=4 or 5. Existing componentCliques_iff_decomposition proves equivalence to EXHAUSTIVE edge-disjoint clique decomposition, including ALL crossing triangles. This is not ordinary graph blocks. Empty graphs, isolates, background edges and vertex-sharing components are permitted.

CS G := tau(triangles G) ≤ 2*nu(triangles G) and (tau(triangles G)=2*nu(triangles G) iff B G). Do not use degree-conditioned Tuza06.CombinedStatement. Universal CS is open.

## Exact R2

addEdges H F has adjacency H.Adj a b OR (a≠b AND {a,b}∈F). Nonedges H F requires each e∈F to have cardinality two and not be an actual H edge.

```lean
theorem r2 {V : Type u} [Fintype V] [DecidableEq V]
  (H : SimpleGraph V) (F : Finset (Finset V))
  (hF : Nonedges H F) (hcard : F.card ≤ 2) (hB : B H)
  (htight : tau (triangles (addEdges H F)) =
    2 * nu (triangles (addEdges H F))) : B (addEdges H F)
```

Equality restoration only; no claim of full CS for H+F. F may be empty, singleton, adjacent or disjoint pair. No graph order/page/attachment bound. No M0, induction, unproved restoration premise or project axiom in R2.

Whole-footprint: in EACH old clique triangle component, the UNION of BOTH spokes of ALL ordinary pages of a fixed old nonedge has at most one edge. This permits simultaneous minimum-cover choice to hit all non-bare pages. Distinguish this from a maximum packing avoiding ONE page.

One-edge insertion: B(H), old nonedge ab, and a NEW triangle after insertion imply tau(H+ab)+1 ≤ 2*nu(H+ab), expressed in addition form.

## Separate M0 and forest plan

M0: fixed finite vertex type, ¬CS G and CS H for every strict edge-subgraph H<G on that same type. Prove nonempty connected actual triangle support, no unsupported edges, and k=nu G implies tau G=2k and for every actual e, nu(G-e)=k and tau(G-e)+1=2k. Tightness precedes use of proper-subgraph equality classification. Hereditary-class variant must state closure and vertex conventions; finite-edge minimization must justify existence. Explicit proper-subgraph CS is a legitimate conditional premise, unlike assuming an advertised restoration lemma.

Forest target: existence of ANY actual-edge triangle cover C whose selected-edge graph is a forest implies CS G, with no minimum-cover or ambient sparsity/connectivity premise. Plan/stretch only unless formally checked.

## Acceptance

Rebuild copied local modules from source. Pinned compiler/mathlib objects are disclosed trust boundary. No sorryAx, admitted/project axioms, native_decide/native proof trust, unsafe escape or unproved import in accepted target closure. Standard propext/Classical.choice/Quot.sound may occur and must be reported. Check exact types, axiom closures, semantic controls, clean build and separate AI semantic/build review.

Amendments: none at v1 freeze; substantive changes require recorded review.
