# Every rank-four binary restriction has a minimum odd triangle cover

Status: complete ordinary rank-four theorem with a complete exact discriminator. The proposed all-rank hypothesis H-BTF remains open. No actual-graph counterexample, unrestricted Tuza theorem, originality claim, or formal verification is asserted.

## Statement and exact scope

Let E be any subset of the nonzero vectors of F2^4. Its triangles are the triples of distinct points `{x,y,x+y}` contained in E. Let tau(E) be the fewest points meeting every such triple, and let pi(E) be the fewest points meeting each triple in one or three points. Then

`pi(E)=tau(E)`.

No TF hypothesis is needed in rank four. The same conclusion holds for every simple binary geometry of rank at most four by a linear embedding into F2^4.

The original discriminator H-BTF asks whether TF implies this equality at EVERY binary rank. Here TF means that every triangle is contained in some minimum point cover, equivalently

`tau(E minus T)=tau(E)-3` for every triangle T.

The rank-four result settles only its stated bounded class. Fano has `tau=pi=3` and triangle-packing number one, so even an all-rank normalization statement would not establish a binary analogue of Tuza by itself. An actual graph's edge-point representation is binary, but arbitrary binary restrictions need not be graphic.

## 1. Caps and affine hyperplanes

Call a point set a cap if it contains no triangle. If alpha(E) is the maximum cap size inside E, then `tau(E)=|E|-alpha(E)`.

A set B lies in an affine hyperplane `{x:ell(x)=1}` for a linear functional ell if and only if no odd-cardinality subset of B sums to zero. Indeed assigning value one to every member of B extends to a linear functional on its span exactly when every linear relation among those members has even length. Such a functional extends to the whole ambient vector space. If B is nonempty, it is automatically nonzero.

An affine hyperplane of value one is a cap: three points summing to zero cannot all have ell-value one. Its complementary value-zero hyperplane meets every triangle in one or three points. Therefore, if E has a maximum cap of the form `E intersect {ell=1}`, the complementary E-points form an odd minimum cover.

## 2. The only non-affine caps in rank four

**Lemma.** A cap B in F2^4 that is not contained in an affine hyperplane is exactly a five-element binary circuit Q.

Choose an odd-cardinality zero-sum subset Q of B of minimum size. It has no nonempty proper zero-sum subset: an odd such subset would contradict minimality, while removing an even such subset would leave a smaller odd zero-sum set. Thus Q is a circuit. A rank-four binary circuit has at most five points. Its size is odd; nonzero points rule out size one and the cap condition rules out size three. Hence Q has five points, with every four linearly independent and all five summing to zero.

The ten pair sums of Q are distinct. If two different pairs shared an endpoint, equality of sums would make the other endpoints equal. If the pairs were disjoint, their four points would sum to zero, contradicting that every four members of Q are independent. None of these sums belongs to Q, by its cap property. There are exactly ten nonzero points outside Q in F2^4, so these ten pair sums exhaust the complement.

Consequently no outside point can be added to Q without making a triangle. Since B is a cap containing Q, it must equal Q. QED.

This identifies a precise rank boundary: the argument that pair sums exhaust the complement uses the fifteen-point ambient geometry. It is not valid in a larger binary rank.

## 3. A five-circuit can be replaced at equal size

Let Q be the five-circuit above, and let E strictly contain it. Choose any `z in E minus Q`. By the pair-sum description, `z=q1+q2` for a unique pair q1,q2 in Q. Set

`Q'=(Q minus {q1}) union {z}`.

Q' is still a cap. Any new triangle would have to use z and two old Q-points, but its pair must be exactly q1,q2, and q1 has been removed.

Furthermore Q' lies in an affine hyperplane. The four points `Q minus {q1}` form a basis. Define ell to have value one on each of them. Since q1 is the sum of those four basis points, `ell(q1)=0`; therefore `ell(z)=ell(q1)+ell(q2)=1`. Thus ell equals one on every point of Q'.

If Q was a maximum cap of E, Q' is an affine maximum cap of the same size.

## 4. Proof of the theorem

If E is triangle-free, the empty cover is already an odd minimum cover, so both optima are zero.

Otherwise choose a maximum cap B of E. If B lies in an affine hyperplane `{ell=1}`, keep it. If not, Lemma 2 makes it a five-circuit Q. Since E contains a triangle, E cannot equal Q. Section 3 then replaces B by an affine cap B' of the same maximum size.

In either case, let ell be one on the chosen maximum cap. The larger set `E intersect {ell=1}` is also a cap, so maximal cardinality forces it to equal the chosen cap. Its complement `C=E intersect {ell=0}` has size `|E|-alpha(E)=tau(E)` and meets every triangle oddly. Therefore `pi(E)<=tau(E)`. The reverse inequality holds because every odd cover is an ordinary cover. QED.

A sharper formula follows: except when E itself is a five-circuit,

`alpha(E)=max_(nonzero ell) |E intersect {ell=1}|`.

For a five-circuit, alpha is five, every affine cap intersection has size at most four, and the empty odd cover remains valid because E has no triangles. The complete discriminator checks this formula and finds exactly the 168 five-circuits as exceptions.

## 5. Complete exact rank-four discriminator

The standard-library script `checks/binary_tf_rank4.py` enumerates all 32,768 labelled subsets of `{1,...,15}`, representing nonzero four-bit vectors. Its thirty-five triangle masks are exactly `{x,y,x xor y}`.

The ordinary cap optimum is computed by deletion DP. If E has no triangle, alpha(E)=|E|. Otherwise choose any contained triangle `{x,y,z}` and use

`alpha(E)=max(alpha(E-x),alpha(E-y),alpha(E-z))`.

Every cap omits at least one triangle point, proving the recurrence. The table stores a maximum-cap witness for every E.

For the parity optimum, write B=E minus C. Since each triangle has three points, C meets it oddly exactly when B meets it evenly. The script precomputes each point-subset's parity vector on the thirty-five global triangles, then enumerates every `B subset E`, retaining the largest B whose parity vanishes on all triangles contained in E. Across every E, this is exactly `3^15=14,348,907` submask states. It also computes the triangle-incidence matrix rank independently and confirms that the number of feasible B states is `2^(|E|-rank)` for every restriction.

TF is checked by the equivalent exact condition `alpha(E minus T)=alpha(E)` for every contained triangle. All retained cap and triangle-even witnesses are checked against the literal triangle masks.

Results:

- 32,768 restrictions in total.
- 3,049 triangle-free restrictions.
- 29,719 restrictions with triangles.
- 3,368 TF restrictions, including the 3,049 vacuous ones.
- 319 nonvacuous TF restrictions.
- Zero restrictions with `pi>tau`, even before imposing TF.

The exhaustive table is `evidence/binary_tf/rank4_exact_table.json`; it records each mask, size, binary rank, triangle count, both exact optima, TF status, optimum cap, optimum triangle-even complement, incidence rank, and kernel size. `rank4_summary.json` contains counts by point-set size and the complete optimum/status histogram.

### Exact finite classification of the TF qualifiers

The same bounded computation verifies that the 319 nonvacuous TF restrictions are exactly:

| Family within PG(3,2) | Number | tau=pi |
|---|---:|---:|
| A Fano plane | 15 | 3 |
| A Fano plane plus one outside point | 120 | 3 |
| A binary representation of the cycle matroid of K5 | 168 | 4 |
| All fifteen points except one | 15 | 6 |
| All fifteen points | 1 | 7 |

The K5 representations are the ten-point sets consisting of a basis and its six pair sums. Enumerating all four-point bases gives exactly 168 distinct sets, which are also precisely the complements of the 168 five-circuits. The script compares the union of these five explicitly generated families with the TF set from the independent deletion DP; they agree exactly.

This is a finite classification at rank four, not an unproved classification at arbitrary rank. There is no binary counterexample here for which graphic realizability needs to be rescued. Of the nonvacuous families, the K5 family is graphic. A Fano plane is not graphic because a simple graphic matroid of rank three has at most six elements; the larger projective families exceed the ten-element maximum for a simple rank-four graphic matroid. These observations do not change the normalization theorem.

## 6. Why linearity alone does not suffice: a nonbinary boundary

Root supplied the affine plane AG(2,3) as a useful control. It has nine points and twelve three-point lines, with at most one line through any pair. Its line hypergraph is linear, but it is not binary in the sense required above.

Every point lies on four lines. Four chosen points give sixteen point-line incidences. If no three are collinear, their six pairs identify six double counts, so they meet only ten lines. If three are collinear, there can be at most one such triple among four points; that triple saves one duplicate relative to the pair count, so they meet at most eleven lines. Therefore four points cannot cover all twelve lines. Any line together with one point on each of the other two parallel lines is a five-cover: it meets all nonparallel lines at the first line and all three parallel lines explicitly. Hence tau=5, and every line is contained in some minimum cover, so TF holds.

Over F2, the three rows in a parallel class sum to the all-one vector J. The four lines through a point p sum to `J+e_p`, because p occurs four times and every other point once. Their combination gives e_p. Thus the twelve-by-nine incidence matrix has full column rank. The all-one point vector is the unique odd cover, so pi=9.

This is a TF counterexample to odd normalization in a linear three-uniform hypergraph, but it is NONBINARY. Indeed a binary point representation would assign a nonzero binary vector to each point, with every line summing to zero. Applying the full-column-rank incidence matrix to each coordinate would force every assigned vector to be zero. It is therefore not an actual-graph triangle construction either. It cannot be used as a counterexample to H-BTF or to a graph claim.

## 7. All-rank obligation and stopping point

For arbitrary binary rank, TF is exactly the assertion that each triangle T has some maximum cap disjoint from T. Odd normalization asks for ONE maximum cap whose intersections with EVERY triangle are zero or two. The unproved step is a simultaneous exchange or uncrossing argument converting those separate TF witnesses into that one compatible cap.

The rank-four proof does not supply such an exchange: it never uses TF. In rank five, a five-circuit can be extended by a point outside its four-dimensional span while remaining a cap, so the crucial complete-cap replacement argument no longer covers all maximum caps. This is a failure of the rank-four proof mechanism, not a counterexample to the all-rank hypothesis.

No higher-rank census was launched merely because this one passed. The bounded discriminator is complete, the stronger rank-four theorem is proved, and H-BTF at arbitrary rank remains open.

## Reproduction and provenance

Run on the owner's local Mac, from the TUZA-19 workspace:

```sh
source LOCAL_ENVIRONMENT
python3 checks/binary_tf_rank4.py
```

The only mathematical input to the finite calculation is binary addition in F2^4. The proof is elementary and imports no external research theorem. The AG(2,3) control was supplied by root and reconstructed above. This note and its evidence hashes are recorded in `evidence/binary_tf/manifest.json`; execution and scope are recorded in `provenance.json`.

Original mission clock: start 2026-11-15 01:53:58 UTC, research cutoff 09:23:58 UTC, hard deadline 09:53:58 UTC. All computation was local Darwin, with pinned Python and its standard library. Requested controls Astra/Ultra; exact serving metadata is not exposed and is not asserted. No Lean, human review, remote execution or publication occurred. Independent fresh review of this rank-four theorem has not yet been claimed.
