> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Complete small-link reductions

Completed on the external verification server at 2026-10-30T18:37:42.308090+00:00.
Top-level source: `lean/Tuza06/SmallLinks.lean`.
Latest successful complete type/axiom/compiler log: `logs/compile-183629-Tuza06.SmallLinks.log`.
All builds used only the shared serialized helper, Lean `-j 1`, 1900 MiB memory limit, and a 240-second bound. These graph proofs compile in seconds. All edits, mathematics, computations, and logs stayed on the external verification server.

## Completed exact result

`minimal_closed_link_size` proves:

    ∀ {V : Type*} [Fintype V] [DecidableEq V] {G : SimpleGraph V},
      MinimalObstruction G → ∀ {v : V} {C : Finset V},
      LinkClosed G v C → C.Nonempty → 5 ≤ C.card.

`LinkClosed G v C` means that every C vertex neighbors v and no edge of the link G[N(v)] leaves C. It allows C to be a component or a union of components. Other components at v, outside vertices, and all permissible attachments remain unrestricted. The theorem is therefore a direct, stronger set formulation of the ordinary small-link exclusion; it does not replace an edge-connected triangle component by an ordinary vertex component.

The successful top-level audit prints the full type and exactly the transitive axioms `propext`, `Classical.choice`, and `Quot.sound`. No placeholders, custom axioms, unsafe/native shortcuts, global Tuza input, or unproved published local reduction is used. The actual minimal combined-obstruction assumption is explicit. This is a completed structural theorem, not a proof of the global 5-degenerate statement by itself.

## Source organization and exact hashes

- `lean/Tuza06/SmallLinks.lean`: `fde3e17afe2a1420c87da08cca1d9fd83806f70de40f1d216be3c60548beb834`.
- `lean/Tuza06/SmallLinksBase.lean`: `3d52a43fa7fd91342506949ada70e31820b5e460a4c5050a2d7d0833e95337cb`.
- `lean/Tuza06/SmallLinksCross.lean`: `cb543f1423d3f7675cdbe94d7ea17c738d824bc00fc454ce916b2afc4a230e0f`.
- `lean/Tuza06/SmallLinksFour.lean`: `f777892653ea172a3c292972ec587eb3ef6d145ffc64b491fae838e4ee5dc3ac`.
- `lean/Tuza06/SmallLinksK3.lean`: `326b0473254705d504f9532f771a56e945590e32bb69782f163e2977621e372c`.
- `lean/Tuza06/SmallLinksK4.lean`: `95b6b95489c84ab8d1621bc03f4ea3c55dc57f25dff5a71f28edd7e012670e09`.
- `lean/Tuza06/SmallLinksOperations.lean`: `8a60a698242303388155dfefd4cb4478c641a7aaecd25d53ec7a8ebdf3661dae`.
- `lean/Tuza06/SmallLinksPatterns.lean`: `aa89ad6aeb0cb6dd12d0d518e7e57753d183082e44b89e5776da205802f573fd`.

## Formal proof spine

- `SmallLinksBase`: two graph triangles sharing an edge lie in one actual residual clique, so every cross adjacency between them is present. A missing cross edge cannot be repaired by outside attachments. Exact edge-support additivity and a joined clique decomposition show that reattaching a separated K4/K5 block preserves Good; therefore a minimal combined obstruction has no isolated such block. Blocks may share vertices and triangle-free background edges are allowed.
- `SmallLinksOperations`: a finite edge-family deletion retains the arbitrary vertex type; every lost triangle uses a deleted edge and every surviving triangle avoids every deleted edge. `minimal_balanced_removeEdges` derives exact residual equality and clique blocks from a concrete packing, complete lost-triangle cover, actual proper deletion, and minimality. `linkClosed_spoke_triangle` proves that deleting spokes only into C loses hub triangles only in the associated local core.
- `SmallLinksK3`: delete C-spokes and one rim edge A, append the hub triangle on A, and use the opposite-edge two-cover of the local K4. Balanced one/two accounting yields residual blocks. An arbitrary outside A-page plus the other hub face is a two-packing whose bases lie in an independent deleted triangle, contradicting the exact packing increment. Every rim edge is treated through the arbitrary A parameter. No outside page remains, and the K4 is excluded as an isolated triangle block.
- `SmallLinksPatterns`: symbolic edge expansions, a generic bipartition-edge cover of all triangles, and appending a displayed packing to a compatible maximum residual packing. No ambient finite graph enumeration is used.
- `SmallLinksK4`: delete C-spokes and a rim perfect matching A,M. The two hub triangles give a two-packing, and the bipartition within-edge cover has size four. For an arbitrary external A-page, choose two crossed hub triangles. Their surviving footprint consists of four edges, each meeting one of the two independent terminals in A, with at most two edges incident to either terminal. The lead's proved Footprints API gives compatible maximum residual packings. The resulting three-packing contradicts the exact two-triangle increment. Treating arbitrary A excludes all rim pages; the isolated K5 is impossible.
- `SmallLinksCross`: factors that arbitrary matching-page augmentation into a general lemma requiring only two actual crossed hub triangles and residual clique components. It has no local-clique, degree, order, or ambient attachment restriction.
- `SmallLinksFour`: one combined argument excludes the diamond and the four-cycle. This proof reorganization is described separately below.
- `SmallLinks`: UniqueEdge gives two distinct full graph triangles on each hub spoke, hence two distinct link neighbors of every C vertex. A nonempty C has at least three vertices. If |C|=3, the two-neighbor property forces a clique. If |C|=4 and it is a clique, use the K4 case. Otherwise choose a missing edge ab; each of a,b must neighbor both remaining vertices c,d, giving exactly the unified cross-four case. This classification is symbolic and exhaustive, with no finite census or asserted symmetry coverage.

## Ordinary supplement: common diamond/four-cycle proof

This is a substantive reorganization of the frozen Section 4.3/4.4 argument, rather than a change of theorem or hypotheses. It should be covered by separate final review.

Let C={a,b,c,d} be closed in the link at v, let ab be absent, and let ac,ad,bc,bd all be present. The edge cd may be present (diamond) or absent (four-cycle). Delete only the v-spokes into C and the two rim edges ac,bd. The triangles vac,vbd append to every residual packing. The four edges ac,bd,vc,vd cover every lost triangle: hub triangles must use c or d since ab is absent, and any other lost triangle uses ac or bd. Balanced two/four accounting gives residual equality blocks and nu(G)=nu(H)+2.

If an ac-page has apex outside the local core, combine it with vad,vbc. The residual footprint is ad,bc and the two old page spokes. In every residual clique, these edges form a star of size at most two because {a,c} is independent. K4-star and K5-two-edge avoidance preserves maximum residual packings, giving nu(H)+3. The bd-page case is the same explicit relabeling, also formalized without an assumed symmetry. Therefore every triangle lost on ac or bd is local.

Now vc,vd,cd cover every lost triangle. Hub triangles meet vc or vd. A rim triangle on four vertices with ab absent must contain cd; if cd is absent, such a rim triangle cannot exist. Thus the cover increment is at most three, contradicting the required four. The proof does not need to delete an extra rim edge or require a residual cover containing a retained edge in the four-cycle case. An unused cd in the displayed set does not affect the graph-edge optimum: covers can be trimmed to graph-supported edges, and no actual triangle can be hit by a nonexistent edge.

## Development and audit qualifications

Failed compiler attempts are preserved. Corrections were routine finite-set coercions, explicit insertion parameters, dependent substitutions, finite matching edge order equalities, and one inferred predicate type. A failed diagnostic compilation of the final theorem printed `sorryAx` because Lean inserted its internal recovery placeholder after an elaboration error; that was NOT an accepted proof, and no placeholder appears in the source. The subsequent successful complete compilation prints only the three permitted standard axioms. Review and reproduction must use the successful final log and exact final source hashes.

The frozen manuscript is unchanged. These Lean reorganizations and this ordinary supplement record the substantive deviation. At that historical stage the global five-degenerate obligations remained to be assessed. The final combined theorem subsequently discharged them; the four-degenerate theorem remains an auxiliary result.

