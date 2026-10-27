> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Adjacent-base digit-sum review

2026-10-27, Session01. Bounded conceptual pass; no Lean work or long calculation. The result below is an informal proof with an explicit finite integer certificate, checked by the reproduced Python calculation. It is not a Lean-checked theorem and is not a result about all decimal fixed points. No novelty claim is made.

Write S_B for digit sum in integer base B>=2.

## Result and the elementary part

The evidence and argument below establish

    S_B((B+1)^s)>=s+1,  B>=3,  1<=s<=B,

subject to the ordinary computational trust in the stated tiny finite certificate. The counterexample B=s=2 is real:9=(1001)_2 has digit sum2.

Every case s<B has an immediate proof: binomial expansion gives

    (B+1)^s == 1+sB (mod B^2).

Since0<=s<B, the two lowest digits are1 ands, already totaling s+1. If2<=s<B, the quotient above these two positions is positive, so in fact S_B((B+1)^s)>=s+2. Thus only s=B needs a nontrivial argument.

For that endpoint, the stronger assertion proved by the certificate is

    S_B((B+1)^B mod B^7)>=B+1,  B>=3.

Only seven low digits are needed.

## Endpoint reduction to a fixed polynomial

Put

    P(X)=sum_{j=0}^6 binom(X,j)X^j,
    D=720.

For every integer B>=0, P(B) is an integer. Moreover

    (B+1)^B == P(B) (mod B^7),

because the omitted binomial terms contain B^7; when B<7 the terms beyond the exponent are zero.

The coefficient vector of DP(X), in ascending order, is

    A=[720,0,720,-360,600,-540,594,-600,514,-285,91,-15,1].

This identity was also independently reconstructed using exact rational falling-factorial coefficients in the check below.

Fix a residue r modulo720. Set c_{-1}=0. For i=0,...,6 define

    a_i=A_i-c_{i-1},
    v_i=sum_{j=i+1}^{12} A_j*r^(j-i-1) mod720,

where v_i is the least nonnegative residue. Set c_i=v_i, except that c_i=720 when v_i=0 and a_i<0.

For each B==r mod720, define

    d_i(B)=(c_i*B+a_i)/720.

The finite certificate verifies, for all720 residues and all seven indices,

    0<=c_i<=720,
    0<=50*c_i+a_i<50*720.

Both inequalities determining0<=d_i(B)<B are affine in B with nonnegative slopes. Their validity at B=50 therefore proves them for every B>=50.

To see that these are the actual low digits rather than merely numbers in the correct range, put

    Q_i(X)=A_i-c_{i-1}+sum_{j=i+1}^{12} A_j*X^(j-i).

Then Q_0=DP, and

    Q_i(B)/720 = B*Q_{i+1}(B)/720 + d_i(B).

The choice of c_i ensures that Q_{i+1}(B) is divisible by720. Beginning with the integer P(B), induction gives integer d_i(B). The proved range0<=d_i(B)<B identifies them as successive Euclidean remainders, so they are exactly the first seven base-B digits of P(B), hence of(B+1)^B.

The same finite check gives, uniformly in r,

    C=sum_{i=0}^6 c_i >=786,
    E=sum_{i=0}^6 a_i >=-360.

Consequently for B>=50 their digit sum is

    (CB+E)/720 >= (786B-360)/720 > B+1.

The remaining47 bases3<=B<=49 are checked directly by modular exponentiation modulo B^7. All satisfy the desired non-strict bound. This completes the reduction and finite verification.

## Reproducible finite certificate

This code uses only exact Python integer/rational arithmetic. It checks the polynomial identity, every residue inequality, the47 small bases, and an additional direct representative-digit comparison for each residue. The recorded run took about0.022 seconds inside Python. Its assertions passed, with minimum C=786 and minimum E=-360.

```python
from fractions import Fraction
from math import factorial

D = 720
A = [720, 0, 720, -360, 600, -540, 594,
     -600, 514, -285, 91, -15, 1]

# Independently derive D * sum_{j=0}^6 binom(X,j)*X^j.
coeff = [Fraction(0) for _ in range(13)]
fall = [1]
for j in range(7):
    if j:
        nxt = [0] * (len(fall) + 1)
        for i, v in enumerate(fall):
            nxt[i] -= (j - 1) * v
            nxt[i + 1] += v
        fall = nxt
    for i, v in enumerate(fall):
        coeff[i + j] += Fraction(v, factorial(j))
assert [D * x for x in coeff] == A

for r in range(D):
    cs, aa, previous = [], [], 0
    for i in range(7):
        c = sum(A[j] * pow(r, j-i-1, D)
                for j in range(i+1, 13)) % D
        a = A[i] - previous
        if c == 0 and a < 0:
            c = D
        assert 0 <= c <= D
        assert 0 <= 50*c + a < 50*D
        cs.append(c)
        aa.append(a)
        previous = c
    assert sum(cs) >= 786
    assert sum(aa) >= -360

    # Additional cross-check; the affine proof covers every B>=50.
    B = r if r >= 50 else r + D
    R = pow(B+1, B, B**7)
    for c, a in zip(cs, aa):
        assert (c*B+a) % D == 0
        R, actual = divmod(R, B)
        assert (c*B+a)//D == actual
    assert R == 0

for B in range(3, 50):
    R, weight = pow(B+1, B, B**7), 0
    while R:
        R, digit = divmod(R, B)
        weight += digit
    assert weight >= B+1
```

Initial tiny exploratory checks had found no full endpoint counterexample for3<=B<=256, with equality only at B=3, and suggested the seven-digit certificate. Those observations are not used as an unbounded argument; the residue-class proof is the relevant step. An initial overly strong diagnostic assertion E>0 failed and was discarded: E can be negative, with the verified lower bound-360. The final proof correctly retains that negative constant.

## Relevance to the decimal length curve

The endpoint certificate does not presently advance the frozen decimal problem. If B=10^t, k=B+1 and t>=2, the endpoint exponent s=B is not on the k-digit curve:

    k^B>=B^B=10^(tB),

and tB>=B+1=k, so k^B already has more than k decimal digits. Actual length-curve exponents are about B/t<B, where the elementary two-block proof applies.

More fundamentally, a large base-B digit is a decimal block, and its numerical size is not its decimal digit sum. For B=10^t, the two low blocks1 ands contribute only

    1+S10(s)

to the decimal digit sum. On the previously proved infinite survivor family

    t=4*10^j, B=10^t, s=B/t=25*10^(t-j-2),

this contribution is exactly8 for every j, although the base-B contribution is s+1. The higher blocks remain uncontrolled.

The generic conversion S_B(N)<=10^(t-1)*S10(N) also loses essentially the whole gain: the bound s+1 translates only to S10(N)>=ceil((s+1)/10^(t-1)), of constant scale on s about B/t. Thus the adjacent-base lemma is a clean auxiliary fact, but it supplies no useful unbounded decimal inequality here. Preserve the certificate; no formalization or further effort is recommended without a new argument controlling decimal weights inside the blocks.
