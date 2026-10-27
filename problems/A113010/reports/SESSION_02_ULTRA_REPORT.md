> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# A113010 — Session 02 Ultra exploration

**Assessment: PARTIAL_INSIGHT.**

**Zero credible new routes to a complete solution survived.** Two exact structural observations and several counterexamples sharpen the diagnosis of the difficulty. Neither original target is proved, and no additional fixed point or complete solution candidate was found. Recommendation: **STOP** the present research line unless a concrete new mechanism is proposed and another session is explicitly authorized.

## Time, configuration, and scope

- Actual recorded start: **2026-10-27 15:27:41 UTC**.
- Exact thirty-minute checkpoint: **15:57:41 UTC**.
- Actual research stop and elapsed duration: **2026-10-27 15:55:09 UTC; 27 minutes 28 seconds**.
- Administrative shutdown/report grace ends: **16:02:41 UTC**; it does not authorize more research.
- Canonical workspace: `the original research workspace`.
- Session 01 checkpoint preserved: `4efdf388099e1fea5542c2f1383c945c78a1e6e6`.

Three fresh researchers were launched with explicit tool parameters `model="gpt-6-astra"`, `reasoning_effort="ultra"`, and `fork_turns="none"`. A fourth fresh agent, the independent critic, used the same parameters after a research slot became free. The orchestration calls accepted that configuration. The principal agent's actual model identifier and reasoning mode were **not independently exposed by the runtime metadata inspected**, so this report does not claim independent verification that the principal itself ran Astra Ultra. There were at most four active agents including the principal; the critic followed the independent research phase rather than running concurrently with all three researchers.

The window includes orientation, context compaction, tool execution, agent activity, experiments, review, and synthesis. The three researchers began around 15:32 UTC. Researcher A received only the definition and known fixed points initially, sent its independent hypotheses around 15:35, and only then received Session 01's findings. A stopped at 15:44:39; B and C completed around 15:44–15:45. The critic began around 15:44 and stopped at 15:50:42 UTC. Exact final closure metadata accompanies this report.

The prescribed five Session 01 notes were read. Existing proof sources, the frozen definition and targets, Lean 4.33.1, and dependency pins were preserved. No installation, upgrade, large search, routine Lean compilation, runtime reconfiguration, or GitHub push was performed.

The unchanged question is whether the only nonnegative integers satisfying

$$
n=d(n)^{S(n)}
$$

are 1 and 32. The frozen Lean convention has `digits 10 0=[]`, so zero is not a fixed point. Session 01's formal exclusions through 10004 digits and digit sum 2500 remain the strongest formal bounds.

## Independent directions

**A — first-principles reconstruction.** The blind phase recovered the length interval, inverse parameterization, and trailing-zero normalization. Every one of those reductions was already in Session 01. After comparison, A tested whether counting nonzero large-base blocks could repair the failed transfer from block weight to decimal weight. Exact counterexamples rejected that mechanism. A found no new route.

**B — connections to additive relations, automata, and Diophantine bounds.** B treated the decimal digits as a positive relation modulo the full growing modulus `k^s`, rather than a fixed-modulus sieve. This produced the two exact diagnostics below. Shortest-path algorithms for minimum-weight multiples offer a precise formulation, but no useful uniform bound or compressed certificate was found. A direct generalized-abc substitution also fails to give the needed exponent comparison and has growing-dimension constants.

**C — inverse, descent, and counterexample reasoning.** C tested monotone induction on the inverse length curve, power-root descent, trailing-zero descent, and maximal perfect-power exponent. The monotonicity proposal has a small counterexample even after the length and modulo-nine filters. The natural descents do not preserve both fixed-point equations. The alternative encodings supply no new estimate.

**Independent critic.** A fresh critic checked the exact statements, exceptional cases, logical sufficiency, and novelty relative to Session 01. The verdict is PARTIAL_INSIGHT, with zero credible global routes; exact proof checks and scope cautions are recorded in `SESSION_02_CRITIC.md`.

## Retained observation 1: exact minimum-weight multiples require enormous span

For every `T>=1`, `s>=1`, put `k=10^T+1`. Then

$$
\operatorname{ord}_{k^s}(10)=2T k^{s-1}.
$$

The least positive multiple of `k^s` having decimal digit sum two is exactly

$$
10^{T k^{s-1}}+1,
$$

whose length is `T*k^(s-1)+1`. No multiple has digit sum one. Thus the unrestricted minimum digit sum of multiples is always two; for `s>=2`, its first weight-two witness already has more than `k` digits.

**Proof mechanism.** The order modulo `k` is `2T`: a proper divisor of `2T` is at most `T`, and `10^d-1` would then be too small to be divisible by `k`. For every odd prime `p|k`, the lifting-the-exponent identity gives

$$
v_p(10^{2Th}-1)=v_p(k)+v_p(h).
$$

This yields the order modulo `k^s`, including composite and nonsquarefree `k`. The plus-sign identity places `-1` at half that order. A digit-sum-two integer is either `2*10^a` or `10^a+10^b`; the former is impossible, and the latter forces the exponent gap to be at least half the order. Full proof: `SESSION_02_B_CONNECTIONS.md`.

**Difference from Session 01.** This uses the entire power modulus and determines the first minimum-weight witness exactly. Session 01's residue witnesses concerned fixed or bounded moduli and did not establish this result. This is new within the research archive; no publication-priority claim is made.

**Connection to the target.** It rigorously excludes weight two in the relevant short interval, but actual additional fixed points require weight at least 2501. It defeats unrestricted minimum-weight arguments and shows that a useful theorem must control weight and length jointly. It supplies no sufficient bound for growing weight.

**Minimum test for a proposed extension.** It must distinguish the interval of at most `k` digits from the explicit enormous weight-two witness. On the actual length curve, all positive multiples of `k^s` with at most `k` digits are among `j*k^s`, `1<=j<=9`. Simply naming their minimum weight is not a new proof mechanism.

## Retained observation 2: a sharp numerical-to-polynomial lifting threshold

Let `P` have nonnegative integer coefficients, `T>=1`, and `k=10^T+1`. Then

$$
P(1)\le10,\quad k\mid P(10)
\quad\Longrightarrow\quad X^T+1\mid P(X)\text{ in }\mathbb Z[X].
$$

In particular, `P(1)` is even. This includes decimal digit polynomials, and the threshold ten is sharp even for such polynomials.

**Proof mechanism.** Reduce modulo `X^T+1` to a signed remainder `R` of degree less than `T` and coefficient absolute sum at most ten. Then `|R(10)|<=10^T<k`; divisibility forces `R(10)=0`. A nonzero integer polynomial vanishing at ten has coefficient absolute sum at least eleven, by comparing its leading term with all lower terms. Thus `R=0`.

At weight eleven the decimal polynomial

$$
P(X)=X^{2T}+X^{T+1}+9
$$

has `P(10)=(10^T+1)(10^T+9)`, yet is not divisible by `X^T+1`. Its remainder is `10-X` for `T>=2`, and eleven for `T=1`, when `P=2X^2+9`. This gives an explicit failure of the hoped-for lifting beyond the stated threshold.

**Multiplicity also fails independently of weight.** Set `H=T*k^(s-1)`. For `s>=2`, the weight-two polynomial `X^H+1` evaluates to a multiple of `k^s` but contains `X^T+1` only once: all its complex roots are simple. Numerical divisibility by a high power therefore does not force symbolic root multiplicity, even at weight two, without further restrictions such as span.

**Difference from Session 01.** The earlier polynomial argument started with an actual symbolic power and used its root multiplicity. This lemma proves a limited passage from numerical divisibility to a symbolic factor, and locates its exact failure. It is a diagnostic advance, not an extension of the old proof to the needed regime.

**Connection to the target and minimum test.** The lemma handles only weight at most ten, far below the already excluded range. Any proposed extension must explicitly defeat both the weight-eleven carry witness and the weight-two multiplicity witness. No such extension was found. Requiring the missing growing-weight conclusion as a hypothesis would repackage the original obstacle.

## Rejected mechanisms and exact counterexamples

| Proposed mechanism | Exact obstruction | What is not concluded |
|---|---|---|
| Nonzero base-`B` blocks always number at least `s` in `(B+1)^s`, `s<=B` | `B=100,s=41`: 42 positions, only 40 nonzero blocks; zeros at positions 9 and 12 from the units block | The decimal sum is 347; this does not refute A113010 or a block claim restricted to T=4*10^j, s=10^T/T |
| Digit sum or excess increases along filtered inverse length candidates | `(s,k)=(52,106)` gives length 106, sum 493, excess 441; `(54,111)` gives length 111, sum 486, excess 432; both pass modulo nine and `10` does not divide either base | A different lower bound or eventual monotonicity restricted to k>=10005 is not excluded |
| Taking a power root gives a smaller fixed point | The fifth root of the known fixed point 32 is 2, which is not fixed; generally both length and sum change | This rejects automatic preservation, not every possible descent |
| Removing trailing zeros yields a fixed point of the normalized core | It preserves `S(u^s)=s` but requires the extra equation `d(u^s)=u` | The established normalization remains valid |
| Generic generalized abc immediately supplies a contradiction | Splitting into `s` unit terms gives conjectural exponent `2s-3`, larger than the target exponent `s`; retaining `m` terms leaves `2m-3` and constants depending on growing `m` | This is an applicability audit of that substitution, not a proof that all Diophantine methods fail |

The infinite family `N_t=32*10^(5t)=(2*10^t)^5` has digit sum and maximal perfect-power exponent both five, but length `5t+2`, so only `t=0` satisfies the required base/length match. It shows why controlling the digital equation alone does not create a counterexample by adding zeros.

## Evidence, sources, and limits

The two retained propositions have self-contained informal proofs checked by the principal and an independent mathematical critic. **No new result was formalized or verified in Lean during Session 02.** There is no complete candidate to submit to final-target verification.

`experiments/SESSION_02_DIAGNOSTICS.py` and its JSON output preserve tiny exact tests: 274 low-weight lifting instances among 4000 small multiples; six sharp weight-eleven witnesses; nine modular checks of the constructed weight-two exponent; the block-support counterexamples; and the two inverse-curve powers. Modular checks verify the constructed exponent, not its minimality; that comes from the proof. These calculations discriminate between mechanisms and do not extend the prior A113010 search range.

Material external sources are [Clokie et al., *Computational Fun with Sturdy and Flimsy Numbers*](https://drops.dagstuhl.de/opus/volltexte/2020/12771/pdf/LIPIcs-FUN-2021-10.pdf), its [expanded TCS article](https://doi.org/10.1016/j.tcs.2022.05.029), and [Hölzl–Kleine–Stephan, *Improved lower bounds for strong n-conjectures*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/881532D8B69924BBFA5C76A32A52063A/S1446788725000084a.pdf/improved_lower_bounds_for_strong_nconjectures.pdf). The first connection provides residue-state/shortest-path algorithms; Hölzl–Kleine–Stephan supplies the precise conjectural exponent and hypotheses used in the applicability audit. The new elementary diagnostics are session deductions, not results attributed to these sources. No exhaustive literature or independent priority review is claimed.

## Final assessment and recommendation

The principal obstacle remains uniform control of the exact decimal weight of a power on the length curve, including normalized cores smaller than the exponent. The coding formulation preserves the full arithmetic but lacks a usable weight-versus-length theorem. The sharp polynomial threshold and multiplicity counterexample explain why two natural shortcuts cannot supply that theorem.

There are **zero surviving credible proof routes**. The retained exact observations justify **PARTIAL_INSIGHT**, rather than a claim that the conceptual obstacle has been overcome. They do not justify more finite enumeration or routine formalization as a route to a complete answer.

Recommendation: **STOP.** Preserve the diagnostic lemmas and counterexamples; require a specific new mechanism before another research window. All four research/review agents have finished. The workspace process audit found no unattended research processes. Mathematical exploration and synthesis ended before the maximum checkpoint; the remaining work is administrative preservation only. Further work requires explicit user authorization, and the original six-hour mission remains closed.


Closure: the independent critic stopped at15:50:42 UTC; principal report review and synthesis continued until the actual stop recorded above. The full authorized thirty-minute maximum was not consumed. No further mathematical work was initiated after that stop. Exact repository/process checks are in SESSION_02_CLOSURE.json and SESSION_02_PRESERVATION_CHECK.json.
