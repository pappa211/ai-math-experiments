> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Common-center cube: three full-apex families with opposite-base extras are paid

Status: ordinary proof candidate, for independent review. This completes one concrete family combination in the existing common-center cube; it does not classify the other combinations or force a tight triple residual.

## Exact interface and canonical cover

Let B be literal tight, nu(B)=m,tau(B)=2m, and restore abc,ade,afg on seven distinct core vertices. Assume the actual-parent cube responses: each single restoration has (m+2,2m+2), each pair has (m+3,2m+5), and X=B+abc+ade+afg has target (m+4,2m+8).

Suppose all three complete individual families have form B of apex_actual_parent_q2_family_frontier_v1.md, and their extra pages lie on the opposite bases bc,de,fg respectively. Write p,q,r for their full apices. For the first family, all pages on ab and ac have apex p, while bc has the p-page and at least one other page. The analogous descriptions hold for q and r.

The three canonical individual covers are

    {bc,ap}, {de,aq}, {fg,ar}.                     (1)

Each old edge ap,aq,ar is background in B. Otherwise an old minimum cover through it, plus its opposite base, would cover its whole individual family at incremental cost one, contradicting single cover gain two.

All full apices lie outside the seven core vertices, since their required a-spokes to another core leaf would be absent restored edges. Distinct full apices are nonadjacent: an old edge pq would form the old triangle apq through background ap.

If p differs from q, then p is not adjacent in B to d or e. For example dp together with ap would give an ordinary ad-page at p, whereas this family's complete description permits only apex q on ad. Similarly a full apex is nonadjacent to every leaf of a family with a different full apex.

As in the preceding common-center discriminator, the only mixed triangles are aij on old cross rims between different opposite pairs. Write J for their complete old rim graph. Arbitrary outside pages are already covered by (1), and all old triangles by a minimum B cover.

## 1. Three distinct full apices

Choose any old minimum cover F and add (1), at most six edges. If the unhit mixed rim graph has matching number at most one, it is triangle-free (it avoids F), hence a star or empty. One further a-spoke gives a cover of size at most 2m+7, contradiction. Thus take two vertex-disjoint unhit mixed rims ij,kl.

Use the five actual triangles

    bcp, deq, fgr, aij, akl.                      (2)

They are edge-disjoint. The first three have distinct opposite bases and outside apices; the last two use disjoint leaf pairs, and their rims are cross edges, not opposite bases. Their a-spokes cannot occur in the first three pages.

The whole old footprint of (2) has at most one edge in every old B component. Indeed, an old clique containing a full apex can contain leaves only from that apex's own pair, and at most one of those leaves because the opposite base is absent. It cannot contain another full apex. Such a clique therefore sees at most one page spoke and no cross rim. A clique containing no full apex sees only the matching rims; it cannot contain two disjoint rims, since it contains at most three core leaves (one per opposite pair). Thus every old component can retain a maximum packing avoiding its one footprint edge. Appending (2) yields m+5, contradiction.

## 2. All three full apices equal

If p=q=r, the union of (1) has only four edges, {bc,de,fg,ap}. After adding any old minimum cover F, the remaining mixed rim graph is triangle-free on six vertices. Every triangle-free graph on six vertices has an independent set of size at least three: at a vertex with three neighbors, those neighbors are independent; otherwise take three nonneighbors, among which a nonadjacent pair exists, and add the chosen vertex. Thus its vertex cover has size at most three.

Add the at most three a-spokes corresponding to that vertex cover. This hits all remaining mixed triangles and gives a full cover of size at most 2m+4+3=2m+7, contradiction.

## 3. Exactly two full apices equal

After permuting the pairs, suppose p=q and r differs from p. The union of (1) has five edges, {bc,de,fg,ap,ar}. The old cross graph J12 between {b,c} and {d,e} is a matching. For if bd and be were both old, the old triangles bdp and bep would share bp and force d,e into one literal old clique, contradicting missing de. The other adjacent-edge cases are symmetric.

Distinct edges of J12 lie in distinct old triangle components. Each lies in an old triangle with p. A common old clique containing two disjoint such rims would contain all four leaves b,c,d,e and force missing bc,de. Choose a minimum B cover F containing every J12 edge, independently in those components; every single K4/K5 edge is eligible. This costs no extra edge.

Let Jcross be the old bipartite cross graph between {b,c,d,e} and {f,g}. If its matching number is at most one, it is a star or empty. The five canonical edges, F, and at most one a-spoke then cover every mixed triangle: J12 is already hit by F, and Jcross by the extra spoke. The total is at most 2m+6, contradiction.

Otherwise take a matching of two edges in Jcross, necessarily using both f and g, and append its two hub triangles to the three pages bcp,dep,fgr. The five triangles are edge-disjoint as in (2).

Their complete old footprint is avoidable componentwise. A component containing p can contain at most one leaf from each of {b,c},{d,e}, and no f or g, since p is nonadjacent to that third pair. Its footprint is at most two adjacent p-spokes; it contains no selected cross rim. A component containing r can contain only one of f,g among the core leaves and none of b,c,d,e, so its footprint is at most one r-spoke and no selected cross rim. A component containing neither apex sees at most one matching rim, since two such rims would require both f,g in one clique. Components cannot contain both p,r because pr is absent.

A maximum K4 packing avoids any adjacent pair by taking the opposite face. A maximum K5 packing avoids adjacent edges 12,13 by taking triangles 145 and 234. Single edges are also avoidable. Consequently a maximum B packing avoids the entire old footprint, and the five new triangles give m+5, contradiction.

## Scope and remaining gap

All three possible equality patterns of full apices are covered. Every branch gives an actual cover saving or packing augmentation with its complete old boundary; no additional page-apex availability is assumed. Mixed A/B forms, a B family with extras on a hub base, and the exceptional-family combinations are outside this theorem. The actual-parent selection still does not guarantee that a triple residual lies in the tight low-packing row.

Dependencies: the exact q=2 family normal form, literal B clique properties, and complete common-center mixed-triangle accounting, all stated above or in the frozen apex_actual_parent_* sources. No numerical computation, new family member, arbitrary defect-two naming or minimum-Q hypothesis is used.
