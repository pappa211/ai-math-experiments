> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Late conceptual review: using both length and digit sum

2026-10-27, Session01; bounded pass beginning about12:01UTC. No large arithmetic computation, experiment, Lean build or owned persistent process was started. Evidence consists of independent deductions and primary-source applicability checks. The frozen problem remains unresolved. No claim that all conceivable methods fail is made.

## Assessment

No overlooked theorem was found that gives a credible uniform exclusion on the exact length curve. There is, however, a relevant refinement to the earlier assessment: some sparse-power prime-exponent bounds are uniform in the number of terms, so it is too broad to dismiss every such result solely for fixing the support. Their gap hypotheses and prime-exponent quantifiers still fail to address the existing survivor family.

The concrete deductions below use the simultaneous scales, rather than substituting the stronger general inequality H. They show exactly what the familiar fixed-support, gap and elementary p-adic routes leave uncontrolled.

## The simultaneous scale makes fixed-support finiteness redundant

Let m be the number of nonzero decimal digits of a hypothetical fixed point n=k^s. Then

    m<=s<=9m,
    k-1<=s*log10(k)<k.

For each fixed m, finiteness of k already follows from these elementary inequalities, with no sparse-perfect-power theorem. For example log10(k)<=sqrt(k) gives

    k-1<=9m*sqrt(k),
    k<(9m+1)^2<=100m^2.

More accurately, along any unbounded sequence of such pairs,

    k~s*log10(s),
    (1-o(1))*m*log10(m)<=k<=(9+o(1))*m*log10(m).

Thus a result that is merely finite for each fixed support or each fixed exponent adds no global cutoff. A useful theorem needs dependence on m and s that can be checked at log(n) of order m*log(m). An unspecified exceptional-height threshold for each m cannot be passed to a growing m. This is a quantifier obstruction, not a claim that every possible uniform theorem is impossible.

The same problem affects fixed-dimension S-unit bounds. Splitting digit coefficients into units gives s summands; retaining coefficients gives m summands and finitely many coefficient patterns for each fixed m. Either dimension grows. A bound on the number of solutions for each specified group and dimension does not bound the heights or make their union over dimensions finite. Choosing a prime divisor of s can fix the power exponent, but does not fix the growing number of terms.

## Closest additional uniform result and its limitations

Bennett–Bugeaud–Mignotte, *Perfect powers with few binary digits and related Diophantine problems*, concluding Remark2 on pp10–11 of the author version https://www.math.ubc.ca/~bennett/BBMshort-final-modified.pdf , is a relevant primary source. The same remark was checked in the earlier author copy https://www.math.ubc.ca/~bennett/BBMshort1.pdf . Remark2 states that, for

    x^a1+...+x^ar+1=y^q,
    a1>...>ar>0,
    ar-1>=kappa*a2,

with prime q coprime to phi(x), q is bounded by a constant depending on the fixed positive kappa. The stated generalization does not fix r: varying term count by itself is not its obstruction. Its bound requires the same fixed positive kappa across the family. This is closer to the desired uniformity than a fixed-support theorem. But it assumes unit coefficients, distinct positions, a proportional interior-gap condition and the specified prime exponent. None follows from the length and digit-sum equations. No extension to arbitrary decimal coefficients is silently assumed here.

Wang–Xiao2026, Theorem4.4, instead fixes the number of terms n, the exponent d, and positive endpoint-gap parameters. Its binary conclusion is algebraic degeneracy outside a finite exception set. It is not itself a height cutoff or a decimal growing-support theorem. Primary statement and Remark4.5 inspected: https://arxiv.org/html/2604.26497v1 .

The next calculation shows that even the actual powers in our necessary-condition family have no fixed proportional endpoint gaps. Consequently, simply supplying their exact power structure and their length does not activate either type of gap result. Whether the extra digit-sum equality could force a gap remains an additional unproved assertion.

## Exact endpoint positions in the infinite survivor powers

For every integer j>=0, define

    t=4*10^j,
    B=10^t,
    k=B+1,
    s=B/t=25*10^(t-j-2),
    n=(B+1)^s.

The already established family satisfies d10(n)=k and n==s mod9. It is not known to satisfy S10(n)=s. All conclusions in this section concern these actual powers, without asserting that they are fixed points.

Since t*s=B,

    n/10^B=(1+1/B)^s.

Bernoulli's lower bound and the finite geometric-series upper bound yield

    1/t <= (1+1/B)^s-1 < 1/(t-1).

In particular n has leading digit1 at position B. For the remainder after removing that digit,

    10^B/t <= n-10^B < 10^B/(t-1).

Using t=4*10^j, both bounds place the remainder between10^(B-j-1) and10^(B-j). Therefore the second-highest nonzero position is exactly

    B-j-1,

and the leading gap is exactly j+1.

At the low end, binomial expansion and s<B give

    n == 1+sB == 1+25*10^(2t-j-2) (mod B^2).

The two positive positions displayed are below2t, so the first two nonzero positions above the units digit are exactly

    E=2t-j-2  (digit5),
    E+1      (digit2).

Hence, as j tends to infinity,

    leading_gap/B=(j+1)/B ->0,
    first_positive_position/B=(2t-j-2)/B ->0,
    second_smallest_positive_position/second_largest_position
       =(2t-j-1)/(B-j-1) ->0.

These calculations rule out deducing a fixed proportional gap merely from the power equation plus the length/mod9 conditions on this family. They also show the gap obstruction persists even if one were to grant a suitable bounded-coefficient decimal analogue of a cited theorem.

There is a separate exponent issue:

    s=2^(t-j-2)*5^(t-j).

The only prime divisors of s are2 and5, for every j. Thus s becoming arbitrarily large does not produce arbitrarily large prime exponents. Rewriting n=(k^(s/q))^q only gives q=2 or5. A theorem that excludes sufficiently large prime q cannot discard this entire necessary-condition family without additional small-prime work.

For comparison, even the bare length and weight constraints permit an evenly spaced support: positions floor(i*(k-1)/(s-1)), i=0,...,s-1, give a k-digit number of weight s with gaps at most ceil((k-1)/(s-1))=O(log k). That construction need not be a power; the exact family above supplies the stronger endpoint calculation for actual powers.

## p-adic valuation methods do not reach the required scale

Radcliffe's May18,2026 paper proves logarithmic digit-count lower bounds from large valuations at primes dividing the display base, and presents Stewart's more general fixed-base bound. For decimal powers the elementary route applies when the normalized base has an imbalance between its2- and5-adic valuations; its argument creates successive nonzero digits through a geometric recurrence of positions. Primary source: *Digital sums of powers, factorials, and least common multiples*, https://radcliffe.dev/pdf/digital_sums.pdf , Lemma1, Corollary1, Theorem1 and Section4.

Even in a favorable fixed-core case these lower bounds have logarithmic scale in s. A hypothetical equality already forces m>=s/9, which is asymptotically much stronger. Substituting k~s*log10(k) into the available logarithmic bound does not turn it into a contradiction. When k changes, any fixed-base constants and thresholds must also be tracked rather than held constant.

Moreover the exact survivor bases B+1 are coprime to10, so the favorable2- or5-adic divisibility of n itself is absent. Divisibility at primes not dividing10 can involve cancellation among unit terms. The small coefficient budget does not by itself supply a uniform valuation bound sharp enough to exclude an exponent of order s. No such result was located in this pass. This is not a proof that a length-sensitive p-adic theorem cannot exist; it identifies the stronger estimate that would still need to be proved.

## Exponential approximation: exact precision barrier

On the survivor family write

    R=(1+1/B)^(B/t),  so n=10^B*R.

The tempting approximation R≈exp(1/t) has an explicit error of order1/(tB), not of order10^(-B). Indeed set

    delta=1/t-(B/t)*log(1+1/B).

For B>=2, alternating-log bounds give

    1/(3tB)<=delta<=1/(2tB).

For t>=4 both exponents lie between0 and1/4, where the derivative of exp is between1 and4/3. Consequently

    1/(3tB)<=exp(1/t)-R<=2/(3tB).

Since B=10^t, this resolves only about t+log10(t) decimal places of the mantissa. Scaling by10^B leaves an absolute error of order10^(B-t)/t. Closeness alone also does not guarantee a common decimal prefix: a decimal-grid boundary can lie between the two values. The lower error bound prevents agreement arbitrarily farther into the expansion.

Higher-order elementary correction does not avoid the scale problem. Define the J-term logarithmic approximation

    L_J=(B/t)*sum_{r=1}^J (-1)^(r+1)/(r*B^r).

The alternating tail, followed by the same derivative bounds, gives for J>=1

    1/[2(J+1)tB^J] <= |R-exp(L_J)|
                       <= 4/[3(J+1)tB^J].

Thus the available precision is about J*t+log10((J+1)t) decimal places. Because t*s=B, if J<=s-1 then

    10^B*|R-exp(L_J)| >= 1/2.

So this truncation cannot recover n by nearest-integer rounding before order s. At J=s, the truncation error is below1/2 after scaling, but evaluating the exponential to that enormous precision is still required; no efficient new proof or algorithm follows.

Even a much shorter digit-sum witness needs a growing order. An L-digit prefix can contribute at most9L, so exceeding digit budget s requires L>s/9. A fixed-order expansion controls only O(t) digits, whereas s=B/t grows exponentially in t. Finally, one would still need a nontrivial digit-weight bound for a long prefix of the varying value exp(1/t). Transcendence or irrationality alone does not give such a bound. No elementary approximation transfer located here yields a sufficient prefix witness.

## Final assessment

The obstacle can be stated more specifically than a need for general random-looking digits: existing tools do not provide a uniform, sufficiently strong weighted-digit restriction in the regime

    m proportional to s,
    k proportional to s*log s,
    power exponents potentially2,5-smooth,
    both endpoint-gap ratios tending to zero.

The closest uniform prime-exponent theorem still needs a fixed gap; fixed-support finiteness is already elementary once both problem equations are imposed; favorable p-adic lower bounds lie below the sparsity already assumed; and the exponential approximation loses almost all needed digit precision. These are exact applicability and scale obstructions, not evidence that the conjecture is false or inherently inaccessible.

No credible new all-k route emerged from this final bounded pass. The endpoint-position formulas and the quantitative exponential-error estimates are useful diagnostics to preserve. There are no owned processes to stop.
