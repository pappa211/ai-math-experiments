> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Apex-unicyclic links with triangle-free remainder: full exclusion

Status: PROOF_USING_DECLARED_GE_INPUT_CANDIDATE, frozen 2026-11-16 for fresh reconstruction. The ordinary local arguments are explicit. General Gallai-Edmonds matching structure is a declared authenticated input, not re-proved here. No finite computation or Kotzig theorem is used.

## Theorem and reduced range

A minimum combined-CS failure G, globally or within an edge-subgraph-hereditary class, has no closed link component L at h and vertex w such that F=L-w is connected, triangle-free and unicyclic.

The accepted full apex-cycle theorem excludes a bare cycle. The accepted full perfect-unicyclic theorem excludes a perfect F. The deficiency-one note excludes a nonperfect F with |V(F)|-2nu_match(F)=1. It remains to treat a connected noncycle triangle-free unicyclic F with

    r=nu_match(F), d=|V(F)|-2r>=2.

Every original F-leaf sees w by minimum degree two of L. The ordinary exposable-leaf lemma gives a maximum F matching exposing an original leaf, so

    nu_match(L)=r+1.

The reverse inequality follows by discarding the at-most-one matching edge incident with w.

We use Facts A and B from `unicyclic_exposable_leaf_matching_v1.md`:

- A: every allowed F edge can be retained in a maximum F matching that exposes an original leaf;
- B: if deleting an edge preserves nu_match(F), the deletion has a maximum matching exposing an original F leaf outside the edge's endpoints.

Their hypotheses include connected unicyclic F and d>=2. Their declared GE input and original-leaf exceptions are retained exactly.

## 1. Balanced deletion and whole-footprint audits

For a matching P in L, |P|=s, and a cover Q of L-P with |Q|<=s, delete all h-spokes to L and P, obtaining K. The s hub triangles append to every K packing. The P edges and spokes to Q cover every lost triangle, including every outside page on P. Minimum-CS accounting either gives an immediate strict contradiction or gives

    |Q|=s, B(K), nu(K)=nu(G)-s.

Because F is triangle-free, every triangle of L contains w and L has no K4. Hence every residual clique block contains at most three L vertices. Any graph matching of L contributes at most one surviving edge per block. In particular an L matching larger than s contradicts the packing count after avoiding that edge in every old block.

If an actual triangle T=wab meets P and L-E(T) has an s-matching Z, append its hub triangles and T. The triangle contributes at most one surviving edge per old block because one T edge was deleted; the matching contributes at most one. Disjoint contributions would require four L vertices. Thus the entire footprint is a two-edge star or smaller in every old K4/K5 block, and the s+1 triangles augment.

If f=ab in P has endpoints in NO L triangle and L-f has an s-matching Z, codegree supplies a page abz with z outside N(h). Each block contains at most one page spoke since f is absent. Disjoint matching/page edges in one block would give an L triangle through a page endpoint. Thus the entire footprint is again a two-edge star, giving an augmentation. These audits allow every actual outside attachment.

## 2. Matching complements and edge avoidance

For EVERY maximum F matching M, the elementary pseudoforest matching-complement lemma gives tau_vertex(F-M)<=r. If it were <=r-1, then P=M and Q={w} union cover(F-M) would be a WKE tuple of size s=r, whereas nu_match(L)=r+1. The larger-matching audit excludes it. Therefore

    tau_vertex(F-M)=r                         (1)

for every maximum M.

Now take a maximum M exposing an original leaf z, and put e0=az for its F leaf edge. Use P=M union {wz}, Q={w} union cover(F-M), a balanced tuple of size r+1. Every edge of R=F-M other than e0 is triangle-supported in K. Indeed its second page cannot have an apex in F because F is triangle-free. A page with apex w survives unless its edge is incident with z, which only e0 is. An outside apex has both spokes surviving because all P endpoints lie in L. Closedness excludes an apex in another h-link component.

We claim nu_match(R)=r. If it were smaller, R could not be a forest, since a forest has equal matching and vertex-cover numbers and (1) holds. Choose an edge e of R's unique cycle. Removing it makes R a forest, so

    tau_vertex(R-e)=nu_match(R-e)<=nu_match(R)<=r-1.

The cycle edge e differs from the leaf edge e0 and is supported in K. Choose a minimum K cover containing e; together with P, hw, and spokes to a cover of R-e this gives at most

    2nu(K)+(r+1)+1+(r-1)=2nu(G)-1,

contradiction. Thus nu_match(R)=r, as claimed.

Every edge of F is now avoidable by some maximum F matching. If an edge is unallowed this is automatic. If f is allowed, Fact A supplies a maximum M containing f and exposing an original leaf. The preceding paragraph gives a size-r matching in F-M, which avoids f.

This does not assert that every F edge is allowed. It proves that no edge occurs in every maximum F matching.

## 3. Allowed triangular edges and the triangle-free L case

Suppose L has a triangle wab whose F edge ab is allowed. Fact A gives a maximum F matching M containing ab and exposing an original leaf x. The tuple P=M union {wx}, Q={w} union cover(F-M) has size r+1 and is WKE. The exposed x is not an endpoint of ab because that edge is in M.

By Section2, deleting ab preserves matching number. Fact B therefore supplies a maximum F-ab matching exposing an original F leaf y outside {a,b}. Add wy. This gives an (r+1)-matching of L-E(wab). The internal-triangle audit contradicts minimality.

Thus every F edge that forms a triangle with w is UNALLOWED.

If L is triangle-free, choose any maximum F matching exposing an original leaf and any edge f in it. Use its balanced tuple of size r+1. Fact B, using the edge-avoidance conclusion of Section2, supplies an (r+1)-matching of L-f. Every endpoint is safe because L is triangle-free. The external-page audit excludes this case. We may henceforth assume L has a triangle, and all its triangular F edges are unallowed.

## 4. Exact GE structure in a unicyclic graph

Use the declared Gallai-Edmonds decomposition with D the exposable vertices, A=N(D) minus D, and C the remaining vertices. D-components are factor-critical; C has a perfect matching; every maximum matching matches A into distinct D-components, matches C perfectly, and leaves one vertex exposed in each unused D-component.

A nontrivial factor-critical tree is impossible by deleting the neighbor of a leaf. A connected unicyclic factor-critical graph must have no leaf and hence is a bare odd cycle. Therefore each D-component is a singleton, except possibly one odd-cycle component.

Every component of F[C] is either a tree or unicyclic and has a perfect matching. A leaf in such a component forces its matching edge in every perfect matching of that component, hence in every maximum F matching, contradicting Section2. A nonempty tree has a leaf. A connected unicyclic graph without a leaf is its cycle. It follows that C is empty or consists of one bare EVEN cycle. If that cycle exists, it uses the unique cycle of F.

Every A-D edge is allowed. For an edge ad, choose a maximum matching exposing the D vertex d. Its D-component is then unused by A. The matching pairs a with a vertex d' in another D-component. Replace ad' by ad; this preserves cardinality, saturates the formerly unused D-component, and leaves d' exposed in the formerly used one. Thus ad belongs to a maximum matching. The same reasoning shows every A vertex has neighbors in at least two DISTINCT D-components: expose a neighbor d, and a must be matched into another component.

Every edge in the possible even C-cycle is allowed by alternating its perfect matching. Every internal edge of a possible odd D-cycle is also allowed: choose a maximum matching leaving that component unused, and choose a near-perfect cycle matching containing the desired edge. No D-D edges join different D-components and there are no D-C edges.

Consequently the only unallowed F edges are of types A-A and A-C. Every actual L triangle under the remaining-case hypothesis therefore has an F base of one of these types and at least one endpoint in A.

## 5. A triangular unallowed edge reaches an original leaf through a tree

Form the bipartite incidence graph I between A vertices and D-components. Each A-D edge gives an incidence. There cannot be two incidences from one A vertex to different vertices of the same odd-cycle D-component: those two edges and a path in that cycle would create a second cycle in F. Thus I is simple. Every A vertex has degree at least two in I.

Choose a triangular unallowed edge ab. We can choose an A endpoint a such that its I-component is a TREE containing only singleton D-components:

- If ab has type A-C, the C even cycle already uses F's unique cycle. Therefore I is a forest and no odd-cycle D-component exists; use its A endpoint.
- If ab has type A-A and both endpoints lie in one I-component, that component cannot already contain a cycle or a contracted odd-cycle D-component, since adding ab would create an additional cycle in F. Hence it is a tree of singleton D-components.
- If the A endpoints lie in different I-components, at most one component can contain the unique cycle or the contracted odd D-cycle. Choose the other endpoint. Its component is the required tree.

This exhausts every possible unallowed triangular edge. The unique-cycle argument uses actual subgraphs/paths of F; contraction is only notation for its possible factor-critical cycle.

A finite bipartite tree whose A vertices all have degree at least two has a leaf on its D side. Let x be such a leaf in the selected I-component. All D-components there are singletons, and a singleton D vertex has neighbors only in A. Hence x is an ORIGINAL leaf of F and sees w.

The unique I-path from a in A to x in D has odd length. Label its vertices1 if adjacent to w and0 otherwise. Both endpoints have label1: a belongs to the chosen L triangle, and x is an original leaf. Every edge of this path is an allowed A-D edge, so it cannot have labels11 by Section3. If it also had no00 edge, labels would alternate along the odd path, forcing opposite endpoint labels. Therefore some allowed edge f on the path has both endpoints labeled0.

## 6. The final safe edge augments

Because F is triangle-free, all triangles of L contain w. The two endpoints of f are not adjacent to w, so neither belongs to ANY L triangle.

Fact A supplies a maximum F matching M containing f and exposing an original leaf x'. Use P=M union {wx'}, Q={w} union cover(F-M), a WKE tuple of size r+1. Section2 makes f matching-preserving, so Fact B supplies an (r+1)-matching of L-f. The safe external-page audit of Section1 now appends one more triangle than the balanced count permits, contradiction.

Every d>=2 case is excluded. Together with the stated perfect, deficiency-one and bare-cycle reductions, this proves the theorem.

## Scope and declared dependencies

The result excludes every connected unicyclic TRIANGLE-FREE remainder F=L-w, even when L has many triangles through w and arbitrarily many branches. The remaining apex-unicyclic problem has an actual TRIANGULAR unique cycle in F and F nonperfect. No general WKE-to-CS theorem or availability of a one-cycle cover for arbitrary graphs follows.

New declared input: general Gallai-Edmonds, authenticated at the primary sources named in `unicyclic_exposable_leaf_matching_v1.md`, SHA e4a7700009250e5710a0c9036d2d61492d48a08edea140bcc2252b18d460e04b. That note's Facts A/B and leaf counts retain their declared-input status. The present use of GE is explicit in Sections4-5; it is not silently reclassified as ordinary.

Other frozen dependencies:

- `apex_unicyclic_wke_v1.md`, SHA d0fb7564463def15f0f77f9713aabfcfcb0437764cf1b9e19bf2dc8f848d968e, for its ordinary matching-complement and exposable-leaf lemmas only;
- `apex_unicyclic_perfect_full_exclusion_v1.md`, SHA 780fde16ec90aefe4a6f22b5aaac942b011a93c19b756c27a7fab61fba699d73;
- `apex_unicyclic_triangle_free_deficiency_one_exclusion_v1.md`, SHA 2cff47fc67a9337acadcde64590d221dc956f50d857de3f144c44d72738fac7f;
- `apex_cycle_link_exclusion_full_v2.md`, SHA 558a0d1f99c1672328aee8c1dd7a38d2c3dc9677233e561f0c90521a428815b7;
- authenticated class-local M0/codegree and literal K4/K5 covers and avoidance.

No finite solver output, all-size Lean claim, Kotzig input, or outside-attachment truncation enters this proof.
