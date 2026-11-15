# Route C results: frozen limitation, no positive amplifier

Status: **DEPRIORITIZE** as a positive route; **REDIRECT** proposed allocation. Complete statement/proof: [C_FROZEN_PROOF.md](C_FROZEN_PROOF.md).

Frozen proof SHA-256: `aaa75c165295bd04bf2cd712bc171c34f871295a9fe9c14581a140adaa4cc1c0`.

- C1: arbitrary fractional G-copy systems of edge load at most one have integral packing >= M nu*(G)-e(N)N^2, uniformly e(N)->0. Dense copied integral obstructions cannot retain only M nu(G)+o(M) packing when nu*(G)>nu(G).
- C2: a graph homomorphism to G plus an edge partition into label-respecting G copies gives exactly tau(X)=r tau(G) and nu*(X)=r nu*(G). Every actual crossing triangle projects to a base triangle, so these equalities concern the full triangle family.
- Affine partial-slope graphs provide a distinct precise construction with all actual triangles classified. The 16-vertex proper partial-slope K4 example has 72 edges, 96 triangles, 12 edge-disjoint planted copies, tau=24, nu*=24, and a verified 20-packing; nu<=21. Its exact integral optimum is NOT_COMPUTED.
- A universal integral-packing replication component fails on that ordinary graph. A construction assertion restricted to hypothetical Tuza counterexamples may be vacuous and is not called a finite refutation. There is no actual Tuza violation here.
- Optional ordinary refinement: tau(G)<=2nu*(G)-1 for any graph with a triangle, adapting Krivelevich's induction. Originality UNESTABLISHED; not quoted as the literal published theorem.
- No credible new candidate outside the proved limitation class was developed. No longer positive Route C campaign is recommended on current evidence.

Primary editions and access: [C_PRIMARY_DEPENDENCIES.md](C_PRIMARY_DEPENDENCIES.md). Snapshots and before/after checks: [C_SOURCE_LEDGER.json](C_SOURCE_LEDGER.json), PASS. Protection was read-only operating convention plus content checks, not OS-enforced immutability.

Reproduction (from workspace, existing Python only):

```sh
LOCAL_ENVIRONMENT checks/c_affine_diagnostic.py --output evidence/c_affine_diagnostic.json
LOCAL_ENVIRONMENT checks/c_affine_verify.py evidence/c_affine_diagnostic.json
```

Finite producer/verifier code was written in one scout context, with different construction/enumeration logic and no shared imported implementation. Fresh independent critic verification remains separate; independently commissioned final verification NOT_RUN. No heavy computation, package installation, external messages, or publication. Route C has no running background jobs.

Domain qualification and explicit partial-slope cover predicate: [C_ADDENDUM.md](C_ADDENDUM.md). The frozen proof bytes are unchanged.
