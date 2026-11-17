> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fixed minimum-cover substitution is not a complete WKE equality method

Coordinator, 2026-11-16 UTC. Ordinary method boundary with two retained finite controls. This does not refute the accepted necessary invariance theorem or general WKE exclusion.

Let the hub be0, core triangle123, and tips4,5,6. The link edges are123 together with14,25,36,15,26,34. Take M={15,26,34}. Its complement F is123 plus pendant14,25,36, with vertex-cover number3. Complete123 to a residual K4 using7, or to a residual K5 using7,8. Let H be that clique plus the pendant edges, and G=H+M+all six hub spokes. These are two fixed literal graphs, fully retained in `evidence/coordinator_wke_invariance_boundary.json`.

For EVERY minimum H cover D, vc(F-D)=3: none of the three pendant edges can belong to a minimum H cover, and they form a matching of size3; vertices1,2,3 cover F. Thus the minimum-cover invariance test gives no saving for either control. The bounded exact recurrences also found packing balance nu(G)=nu(H)+3 in both, with (tau,nu)=(6,4) and(7,5). Only these two graphs were tested; no general census claim or UNKNOWN remains. Runtime0.123seconds, sampled4.95MiB, external30second cap.

The first packing balance also has a short ordinary upper bound: G has18 edges, and its four independent outer vertices4,5,6,7 each have degree3. Every triangle packing leaves at least one incident edge uncovered at each, hence at least4 distinct edges uncovered and at most floor(14/3)=4 triangles. The displayed hub matching plus residual clique triangle attains4.

The conclusion is methodological: retaining every M rim edge in the extending cover and changing only residual minimum covers and hub spokes can miss existing strictness. A full equality proof needs additional rim-base substitutions, an augmentation, or local structural availability. These controls have small closed link components at residual completion vertices, so they do not satisfy all minimum-CS structural hypotheses. Do not promote them to hypothetical minimum failures.
