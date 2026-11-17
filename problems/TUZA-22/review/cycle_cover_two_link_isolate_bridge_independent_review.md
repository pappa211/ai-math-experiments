> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: cycle-cover two-link isolate bridge

Source_audit,2026-11-16 UTC. Verdict: ACCEPT THE ORDINARY CONDITIONAL BRIDGE and its exact finite-domain reduction. Exclusion of that finite domain remains a separate independently validated premise; this review does not rerun or certify the producer's computation.

Frozen source: notes/challenger_cycle_cover_two_link_isolate_bridge_v1.md,
SHA256 1cc22c21d6560aaf29b21ba305c4eec146cfbb8779fef6c4f2b2c95f638cf05c.

The key transfer is exact for FULL actual vertex links. If h and v are adjacent and v has precisely neighbors u,w in L_h, then N_G(h) intersect N_G(v)={u,w}. Hence h has precisely those two neighbors in L_v. If uv and vw are the selected cycle edges at v, deleting u,w from L_v leaves h isolated. The hypothesis that uw is absent is preserved literally as the missing edge between the two apices. No outside common neighbor is suppressed: it would already have been an additional neighbor of v in the full L_h.

The accepted whole-link/path-forest reductions therefore put this neighboring link in exactly the one-isolate/no-apex-edge subdomain. The existing at-most-one-isolate rule makes the isolate count exactly one. With matching number at most two, the remaining nonempty path forest is precisely one of P2,P3,P4,P5,P2+P2,P2+P3,P3+P3. An empty remaining forest would make the whole link have only three vertices and violates the stated robustness input. The matching-two bound retains its existing finite P6 premise.

For the displayed P5 boundary, vertex2 has no apex adjacency and its only link neighbors are1,3. Since every F_h edge is selected,12 and23 are exactly its cycle edges, and13 is absent in the actual induced path forest. Thus the bridge applies even though that initial link is non-WKE. This is a valid consistency condition between two links of one actual graph, not a fabricated WKE certificate for the first link.

I independently checked the raw domain arithmetic. Adding one isolate gives forest orders3,4,5,6,5,6,7; with two ordered arbitrary apex neighborhoods and no apex edge the raw total is

    2^6+2^8+2^10+2^12+2^10+2^12+2^14=26944.

The largest full link has nine vertices. Connectivity, actual minimum degree and K4-freeness are the stated necessary filters; their complete literal enumeration and certificate validation must be supplied separately. No additional pruning or symmetry quotient is implicit in this bridge.

Accordingly, an independently validated exclusion of that exact subdomain would forbid the stated configuration globally in a hypothetical minimum-CS cycle-cover graph. The ordinary implication itself is accepted now. A producer pass or an UNKNOWN is not silently converted into a proved domain exclusion, and no unrestricted cover-availability claim follows.
