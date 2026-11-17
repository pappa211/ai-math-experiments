> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Compatible-strip augmentation with paid boundary crossings

Frozen ordinary operation candidate v1, TUZA-26, 2026-11-17. Developed with the coordinator's odd-cycle payment and independent-spoke charging observations. Independent review required. This genuinely relaxes the clean complete-boundary strip: selected outside packed triangles are removed and paid for in the local packing replacement. It does not assert strip availability, classify defect-two supports, or infer geometric privacy from a cover exchange.

## Actual marked setup and bookkeeping

Use the marked setup of notes/matching26_marked_strip_augmentation_v2.md. Thus e=uv, K=Q-e, nu(Q)=nu(K)=k, x,y are distinct common neighbors of u,v, and

    L=K-{xu,yu,xv,yv}, nu(L)=k-1.

K contains the literal two-hub strip D with hubs x,y and simple path v0=u,...,v_l=v, l>=3. All hub spokes are present; xy may be present or absent. Let

    B={xu,yu,xv,yv} union({xy} if present), I=E(D)-B.

Every actual K triangle not a triangle of D is called outside. Its intersections with I are actual private-edge crossings. Endpoint chords, shared vertices, retained background and outside triangles are never discarded.

Take any maximum packing M of L. Split the triangles touching D into:

- internal D triangles, i in number;
- outside triangles using at least one I edge, c in number;
- all other triangles, retained unchanged.

After deleting the four marked endpoint spokes, the internal D family is the optional hub edge joined to the internal path v1,...,v(l-1), which has m=l-2 rim edges. Thus i<=m. If xy is present, at most one of the i triangles is a spine triangle; every other one uses a distinct internal rim edge. If xy is absent, all internal triangles use such rim edges.

Delete the i+c touched triangles from M. Every retained triangle avoids I, avoids the four endpoint spokes because it lies in L, and may use xy. Append the l alternating-hub rim triangles on the full marked path. They use only I and two endpoint spokes, and avoid xy. This is therefore an actual edge-disjoint replacement, regardless of the removed outside triangles' other edges.

For ODD l the first and last rim triangles use the SAME hub. The two endpoint spokes to the other hub remain free. Append also the uv-page through that other hub. This last triangle is in Q, uses e and the two unused endpoint spokes, and is disjoint from all retained and appended triangles. Thus the replacement adds l+1 triangles when l is odd, rather than l. No outside L triangle uses e.

Consequently an actual packing contradiction follows whenever

    i+c <= m                 (either parity), or
    i+c <= m+1               (odd l).

The resulting Q or K packing has at least k+1 triangles. The following explicit boundary conditions guarantee precisely these payments.

## 1. Arbitrary internal rim crossings

Suppose the COMPLETE outside boundary condition is relaxed to

    E(T) intersection I is contained in F

for every outside K triangle T, where F is ANY subset of the internal rim edges v1v2,...,v(l-2)v(l-1). There is no bound on the number of outside triangles using F, their apices, or their other edges.

Let S be the union of F edges used by the c outside triangles of M, and put r=|S|. Since those triangles are edge-disjoint and each uses at least one F edge, c<=r. They may use several such edges; this only helps the bound. Every internal D rim triangle remaining in M avoids S, so at most m-r internal rim triangles remain. Hence

    i+c <= (m-r)+c <= m                    if xy is absent;
    i+c <= (m-r)+1+c <= m+1                if xy is present.

It follows that the actual strip augmentation is valid:

- for EVERY l>=3 when xy is absent;
- for EVERY ODD l>=3 when xy is present.

In particular the odd-length operation tolerates arbitrary books of outside triangles on every internal rim edge. It does not assume that their third edges are distinct beyond the selected packing's actual edge-disjointness.

## 2. Independent internal spoke crossings

A second explicit charged boundary is a set F of hub spokes at an independent set W of vertices of the INTERNAL path, where each w in W has TWO incident internal rim edges. Equivalently W is contained in {v2,...,v(l-2)} and no two W vertices are consecutive on the path. Either or both spokes at any such vertex may belong to F. Again require every outside triangle's private-edge intersection to be contained in F.

For the c selected outside triangles, let s be the number of distinct F spokes they use. Then c<=s. At a vertex w where one hub spoke is used outside, the internal packing cannot use BOTH incident rim edges: their triangles would have to use the same other hub and would share its spoke at w. Thus at least one of those two rim edges is unused. If both hub spokes are used outside, neither incident rim edge can support an internal rim triangle, giving two unused edges.

The incident rim-edge pairs for vertices in W are disjoint. Therefore at least s internal rim edges are unused, without double counting. At most m-s internal rim triangles remain. The same optional one-spine estimate yields

    i+c<=m if xy is absent, and i+c<=m+1 if xy is present.

The same two augmentation conclusions follow: any length with absent xy, or odd length with present xy. This is a pure-spoke condition; arbitrary mixtures of spoke and rim charges are NOT silently added, since their forced unused rim edges could overlap. A mixed condition is valid only after its charges are separately proved disjoint.

## 3. Even length with a hub edge: a nonisolating rim boundary

There is a useful sharpening of Section1 when xy is present and l is even. Suppose F is a matching of internal rim edges and avoids the two endpoint edges of the internal path. Deleting ANY subset S of F leaves no isolated vertex of that internal path.

If an internal spine triangle is selected in M, its apex has at least one remaining incident rim edge after S is deleted. That edge cannot support a packed rim triangle, because the spine uses both hub spokes at its apex. Thus the spine replaces at least one of the m-r still-available rim slots, rather than adding a unit above them. Therefore

    i<=m-r, and i+c<=m.

The original l-triangle replacement now gives the contradiction for even l as well. This includes an arbitrary crossing book on one deep internal rim edge. It is an exact reason why the placement of allowed boundary edges matters; an endpoint deletion or two consecutive deleted rim edges can create an isolated vertex whose spine triangle consumes no remaining rim slot.

## 4. A minimal crossing book on any private edge

Suppose every outside triangle touching I contains one fixed private edge g. There may be arbitrarily many such triangles and they may also use other private edges. At most one of them occurs in M. Therefore c<=1 and i+c<=m+1. For ODD l, the extra uv-page pays this sole crossing automatically, even when g is a private spoke or an endpoint rim edge. More generally the same argument applies whenever the entire crossing family has packing number at most one.

For EVEN l the same one-book crossing is harmless if g is packing-critical in the internal strip D': when c=1, all internal triangles avoid g and i<=m-1, so again i+c<=m. Examples with xy present are any non-endpoint internal rim edge of D', or either hub spoke at a path vertex at distance at least two from BOTH endpoints of D'. To verify the latter examples directly, every maximum m-packing of D' consists either of all m alternating rim triangles, or one endpoint spine triangle and all other m-1 rim triangles. An interior spine would lose two incident rim edges and cannot attain m. The stated deep edges occur in every displayed maximum packing. Thus deleting one lowers the local optimum by one.

This is a genuine repair of a minimal external crossing. It does not require K or L resilience at g; it pays for the crossing triangle by a forced loss of local internal packing capacity.

## What remains an actual availability obligation

These operations use only the actual marked packing profile and the stated complete crossing conditions. Universal full-triangle cover eligibility, K resilience and defect-two naming are not additional premises, and none has been used to assume a crossing can be ignored.

The unresolved situation includes strips with private-spoke crossings whose charges overlap, end-near crossings in even strips, or a larger crossing family without enough forced internal rim losses. Such crossings may protect local critical edges; merely observing that the isolated strip is fragile does not remove them. The complete outside family must still be controlled by actual graph geometry or replaced by a different paid region.

No enumeration, optimizer, graph contraction, or unbounded sequence of exchange-distance cases was used. The result is an explicit generalized packing operation. It does not show that every surviving minimum-Q cover exchange supplies one of these regions, and therefore does not close the global availability gap or prove unrestricted Tuza.
