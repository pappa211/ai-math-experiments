> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Combined CS for graphs admitting a tree-and-triangle cover

Status: ORDINARY_PROOF_CANDIDATE_USING_DECLARED_CLASS_LOCAL_INPUTS, frozen for fresh adversarial review. Challenger closure, independently reconstructed by the coordinator before freeze, 2026-11-16 UTC. This is a complete theorem for the stated hereditary class, not unrestricted Tuza or unrestricted CS.

## Theorem

Let G be any finite simple graph admitting an actual triangle-edge cover C whose nonempty connected components are trees or literal triangles. The cover need not be minimum. Then

    tau(G) <= 2nu(G),

with equality exactly when every nonempty shared-edge triangle component has literal K4 or K5 edge support (the property B(G)). Triangle-free background edges and vertex sharing between triangle components are permitted, subject to every actual triangle.

Equivalently, combined CS holds throughout the class H of graphs admitting ANY cover of this shape. No statement is made that every graph belongs to H.

## 1. Hereditary minimality and the accepted equality normalization

The class H is hereditary under edge deletion: restrict C to the surviving edges. Each tree splits into forests, and a partly deleted triangle becomes a path, edge or isolates. Every surviving triangle is still hit. Vertex deletion follows as a special case.

The ordinary inequality throughout H is already proved in challenger_tree_triangle_cover_tuza_v2.md, with the stronger assigned-family estimate tau(G)<=sum_i tau(F_i)<=2nu(G). Suppose CS fails in H and choose a failure G with the fewest edges, discarding isolates. It is tight, because the inequality holds in H, and every proper edge-subgraph belongs to H and satisfies CS.

We use the authenticated class-local M0/codegree/robustness and clique facts: every actual edge of G has triangle codegree at least two; every closed link component has minimum degree at least two and at least five vertices; and a genuine balanced packing/cover deletion has a literal B residual. The scope is the same already audited in forest_triangle_cover_cs_v1.md and pinned sources/public/papers/tuza-five-degenerate/main.md Sections1--4. No five-degeneracy assumption is imported.

Fix any selected cover C of the required shape. The separately frozen equality normalization gives:

    Every triangle component T of C has exactly two full private apices x,y,
    no other private pages, and xy is an edge of a TREE component of C.      (N)

Here the inputs are challenger_mixed_cover_q3_strictness_v1.md, challenger_tight_mixed_cover_q2_k5_v1.md, and challenger_mixed_cover_low_cost_triangle_exclusion_v1.md. Briefly, local cover costs add under equality; q3 cores are strict; q2 cores normalize to a literal K5 on a selected tree edge; a cost-two family with two private pages is strict; and its remaining one-full-apex K4 has an entire star boundary and peels by proper-subgraph CS. These are actual local-family statements, not an assertion that C itself is minimum.

The rest of the proof closes the remaining outside-boundary obligation without assuming those K5 patches are individually isolated.

## 2. A full triangular component in an apex forest/triangle link is impossible

We first prove a local lemma independently of the chosen cover C.

Let L be a closed connected link component at hub v in a class-minimum CS failure. Suppose w is a vertex of L and every component of F=L-w is either a tree or a literal K3. Suppose some triangle component T=abc of F has ALL THREE edges wa,wb,wc. Then this configuration is impossible.

Because delta(L)>=2, F has no isolated vertex: an isolate would have at most its one edge to w in L. For a tree component J, write r_J for its maximum matching number. For ANY maximum matching M_J, the forest J-M_J has vertex cover at most r_J by the elementary forest matching-cover equality. If J is perfectly matchable, it has2r_J vertices and at most2r_J-1 edges, so after deleting its r_J matching edges it has at most r_J-1 edges and hence a cover of size at most r_J-1. A triangle component has matching number1 and its matching complement is P3, with cover number1.

We also use the ordinary forest fact that every nonperfect tree of order at least two has a maximum matching exposing an ORIGINAL leaf. One proof starts at an unmatched vertex and follows alternating paths. Every reached odd-distance vertex is matched, or there is an augmentation; every reached even-distance nonleaf has a forward nonmatching edge. Finiteness and absence of cycles terminate a branch at an even-distance original leaf, which can be exposed by flipping that path. If the starting vertex is already a leaf the fact is immediate. This requires no condition on the outside graph.

Let r=sum_J r_J over all components of F, with r_J=1 for a triangle. Choose a maximum matching M of F componentwise.

**Case A: another component of F is a perfectly matchable tree.** Choose a vertex cover Q0 of F-M componentwise, using the strict r_J-1 saving in that component. Thus |Q0|<=r-1. Let P=M and Q={w} union Q0. Then P is an r-matching of L, Q covers L-P, and |Q|<=r.

**Case B: another component of F is a nonperfect tree or a triangle.** In the nonperfect tree choose an original leaf z exposed by a maximum matching. Its degree in F is one, so delta(L)>=2 forces wz to be present. For another triangle component, connectedness of L forces it to have a w-neighbor z, and a maximum matching of that triangle can expose any chosen vertex. In either case choose M exposing z in this OTHER component. Let P=M union {wz}. A componentwise cover Q0 of F-M has size at most r, so Q={w} union Q0 covers L-P and satisfies |Q|<=r+1=|P|.

In either case, delete all hub-v spokes to L together with P to obtain K. The |P| hub triangles on P are edge-disjoint and use only deleted edges. The actual edges P together with the v-spokes to Q cover every lost triangle: closedness handles hub-spoke triangles, while all outside pages on a removed rim edge are met by that rim edge. If the cover cost is strict, minimum-CS accounting already contradicts tightness. Otherwise K is a B graph by proper-subgraph CS and equality throughout the balanced accounting.

But P removes exactly ONE edge of the distinguished triangle T and removes NONE of wa,wb,wc. In CaseA it uses no w-edge; in CaseB its only w-edge goes to the other component. Thus the actual induced graph of K on {w,a,b,c} is a diamond: K4 with that one T edge missing. Its two triangles share an edge, so in a B graph they must belong to one literal clique triangle component, which would force the missing T edge to be present. This is impossible.

These cases cover every possibility in which F has a component besides T: an additional tree is perfect or nonperfect, and any additional triangle is CaseB. If F consists solely of T, then L is the literal K4 on w,a,b,c, contrary to the authenticated lower bound of five vertices per closed link component. This proves the local lemma.

The proof includes arbitrary outside triangles. It is a residual-diamond contradiction, not an assumption that a WKE tuple alone settles equality.

## 3. A leaf of the selected cover closes the class argument

The cover C is nonempty because a CS failure has triangles. If C had no tree component, every nonempty component would be a triangle, contradicting (N), which requires the two apices of each such component to be joined by an edge of a TREE component. Thus C has a nontrivial tree component.

Choose a leaf v of that tree and write vw for its unique incident selected edge. Let L be the closed link component at v containing w. It exists because vw is an actual edge, and the codegree condition makes w nonisolated in the link.

For any edge ab of L-w, the actual triangle vab cannot be hit by va or vb in C, since v has only the selected neighbor w. Hence ab belongs to C. Therefore F=L-w is a subgraph of the selected cover. Its components are forests or triangles. Any triangle component of F is exactly a triangle component T of C: its three selected edges already exhaust the selected component, so it has no selected connection to another F vertex.

If such a T occurs, v is a full apex of T. By (N), its other full apex x is joined to v by a selected TREE edge vx. The unique selected edge at v is vw, so x=w. Thus w is adjacent to all three vertices of T, and Section2 excludes L.

Consequently F has no triangle component and is a forest. The already accepted ordinary apex-forest link exclusion now applies: apex_forest_perfect_link_exclusion_v2.md if F has a perfect matching, and apex_forest_nonperfect_branch_v2.md otherwise. Both are class-local and audit all actual triangles and residual footprints; they exclude this closed link component.

Every possibility contradicts the existence of the minimum CS failure G. Hence CS holds throughout H. QED.

## 4. Equality and exact scope

Combined CS supplies B(G) at equality. Conversely, for any graph in H whose actual shared-edge triangle components are literal K4/K5, the elementary block values and additivity over disjoint triangle edge supports give tau=2nu. The triangle-free case gives equality0=0 with empty triangle support.

Unlike the forest-only class, H can contain K5: a triangle plus the disjoint edge on its complementary two vertices is a cover of the permitted shape. No K5 exclusion is claimed here. The theorem neither requires such equality blocks to be vertex-disjoint nor infers that arbitrary gluing creates no crossing triangles; B refers to ALL actual triangles.

This resolves the equality classification inside the hereditary ANY tree/triangle-cover class. It does not prove that every graph admits a cover of this shape. The broader minimum-CS object may have cover components with longer cycles or more complicated structure. Those availability questions, unrestricted CS, original H-D, and unrestricted Tuza remain separate.

## 5. Dependencies and review boundary

New local Section2 is elementary matching/cover reasoning plus authenticated class-local balanced accounting and robustness. The final apex-forest step uses the accepted self-contained v2 proofs. Equality normalization uses the separately frozen ordinary mixed-cover results listed in Section1, with the K4 star-peeling input at its precise proper-subgraph scope.

No new finite census, solver verdict, Gallai--Edmonds theorem, Konig theorem beyond the elementary forest proof, Kotzig theorem, four-branch certificate, or unpublished outside-attachment assumption enters this theorem. All source dependencies are current workspace notes and the pinned authenticated class-local Sections1--4. Fresh review should reconstruct the full-triangle link lemma, the exact selected-leaf implication x=w, and hereditary minimality independently before adoption.
