> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Adjacent restoration over one named support needs at most one outside terminal

Coordinator-proposed domain lemma, independently reconstructed and frozen by the apex worker, v1, 2026-11-16. **PROVED_ORDINARY at the explicit hypotheses below.** Applying minimum degree four to the conditional Q is conditional on the separately reviewed degree-three exclusions. This is a finite-domain reduction, not a completed finite search or a universal availability theorem.

## Exact hypotheses and conclusion

Let Q be finite simple, triangle-supported with connected nonempty triangle family, single-edge packing-resilient, defect one, and minimum degree at least four on its nonisolated support vertices. Let ab,ac be distinct edges with a,b,c distinct and let R=Q-{ab,ac}. Suppose these form a packing blocker, so nu(R)=nu(Q)-1, and suppose R has exactly one nonempty triangle-support component C, which is one of the EXACT frozen C12 models. Arbitrary R background is retained.

Then every support vertex of Q belongs to V(C) union{a,b,c}, and at least two of a,b,c belong to V(C). Thus Q has at most one support vertex outside C, and at most14 nonisolated support vertices. Isolated vertices are irrelevant and are not bounded.

The proof uses the named models' universal-vertex and induced-C4-free properties, and the accepted independent-star avoidance theorem for the ten literal fresh-edge-glued models. It does not assume global R.

## 1. No outside apex survives minimum degree four

Any vertex z outside V(C) union{a,b,c} occurs in no old R triangle. Every Q triangle containing it must therefore be an ordinary page on one restored base, with z its apex. Every incident Q edge is triangular, so all neighbors of z lie among a,b,c. This gives degree at most three, contradiction. Hence the claimed initial vertex confinement holds.

Any old edge between C vertices already belongs to C: its universal vertex completes a triangle, unless it is itself a universal spoke. An old outside terminal's C-neighbor set is independent in C, since an adjacent pair would make an old triangle containing that terminal. These are consequences of actual triangle support, not permission to discard background.

At least one restored terminal belongs to C. Otherwise every new triangle has no old C edge: ordinary pages have two outside-terminal spokes, and the possible two-restored-edge triangle abc has only the old outside edge bc. The old C triangle family could not connect to any new family, contrary to Q's triangle connectivity.

Each restored base has an ordinary page. For example Q-ab has the same packing number as Q by resilience, but R has one fewer; its only possible new triangles are ordinary ac-pages. Thus such a page exists. The other base follows symmetrically.

## 2. Exactly one C terminal cannot be a leaf terminal

Suppose b is the only terminal in C, so a,c are outside. After the initial vertex confinement, every ordinary page apex lies in C: the other terminal cannot be an ordinary apex because its required other restored edge is absent in R.

An ab-page abx has exactly one old supported spoke bx in C. An ac-page acy is bare, with both old spokes background. If x!=y, these two pages are edge-disjoint; a maximum C packing avoiding bx (single-edge resilience) combines with both, giving nu(C)+2, whereas the blocker pair gains only one. Therefore both entire ordinary-page families have the same singleton apex x.

Every old edge incident to the outside center a must be used in a new Q triangle, since it lies in no old triangle. Such an edge can occur only in one of those ordinary pages; the two-restored-edge triangle abc uses no old a-edge. Consequently the old neighbor set of a is exactly{x}. In Q it has only neighbors b,c,x, giving degree three, contradiction. The symmetric case with c as the only C terminal is identical.

## 3. Exactly one C terminal cannot be the common center

Suppose a is the only terminal in C and b,c are outside. Let B and T denote their C-neighbor sets in R. Every such old edge must become triangular through the corresponding restored base, so

    B,T are independent subsets of N_C(a).

The only other possible old edge incident to either outside terminal is bc. Minimum degree four gives |B|,|T|>=2; if bc is absent both sizes are at least three. If bc is present, B and T are disjoint, since a common neighbor would make an old triangle bcz outside C.

### Ten fresh-edge models

If C is one of the ten fresh edge-gluing models, any distinct nonadjacent pair u in B, v in T gives an avoidable independent star {au,av}. The accepted independent-star theorem supplies a maximum C packing avoiding both edges, so the pages abu and acv append simultaneously, contradiction.

Hence every distinct cross-pair is adjacent. If B and T intersect, choose a common vertex and another vertex of B; they are distinct and nonadjacent because B is independent, contradiction. Thus B,T are disjoint and complete to each other. Choosing two vertices in each yields an induced C4 in C, forbidden for these models. This excludes the fresh-edge case.

### K5-e

If a is a peripheral endpoint of the missing edge, N_C(a) is a clique and has no independent pair. If a is universal, its only independent pair is the two peripheral vertices. Thus both B,T must equal that pair. Their sizes are exactly two, so minimum degree four forces bc to be present, contradicting the required disjointness. This excludes K5-e.

### W5 with a rim center

If a is a rim vertex, N_C(a) consists of the universal hub and its two nonadjacent rim neighbors. The only independent pair is the latter pair. Again B=T is that pair, and degree four forces bc, giving an old triangle outside C. This case fails.

### W5 with its hub as a

Now N_C(a) is the five-cycle rim. Its independent sets have size at most two, so B,T are independent pairs. Minimum degree four forces bc, and the pairs are disjoint.

Every Q triangle has common vertex a. The link L is exactly the rim C5, the two outside vertices b,c joined to their respective independent rim pairs, and bc. This link is triangle-free: neither outside neighbor pair has an edge, and their disjointness prevents a triangle through bc.

Choose b together with two nonadjacent rim vertices outside B. Such a pair exists because deleting an independent pair from C5 leaves three vertices with an independent pair. These three vertices form an independent set in the seven-vertex link. Its complement is a vertex cover of size four. The corresponding four a-spokes cover ALL Q triangles, so tau(Q)<=4.

But nu(C)=2 and the blocker profile gives nu(Q)=3; defect one requires tau(Q)=5. Contradiction. This uses the correct triangle-free common-apex semantics, not a matching-only formula for arbitrary cones.

All cases with exactly one C terminal fail. At least two terminals therefore belong to C, proving the claimed domain.

## Finite reconstruction role and remaining open arrows

For the minimum unknown Q, this lemma becomes applicable only after three separate inputs are established: minimum degree at least four; resilience of the blocker residual; and exclusion of its tight components. It then gives a complete vertex universe for adjacent two-edge reconstruction: each C12 support, all or two restored terminals inside it, at most one outside terminal, and every admissible old background edge retained. A generator still must enumerate every allowed background pattern, all actual triangles, and exact optima before claiming a finite exclusion.

This reduction supplies no blocker in the no-blocker case. It does not assume the reported ten-vertex census or claim Q has more than ten vertices. The at-most14 bound is scoped to this particular restored named-support interface, not to all resilient defect-one graphs. Universal CS/Tuza remains separated by the remaining exact reconstruction and global availability obligations.

Source attribution: TUZA25 notes/residual_independent_star_avoidance.md supplies the fresh-edge independent-star theorem; the literal C12 definitions and their reviewed universal/induced-C4-free properties supply the named geometry; TUZA22 common-apex note provides context for the last case, though its displayed four-spoke cover is direct here. No historical novelty or Lean claim is made.
