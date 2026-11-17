> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Authentication of the declared Gallai-Edmonds input

Authenticated 2026-11-16 for frozen `unicyclic_exposable_leaf_matching_v1.md`.

Primary research-paper restatement: Busch, Ferrara, Hartke, Jacobson, Kaul and West, *Packing of Graphic n-tuples*, author manuscript dated January10,2011, [author-hosted PDF](https://dwest.web.illinois.edu/pubs/degpack.pdf), theorem3.6 on printed/PDF page9. Local archive: `literature/gallai_edmonds_authentication/busch_et_al_degpack_20110110.pdf`, 150870bytes, 12pages, SHA256 `11a5945258dc4818c5492df9e62962f75e84d4584659a974ed32586bcb7ac264`. Exact page text and retrieval receipt are beside it.

The source defines its A as vertices exposable by a maximum matching and its B as their outside neighbors. The theorem states factor-criticality of A-components and decomposes every maximum matching into near-perfect matchings there, a perfect matching in C, and edges from B into distinct A-components. Thus source(A,B,C)=mission(D,A,R). Because B vertices are not exposable, every maximum matching saturates them; counting the remaining unmatched components gives d=#components(D)-|A|.

The original attribution is Gallai1963/1964 and Edmonds1965. Gallai's 1964 publication metadata were rechecked at the [Academy repository](https://real.mtak.hu/189486/): volume9(3),401–413, published-version PDF available.

The exact standard statement is authenticated. Its complete historical proof was not independently re-proved. The new unicyclic deductions therefore retain PROOF_USING_DECLARED_INPUT status; the earlier self-contained forest proof remains separate.
