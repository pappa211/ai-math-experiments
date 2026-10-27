> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Quantitative polynomial separation review

2026-10-27, Session01. Informal proof checked independently; no computation, Lean build or formalization. The proposed refinement is correct, including the strict final inequality and the possibility that borrowing removes the top block.

Write S(n) for decimal digit sum and d(n) for decimal digit count of a positive integer.

## Signed-coefficient normalization lemma

Let

    Q(X)=sum_{i=0}^D q_i X^i in Z[X],
    q_D>0,
    H=max_i |q_i|>=1,
    B=10^M>H+1.

Normalize from low to high using incoming carry c_0=0 and

    v_i=q_i+c_i,
    c_{i+1}=floor(v_i/B),
    b_i=v_i-B*c_{i+1}.

Inductively c_i is either0 or-1. Indeed, -H-1<=v_i<=H and B>H+1 imply -B<v_i<B, so its floor quotient by B is0 or-1. Every b_i lies in[0,B-1]. At the last coefficient, v_D=q_D+c_D>=0, so c_{D+1}=0. Telescoping gives

    Q(B)=sum_{i=0}^D b_i B^i.

The last block can be zero when q_D=1 and c_D=-1. Removing such a leading zero does not alter any lower block or any digit sum.

If some coefficient q_i is negative, then v_i=-a for an integer1<=a<=H+1. Its normalized block is

    b_i=B-a>0.

Thus the represented integer is positive even if the top block disappeared. The complement identity in an M-digit decimal block gives

    S(B-a)=9M-S(a-1).

Since0<=a-1<=H<10^d(H), its digit sum is at most9d(H). Distinct base-B blocks occupy disjoint decimal positions, including their zero padding. Hence

    S(Q(B))>=S(B-a)>=9(M-d(H)).

If all coefficients are nonnegative, all carries are zero and all coefficients fit inside their M-digit blocks. Therefore

    S(Q(B))=sum_i S(q_i)>=number of nonzero coefficients of Q.

There is no cancellation of a negative block's decimal weight during later normalization: all borrowing is already accounted for by c_i, and the final b_i are canonical base-B digits. This is why the top-block issue causes no gap.

## Explicit threshold for a polynomial power

Let P be a fixed nonmonomial polynomial in Z[X] with positive leading coefficient. Put

    W=sum_i |coefficient_i(P)|,

so W>=2. For every integer s>=1, the following explicit implication holds:

    M>=s*d(W)+floor(s/9)+1
    => S(P(10^M)^s)>s.

Proof. Put Q=P^s and let H be its coefficient height. The sum of absolute coefficients is submultiplicative, so

    H<=W^s<10^(s*d(W)),
    d(H)<=s*d(W).

The proposed threshold in particular gives M>=s*d(W)+1, and therefore B=10^M>H+1, as required by the normalization lemma.

If Q has a negative coefficient, that lemma gives

    S(Q(B))>=9(M-d(H))
             >=9(floor(s/9)+1)
             >s.

The last inequality is strict for every s: if s=9q+r with0<=r<=8, then9(q+1)-s=9-r>=1.

If Q has no negative coefficient, it has at least s+1 nonzero coefficients. To justify this standard term-count fact, a nonmonomial P has a nonzero complex root alpha, which has multiplicity at least s in Q. If Q had m<=s terms with distinct exponents e_i, applying (X*d/dX)^j at alpha for j=0,...,m-1 would give the invertible Vandermonde system on the e_i, forcing every nonzero term coefficient times alpha^e_i to vanish. This is impossible. The nonnegative case of the normalization lemma therefore gives S(Q(B))>=s+1>s. QED.

The threshold is sufficient and deliberately coarse. In particular, W^s bounds the height without having to expand P^s. No assertion of sharpness is made.

## Why this explicit estimate misses the length curve

Fix P of degree D>=1 and positive leading coefficient a. For growing M,

    k=P(10^M) ~ a*10^(D*M),
    log10(k) ~ D*M.

Any exponent satisfying the required k-digit condition obeys

    (k-1)/log10(k)<=s<k/log10(k),

and hence, along any unbounded sequence of such candidate pairs,

    s ~ a*10^(D*M)/(D*M),
    M/s -> 0.

This is conditional on candidates existing; it does not assert that every M or infinitely many M yield an integer exponent in the interval.

The separation condition already requires M>=s*d(W), with d(W)>=1, so it eventually fails on that length curve. The refinement makes the previous fixed-polynomial obstruction effective, but it covers exponents at most of linear size in the block width M. The actual length-compatible exponent grows exponentially in M divided by M. Consequently the explicit lemma does not presently supply an all-k exclusion for the frozen decimal problem.
