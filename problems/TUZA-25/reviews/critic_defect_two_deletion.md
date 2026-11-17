> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: critical-edge deletion at defect two

**PASS, including the connected-support strengthening.** Reviewed the final supplied version of `notes/mixed_critical_edge_addendum_frozen.md`, SHA-256 `69e52ea56e9d58c9217f6016b4871bf6a503dcf9a17326c05b1b2661206a6017`. This is an ordinary conditional theorem using proper-subgraph CS. It is not a proof of CS, a proof of the broad rigidity conjecture, or a claim of historical novelty.

## First deletion

Put p=nu(J). A critical edge e lowers the packing number exactly by one, because deleting one graph edge removes at most one member of any edge-disjoint packing. For R=J-e, restricting and extending covers give tau(R) between 2p-3 and 2p-2. If it has the larger value, CS on R makes R tight B.

The critical edge e lies in a triangle of J, and the K4-completion hypothesis supplies a literal K4 containing it. After deleting e, the two remaining K4 triangles share an edge and belong to one R triangle component. That component contains all four old K4 vertices. A literal K4/K5 support containing both endpoints of e must contain their edge, contradicting its deletion. Therefore tau(R)=2p-3, exactly defect one at nu(R)=p-1.

## Why a second critical deletion is impossible

Suppose f is critical in R and put L=J-{e,f}. Then nu(L)=p-2. Cover extension from L to R gives tau(L)>=2p-4, and proper-subgraph CS supplies the reverse inequality and B(L). Also nu(J-f)<=nu(L)+1=p-1, while single-edge deletion gives nu(J-f)>=p-1. Thus f is critical in J too.

Any literal J-K4 containing e must contain f: otherwise its K4-e diamond survives in L and forces the absent edge e into a literal B component, exactly as in the first-deletion argument. The symmetric assertion holds for K4s containing f. Every triangle lost between J and L contains at least one of these two edges; its K4 completion therefore contains both.

For disjoint e,f, the four endpoints uniquely determine that K4. For adjacent edges e=uv,f=uw, any such K4 has vertices u,v,w,x. If two fourth vertices x,y occur, the old triangles vwx and vwy remain in L and share vw. Their literal B component contains v,w,x,y and therefore contains xy. The old edges ux,uy also remain, so uxy is an actual L triangle sharing xy with that component. It puts u in the same component as v, forcing the absent uv. Contradiction. Thus in this case too there is only one possible common K4.

Consequently every triangle lost on deleting {e,f} lies in one literal K4. Any edge-disjoint triangle packing uses at most one triangle from a K4, so a J packing has at most nu(L)+1=p-1 members. This contradicts nu(J)=p. No f can be critical in R, establishing one-edge resilience. The argument counts all actual triangles; it does not assume the two critical edges were adjacent or that a chosen completion was unique before the B argument.

## Components and conditional connectivity

Every actual shared-edge triangle component of R has its own actual support graph; these supports share no edges, so both optimum parameters add. Each support is a proper subgraph of J and satisfies the stated CS premise. Their nonnegative integer defects sum to one. Exactly one component has defect one, and every other nonempty component is tight and therefore one literal K4 or K5. Global resilience forces componentwise resilience by the same additive parameter identities.

The extra connected-support conclusion is also valid. Every originally triangular edge other than e remains triangular after deletion: choose a K4 containing it; that clique either survives unchanged or becomes a K4-e diamond, all five of whose remaining edges are triangular. Thus if every J edge was triangular, every R edge is triangular.

For every removed e-page, choose a completing K4. Its surviving diamond belongs to a single R component containing both endpoints of e. That component cannot be one of the tight literal cliques, since it would contain the missing edge. Hence it belongs to the unique defect-one component. Both old spokes of every restored e-page lie in that same component. A different R component could not join it when e and all its pages are restored, because none of those new triangles shares an old edge with the different component. It would remain a separate J triangle component. Connected triangle support of J rules this out, proving connected support of R.

This uses neither ordinary vertex connectivity nor an unproved triangle-extension property. Background edges remain present and are irrelevant only to the current triangle-component accounting; they are not declared disposable for future restoration.

## Exact consequence and limitation

For a K4-completed defect-two predecessor with a wholly critical separator triangle, each of the three edge deletions reaches a strictly smaller resilient defect-one graph. If the predecessor has connected triangle support, each resulting residual does too; if it is fully triangle-supported, so are they. This reaches the broad frozen rigidity domain under the explicit proper-CS premise.

It does not show that a wholly critical triangle is impossible. A next proof must reconstruct the predecessor simultaneously from these deletions and use their compatibility, or supply a valid replacement. A classification of only one deletion, without that reconstruction, does not close the branch. No every-triangle-extends property, two-edge resilience, three-vertex connectivity, or specified minimum-CS restored-triangle parent is inherited by this theorem. Those distinctions are essential when connecting the result back to the narrower primary residual profile.

No unresolved mathematical discrepancy remains in the reviewed proof. No solver, finite census, external matching theorem, or new Lean execution was used in this reconstruction.
