# Final formal proof and publication verification status

**Current paper artifact.** The [revised technical report](../../papers/tuza-five-degenerate/README.md) is identified by the [current editorial artifact record](editorial/CURRENT_ARTIFACT.json). The original paper QA/publication-verification PDF hash and original publication review below refer to the earlier 20-page PDF (`41c4c501…415bd`). Those historical records are preserved unchanged. This editorial revision verifies source identities and presentation; it performs no new Lean build/replay and changes none of the 280 mathematical source files.

**COMPLETE.** Every finite simple five-degenerate graph satisfies $\tau(G)\le2\nu(G)$, with equality exactly when every nonempty triangle component connected through shared graph edges has literal edge support $K_4$ or $K_5$. Graph order and maximum degree are unrestricted. Empty/triangle-free graphs, background edges and blocks sharing vertices are included.

The exact declaration [Tuza06.five_degenerate_combined](lean/Tuza06/FiveDegenerate.lean) is:

```lean
@Tuza06.five_degenerate_combined :
  ∀ {V : Type u_1} [Fintype V] [DecidableEq V] {G : SimpleGraph V},
    Tuza06.Degenerate G 5 →
      Tuza.tau (Tuza.triangles G) ≤ 2 * Tuza.nu (Tuza.triangles G) ∧
      (Tuza.tau (Tuza.triangles G) = 2 * Tuza.nu (Tuza.triangles G) ↔
        Tuza06.ComponentCliques G)
```

`five_degenerate_statement` proves the originally frozen `CombinedStatement G`. The sole substantive hypothesis is five-degeneracy; `Fintype` and `DecidableEq` are the ambient finite representation. There are **no additional unproved external mathematical inputs**. Unrelated conditional interfaces in four reused foundation files are not premises of this theorem. [Full definitions](FORMAL_STATEMENT.md) and [complete ordinary proof/formal coverage](../../papers/tuza-five-degenerate/main.md).

| Actual publication check | Result |
|---|---|
| Original mathematical freeze and all public copies | PASS: all 280 modules byte for byte |
| Fresh project rebuild from the public source tree | PASS: 280 modules, finished 2026-10-30T21:20:57.971780+00:00 |
| Complete public theorem types and transitive axioms | PASS: 618 declarations; only propext/Classical.choice/Quot.sound allowed |
| Exact standard-kernel replay of fresh objects | PASS: all 280 modules, finished 2026-10-30T21:30:37.107427+00:00 |
| Build/replay source and object identity binding | PASS: all inventories agree before/after replay |
| Pinned dependency/configuration bootstrap reuse | PASS: exact selector/manifest/configuration and nine package revisions unchanged |
| Independent finite certificates | PASS: all three portable checkers; nonpublic input-file resolution denied |

The printed main theorem and frozen-target proof use exactly `Classical.choice`, `Quot.sound`, `propext`. See the [actual reproduction summary](reproduction/publication-evidence/PUBLICATION_VERIFICATION.json), [full theorem/type output](reproduction/publication-evidence/MAIN_THEOREM_TYPES.log), [all 618 axiom reports](reproduction/publication-evidence/build/declaration-axioms.json) and [all command evidence](reproduction/publication-evidence/README.md). These are labeled public derivatives; their public hashes are distinct from original private evidence hashes.

Lean 4.33.1, compiler commit `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`, Mathlib `0df444a360eaa60ab8c11dca51a86af692955474` and all nine package revisions are pinned. Compiled pinned dependencies were reused. This is a fresh project rebuild, **not a cold Mathlib rebuild**. Replay uses the same standard Lean kernel through the unchanged upstream routine, **not an independently implemented kernel**. The unsafe IO/runtime-memory adapter is outside the mathematical import closure. The closure has no sorry/admit/custom axiom/native proof shortcut or hidden mathematical premise.

The original [source freeze](notes/FINAL_PROOF_SOURCE_FREEZE.json) has a historical PENDING field, and immutable definition-source comments describe obligations before their implementation. They are preserved as provenance; the actual final status is the completed theorem and evidence above. Selected older partial reviews are likewise historical, not undischarged premises. Exact `FiveDegenerate.lean` SHA-256: `978ebe0431fde9ecf9598538c6c01e06bcd9ee363bd5ee03a53b76c43143fadf`.

The [paper](../../papers/tuza-five-degenerate/main.md) maps its results to actual declarations, including `componentCliques_iff_decomposition`, the arbitrary-graph `componentCliques_equality`, genuine minimal obstruction, all local/overlap restrictions, second peeling, final reconstruction and arbitrary outside-page strict cover saving. [Selected internal AI reviews](review/README.md) explain the source/statement audit. Internal AI review and kernel checking do not establish historical priority or external human peer review.

The [publication-specific separate internal AI review](review/PUBLICATION_REVIEW.md) closed the exact paper/source/evidence review. Its final tree binding is retained privately to avoid self-referential report hashes.
