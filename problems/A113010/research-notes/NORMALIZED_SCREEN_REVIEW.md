> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Independent review of normalized-family screen

Session 01, 2026-10-27; original authorized window 08:45:56–14:45:56 UTC.
Reviewed by the mathematical critic. Scope: experiments/normalized_families.py and experiments/normalized_100.json, for u = 2,...,9 and t = 0,...,100. This is an independently checked computational method, not a Lean proof or a proof for unbounded t.

## Verdict

The logarithm enclosure and conservative exponent endpoints are correct for this invocation. An independent implementation using 180 exact Fraction terms, rather than individually rounded grid terms, reproduced every classification count, known fixed point and unresolved survivor. The earlier count label exact_excluded includes the known fixed point; the principal researcher is renaming it exact_checked. No mathematical exclusion depends on that label.

Inspected source SHA-256: 62ea112ae95e20299986221adbaea85544b8a2cd35325dbe918af6bfa9422268.
Inspected result SHA-256: 9a9f7c48c567050d05ee14a877e239cb622df50262eaae43475656b9e2b0ab8a.
These identify the files at replay time; a later label-only correction changes their hashes.

No huge power was expanded. The independent replay took approximately 0.029 seconds of internal wall-clock time and used only small exact cases permitted by the original exponent cutoff.

## Mathematical enclosure audit

For 1 <= a/b <= 2, z = (a-b)/(a+b) lies in [0,1/3]. The identity

    ln(a/b) = 2 sum_{r>=0} z^(2r+1)/(2r+1)

has nonnegative terms. After j terms, its remainder is bounded above by

    2*z^(2j+1) / ((2j+1)*(1-z^2)).

The code's integer comparison is exactly the assertion that this upper tail bound, multiplied by the grid scale, is less than 1. Each of the j included terms is rounded down, losing less than one grid unit. Thus total <= scale*ln(a/b) < total+j+1. Returning the latter integer as an upper bound is conservative. The special a=b branch returns the exact interval [0,0].

Writing n = 2^m*(n/2^m) with m = bit_length(n)-1 reduces the remaining factor to [1,2), and adding m copies of the positive ln2 enclosure preserves containment. The actual ln10 lower endpoint is positive. Therefore

    alpha_lo = ln_u_lo/ln_10_hi <= log10(u)
    alpha_hi = ln_u_hi/ln_10_lo >= log10(u).

Let k = u*10^t. Any positive s with d(k^s)=k satisfies

    (k-1)/(t+log10(u)) <= s < k/(t+log10(u)).

Replacing the denominator by alpha_hi in the lower bound moves it down; replacing it by alpha_lo in the upper bound moves it up. Hence the code's candidate interval

    ceil((k-1)/(t+alpha_hi)) <= s <= ceil(k/(t+alpha_lo))-1

cannot omit a valid exponent. The ceil-minus-one expression correctly handles equality at the strict upper endpoint. A precision failure raises rather than silently truncating candidates.

The congruence check is necessary because S10(k^s) is congruent to k^s modulo 9. For exact cases, evaluating u^s and using length ts+d(u^s) and digit sum S10(u^s) is exact, since multiplying by 10^(ts) appends zeros.

## Independent replay and survivor lengths

The independent implementation used exact rational partial sums, with fixed N=180:

    z = Fraction(a-b,a+b)
    partial = 2*sum(z**(2*j+1)/(2*j+1) for j in range(N))
    tail = 2*z**(2*N+1)/((2*N+1)*(1-z*z))
    return partial, partial+tail

It constructed ln2, ln10 and lnu by binary range reduction, formed rational log10 intervals, then enumerated the conservative integer exponent intervals and modulo-9 survivors. It checked small cores only when s <= 200000, as in the original experiment. Every per-u count, fixed point and survivor agreed, allowing the exact_excluded/exact_checked label alias.

Both surviving candidates actually satisfy the length condition, not merely a conservative interval:

1. u=4, t=35, k=400000000000000000000000000000000000,
   s=11235304926103517236760601181978660.
   Rigorous rational bounds give

       0.175813482644375 <= s*log10(k)-(k-1) <= 0.175813482644376.

2. u=6, t=9, k=6000000000, s=613612926.
   Rigorous rational bounds give

       0.618466191884973 <= s*log10(k)-(k-1) <= 0.618466191884974.

Both intervals are contained in [0,1), establishing d(k^s)=k. Their exact digit sums remain unresolved. These are not fixed-point candidates with any evidence that the digit-sum equality holds; they are survivors of necessary conditions only.

## Prospects of modular or partial-digit exclusions

For B=10^m and M=B-1, repeated summing of B-sized blocks preserves residue modulo M and cannot increase decimal digit sum. Thus for R=N mod M,

    S10(R) <= S10(N).

If R=0 and N>0, the stronger lower bound S10(N)>=9m follows by retaining the positive terminal representative M. For R!=0, the terminal representative is R. This is the usual block-folding argument.

However S10(R)<=9m, so an exclusion based solely on S10(R)>s requires at least

    m >= floor(s/9)+1.

For the u=6 survivor this is 68,179,215 decimal positions. For u=4 it is 1,248,367,214,011,501,915,195,622,353,553,185 positions. The same absolute limitation applies to summing directly inspected digits: r inspected digits contribute at most 9r. Typical random-looking residues would need substantially more positions than this maximum-digit lower limit, but randomness is only a heuristic.

One cannot add lower bounds from different overlapping residues: each bounds the same full digit sum and their evidence is not disjoint. Disjoint digit blocks can be added, but still require the above total digit count to exceed s using literal digits alone. A new symbolic lower bound could avoid this cost; no such bound was found.

Consequently, small modular residues and short prefixes/suffixes cannot exclude these survivors by a simple digit-sum-threshold certificate. The u=6 case might be computationally tractable with carefully benchmarked optimized large-integer arithmetic, but a residue or suffix with tens/hundreds of millions of decimal positions is not a lightweight experiment. It requires a separate resource/time assessment and is a finite computation, not a conceptual breakthrough. The u=4 scale is computationally infeasible by these direct methods. No such large computation was attempted in this review.

This does not rule out a special symbolic congruence or another unforeseen argument; it identifies the limitation of the specific block-folding and partial-digit lower-bound proposals.
