> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Redirect memo: the precise missing digit inequality

2026-10-27, Session 01. Read alongside `APPROACHES.md`, `DIAGONAL_INEQUALITY_REVIEW.md`, and `LATE_CONCEPTUAL_REVIEW.md`. This is a conceptual redirect, not a proof of the frozen target. No numerical scan, large computation, or Lean build was performed.

## 1. Hypothesis H and its status

Write `S` for decimal digit sum and `d` for positive decimal digit length. The proposed statement is

    H: for all integers k>=2 and 1<=s<=k with 10 not dividing k,
       S(k^s)>s.

**Hypothesis, not proved here:** no reviewed source establishes H, and the session found no counterexample. This is a report about the reviewed material, not a claim that the entire literature has been exhausted. The condition is `10∤k`, not `gcd(k,10)=1`; powers of two belong to its domain. The exclusion of `k=1` is necessary because `S(1^1)=1`.

H is much stronger than excluding equality on the decimal-length curve. A value with `S(k^s)<s` would refute H without producing an A113010 fixed point.

## 2. Proved implication: precisely which powers of two H controls

Fix positive integers `t,s`, put `k=2^t`, and write `E=t*s`. The hypothesis `k>=s` is exactly

    s<=2^t, equivalently E<=t*2^t.

Consequently H would imply

    S(2^E)>E/t

for each positive divisor `t` of `E` satisfying `E<=t*2^t`. Integrality gives the equivalent lower bound `S(2^E)>=E/t+1` on these pairs. One cannot choose an arbitrary real or integer `t` near `log_2(E)` while ignoring `t|E`.

For each `E`, the strongest bound obtained by this substitution uses the least positive divisor `t` satisfying that inequality; the divisor `t=E` always exists and yields only `S(2^E)>1`. For prime `E>=3`, divisors are 1 and E, and `t=1` is inadmissible because `E>2`. Thus this substitution gives only the trivial bound for every such prime exponent. It does not establish an `E/log E` lower bound for all E.

There is nevertheless an explicit infinite strong subsequence. Choose

    s=2^t, k=2^t, E_t=t*2^t, t>=1.

Then H implies `S(2^E_t)>2^t=E_t/t`. Since

    log(E_t)=t*log(2)+log(t),

this threshold is `(log(2)+o(1))*E_t/log(E_t)`, with natural logarithms. This is a conditional lower bound on the specified subsequence, not a statement about other exponents or about the existence of fixed points.

For scale comparison, Radcliffe proves the unconditional bound `S(2^E)>log_4(E)` for positive E; that theorem is far below the conditional diagonal threshold. The primary text was rechecked for this memo: [The growth of digital sums of powers of two](https://arxiv.org/pdf/1605.02839), main result on pp. 2–3. This comparison neither refutes H nor proves it inaccessible.

## 3. A genuinely weaker length restriction, and its limitation

Consider

    L0: if k>=10005, s>=1, 10∤k, and d(k^s)=k,
        then S(k^s) != s.

**Hypothesis:** L0 is not proved. **Proved implication:** H implies L0, because the upper length inequality gives `s<k/log_10(k)<k` in this range. L0 asks only for non-equality on the exact length curve and avoids H's whole diagonal `k=s>=10`.

Even the strict version of L0 has a qualified power-of-two consequence. For `k=2^t` in its range, its integer exponent must lie in

    (2^t-1)/(t*log_10(2)) <= s < 2^t/(t*log_10(2)).

If such an integer exists, `E=t*s` is a multiple of t and a strict inequality would give `S(2^E)>E/t`. The interval has width `1/(t*log_10(2))`; no argument here proves that it contains an integer for infinitely many t. The non-equality version L0 would imply only `S(2^E)!=E/t`, not a lower bound. These distinctions prevent transferring the diagonal consequence of H to L0 without justification.

L0 alone does not classify bases divisible by ten.

## 4. Proved conditional reduction: the gap H leaves after normalization

For an additional fixed point write its digit-count base uniquely as

    k=10^v*u,  v>=0, u>=1, 10∤u,
    n=k^s,    s=S(n).

Trailing-zero normalization gives exactly

    S(u^s)=s,
    v*s+d(u^s)=10^v*u=k.

The pure-ten core `u=1` is excluded by an existing separate theorem. Thus consider `u>=2`.

**Proved implication conditional on H:** if `u>=s`, applying H to the core u contradicts `S(u^s)=s`. Hence H would force every remaining additional point into

    2<=u<s,   v>=1,   10^v>log_10(k).

Indeed `v=0` would give `u=k>s` on the length curve. Also

    log_10(k)<k/s=10^v*u/s<10^v.

These are conditional restrictions, not unconditional new theorems about fixed points. H says nothing about the needed equality for `u<s`. Such equalities really occur: `S(2^5)=5` and `S(2^70)=70`. The separate length-lift condition allows known 32 in the first case and rules out the second. Merely classifying an equality of core digit sums is therefore different from producing a fixed point.

## 5. A length-sensitive target that would actually suffice

With the existing finite classification and pure-ten exclusion retained, the following statement is sufficient:

    L: for all u>=2, v>=0, s>=2501 with 10∤u,
       set k=10^v*u and suppose k>=10005 and
       v*s+d(u^s)=k;
       then S(u^s) != s.

**Hypothesis:** L is not proved. **Proved implication:** L, together with the already formalized small-range and pure-ten results, would leave only 1 and 32. An additional fixed point would supply precisely a prohibited tuple. Strict `S(u^s)>s` would also suffice, but is stronger than necessary.

L is a narrower equality-exclusion target than demanding digit-sum growth for every power. It is not literally a logical weakening of H: its domain includes `u<s`, which H does not cover. This correction matters. A convenient sufficient split is H plus the complementary statement

    C: under L's hypotheses, with 2<=u<s and v>=1,
       S(u^s) != s.

H handles `u>=s`; C handles the remaining normalized domain. Alternatively prove L directly and avoid H's unnecessary off-curve burden. L is essentially the unresolved equation rewritten with precise quantifiers; naming it supplies a research target, not a new proof mechanism or an upper cutoff.

## 6. What the reviewed results do and do not establish

None of the following reviewed results proves H, L0, C, or L.

- Fixed-base digit bounds, including the Radcliffe theorem above and the valuation bounds reviewed in the late note, provide logarithmic-scale lower bounds. They do not give the required linear comparison to the exponent along H's explicit diagonal. Constants or thresholds for a fixed base cannot be treated as uniform when the base varies.
- Hare–Laishram–Stoll's [Stolarsky ratio theorem](https://arxiv.org/pdf/1001.4169), Theorem 1.3, concerns the ratio to the root's digit sum at fixed polynomial/exponent. Its reviewed construction has at least `4s+1` separated output contributions. It supplies neither a proof nor a counterexample to H.
- Moscariello's [sparse-square construction](https://arxiv.org/pdf/2101.10415), Theorem 10, fixes exponent two and guarantees a specified number of nonzero digits. It does not produce digit sum at most the growing exponent required to challenge H, nor impose our length matching.
- Bennett–Bugeaud–Mignotte [Remark 2, pp. 10–11](https://www.math.ubc.ca/~bennett/BBMshort-final-modified.pdf) permits varying numbers of distinct unit terms, but bounds a prime exponent under a fixed positive proportional-gap condition and a coprimality condition. Thus varying support alone is not the objection. Decimal coefficients, absent uniform gaps, and possibly 2,5-smooth growing exponents prevent direct application here.
- Wang–Xiao [Theorem 4.4](https://arxiv.org/html/2604.26497v1) fixes support size, power exponent, and endpoint-gap parameters. Its conclusion does not supply the moving-parameter decimal estimate needed here. The session's effective fixed-polynomial separation theorem likewise requires block width proportional to s; on the length curve that width is logarithmic in the base while s is much larger.

These are checked applicability limits of specific sources, not a theorem that all sparse-power, S-unit, or p-adic methods must fail.

## 7. Concrete first question for a fresh session

Start with one exact, falsifiable length-curve family rather than attempting all of H or extending enumeration:

    For every j>=0, let T=4*10^j, B=10^T, s=B/T, k=B+1.
    Is S((B+1)^(B/T)) > B/T always true?

The uniform assertion is an unproved proposed first question. The `j=0` member is already excluded by the formal suffix certificate for `10001^2500`, whose suffix weight exceeds 2500; the new task is uniform control for `j>=1`. Existing results already establish `d(k^s)=k`, the modulo-9 condition, and `10∤k` for every member. Both exponent and the binomial carries grow; fixed-exponent polynomial separation does not apply. The late note identifies the actual endpoint digits and shows that fixed proportional-gap theorems and fixed-order approximations by `exp(1/T)` do not settle it.

The useful deliverable is a uniform argument controlling the weighted digits in this family, or an exact structural counterexample to the displayed strict inequality. A finite check of more j is not the proposed work. A strict-inequality counterexample with digit sum below s would still not be a fixed point; equality would be decisive because length is already matched. Even a proof for this family would settle only a diagnostic subfamily and would leave C and the rest of L open.

This first question tests whether a proposed new method actually handles the growing-exponent length regime, while avoiding the stronger, extraneous diagonal obligation built into H.

Status: all proposed inequalities are labeled hypotheses; the substitution and sufficiency statements above are proved deductions. No builds, scans, or owned processes were started for this memo.
