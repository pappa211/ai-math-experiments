> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# External mathematical sources consulted — Session 01

Consulted 2026-10-27. These distinguish prior literature from session deductions.

1. OEIS A113010, https://oeis.org/A113010 . Definition, fixed-point question,
   and Chai Wah Wu's February2019 comment reporting no others below10^1000.
   Existing numerical evidence only; no proof of the full conjecture stated.
2. David G. Radcliffe, *Digital sums of powers, factorials, and least common
   multiples*, May18,2026, https://radcliffe.dev/pdf/digital_sums.pdf .
   Elementary logarithmic bounds in special cases and exposition of Stewart's
   general fixed-base lower bound. These estimates do not reach the exponent
   s required by this project. Primary author-hosted PDF read by principal and critic.
3. David G. Radcliffe, *The growth of digital sums of powers of two*, March29,2015,
   https://oeis.org/A001370/a001370_1.pdf . Elementary S(2^n)>log_4 n bound;
   linear growth is presented as conjectural. Read by principal and critic.
4. Bennett, Bugeaud, Mignotte, *Perfect powers with few binary digits and related
   Diophantine problems*,2013,
   https://www.numdam.org/item/ASNSP_2013_5_12_4_941_0.pdf . Consulted by critic;
   bounded sparse expansions do not directly cover a digit sum growing with s.
5. Hare, Laishram, Stoll, *Stolarsky's conjecture and the sum of digits of
   polynomial values*, author-institution page
   https://www.isid.ac.in/~statmath/index.php?Action=ViewAbs&PreprintId=151&module=Preprint .
   Consulted by critic; cautions against naive monotonicity of digit sums under
   polynomial maps. No direct counterexample to the proposed moving-base inequality.

The broad web search also surfaced arXiv2511.15850 / a ResearchGate copy of an
older Radcliffe version. Mathematical reliance is on the author-hosted primary
source above, not the aggregator. No source is used as an unproved Lean axiom.

Additional review sources: Moscariello, *Lacunary Polynomial Compositions*,
https://arxiv.org/abs/2104.11704 (v2); *On sparse perfect powers*,
https://arxiv.org/abs/2101.10415 ; Corvaja–Zannier,
https://doi.org/10.5802/aif.2774 ; Darsana–Nair–Rout,
https://arxiv.org/abs/2610.08310 (October2026 preprint; actual Theorem1.2 subsequently inspected, with prime-exponent, coefficient and spacing restrictions).
Critic's exact source-use limitations are in CRITIC_SECOND_REVIEW.md. No result
from these papers is assumed in the Lean proofs. A2014 Mathematics Stack
Exchange question led to the independently verified exponent70 example:
https://math.stackexchange.com/questions/868683/find-all-positive-integers-n-such-that-sum-of-digits-of-2n-is-equal-to-n .

Evertse–Schlickewei–Schmidt, *Linear equations in variables which lie in a
multiplicative group*, Annals155(2002),807–836, Theorem1.1:
https://arxiv.org/pdf/math/0409604 and
https://annals.math.princeton.edu/2002/155-3/p04 . Critic read the theorem;
it bounds solution counts for fixed dimension/rank/group, not the varying
parameters or heights required here. See CRITIC_THIRD_REVIEW.md.

Sandro Mattarei, *Root multiplicities and number of nonzero coefficients of a
polynomial*, arXiv:math/0512239v2,20January2006,
https://arxiv.org/abs/math/0512239 and https://arxiv.org/pdf/math/0512239 .
The characteristic-zero support/multiplicity bound is explicitly identified as
previously known. PolynomialSupport.lean is an independent formalization of
this known mathematical fact, not a novelty claim.

GNU MP6.3.0 official manual, implementation reference for bounded numerical
experiments only: https://gmplib.org/manual/Integer-Internals ,
https://gmplib.org/manual/Converting-Integers ,
https://gmplib.org/manual/Integer-Exponentiation . Checked public mpz fields,
conversion-buffer sizing, and exact modular/integer exponentiation APIs.
No GMP calculation is accepted as a Lean kernel certificate.

## MPFR exact outward candidate enclosures

GNU MPFR4.2.1 manual: https://www.mpfr.org/mpfr-4.2.1/mpfr.html . Directed rounding, correctly rounded log10 and ui_div, and get_ui conversion with rounding upward justify the outer exponent interval in tail_search.py. Installed4.2.1 ABI/version checked by source. This is trusted-library numerical evidence, not a Lean certificate. The independent code review records both main and GMP-helper hashes.

## Further fixed-support literature check, 2026-10-27

Julie Tzu-Yueh Wang and Zheng Xiao, Families of Unit Equations and Exponential Diophantine Problems via Integral Points, arXiv:2604.26497v1 (29 April2026), https://arxiv.org/html/2604.26497v1 , Theorem4.4 and Remark4.5. The stated binary sparse-power result fixes the number of terms, the power exponent, and positive proportional endpoint-gap parameters. It gives algebraic degeneracy outside finitely many exceptions. It supplies neither a uniform height bound nor a decimal theorem with a growing digit budget. Not used as a proof premise here.

BBM's precise uniform-gap generalization was rechecked in concluding Remark2, pp10–11 of the primary author version https://www.math.ubc.ca/~bennett/BBMshort-final-modified.pdf . Its stated prime-exponent bound depends on the fixed proportional gap, not on a fixed term count. The gap, coefficient, and prime-exponent restrictions remain essential; see LATE_CONCEPTUAL_REVIEW.md. Broader searches for growing-exponent digit-sum results did not identify another applicable theorem; absence from this search is not a completeness claim about the literature.
