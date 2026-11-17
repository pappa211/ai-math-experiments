> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: mixed reductions and equality restoration

**Verdict: PASS for Theorems 1–5, Lemma 4, and the minimal-failure audit at their stated scopes.** The main advances are ordinary, unconditional equivalence/transfer theorems: universal mixed inequality is equivalent to universal ordinary Tuza, and the *full mixed equality classification* is equivalent to ordinary CS. Neither conjecture is proved. I found no unresolved mathematical discrepancy in the frozen argument.

Reviewed file: `notes/mixed_frozen_theorems.md`, SHA-256 `4c2729968b8fc237fe94d23dd407046a64bb5d244df176cb3b77cce12b96bdf4`. I reconstructed the proofs independently from this frozen statement, without reading or importing the discovery programs. This is in-session independent AI reconstruction plus small exact semantic controls; it is not Lean verification, external peer review, a separate final audit, or a novelty determination.

## Definitions and finite capacity

The essential hypotheses are a finite simple graph, every actual triangle counted, N subset E triangle-free, and outside-N edges having capacity one. Because N is triangle-free, each triangle has a nonempty allowed footprint. A feasible multiset cannot repeat a triangle: its nonempty allowed footprint would consume some capacity-one edge twice. The sum of consumed allowed capacities is at least the multiset cardinality, so any feasible packing has at most q=|E minus N| triangles.

The entire allowed set covers every triangle and has weight q. With weight/capacity M=q+1 on N, a cover using an N edge costs more than q, so an optimum avoids N. A mixed packing has at most q triangles, hence no N capacity M can bind. These arguments give both directions of both optimum identities. The q=0 case is genuinely triangle-free, with both optima zero. This proves the specified {1,M} semantics; it is not a proof for arbitrary edge weights.

## Cover recurrence and fan identities

For e outside N, covers containing e correspond exactly to covers of G-e after paying one; covers excluding e are precisely the covers of the forbid child. If N+e contains a triangle, there is no cover excluding e. That branch has value +infinity and is not an admissible mixed instance. Deletion and admissible forbiddance both reduce q by one while retaining the vertex universe. The recurrence therefore has a valid natural-number induction measure.

For e=uv, all triangles using e have the form uvw. On the forbid branch their remaining allowed footprints D(w) are nonempty, since otherwise uvw would be entirely forbidden. Distinct third vertices give disjoint pairs {uw,vw}, hence disjoint D(w). A packing's chosen pages are a subset U of these triangles; all other packed triangles avoid e and D(U), so they form a packing of H-D(U), where H=G-e. Conversely every such residual packing extends by the chosen pages. This proves the max-over-U identity exactly. On the original branch, e has capacity one, so zero or one page can be used, yielding the second identity. All crossing triangles are handled by actual edge deletion, not by a decomposition assumption.

## Paid peeling

An **inclusion-maximal** packing among N-hit triangles is sufficient. Its allowed footprints are nonempty, mutually disjoint, and have cardinality at most two. Their union S therefore satisfies |S|<=2r, where r is the packing size. A triangle meeting N that survives in H=G-S would have allowed footprint disjoint from S and could be appended, contradicting maximality. No maximum-cardinality choice is needed.

Every H triangle avoids N. Thus ordinary H packings are mixed H packings, and a minimum ordinary H cover can omit N. Adding S gives a valid G cover, while appending any maximum H packing to the chosen r triangles gives a mixed G packing. The exact one-sided bounds are

    tau(G;N) <= |S| + tau(H),
    nu(G;N) >= r + nu(H),
    |S| <= 2r.

Consequently ordinary Tuza on H pays the whole budget. If any chosen triangle has two N edges, its footprint has cardinality one and supplies strict slack. For active N, at least one triangle is chosen and q decreases. With N empty or inactive, the mixed instance is already ordinary in its triangle semantics.

The argument is also a failure-preserving reduction without assuming either conjecture: if tau(G;N)>2nu(G;N), then the displayed inequalities force tau(H)>2nu(H). The converse universal implication follows by N empty. This is a genuine equivalence, not just an empirical comparison or a restatement of the unpaid forbid-branch estimate. It nevertheless supplies no reduction for an unresolved ordinary graph with N empty: that is the remaining ordinary obligation.

## Lemma 4: final restoration

This lemma is independently valid without assuming global CS. Its hypotheses must remain exactly: uv in N; uw and vw outside N; H=G-{uw,vw}; N triangle-free; N inactive in H; and every nonempty shared-edge triangle component of H supported on a literal K4 or K5. Other N edges and all background edges remain present.

The old component packings and covers combine because their edge supports are disjoint, even when components share vertices. K4 contributes nu=1,tau=2 and K5 contributes nu=2,tau=4, so tau(H)=2m. A cover of H plus the two restored edges has cost at most 2m+2. Its old part avoids N because N is inactive. The triangle uvw, whose allowed footprint consists of the two restored edges, extends an H maximum packing, so the mixed packing number is at least m+1.

Every triangle absent from H uses a restored edge. A triangle using both is exactly uvw. If there is no further uw-page, then vw meets every new triangle; the symmetric case is identical. The resulting cover has cost at most 2m+1 and gives the asserted strict inequality.

Otherwise choose uwx with x different from v and vwy with y different from u. If x=y, the old edges ux,vx,uv form an H triangle meeting N, contradicting inactivity. Thus x and y are distinct and the two pages are edge-disjoint. This is stronger than the footprint-disjointness actually required.

No old literal clique contains two of u,v,w: uw and vw are missing in H, and an old clique containing u,v would make uv triangular in H, again contradicting inactivity. The old edges of the two pages are ux,wx,vy,wy. In any old clique, at most one terminal occurs, so the forbidden old edges form at most two edges of a star. Edges among these that are background edges of H occur in no H packing and require no additional treatment.

Each old clique has a maximum packing avoiding those star edges. In K4 use the opposite triangle, avoiding every edge at that terminal. In K5, if the prohibited edges are za,zb with remaining vertices c,d, use zcd and abc. These two triangles are edge-disjoint and avoid both prohibited edges. Zero or one prohibited edge can be enlarged to this avoidance problem. Combining these choices across all components yields an H maximum packing avoiding all old edges of the two pages. Appending both pages proves nu(G;N)>=m+2. Together with the 2m+2 cover this gives slack at least two. Any additional N edges in the pages only relax capacities, so they do not invalidate the construction.

The proof therefore accounts for every page, all crossing triangles, all background edges, vertex-sharing among old components, and arbitrary other forbidden edges allowed by the hypotheses.

## Equality induction

Induction on q is legitimate because the selected active triangle has one or two allowed edges and only those edges are deleted. N remains the same admissible subset. For inactive N, both optima are the ordinary ones, so ordinary CS gives exactly the stated equality classification.

For active N, delete the selected triangle's allowed footprint S of size s. The triangle can be appended to every residual mixed packing, and S can be added to every residual mixed cover. If s=1, the residual non-strict inequality already gives a full unit of strict slack. If s=2 and N remains active, the inductive strict inequality supplies that unit. If s=2, N becomes inactive, and B(H) fails, the strict part of ordinary CS supplies it. The only residual equality case is precisely Lemma 4, since the selected triangle then has one forbidden edge and two allowed adjacent edges. The lemma gives strictness in this final case too. Specializing the full mixed statement to N empty proves the reverse implication.

**Scope distinction:** this proves the full mixed equality statement iff ordinary CS, and in particular ordinary CS implies strictness for active N. It does not prove that active-forbidden strictness *alone* is equivalent to CS. It also does not show that ordinary Tuza alone implies that strictness.

## Minimum-failure consequences

Suppose a mixed inequality failure minimizes q over all finite vertex universes, and put k=nu(G;N). A least q exists if any failure exists. For each allowed e, deleting it removes at most one triangle from a mixed packing. Minimality gives tau(G-e;N)<=2nu(G-e;N), and the cover extension gives

    2k+1 <= tau(G;N) <= 1+tau(G-e;N)
           <= 1+2nu(G-e;N) <= 2k+1.

Thus all terms are tight: tau(G;N)=2k+1, nu(G-e;N)=k, and tau(G-e;N)=2k. For an admissible forbid child, its cover optimum is at least tau(G;N), and minimality bounds it by twice its packing optimum; integrality gives a packing jump of at least one. No generic strictness premise is used.

If a triangle has only one allowed edge e, every cover is forced to contain e. Its footprint {e} can be appended to any G-e packing. These give exact increments one in both optima, contradicting minimal failure by the residual inequality. Hence no such triangle exists in a minimum failure. Every further forbiddance is then admissible, because a newly all-forbidden triangle would have had two old N edges and one allowed edge. The frozen argument correctly derives this fact rather than importing an ordinary-counterexample lemma.

## Independent semantic controls

`reviews/critic_mixed_controls.py` is a new standard-library checker. It examines all 729 absent/allowed/forbidden edge colorings of a fixed four-vertex universe, explicitly rejecting 93 inadmissible cases and checking 636 admissible instances. It verifies finite weighted-cover semantics, 1,356 allowed-edge branches (252 with inadmissible forbid children), 1,104 fan identities, and all 738 inclusion-maximal active packings encountered. No solver bound or timeout is interpreted as an optimum.

Three targeted Lemma 4 controls retain additional forbidden background edges and, in one case, vertex-sharing old clique components. Their independently enumerated (old nu,old tau; new nu,new tau) values are (1,2;2,3), (2,4;4,5), and (2,4;4,5). A same-apex negative control correctly violates old-N inactivity. The results are in `reviews/critic_mixed_controls.json`. These are semantic controls for the ordinary proof, not a replay of the historical census and not evidence for a universal conjecture by enumeration.

Reproduce locally from the workspace with the pinned environment:

    source PRIVATE_PATH_REMOVED
    python reviews/critic_mixed_controls.py

No external messages, remote mathematical execution, installation, source edits, or new formalization were used. No unrestricted solution or literature-priority claim follows from this review.
