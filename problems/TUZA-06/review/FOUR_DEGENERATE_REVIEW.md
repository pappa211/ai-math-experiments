> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Independent four-degenerate theorem review

Reviewer: separate AI `review` agent, not the author of the small-link modules or the four-degenerate theorem. UTC review completed: 2026-10-30T18:40:43.368581+00:00. All source inspection, mathematics, auditing, and retained artifacts are on the external verification server.

## Verdict and exact scope

PASS: no material mathematical defect or statement weakening was found in the unified diamond/four-cycle argument, the complete small-link closure, support handling, or the full four-degenerate theorem. The theorem is a complete result for **four-degenerate graphs**. It is **not** a Lean proof of the requested five-degenerate theorem. The five-degenerate target and its remaining substantive structural obligations must remain separately marked incomplete.

The independently printed complete type is:

```text
@Tuza06.four_degenerate_combined :
  ∀ {V : Type u_1} [Fintype V] [DecidableEq V] {G : SimpleGraph V},
    Tuza06.Degenerate G 4 →
      Tuza.tau (Tuza.triangles G) ≤ 2 * Tuza.nu (Tuza.triangles G) ∧
      (Tuza.tau (Tuza.triangles G) = 2 * Tuza.nu (Tuza.triangles G) ↔
        Tuza06.ComponentCliques G)
```

Its only substantive hypothesis is four-degeneracy of the arbitrary finite simple graph. No residual induction conclusion, published local lemma, equality classification, bounded graph order, maximum-degree, coloring, planarity, or forbidden-subgraph assumption remains in its type. All triangles and actual edge extrema are used. `ComponentCliques` is the literal shared-edge component-support K4/K5 condition, independently reviewed earlier. Empty graphs, triangle-free graphs, triangle-free background edges, and blocks sharing vertices are included. K5 remains an allowed equality block, as it should for four-degenerate graphs.

## Reviewed exact source identities

| Module under lean/Tuza06 | SHA-256 |
| --- | --- |
| `FourDegenerate.lean` | `55e6c178231c0d1958db52b01c93ad609e8e124be9bdf34b3930f6f019a18eeb` |
| `Support.lean` | `69ecd45180db04192a8bc4606bd66f2ab122352520cedc3d14d1111af07b733e` |
| `SmallLinks.lean` | `fde3e17afe2a1420c87da08cca1d9fd83806f70de40f1d216be3c60548beb834` |
| `SmallLinksBase.lean` | `3d52a43fa7fd91342506949ada70e31820b5e460a4c5050a2d7d0833e95337cb` |
| `SmallLinksCross.lean` | `cb543f1423d3f7675cdbe94d7ea17c738d824bc00fc454ce916b2afc4a230e0f` |
| `SmallLinksFour.lean` | `f777892653ea172a3c292972ec587eb3ef6d145ffc64b491fae838e4ee5dc3ac` |
| `SmallLinksK3.lean` | `326b0473254705d504f9532f771a56e945590e32bb69782f163e2977621e372c` |
| `SmallLinksK4.lean` | `95b6b95489c84ab8d1621bc03f4ea3c55dc57f25dff5a71f28edd7e012670e09` |
| `SmallLinksOperations.lean` | `8a60a698242303388155dfefd4cb4478c641a7aaecd25d53ec7a8ebdf3661dae` |
| `SmallLinksPatterns.lean` | `aa89ad6aeb0cb6dd12d0d518e7e57753d183082e44b89e5776da205802f573fd` |

The scope and hashes are also retained in `FOUR_DEGENERATE_SOURCE_HASHES.json`. The earlier milestone review covers the already established component equivalence, universal equality converse, true extrema, block compatibility, minimal-obstruction accounting, and codegree-two infrastructure used here. This pass read every actual SmallLinks module and Support, rather than inferring validity from the prior ordinary proof or a PASS note.

## Independent ordinary reconstruction of the diamond/C4 reorganization

Let C={a,b,c,d} be a closed set in the link at v, with the four vertices distinct. Assume ab is absent and ac,ad,bc,bd are present; cd can be present or absent. Closure means every C vertex neighbors v and no link edge leaves C. It permits other link components at v and arbitrary outside attachments.

Delete only the four v-spokes into C and the two matching rim edges ac,bd. The two triangles vac,vbd are edge-disjoint and every one of their edges is deleted, so they append to every residual packing. The four edges ac,bd,vc,vd hit every lost triangle. A lost spoke-triangle is local by link closure, and any local hub triangle must contain c or d because ab is absent. Any other lost triangle uses ac or bd. Therefore balanced accounting in an actual minimal combined obstruction gives residual equality blocks and the exact packing relation nu(G)=nu(H)+2.

For an external ac-page with apex x outside {v,a,b,c,d}, add that page to vad,vbc. Those three triangles are edge-disjoint: the two local triangles share only v, and neither uses base ac; the page's other edges leave the local set. The surviving footprint is ad,bc,xa,xc. Since ac was deleted, {a,c} is independent in the actual residual. Every forbidden edge has one of those two terminals, and only two footprint edges are incident with either terminal. A residual clique therefore sees a star of size at most two. A K4 opposite face and a K5 two-edge-avoiding maximum packing suffice. Together with the three displayed triangles these packings give nu(H)+3, contradiction. The bd-page case uses the explicitly relabeled pair vbc,vda and is separately instantiated in the Lean proof; no unexplained symmetry reduction is used.

All triangles lost through ac or bd are consequently local. Every lost triangle at v is covered by vc or vd. Every rim triangle on C must contain both c and d: omitting c leaves only a,b,d and would require absent ab, and omitting d similarly would require ab. Hence vc,vd,cd cover every lost triangle, with at most three cover edges. If cd is absent, no such rim triangle exists; its unused two-element set in the formal cover witness can be trimmed and never helps cover a triangle. The graph-edge cover optimum is unchanged by that representation. Thus tau(G)<=tau(H)+3 contradicts the exact required four-edge increment.

This argument is valid for both the diamond and the four-cycle. It faithfully replaces the older C4 route that deleted an extra rim edge and used a residual cover containing a retained edge. The change removes a dependency; it does not change the theorem, omit external pages, or assume a nonexistent cd edge. The substantive reorganization is documented in `notes/SMALL_LINKS.md` and should be retained with the delivered manuscript change record.

## K3 and K4 link cases

The K3 link proof deletes only the component spokes and one arbitrary rim edge. It derives residual equality by a one/two reduction. An external page on that rim edge and a second local hub face have bases in a deleted independent triangle, so the existing arbitrary two-triangle augmentation provides the contradiction. The rim edge is universally quantified, excluding every external rim page. Link closure handles all triangles on local spokes. The resulting K4 is an isolated triangle-support block, and the proved `minimal_no_isolated_clique` excludes it without requiring the entire graph to be a single component.

The K4 link proof deletes only local spokes and a rim perfect matching. Its two hub triangles and the four-edge within-part cover give balanced accounting. For any external page, two crossed local hub triangles produce a three-packing. Their surviving footprint has one of the deleted base endpoints on every edge and at most two edges per endpoint. The proved Footprints API supplies a compatible maximum residual packing. Therefore every rim page is excluded, and the local K5 is excluded by the actual isolated-block reattachment theorem. Arbitrary outside vertices and other link components are retained throughout.

## Exhaustive small-link closure

`minimal_link_two_neighbors` uses two distinct FULL graph triangles on each actual spoke va, proved by the actual minimal-obstruction edge-codegree result. Their distinct third vertices are both in C by link closure. Thus every C vertex has two distinct link neighbors, and every nonempty closed link set has at least three vertices.

For cardinality three, the two-neighbor property forces a clique and the K3 case applies. For cardinality four, either C is a clique and the K4 case applies, or choose a genuinely absent edge ab. Each of a,b has two neighbors among the two remaining vertices c,d, so every cross edge ac,ad,bc,bd is present. This is exactly the unified diamond/C4 case, irrespective of cd. These cases exhaust all possibilities symbolically; no unverified finite graph census or hidden coverage assertion is used.

The result `minimal_closed_link_size` therefore proves at least five vertices for every nonempty LinkClosed set. Since each actual link component is closed, this implies the ordinary robustness conclusion. The formal statement is stronger in allowing unions of components, and does not confuse link components with triangle edge-components.

## Isolated ambient vertices and the final global theorem

`triangleVertices G` is the union of vertices of all graph triangles. In an actual MinimalObstruction it is nonempty, because otherwise Good follows immediately. Every actual graph edge lies in a triangle, so every graph neighbor is supported. Thus `minimal_neighbors_supported` and `minimal_support_degree_eq` prove that degrees inside triangleVertices equal full graph degrees, while retaining possible isolated vertices in the ambient type.

`full_link_closed` proves the entire graph neighbor set at a supported vertex is closed in its link. The already proved support degree at least three makes that set nonempty, and `minimal_closed_link_size` raises the full degree to at least five. The degree equality transfers this to the supported set. No false assertion that all ambient vertices have positive degree is used.

For a four-degenerate graph G failing Good, `exists_minimal_obstruction` gives an actual minimal bad subgraph H. Degeneracy monotonicity preserves four-degeneracy. Apply it to the nonempty supported set of H to get a supported vertex of degree at most four there, contradicting the proved lower bound five. Hence G is Good, and the already proved universal converse reconstructs the full component equality biconditional. This closes a genuine global theorem with all induction obligations discharged.

## Independent import-only type/axiom audit

The reviewer created `lean/Review/FourDegenerateAudit.lean` and compiled it through `python3 build_serial.py Review.FourDegenerateAudit`, using the shared fcntl lock and existing single-job/memory limits. The successful log is `logs/compile-183929-Review.FourDegenerateAudit.log`; exit status is zero.

Thirteen key declarations, including the full combined theorem, its two projections, the closed-link size theorem, unified cross-four exclusion, K3/K4 exclusions, exact balanced deletion, arbitrary crossed-page augmentation, and isolated-block reattachment/exclusion, have independently printed complete types and transitive-axiom reports. Every axiom set contains only `propext`, `Classical.choice`, and `Quot.sound`. No explicit or implicit mathematical hypothesis was omitted in the reported full theorem type. All ten reviewed module hashes were rechecked unchanged after the audit. Machine-readable results are in `FOUR_DEGENERATE_AUDIT_RESULT.json`.

This audit imports the compiled development project and reuses pinned compiled Mathlib dependencies. It is not a clean project reproduction or independent serial kernel replay; those remain separate final acceptance work. The successful exact-type/axiom result does not cover future source edits automatically. Failed development logs containing Lean recovery placeholders are not evidence for a completed proof; the accepted successful closure has no such axiom.
