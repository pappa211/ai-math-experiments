> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: named active-core matching reconstruction

**PASS for the complete conditional reconstruction theorem and its minimum-Q application.** Reviewed `notes/mixed_named_matching_reconstruction_frozen.md`, SHA-256 `916d639d5951a2fa3a0913a52b63285295750975d937b90d550b57e7195f688e`. This closes the identified zero-gain matching leaf configuration when the smaller active support is named. It does not prove a leaf exists or that an arbitrary predecessor is K4-completed.

## Structural properties and confinement

Every one of C12 has a universal support vertex: the star center in the central-K4 models, a shared endpoint in the two-K5 model, the wheel hub, or a degree-four vertex in K5-e. Hence an extra edge between two support vertices would itself be triangular, using the hub unless one endpoint is that hub. Such an edge cannot be background. The induced graph on the support vertices is exactly the named support.

These supports are induced-C4-free. Fresh edge-glued clique graphs have a perfect elimination order obtained by removing the fresh vertices of the last piece and repeating, hence are chordal. K5-e is chordal directly. In W5 every cycle through the hub has a chord, while any four rim vertices fail to induce a cycle.

For an external-apex restored matching page, a completing K4 cannot contain both opposite matching edges: their four endpoints already exhaust A. The surviving diamond is entirely in R and all its edges are triangular. With only the active support D remaining, that diamond lies in D. Both endpoints and the old spokes of every external page are therefore inside D. This excludes every otherwise possible page involving background-only vertices or old background edges.

## All support-intersection cases

Let I=A intersect V(D). If |I|<=1, no central A edge lies in D, and no external matching page exists because such a page requires both endpoints of a matching edge in D. The old D family and the new K5 family then share no graph edge, contradicting connected H triangle support.

If |I|=4, all four present A-crossedges belong to D by the universal-vertex argument, while the opposite matching edges remain absent. They induce a C4, contradiction.

For |I|=2, there are two genuinely different cases, both handled in the frozen proof. If I is a crossedge f, neither matching edge has both endpoints in D, so there are no external pages. The exact triangle families compare D plus K4[A] with D plus K5[A+x], with sole common edge f. Each added clique has a maximum packing avoiding f, giving exact contributions one and two regardless of whether an old optimum uses f.

If I is a restored matching pair e, replace the old side by L=D+e. Confinement and the absence of background between support vertices show that every external page is exactly a page inside L. The other matching edge has no external page. The same edge-interface comparison now applies to L, with common edge e. No resilience, tightness, or defect assumption on L is needed.

For |I|=3, the unique matching edge e internal to I completes I to a literal triangle in L=D+e. The fourth A vertex lies outside D and, by confinement, belongs to J triangles only in the central A faces. The exact families are therefore a K4-on-triangle and a K5-on-triangle over the same L. For p0=nu(L) and b=max_f nu(L-f), their packing values are max(p0,1+b) and max(p0+1,2+b). The second is exactly the first plus one. Extra background creates no omitted triangle by the preceding confinement argument.

Every possible case thus contradicts zero gain or gives the exact gain nu(H)=nu(J)+1. The argument is about actual triangle families, not an assumed fresh graph gluing in the presence of background.

## Tight pieces and retained completions

When R also contains tight components, the independently reviewed single-edge-boundary removal applies. Each removed clique has a maximum packing avoiding its whole retained boundary, so the same exact packing partition works before and after adding x:

    nu(J)=r+nu(J'),  nu(H)=r+nu(H').

Thus zero gain passes to J',H'. Their old residual R'=J'-M has exactly D as triangle support; boundary edges of removed pieces may now be background and remain present. H' stays triangle-connected and retains the full K5 on A+x.

The claimed preservation of every J' triangle's K4 completion is valid and essential. For an old D triangle, an original completing K4 uses either zero matching edges, in which case it lies wholly in D, or one, in which case its surviving diamond lies in D. It cannot use both matching edges, since then its vertex set is A and every face contains a matching edge, whereas the triangle being completed survived in R. All relevant edges are therefore retained. External restored pages have their retained D diamonds. Central restored pages are completed by A, whose crossedges are retained boundaries or untouched edges and whose matching edges remain present. These cases exhaust actual J' triangles.

Accordingly the one-active-support theorem applies after peeling, and gives packing gain one, contradicting passed zero gain. No assertion that the removed tight pieces have fresh private vertices is required.

## Defect-three premise and legitimate minimum-state use

For a defect-one zero-gain K5-on-K4 leaf, the cover increment is between zero and two, so the predecessor defect is one, two, or three. Every A edge is critical, and every opposite pair lowers packing by two because its two new x-triangles append to any avoiding packing. If the predecessor defect were one, K4-completion plus proper-CS would force resilience, contradiction. If it were two, deleting one matching edge would give a resilient graph, yet deleting the opposite edge next lowers packing again, contradiction. Thus defect three follows under the explicitly retained K4-completion/proper-CS hypotheses.

The resulting matching residual has one smaller connected resilient defect-one support D. Proper-CS only identifies the other defect-zero components as B. D is named only when the separate wider minimum-Q choice applies: D is an actual proper edge-subgraph inside the fixed G, has strictly fewer supported edges, and satisfies every predicate in that chosen class. No ordinary CS inference classifies D at defect one.

With this legitimate naming step, the theorem excludes the identified zero-gain leaf in Q. It does not establish the local leaf, predecessor K4-completion, frozen-F membership, a degree bound, or an unrestricted classification. Triangle extension and an actual missing-triangle parent are not used or inherited. The remaining obstacle is configuration availability or another proved reduction for the unknown core.

No mathematical discrepancy remains in this frozen theorem. This is ordinary independent in-session reconstruction, not Lean verification or an unrestricted solution.
