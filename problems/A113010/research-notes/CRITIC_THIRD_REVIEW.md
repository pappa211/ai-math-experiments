> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Independent critic — third conceptual review

Session 01, 2026-10-27. The authorized window remains 08:45:56–14:45:56 UTC.
Evidence: rigorous informal arguments plus a literature applicability review. No Lean proof, complete solution candidate, or novelty claim is made here.

The main construction was developed jointly in this review: the critic supplied a fixed-block semigroup argument, and the principal researcher improved it to one variable block. The improved proof below supersedes the earlier quadratic-threshold version.

## Main result: prescribed digit sum, prefix and residue remain compatible

Write S(n) for decimal digit sum, including S(0)=0. All parameters below are integers.

**Theorem (explicit variable-block construction).** Let M >= 1 and define

    d = number of decimal digits of M,
    w = S(M),
    g = gcd(M,9) = gcd(w,9),
    q = 9/g.

Let ell >= 1 and let A be an ell-digit positive integer:

    10^(ell-1) <= A < 10^ell.

Put P=S(A). For any s,k,r satisfying

    s >= P + 18d + (q-1)w,
    k-ell >= floor((s-P)/9) + (q+1)d,

there exists a k-digit integer N whose first ell digits are A, whose digit sum is exactly s, and which satisfies N == r (mod M), **if and only if**

    s == r (mod g).

The padding inequality in particular implies k>=ell. All displayed subtractions are ordinary integer subtractions under these positivity assumptions.

**Simpler uniform sufficient hypotheses:**

    s >= P+90d,
    9(k-ell) >= 2(s-P).

In particular, s>=P+90d and k>=s+ell are sufficient. Uniformly over every ell-digit prefix A, the still simpler conditions

    s >= 9ell+90d,   k >= s+ell

suffice.

This theorem constructs possible digit strings. It does NOT assert that the constructed N equals k^s or is a perfect power.

### Necessity

If N == r mod M then N == r mod g. Since g divides 9, every integer N satisfies S(N) == N mod g. Hence s == r mod g.

### A digit-sum identity for multiples

For every H with 10^H > M,

    S(M(10^H-1)) = 9H.

Indeed,

    M(10^H-1) = (M-1)10^H + (10^H-M).

The two parts occupy separate decimal blocks. The lower H digits of 10^H-M are the digitwise 9-complement of the H-digit padded representation of M-1, so the two digit sums add to 9H. In particular, the identity holds for H>=d, since M<10^d.

### Residue block and remaining digit-sum budget

Choose the unique R satisfying

    0 <= R < M,
    R == r - A*10^(k-ell) (mod M).

Then S(R)<=9d. Put

    D = s-P-S(R).

Assume the necessary congruence s==r mod g. Reduction modulo g gives

    P+S(R) == A+R == r (mod g),

because g divides9 and 10==1 mod g. Hence g divides D. Since gcd(w,9)=g, there is an integer a with

    0 <= a < q,
    a*w == D (mod9).

Define

    h = (D-a*w)/9.

The first size hypothesis yields

    D-a*w >= s-P-9d-(q-1)w >= 9d,

so h is an integer with h>=d. Set

    B = M(10^h-1).

Then B is a positive multiple of M, S(B)=9h, and B<10^(h+d).

### Packing without carries

Use a width-d block for R, a width-d block for each of a copies of M, and then a width-(h+d) block for B. Explicitly set

    N = A*10^(k-ell)
        + R
        + M*sum_{i=1}^a 10^(di)
        + B*10^(d(a+1)).

The empty sum is zero when a=0. The entire lower part fits within

    W = h+(a+2)d

decimal positions, in the precise sense that it is less than 10^W. Since

    h <= floor((s-P)/9),
    a+2 <= q+1,

we have

    W <= floor((s-P)/9)+(q+1)d <= k-ell.

Consequently the lower part does not overlap A, N has exactly k digits and prefix A, and

    S(N)=P+S(R)+a*w+9h=s.

Every added block except R is a multiple of M, so N==A*10^(k-ell)+R==r mod M. This proves sufficiency under the main hypotheses.

### Verification of the simpler uniform hypotheses

Because w<=9d and q<=9,

    18d+(q-1)w <=90d.

Thus s>=P+90d ensures h>=d as above. Put E=s-P. Then

    W <= E/9 + 10d <= 2E/9.

The simpler padding condition 9(k-ell)>=2E therefore ensures W<=k-ell. This proves that version directly; it need not imply the slightly coarser integer padding bound stated in the main version. Finally, k>=s+ell gives k-ell>=s>=2(s-P)/9, and P<=9ell gives the uniform-over-prefix form.

The modulus need not be coprime to10. Including any desired power of10 in M therefore includes a suffix constraint automatically.

## Consequence for the infinite length/mod9 survivor family

Recall the family already proved in the first critic review:

    j >= 0,
    t = 4*10^j,
    x = 10^t,
    k = x+1,
    s = x/t = 25*10^(t-j-2).

It satisfies k=ts+1, d(k^s)=k, and k^s==s mod9, while s tends to infinity and k/s tends to infinity.

Fix any modulus M and any prefix length ell. For every sufficiently large j, take r=k^s mod M and A equal to the actual first ell digits of k^s. The uniform-over-prefix hypotheses eventually hold. Compatibility holds because g=gcd(M,9) divides9 and k^s==s mod9. Thus there exists an integer N with simultaneously

    d(N)=k,
    S(N)=s,
    N==k^s mod M,
    first ell digits of N = first ell digits of k^s.

The theorem does not establish N=k^s; the missing exact perfect-power information is the unresolved issue. A finite collection of fixed-modulus conditions, even combined with any fixed number of actual leading and trailing digits, therefore cannot by itself contradict digit sum s for all sufficiently large members of this family. Combine the fixed moduli by their least common multiple, including any needed power of10 for trailing digits.

This obstruction also applies to much larger varying moduli. On each sufficiently large family member, **every** modulus M satisfying

    90*d(M)+9ell <=s,
    k>=s+ell

can be included. Thus the construction absorbs moduli with up to approximately s/90 decimal digits, not merely fixed or polynomial-size moduli. It can also absorb a growing prefix length as long as these same explicit inequalities hold.

These are sufficient ranges, not optimal limits. The result does not rule out a modulus larger than this range, a growing collection of constraints whose combined modulus exceeds it, structural information about perfect powers, or suitable information at many other digit positions. It is a precise limitation of residue-and-prefix necessary-condition methods, not a proof that all modular reasoning is futile.

## Other routes examined and their exact obstacle

### Positive S-unit reformulation

Splitting every decimal digit into unit contributions writes the target equality as

    sum_{i=1}^s 10^(e_i) / k^s = 1,

with 0<=e_i<=k-1 and at most nine occurrences of any e_i. Positivity guarantees nondegeneracy (no nonempty subsum vanishes). For fixed k and fixed s, these tuples lie in a subgroup of (Q*)^s generated by the s coordinatewise powers of 10 and the common denominator vector (k^-1,...,k^-1), of rank at most s+1.

Evertse–Schlickewei–Schmidt, Theorem 1.1, bounds the number of nondegenerate solutions in dimension s and rank r by exp((6s)^(3s)*(r+1)). This is a solution-count bound for a specified group, not a height bound. Here the dimension grows with the exponent, and changing k changes the group. Applying the theorem does not bound k or s, does not make an infinite union finite, and does not produce a contradiction. Even the weaker fixed-s finiteness would not add the needed missing ingredient: the length inequality already bounds k when s is fixed.

Primary source: J.-H. Evertse, H. P. Schlickewei, W. M. Schmidt, *Linear equations in variables which lie in a multiplicative group*, Annals of Mathematics 155 (2002), 807–836; Theorem 1.1 read at https://arxiv.org/pdf/math/0409604 ; publisher page https://annals.math.princeton.edu/2002/155-3/p04 .

### Carry polynomial reformulation

Let P(T) be the decimal digit polynomial of k, D(T) the digit polynomial of k^s, and C(T) the polynomial of nonnegative carrying amounts when normalizing the coefficients of P(T)^s into decimal digits. Then exactly

    P(T)^s = D(T) + (10-T)C(T).

Evaluating at 10 gives the numerical power identity. Evaluating at 1 gives

    S(k)^s = S(k^s) + 9*C(1).

Thus S(k^s)=s requires C(1)=(S(k)^s-s)/9; integrality recovers the modulo-9 condition. A scalar carry total does not provide a new independent restriction. A useful theorem would need to control where the carries occur, or otherwise show that the residual digit mass cannot be s on the length curve. No such theorem was obtained.

A shortcut replacing digit sum by a stronger nonzero-digit count is false even on the length curve: 12^11=743008370688 has 12 digits and only nine nonzero digits, although s=11 and its digit sum is54. Likewise the normalized u=4 and u=6 survivors have core lengths less than s, so their number of nonzero digits is necessarily below s. This does not contradict the weaker general relation ceil(s/9)<=number of nonzero digits for an actual fixed point.

### Recent sparse-power preprint: qualification

The initial second review inspected only the abstract of arXiv:2610.08310v1. The principal researcher subsequently read its actual Theorem1.2; I also opened the full HTML statement during this review. The advertised five-term result has additional hypotheses, including coefficients equal to1, a prime exponent coprime to phi(g), and an exponent-separation condition involving a fixed positive kappa. It must not be used as a theorem about arbitrary five nonzero digits, much less an unbounded digit budget. Source: https://arxiv.org/html/2610.08310v1 . No proof acceptance is claimed here.

## Assessment

The explicit block theorem is a substantive, elementary obstruction to a whole class of proposed finite-information sieves. It is suitable for independent checking and possible formalization, but is a negative methodological result rather than progress toward existence or nonexistence itself. The S-unit and scalar-carry rewritings expose the same missing uniform digit structure; they currently provide no credible path to the frozen target. No further numerical range search, large power expansion, Lean build or persistent subprocess was used for this review.
