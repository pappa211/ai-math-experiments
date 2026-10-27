> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Session 02 — principal scratch review

The additive/coding representation was independently considered: a fixed point gives a decimal polynomial D with coefficients 0..9, degree k-1, D(1)=s, and D(10)=k^s. A bound on the minimum positive digit weight of multiples modulo k^s would be stronger than needed. On the length curve there are only at most nine positive k-digit multiples of k^s; a minimum-weight bound restricted to this span risks simply repackaging the target. Researcher B separately pursued this and found a useful exact obstruction to omitting the span restriction.

Several mechanisms considered but not promoted: digit-polynomial carry identity with nonnegative carry coefficients; derivative/moment inequalities at 10; minimal-counterexample descent by taking power roots. No nontrivial missing lemma was established for these. Root multiplicity of a symbolic polynomial cannot be inferred from divisibility at its single integer evaluation.

Tiny radix diagnostic (no bearing on decimal classification): for each s>=2, in radix b=2^s-s+1, n=2^s has two digits 1 and s-1, hence d_b(n)=2 and S_b(n)=s. Thus fixed points exist in varying bases by simple construction. This does not challenge any decimal-specific theorem. Also 4^4=256=(2011)_5 has four digits and digit sum4, showing a radix-independent version of H (k>=s and radix does not divide k implies digit weight>s) is false even on a length curve. The finite s=2..40 check of s^s in radix s+1 was only a quick diagnostic; no conjecture inferred. No external source needed for these exact elementary identities.

Status: no principal route to complete solution as of15:40 UTC. No Lean compilation, server computation, or persistent process started.

## Sharp specialization threshold (joint refinement of B's observation)

Let T>=1, B=10^T, and P in Z[X] have nonnegative coefficients and P(1)<=10. If B+1 divides P(10), then X^T+1 divides P(X). Reduce modulo X^T+1 to a signed remainder R of degree<T. Its coefficient l1 norm is at most10. Then |R(10)|<=10*10^(T-1)<B+1, so divisibility implies R(10)=0. Every nonzero integer polynomial vanishing at10 has coefficient l1 norm at least11: if leading coefficient has absolute value a>=1, the remaining coefficients must have total absolute value at least10a to cancel it. Thus R=0.

The weight threshold is sharp even for ordinary decimal digit polynomials: P=X^(2T)+X^(T+1)+9 has P(1)=11, P(10)=(B+1)(B+9), and remainder10-X modulo X^T+1 (for T=1 the further remainder is11, also nonzero). For T=1 the two leading monomials coincide, giving2X^2+9. Small exact checks T1..6 produced209,11009,1010009,100100009,10001000009,1000010000009, all weight11.

Correction to shorthand: remainder10-X is literal degree<T only for T>=2; atT1 it reduces to11. This has no effect on nondivisibility.

It generalizes to radix b>=2 with threshold b and witness X^(2T)+X^(T+1)+(b-1), interpreted as a nonnegative integer-coefficient polynomial (for b=2,T1 coefficient2 is not a binary digit, so the blanket decimal-digit qualification is only asserted for radix10 here). This is not a sufficient route: actual candidate weight s>=2501 exceeds10. No carry-bound uniform in s was proved.
