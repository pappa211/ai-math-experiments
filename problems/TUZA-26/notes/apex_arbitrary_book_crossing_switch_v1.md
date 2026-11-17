> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# An arbitrary-book crossing switch that changes two outside triangles

Frozen ordinary paid operation, TUZA-26. This addresses a literal canonical crossing through an extra common neighbor. No codegree-two assumption, cover-edge matching, or classification of the residual is used. Its availability in every minimum Q remains OPEN.

## Actual setup

Let uv be the marked edge, and let g,h be a compatible pair of distinct common neighbors. Put

    L=Q-{uv,ug,vg,uh,vh}.

Let M be an actual L packing of size k-1, where nu(Q)=k. The operation below does not require M to be canonical or maximum; the size k-1 is the required payment premise. For its canonical interpretation, choose M to maximize the number of triangles avoiding u,v among all maximum L packings.

Suppose the following NINE vertices are pairwise distinct:

    u,v,g,h,z,a,b,p,q.

The old packing contains the four distinct triangles

    A=uza, B=vzb, C=gap, D=zpq.

Thus z is an additional common neighbor of u,v, beyond the compatible pair g,h. A and B are endpoint-fan triangles; C and D are outside triangles. Assume the four actual Q edges

    ab, gb, gq, up

are unused by M after those four triangles are removed. With the displayed distinctness they belong to none of the four removed triangles either, so this is equivalent to their being unused by all of M. No other edge or triangle outside this region is assumed absent or private.

The first free edge ab supplies the actual crossing triangle T=zab: it meets A on za and B on zb and has an unoccupied third edge. The two additional outside triangles C,D will pay for a real outside-packing change.

## Six-for-four replacement

Remove A,B,C,D. Retain EVERY other packed triangle. Add the following six actual Q triangles:

    zab,
    uga,
    vgb,
    uzp,
    gpq,
    uvh.

Their edge inventory is

| New triangle | Released old edges | Supplied free edges | Deleted book edges |
|---|---|---|---|
| zab | za from A; zb from B | ab | none |
| uga | ua from A; ga from C | none | ug |
| vgb | vb from B | gb | vg |
| uzp | uz from A; zp from D | up | none |
| gpq | gp from C; pq from D | gq | none |
| uvh | none | none | uv,uh,vh |

All eighteen listed edges are distinct under the stated vertex distinctness. Every edge in the first column was released from one of the four removed triangles, and M was edge-disjoint. Every supplied free edge avoids the retained packing by hypothesis. All five deleted book edges were absent from L and therefore from M. This verifies BOTH mutual disjointness and disjointness from the entire retained packing, including arbitrary crossing triangles already packed outside the displayed region.

The new packing has size

    (k-1)-4+6=k+1,

contradicting nu(Q)=k. Consequently this exact configuration cannot occur in the minimum-Q compatible-pair interface.

## Why this changes the outside packing

The old outside pair {gap,zpq} is replaced by the new outside pair {zab,gpq}. The old two endpoint triangles are replaced by THREE endpoint triangles, uga,vgb,uzp. The reserved uvh page supplies the second net packing gain.

Thus this is not merely a larger release set followed only by endpoint-fan replacement. Keeping all other outside triangles fixed and omitting the new outside pair would discard two outside triangles while gaining only one endpoint triangle. The two actual new outside triangles are essential to the count.

The switch also explains the purpose of the common intermediate vertex p. The released rim zp allows the u-fan to move from uza to uzp, while the released pair gp,pq combines with free gq into a replacement outside triangle. This compensates for using ga in the new uga page. All uses are physical graph edges.

## Exact canonical obstruction before the outside release

There is a useful preceding statement about the original crossing T=zab. Build the usable L-link at u, excluding the opposite endpoint, the deleted marked spokes, and every rim occupied by the retained outside packing or the v-fan. If a matching of the original u-fan size could avoid BOTH za and ab, replace the u-fan by it and then replace B=vzb by outside triangle zab. The new packing stays in L, has the same total size, and has one more outside triangle. A canonical M forbids this. Symmetrically the v-fan cannot neutrally avoid both zb and ab.

The qualification L-link is necessary: a matching using a restored g- or h-spoke would not stay in L and cannot be used in this canonical comparison. In the displayed six-for-four operation, the alternative rim zp was blocked by the old outside triangle D. Releasing D and simultaneously replacing the outside pair is exactly what permits the otherwise blocked move. Additional common-neighbor rims are allowed throughout and are checked through actual edge disjointness, rather than assumed decoupled.

## Boundary, control, and scope

The region is not required to have a small graph boundary. Its complete packing boundary is the retained packing itself: the four supplied free edges must avoid it, and all remaining selected edges are explicitly released or previously deleted. Extra graph edges and unpacked crossing triangles cannot invalidate a certified packing. Conversely, the mere presence of the four displayed old triangles and ab does NOT prove the other three edges gb,gq,up exist or are unused.

The operation is checkable without optimization from the displayed packing and edge inventory. It is consistent with the accepted arbitrary-book release compression: that theorem only controls replacements which retain the unreleased outside triangles and add endpoint fans plus one book page, whereas the present operation constructs a different outside packing. The preserved star555 and double-cone controls do not establish or refute availability of this exact configuration.

This supplies one concrete arbitrary-codegree crossing/outside repair. A global bridge still has to force this configuration, an equivalent outside switch, or a cover saving from the simultaneous page blockers and the stronger Q profile. Neither minimum degree five, the two-hub exclusion, nor full-triangle cover eligibility has yet supplied the three free edges here. No new degree catalogue, enumeration, or numerical search was run.

Relied sources: notes/arbitrary_book_release_compression_v1.md; notes/matching26_canonical_outside_packing_v1.md; notes/matching26_outside_hub_repair_v1.md; the accepted compatible-pair residual profile. Independent review requested before promotion.
