# Route C independent initial note

Saved before receiving other scouts' arguments. Time: 2026-11-03T23:14:43.439696+00:00

## Leading candidate: dense edge-disjoint copy gluing with controlled closure
Fix a finite simple graph G. Seek graphs A_m, and m edge-disjoint labelled copies G_1,...,G_m whose union is A_m, with |V(A_m)|^2 <= K_G m, together with a proved bound nu(A_m) <= m nu(G)+r_m where r_m=o(m). Every actual triangle contained within a copy is planted; every other actual triangle is a closure triangle and must be accounted for. The cover bound tau(A_m)>=m tau(G) is automatic because the copies have disjoint edge sets. All vertices and edges of a successful specific family still need definition; this is a frozen construction target, not a claimed construction.

## Shortest hypothetical proof
If delta(G)=tau(G)-2nu(G)>0, these inequalities imply delta(A_m)>=m delta(G)-2r_m. Since |V(A_m)|^2<=K_G m and |V(A_m)| tends to infinity, liminf delta(A_m)/|V(A_m)|^2 >= delta(G)/K_G>0, contrary to the uniform asymptotic Tuza theorem. Its exact primary-source quantifiers are to be authenticated before use.

## First unproved assertion
There is a dense gluing for each hypothetical counterexample whose full actual triangle packing increases by only o(m) over the within-copy integral optima. The cover lower bound is already elementary; the all-packing upper bound is the missing step.

## Strongest likely obstruction
For any edge-disjoint copy gluing, copywise fractional packings combine to give nu*(A_m)>=m nu*(G). The uniform integer/fractional packing approximation then forces nu(A_m)>=m nu*(G)-o(|V(A_m)|^2). Thus dense gluing necessarily gains at least m(nu*(G)-nu(G))-o(m). Krivelevich's mixed bound tau(G)<=2nu*(G), if authenticated, makes the gain >=m delta(G)/2-o(m) for any hypothetical violation. Triangle-separated gluing is also constrained by the triangle-removal lemma: many bounded-size components cannot occupy positive quadratic edge density.

## Cheap symbolic rejection
First compute disjoint unions: delta(mG)/|V(mG)|^2=delta(G)/(m|V(G)|^2) -> 0. For ordinary equal-size blow-ups, prove nu*(G[t])=t^2 nu*(G), tau(G[t])<=t^2 tau(G), and nu(G[t])=t^2 nu*(G)-o(t^2). For the candidate, prove the copywise fractional lower bound and test it on K4, where nu*=2 but nu=1: dense copy gluing must gain approximately one extra triangle per copy. A finite affine-line construction with q^2 copies on q|V(G)| vertices is a useful exact diagnostic: if all q slopes are allowed it is exactly an ordinary blow-up, exposing closure triangles rather than evading them.

## Progress beyond known identities
A new precise non-blow-up family with a substantial all-packing upper bound and positive normalized gap would advance the route. If it fails, a proved closure-growth theorem for every dense edge-disjoint gluing (including arbitrary vertex identifications and all closure triangles), with exact hypotheses and quantified unavoidable packing gain, is a potentially useful limitation result. Ordinary blow-up failure alone does not qualify as advance. No novelty claim is made for the prospective limitation theorem until targeted primary-source comparison.
