> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: the critical wedge edge is background over B

Verdict: PASS, PROVED_ORDINARY for notes/matching26_two_edge_critical_wedge_background_v1.md, SHA-256 f003e80f01ed324093a7c9fc805cbc7cc56affbee38c9b5b7191a1819767d7e3. This is a restriction on the explicit two-edge tight restoration, not a classification of defect-two graphs. No computation or Lean verification was needed.

## Interface and common tools

A=B+{xz,f} has nu=m+2,tau=2m+2, actual triangle xyz, critical yz and noncritical xy. Each restored edge is critical because deleting it leaves one edge over B and packing at most m+1. Thus f cannot equal xy; f=yz already makes the claimed old support absent.

Each restored base has a bare ordinary page. If it did not, the whole-one-base footprint supplies at most one specified edge per tight B component; choose minimum clique covers containing those edges to hit every ordinary page on that base. Adding the other restored edge covers every remaining new or mixed triangle at cost2m+1. This contradicts the prescribed cover number.

A maximum A packing has two ordinary new pages and m old triangles: its gain two exhausts the two distinct restored edges, so a mixed two-base triangle cannot occur. Under the contrary assumption that yz is supported in old clique D, x is outside D. Any noncentral xz-page disjoint from a bare f-page appends over old maxima avoiding yz and its footprint. The only doubled footprint is yz together with zp in D, an adjacent pair. Hence such a disjoint page pair is impossible. Two bare pages on opposite bases also cannot be disjoint.

For adjacent restored bases, ordinary pages intersect exactly when their apices coincide, so their nonempty bare-apex families are the same singleton. For disjoint bases, intersection forces every bare apex to be an endpoint of the other base. These are actual triangle edge-intersection facts, including the exclusions imposed by ordinariness.

## Exhaustive f placements

For f=zt, both ordinary apex families are confined to y and their common bare apex w, by the adjacent-star avoidance argument at z. Old xt is absent, since otherwise it makes an old triangle using bare edges xw,tw. Therefore there is no mixed triangle. A minimum B cover containing yz plus the single background edge zw covers every new page, contradicting the required cover increase two.

For f=xt, an A maximum avoiding xy must use the bare xz-page at w and an ordinary xtq-page disjoint from it. The latter avoids yz. Avoiding its footprint and yz in all old pieces could fail only in a K4 D on{y,z,t,q}, with opposite forbidden edges yz,tq. But old xy,xq and D edge yq make an actual old triangle xyq, merging x into D and forcing the absent xz. The opposite-edge exception is therefore genuinely eliminated, rather than assuming K4 can avoid opposite edges.

For f=yt disjoint from xz, bare apices are forced to t on xz and x on yt. A maximum avoiding xy must use xzt. Its ordinary ytq-page avoids q=x,z because it is disjoint from xzt; it therefore avoids yz. Its only possible D footprint is yq, adjacent to yz, so it and the bare xz-page append over old maxima avoiding yz, contradiction.

For disjoint f=ab not containing y, choose bare xza. Both a,b are outside D: za proves it for a; a bare f-apex z proves it for b, or a bare f-apex x and old triangle xy b would contradict bareness of xb if b lay in D. Any ordinary f-apex outside{x,z} would give an appendable page pair avoiding yz, so all f-pages have apex x or z. All noncentral e-pages similarly have apex a or b. Thus every new triangle except xyz lies on{x,z,a,b}, and there is no mixed triangle because the bases are disjoint. A maximum avoiding xy would require two edge-disjoint new triangles on four vertices, impossible.

These placements exhaust all f distinct from xz,xy,yz. The conclusion that yz is not supported in B follows.

If f differs from yz, it is therefore background. A maximum A packing avoiding xy still uses critical yz. No old triangle can use that background edge, and the only xz-page containing it is excluded central xyz. Thus an ordinary f-page contains yz, forcing f=zt or f=yt for t outside{x,y,z}, with actual triangle yzt. This is the exact resulting star/path restriction.

The four-wheel and bare-book controls remain valid at the relaxed local scope. In particular the conclusion does not force A to be literally a wheel or remove old tight attachments. Actual-Q payment of the surviving star/path cases remains open.

Frozen UTC: 2026-11-17T00:13:29.606519+00:00
