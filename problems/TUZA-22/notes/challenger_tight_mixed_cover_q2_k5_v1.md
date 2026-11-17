> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Tight mixed covers force every two-apex triangle into a literal K5

Status: ORDINARY_PROOF_CANDIDATE, frozen for fresh review. Challenger, 2026-11-16 UTC. This is a necessary equality restriction in the hereditary class admitting a tree/triangle cover. It does not prove that the resulting K5 patches have isolated triangle support.

## Statement

Let G admit an actual triangle cover C whose connected components are trees or literal triangles, and suppose tau(G)=2nu(G). Then every triangle component with assigned-family cover number3 has exactly two full apices v,x, and vx is a selected edge of a TREE component of C. Consequently that core together with its two full apices is a literal K5.

The q3 exclusion is supplied by challenger_mixed_cover_q3_strictness_v1.md. The new content below is the actual adjacency and selected-tree-edge conclusion. Neither C nor its restriction to a family is assumed minimum initially.

## 1. Equality makes local cover costs additive

For the assigned families F_i write tau_i for their ordinary edge-cover numbers and c=sum_i tau_i. The accepted arbitrary-cover theorem gives

    tau(G) <= c <= 2nu(G).

Under equality, both inequalities are equalities. Therefore arbitrary choices of minimum local covers from distinct families cannot share a graph edge: their union would cover G with fewer than c edges.

There is a stronger deletion consequence. If D_j is ANY minimum cover of family F_j and i differs from j, then deleting all triangles of F_i that use an edge of D_j does not reduce its cover number. Otherwise D_j, a smaller cover of that residual i-family, and minimum covers of all other families would cover G with fewer than c edges. In symbols,

    tau(F_i after deleting D_j edges) = tau_i.             (1)

This statement concerns triangle families and their actual edge sets; it makes no assumption that a family is an induced graph.

## 2. There are no mutual q2 targets in equality

For a q2 core T=abc with full apices v,x, the following are minimum local covers of size3:

    {ab,bc,ca}, and {bc,av,ax}, {ac,bv,bx}, {ab,cv,cx}.

Each listed set covers T and all six private pages. Thus every private spoke belongs to some minimum local cover.

If two q2 cores had reciprocal full-apex targets, their corresponding shared cross edge would be a private spoke of both families. It could be selected in minimum local covers of both, contradicting Section1. Hence the q2 potential mutual-target graph J is EDGELESS in equality. This is stronger than merely excluding its cycle components.

By the q3 strictness lemma there are no q3 cores. Low-cost triangle families use their internal triangles in the compatibility construction. A family of cost1 would create a strict weight surplus, so a nonempty triangle family in equality has cost2 or3, although the argument below only needs its chosen internal triangle when its cost is at most2.

## 3. Delete one same-terminal pair of q2 spokes at no local cost

Fix a q2 core T=abc with full apices v,x, and use its minimum cover

    D_a={bc,av,ax}.

For each OTHER tree family, delete all triangles using D_a and apply the forest anchor plus external-family minmax to the residual family. Its cover cost remains tau_i by (1), and its selected tree bases are unchanged: av,ax are cross edges and bc belongs to the distinct component T. We obtain a local weighted packing of weight at least tau_i, avoiding av and ax.

Each other low-cost triangle family retains its internal triangle, which is disjoint from D_a because cover-core vertex sets are disjoint. Other q2 families are unaffected by deleting D_a: bc cannot be an edge of their family, and if av or ax were their private spoke there would be a reciprocal q2 target, already excluded. Keep any two-page choices there.

Thus we have new supplied packings meeting the same local cost targets and avoiding av,ax everywhere outside T. The coherent averaging construction still applies. Since J is edgeless, each q2 core has its own independent fair sign; changing T's sign affects only actual conflict components incident with T. As before, every outcome must have exactly nu(G) triangles: its expectation is at least c/2=nu(G), while no actual packing can exceed nu(G).

Only TREE-family external pages can conflict with a T-page. Other low-cost triangle choices are internal, other q2 cores have no mutual target, and q3 cores are absent.

## 4. Four spoke usages and all possible page choices

Among the other supplied packings, let b_v,c_v,b_x,c_x indicate whether the actual edges vb,vc,xb,xc respectively are used. Each indicator is zero or one. Indeed a cross edge joining T to another cover core can occur only in that other assigned family, whose supplied triangles are edge-disjoint. If v or x lies outside every other cover core, the corresponding indicators are zero.

First choose T-pages vab and xac. Their a-spokes are avoided by every other family, so their only possible conflicts use vb and xc. These conflicts, if both present, involve DISTINCT outside triangles because an outside triangle has only one apex in T, here b versus c. There are no further cross conflicts at those outside triangles with T. Hence changing T's sign compares retaining its two pages with retaining those b_v+c_x outside triangles and adding the internal T. Equality of all outcomes forces

    b_v+c_x = 1.                                         (2)

Similarly, using T-pages vac and xab gives

    c_v+b_x = 1.                                         (3)

Together these equations say exactly two of the four spoke indicators are1. Their positions have one of four types: both at v, both at x, both at terminal b, or both at terminal c.

If both are at v, choose the T-pages vbc and xab. The first conflicts with two distinct outside triangles, one with apex b and one with apex c; the second has no conflict. Changing T's sign therefore compares two T-pages with two outside triangles plus internal T, of sizes2 and3. This contradicts equality. The case with both at x is symmetric.

Suppose both are at terminal b. Choose T-pages vab and xbc, which are disjoint because their bases ab and bc differ and their apices v,x differ. If vb and xb occur in two DIFFERENT outside triangles, changing T's sign again compares2 with3, contradiction. Therefore both spokes belong to ONE outside triangle, necessarily vxb. The case with both at c similarly forces a single outside triangle vxc.

All sign comparisons refer to the whole affected conflict components. In the last case a common outside triangle gives a three-vertex path with the two T-pages on one side; this is exactly the configuration for which retaining the other side plus internal T still has size2. If the outside triangles are distinct, they are in two separate affected components, giving size3 instead. No uncounted conflict with another family is possible because each external-conflict component has a fixed pair of cover families.

Thus some supplied TREE-family external triangle has base vx and apex b or c. In particular vx is an actual graph edge. More fundamentally, every actual triangle vxa with a in T must meet the selected cover C; its two spokes are cross edges between distinct cover components or outside vertices, so they are unselected. Hence vx belongs to C. The selected external triangle above belongs to a TREE family, so this selected edge is in a tree component, not another triangle component.

Together with the six full-apex spokes and the three T edges, vx completes a literal K5. QED.

## Remaining equality obligation

The K5 conclusion does not isolate its triangle support. A spoke va may still lie in an outside triangle vaz whose selected base vz belongs to the same tree component as vx. The theorem does not show those outside pages absent, nor that the entire K5 outside boundary is avoidable by a maximum patch packing. Larger tree components may connect several such configurations, and cost-two triangle families remain to be classified.

Accordingly this is an equality-normalization advance, not a full CS theorem for the hereditary class and not an unrestricted result. It uses the accepted forest anchor/external minmax, arbitrary-cover inequality, and q3 strictness. All arguments are ordinary actual-edge cover replacements and finite sign comparisons; no computation or external theorem is a premise.
