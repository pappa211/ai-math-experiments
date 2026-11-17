> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: compatible-page marked strip augmentation

Verdict: PASS, PROVED_ORDINARY for notes/matching26_marked_strip_augmentation_v2.md, SHA-256 b1c9d183cbd242c760677600867e9a25752dcdb9b6235e23b4581df8cb28bad7. This is an actual conditional packing operation; availability of its region remains OPEN. No finite computation or Lean verification was needed.

## Exact interface and compatibility

Q=K+uv has nu(Q)=nu(K)=k. Distinct common neighbors x,y define the four endpoint spokes; L deletes them from K. The operation assumes nu(L)=k-1. It needs no cover, defect, naming, degree, connectivity or codegree-two premise.

The compatibility consequence of Q's two-edge resilience is valid at arbitrary codegree. Appending uvx bounds nu(K-P_x)<=k-1. A k-packing of Q-P_x therefore contains an e-page at some y different from x. Removing that unique selected e-page leaves k-1 triangles in K-P_x-P_y; the reverse bound follows from containment in K-P_x. Thus every page has a compatible partner. This is not a claim that all pairs are compatible.

The literal region D has the simple u-v path of length l, both hubs' spokes to every path vertex, and xy exactly when present in K. The boundary is measured against every actual K triangle outside D, not against an abstract exchange graph or necessarily Q. It permits arbitrary shared vertices and external triangles whose D edges are confined to the four endpoint spokes and optional xy.

## Local packing and global replacement

Without xy, a D packing uses at most one triangle on each rim edge, and alternating hub choices attain l. After deleting all four endpoint spokes, only the internal path of length l-2 can support rim triangles, so its local packing is exactly l-2. This includes l=2, where it is zero.

With xy present and l>=3, the residual local graph is the join of xy with an internal path of length m=l-2>=1, plus irrelevant endpoint rim edges. A packing without a spine triangle has at most m triangles. A packing with a spine triangle through xy cannot use any rim edge incident to its apex; there is at least one such edge, so it has at most1+(m-1)=m triangles. Alternating rims attain m. The m=1 case is K4 and satisfies the same value.

Take a maximum L packing of size k-1 and remove all triangles wholly in D, at most l-2. Each retained triangle is an actual outside K triangle. The complete boundary restricts its D edges to the endpoint spokes or xy, and the former are absent in L. Thus it can use only xy. Appending all l alternating rim triangles of D is valid: they are pairwise edge-disjoint and avoid xy and every retained triangle. The resulting K packing has at least(k-1)-(l-2)+l=k+1 members, contradiction.

This replacement retains all outside graph data. It does not infer a triangle packing from a matching of cover edges and does not require vertex privacy. The weaker K-boundary is precisely sufficient because both the old and new packings are in K. In particular, at l=2 the restored Q triangle through the middle path vertex would violate a Q-boundary, but has no role in the K packing argument.

The excluded short case is sharp: Q=K5, e=uv, path u-z-v and hubs x,y gives D=K5-uv, nu(Q)=nu(K)=2 and nu(L)=1. Here xy exists and the residual local spine triangle survives, so only a one-triangle replacement gain is available. V2 correctly makes no exclusion of this case.

## Narrow crossing-repair target

The complete boundary is sufficient but stronger than the actual replacement needs. Let I consist of the private D edges, namely all l rim edges and the two spokes at each of the l-1 internal path vertices. For ANY maximum L packing M, if at most l-2 of its triangles meet I, delete precisely those triangles and append the l alternating rims. The retained triangles avoid I, have no endpoint spoke because they lie in L, and may use xy harmlessly. The same k+1 contradiction follows. This is a separately checked elementary relaxation of the sufficient boundary, not an availability theorem.

Both full alternating rim packings use EVERY edge of I, and differ only in their two endpoint spokes. Each internal vertex lies on two successive rim triangles with opposite hubs. Consequently merely reversing the alternation cannot repair any private-edge crossing from M. A useful local repair would have to change M or exploit a deficit in its internal D triangles to pay for crossing triangles. Quantitatively, the target is a maximum L packing with total private-edge conflict count at most l-2, counting internal and crossing triangles together. A crossing triangle by itself does not prove failure; its cost can be offset by unused internal packing capacity.

No existing global profile has yet forced this conflict bound or a complete-boundary strip. The known relaxed-scope controls do not refute such a conclusion under all minimum-Q hypotheses. Directed disagreement paths also need not produce literal hubs, a simple rim path or the required actual boundary. This is the specific remaining extraction/repair obligation, not a reason to restart a broad graph census.

Frozen UTC: 2026-11-16T23:27:09.933082+00:00
