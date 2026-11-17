> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Surviving existential choice: a concrete private rotation

Status: exploratory global route with a proved graph-specific exchange. D-all and D-some-extension were refuted by the frozen four-cone example; neither is reused as a premise.

## Quantifier and objective

Fix a minimum ordinary triangle cover C and let q=nu(F_C). Define

    p*(G,C) = max {|P| : P is a full triangle packing and |P intersection F_C|=q}.

A packing P with q private triangles exists by extending a maximum private packing. Conversely every maximum-private Q and full extension P containing it have exactly q private triangles, since more would contradict the definition of q. Thus p* is exactly the largest full extension size over all choices of maximum private Q.

The stronger surviving fixed-cover target is:

    for every G and every minimum C, |C| <= 2 p*(G,C).

The mission's D-some-choice only asks for some minimum C. Both remain conjectural. The four-cone witness has p*=32 for its displayed C, because a maximum full packing contains a maximum private20-subpacking; that example does not distinguish these two surviving targets.

The statement that some maximum private Q lies inside a maximum full packing is stronger still. It could fail even while p* remains above the Tuza threshold. It is an optional discriminator, not an assumed mechanism or a necessary proof obligation.

## One rotation repairs the bad witness

Use the local coordinates and gluing of notes/challenger_D_counterexample.md. The bad Q contains in piece i the private triangle z_i,5_i,27_i. Replace it by

    z_i,20_i,27_i.

The new rim has XOR15, so it is an actual edge. Vertex27 is in I and20 is outside I, so the new triangle is private for the same cover C. The old and new triangles share only the27 spoke. The20 spoke was unused, and the new rim is not a boundary edge; hence replacing this single triangle preserves edge-disjointness, cardinality20 and maximum-private optimality.

Two full triangles are now free:

1. z_i,5_i,10_i, whose rim has XOR15 and uses the newly freed5 spoke and the previously unused10 spoke;
2. the previous piece's triangle on its outgoing edge10_(i-1),20_(i-1), identified with the newly freed rim5_i,27_i.

The first new triangle is confined to piece i and uses no shared rim. The second lies in the previous piece and uses the freed shared rim. They may share a vertex, which is allowed, but no edge. Their other spokes were unmatched in the original Q. Both avoid the revised Q. Thus one private-triangle replacement turns the locked20-packing into a maximum-private20-packing with a22-triangle full extension, exactly meeting tau44/2.

Replacing the local private matchings by the five I-crossing edges of the XOR15 perfect matching gives the stronger global32-extension. The one-rotation observation identifies the smaller repair actually needed to reach the factor-two threshold.

## Why this is a mechanism, and what remains missing

The rotation releases two distinct constraints: its old rim was blocking a neighboring piece, and its old spoke was blocking a local full triangle. The new triangle uses a previously unmatched spoke. This is a graph-endpoint exchange, not an abstract reassignment of triangle labels. It preserves the required maximum-private cardinality and the same minimum cover.

An exploratory next target is an availability theorem: when a maximum-private choice Q plus a maximum residual extension lies below |C|/2, can some private alternating exchange increase the maximum residual packing? Choosing Q to maximize the residual packing prevents such an exchange, so a proved availability result would contradict a deficient optimal choice and prove the fixed-cover target. No availability theorem is currently proved, and calling the choice optimal supplies no exchange by itself.

Reasons to pursue: (1) the decisive obstruction is a bad choice, and this literal repair demonstrates how rechoice can release multiple full triangles; (2) cardinality-preserving private exchanges preserve the exact quantifier that failed. Risks: (1) arbitrary private packing systems need not admit matching-like alternating paths; (2) endpoint exchanges can consume other outside triangles or require simultaneous changes of unbounded size. The next discriminator must retain all outside edges and all color patterns and should seek a local optimum that is still deficient, not enlarge this already-understood cycle family.

Global scope remains conjectural. This is a scoped exchange on the witness and a precise new question, not progress on the unrestricted availability obligation.
