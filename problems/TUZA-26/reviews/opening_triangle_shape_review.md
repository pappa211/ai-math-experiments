> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: triangle-shaped three-edge B residual

Frozen 2026-11-16T21:05:54.126419+00:00. **PASS — PROVED_ORDINARY at the exact stated gain-two, cover-gain-three hypotheses.** Reviewed notes/blocker_triangle_shape_v2.md, SHA-256 `483f11b9d7cf740990956964b796d306652ae57494899b4ec67c2f4f4d19a8ab`. Its conclusion is the entire triangle support K5-e; arbitrary retained background and isolated vertices are permitted. No single-edge resilience, minimum-counterexample premise, finite census, or Lean verification is used.

## Actual triangles and whole footprints

For S={ab,bc,ca} absent in L, the terminals are independent in L. Every new triangle is either abc itself or a page on one restored base with an apex outside {a,b,c}. A triangle on two restored edges would have vertex set {a,b,c} and necessarily uses all three, so no additional type exists.

Three pages on three different bases and distinct apices are edge-disjoint: their restored bases are different, and an old spoke cannot coincide without a common apex. Each old literal K4/K5 component contains at most one independent terminal. That terminal lies on at most two selected bases, so the *whole* supported footprint of the three selected pages in any component is at most two edges incident to the same terminal. Maximum K4 and K5 packings avoid that footprint. Components' triangle supports are edge-disjoint, so these local packings combine and append all three pages, contradicting nu(Q)=nu(L)+2. Consequently the base/apex incidence matching number is at most two. Arbitrary shared vertices of old components do not affect this argument.

## Incidence cover becomes an actual graph-edge cover

The matching-cover assertion for this bipartite incidence graph is correct. With at most two incidence-cover vertices, all possibilities map to a cover of the full new triangle family by at most two actual Q edges, except the stated two-full-apex case:

- Two base vertices give their two restored edges; these also hit abc.
- Base ab plus apex x gives {ab,cx}. Every page outside ab then has apex x and contains cx. If cx is absent, there is no such page and ab alone suffices.
- Two apex vertices force at most two active apices. An active apex has one or three pages, since its set of old terminal neighbors has size two or three and all terminal pairs are restored. A nonfull apex on ab plus a full apex y is covered by {ab,cy}. Two nonfull apices are covered by their base edges. One active apex is similarly covered by one base and its opposite spoke if full, or its sole base if nonfull. Zero active apices leaves abc alone.

If desired, the elementary three-row Hall alternative replaces the general bipartite matching-cover statement: when all three bases are active but no matching saturates them, either two rows share an identical singleton apex, or the total apex set has size at most two. In the singleton-row case, say ab and ac both only see x, {ax,bc} covers every page and abc. This independently recovers the proof's exhaustion without an external theorem dependency.

An old minimum cover plus any two-edge new-family cover would have size at most2m+2, violating tau(Q)=2m+3. Therefore the sole surviving family is abc plus all six pages at exactly two full apices x,y. This is an actual-graph argument: unrealizable two-page apex sets are never allowed.

## Cover overlap and connected support

Each of the six old spokes occurs in a three-edge cover of the new family: for ax use {ax,ay,bc}, and permute terminals for the others. If a spoke were old-supported, its literal K4/K5 component has a minimum cover through it. Combining old minimum component covers with that three-edge new-family cover overlaps in the spoke and costs at most2m+2. Thus all six spokes are background in L.

The edge xy is absent in L, because otherwise axy would be an old triangle supporting ax. It cannot be a restored edge, since x,y are outside the terminal set. Hence the displayed five vertices induce K5-xy. All actual new triangles have already been enumerated, and all their old edges are background. The new component is therefore edge-disjoint from every old triangle component. Q has exactly one nonempty shared-edge triangle component, so no old component can exist. Its entire triangle support is exactly K5-e. Possible isolated vertices and extra triangle-free background are immaterial to this correctly scoped conclusion.

## Implication and strategic scope

For conditional minimum Q, a fragile blocker-pair residual yields a three-edge set S with L=Q-S satisfying B, nu(Q)=nu(L)+2 and tau(Q)=2nu(L)+3. If S is a triangle, this theorem gives K5-e support, contradicting Q outside frozen C12. This implication does not use archived gain-one R3 equality restoration and does not assume that Q inherited a missing-triangle parent.

Together with the separately checked star theorem, the result excludes two of the five endpoint shapes for fragile blocker triples, at all minimum degrees. It leaves P4, P3 plus a disjoint edge, and a three-edge matching. It also leaves resilient blocker-pair reconstruction and the no-blocker all-eligible two-edge-resilient branch. No universal blocker availability, global C12 rigidity, CS, or Tuza conclusion follows yet.
