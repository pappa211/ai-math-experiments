> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# One-edge active-kernel peeling and residual connectedness

Status: ordinary proof candidate. This is the one-edge counterpart of `active_kernel_peeling_v1.md`, with a smaller footprint bound. No equality classification of a defect-one component is assumed.

## General peeling theorem

Let H be a finite simple graph, let uv be absent in H, and set G=H+uv. Select any collection B0 of actual shared-edge triangle components of H whose edge supports are literal K4 or K5. Let m be the sum of their packing numbers. Let J denote the union of the edge supports of all other old triangle components. Write N for the entire family of new triangles uvx, and let A be the graph whose edge set is E(J) together with every edge of every triangle in N. Isolated vertices are irrelevant.

Each selected clique block meets the entire new family in at most one edge. Indeed, neither block can contain both u and v. Any new edge in the block is therefore a spoke at one fixed terminal, say u. If distinct spokes ux,uy occurred, then x,y,u lie in the clique and vx,vy also exist in H. The actual old triangle vxy shares the block edge xy and hence lies in that same old triangle component. The literal clique support would therefore contain v and the edge uv, a contradiction.

The actual triangles of A are exactly the old J triangles and the new triangles N. To check this without an induced-subgraph assumption: each actual A triangle is an actual G triangle, and an old G triangle belongs either to J or a selected block. A selected block contributes at most one edge to A, since distinct old component supports are edge-disjoint. It therefore contributes no triangle to A. Conversely all J and N triangles were included explicitly.

A maximum packing in each selected block can avoid its at-most-one edge in A. Thus those block packings combine with any packing of A. The opposite bound follows by assigning each G packing triangle either to its selected old block or to A. Hence

    nu(G)=m+nu(A).

Covers combine to give

    tau(G)<=2m+tau(A).

If A satisfies combined CS, these formulas prove Tuza's inequality for G. If G is tight, both inequalities force A tight, so B(A). If some selected block and A share an edge e, each has a minimum cover containing e: in a literal K4 choose its opposite partner; in K5 choose the 2+3 partition whose two-part is e. The component additivity of B(A) supplies such a minimum cover of A too. Combining these covers saves one shared edge and yields tau(G)<=2nu(G)-1, a contradiction. Therefore their triangle supports are disjoint. All actual triangles have already been accounted for, so the selected blocks and the B(A) blocks constitute B(G).

Consequently CS(A) implies CS(G), with arbitrary old J and arbitrary outside attachments.

## Minimum-CS consequence

Let G be a minimum-edge failure of combined CS, and k=nu(G). The established M0 identities give, for every edge e,

    nu(G-e)=k,    tau(G-e)=2k-1.

Proper-subgraph CS applies to every triangle component of H=G-e. Component additivity shows that the nonnegative integer defects 2nu-tau sum to one. Thus exactly one nonempty component has defect one, and every other nonempty component is tight and hence a literal K4/K5 component.

If any such tight component existed, select all of them in B0 and form the active graph A above. A omits all but at most one edge from every selected block and is therefore a proper edge-subgraph of G. Minimality supplies CS(A); the peeling theorem supplies CS(G), contradiction.

Therefore, for EVERY edge e, G-e has exactly one nonempty shared-edge triangle component, of defect one. Triangle-free background edges may be present. This says nothing about the internal classification of that remaining component.

Together with `active_kernel_peeling_v1.md`, both single-edge and whole-triangle residuals of a minimum CS failure have connected nonempty triangle support and defect one (their packing numbers differ as already recorded).

Dependencies: M0 and proper-subgraph combined CS; elementary K4/K5 packing avoidance and minimum covers; all-page footprint argument. The existing SEP theorem separately excludes suitable one-edge separations, so no novelty attribution is made for elementary separator consequences.
