> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Zero-gain K5-on-K4 leaf: a forced two-edge defect-one residual

Ordinary deduction pending independent review. This isolates a remaining obligation; it does not claim the resulting residual is resilient.

Let J be a finite simple graph containing a literal K4 A. Add one fresh vertex x adjacent precisely to A in the triangular support, obtaining G; retain all background edges. Write p=nu(J). Assume:

1. nu(G)=p (zero packing gain);
2. tau(G)=2p-1 (G has defect one);
3. tau(J)=2p-3 (J has defect three).

The exact leaf packing formula already proves every edge of A is critical in J. For an opposite pair M={ab,cd}, the two new triangles xab and xcd are edge-disjoint. They can be appended to any maximum packing of J-M, so

    p=nu(G)>=2+nu(J-M).

Two edge deletions lower packing by at most two, yielding the reverse inequality nu(J-M)>=p-2. Therefore **each of the three perfect matchings M of A satisfies nu(J-M)=p-2**. No triangle-extension hypothesis is needed.

Now choose any minimum cover C of J. Its restriction C_A to A covers K4. It cannot contain a whole triangle U of A: otherwise C-E(U) covers J-E(U), and the exact leaf cover formula would give

    tau(G)<=4+tau(J-E(U))<=4+tau(J)-3=2p-2,

contradiction. Thus C_A is a triangle-free K4 cover. It has size two, three, or four and is respectively a perfect matching, a four-vertex path, or a four-cycle. Each contains an opposite pair M. Since M subset C,

    tau(J-M)=tau(J)-2=2p-5.

The equality follows both from restricting C and from adding M back to any cover of J-M. Combining with the packing identity proves

    nu(J-M)=p-2,  tau(J-M)=2nu(J-M)-1.

This gives a concrete two-edge deletion to a smaller defect-one graph. The additional obligations are one-edge resilience, connected triangle support, and a boundary reconstruction compatible with the original restoration problem. None follows just from the displayed numbers, and none is claimed here. This derivation requires neither every-triangle-extension nor one-edge resilience of G. The subsequent matching-deletion theorem supplies resilience of the resulting R under the stated K4-completion/proper-CS premises.


## Dated supersession — 2026-11-16 16:55:54 UTC

The earlier local statement that matching reconstruction remains unresolved is superseded, at its exact conditional scope, by [Named-core matching reconstruction](mixed_named_matching_reconstruction_frozen.md). Together with the matching-deletion resilience theorem and the exact marked-edge component transfer, that proof excludes the zero-gain configuration when its smaller active component is named by the explicitly stated wider-class minimality. It does not supply a leaf region, prove broad rigidity/frozen-F availability, or prove unrestricted CS/Tuza. The earlier numerical/proof arguments are retained unchanged; consult the final reconstruction note and fresh critic receipt for authoritative scope and review status.
