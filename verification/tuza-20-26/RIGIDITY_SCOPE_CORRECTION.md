# Rigidity notation and implication correction

This is a mathematical scope clarification for the publication layer. Historical source files should retain their bytes and carry an adjacent pointer to this clarification.

## Precise source statements

- `problems/TUZA-25/notes/residual_family_freeze.md`, lines 5–15, defines F by fresh K4/K5 attachment along complete overlaps of size 2 through s−1, adds W5, and explicitly defines “Candidate R-F”. Its line 15 states that even R-F would require missing restoration cases before implying CS. This caveat is correct and must remain.
- `problems/TUZA-25/PROOF_CHAIN.md`, sections 3–6, uses the different, explicit C12 minimum-Q universe and proves conditional predecessor reconstructions. It expressly leaves global availability open. It supplies no missing universal implication from broad R-F.
- `problems/TUZA-26/PROOF_CHAIN.md`, line 47, says: “Global R would be a stronger sufficient route through archived restoration”. The shorthand R is not defined there with enough precision to distinguish the earlier broad R-F from the narrower twelve-model assertion. Its sufficiency sentence is valid for the precisely stated R12 below; it must not be exported as sufficiency of R-F. Line 3’s open “global defect-one rigidity R” should likewise link to explicit definitions.
- `problems/TUZA-26/REPORT.md`, line 3, uses “global R” only to say it is not proved. That status statement is safe, but should use the same disambiguation pointer.

## Proposition R12 implies global CS

Let B mean that each actual shared-edge triangle component has literal K4 or K5 support. Let CS(G) mean tau(G)≤2nu(G), with equality if and only if B(G). Let C12 be the twelve explicitly frozen graphs: nine central-K4 stars with leaf words 4,5,44,45,55,444,445,455,555; two K5s on a common edge; the six-vertex wheel with five-cycle rim; and K5 minus an edge. A leaf Ks is attached along its own edge of one root K4 star with all non-root vertices mutually fresh, and the graph is the exact union of piece edges.

R12 is the assertion that every finite graph H whose nonempty triangle support is connected through shared graph edges, with tau(H)=2nu(H)−1 and nu(H−e)=nu(H) for every edge e, has triangle support isomorphic to a member of C12.

Assume R12 and suppose universal CS fails. Choose G with the fewest edges among failures. The proved minimum-parent extraction (Lemma A, R1/R2, the attachment, triangle-plus-edge and two-triangle extension results at their archived scopes) gives tau(G)=2nu(G), not B(G), and an actual triangle T such that H=G−E(T) has connected nonempty single-edge-resilient defect-one triangle support. R12 makes that support a member of C12. The proved strict triangle-restoration theorem for each C12 support, retaining every background edge and all actual triangles, gives tau(G)≤2nu(G)−1. This contradicts the parent equality. Therefore universal CS holds. Its inequality clause immediately gives Tuza.

This is a sufficient implication, not an equivalence. It does not use Q minimality or the final minimum-Q profile. R12 also implies R-F because every listed C12 graph has its frozen F certificate (or is W5). The archive establishes neither the converse R-F⇒R12 nor R-F⇒CS. Conditional reductions for supplied broader clique overlaps do not establish availability or closure for all members of F.

A graph refuting R12 or R-F would have defect one and would itself satisfy Tuza strictly; such a graph would not by itself refute CS either, since its strict inequality satisfies the equality characterization.
