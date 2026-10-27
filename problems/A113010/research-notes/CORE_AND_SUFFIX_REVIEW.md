> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Independent review — core enumeration and GMP suffix bound

Session 01, 2026-10-27. Reviewed within the original 08:45:56–14:45:56 UTC authorization.

Evidence categories: source-code and mathematical review; examination of saved run logs; small independent arithmetic cross-checks after the large run completed. This is not an independent full recomputation of either large experiment and is not a Lean proof or a solution of the frozen all-k problem. No Lean build or large arithmetic computation was launched by this reviewer.

## Results and exact scope

The reviewed C program and completed log support this finite numerical statement:

    For u in {2,...,9} and 1<=s<=1,000,000,
    S10(u^s)=s occurs only at (u,s)=(2,5),(2,70).

The search is exhaustive for equality over that rectangle. The log's `below:0` is narrower: it counts only pairs passing the modulo-9 filter. It does not assert S10(u^s)>=s everywhere. For example S10(2^9)=8<9, but this pair fails the congruence filter and is deliberately skipped.

The completed large GMP run reports

    e = 613,612,926,
    m = 140,000,000,
    R = 6^e mod 10^m,
    S10(R) = 630,014,399 > e.

This excludes the screened normalized candidate (u,t,s)=(6,9,613612926), hence k=6,000,000,000, as numerical evidence. It does not exclude the remaining u=4 survivor or arbitrary normalized families.

## C enumeration: invariant, bounds and early cutoff

Source: experiments/core_equalities.c. It stores each positive integer in little-endian base B=10^9 blocks. At the start of a base-u pass, len=1 and blocks[0]=1. Each successive iteration multiplies the current exact value by u, so after iteration s the active blocks represent u^s exactly. Stale blocks from the previous base are irrelevant: len resets to one, and any newly active block is overwritten by the carry before it is read.

Every block remains in [0,B-1]. The carry is at most u-1<=8. Thus each multiplication intermediate satisfies

    v <= 9(B-1)+8 = 8,999,999,999 < 2^34.

The cast to uint64_t occurs before multiplication, so these intermediates do not overflow a 32-bit multiplication. Stored blocks and appended carries fit in uint32_t. Only one new block is needed when multiplying by u<=9<B.

Since u^s<10^s for 2<=u<=9, at most ceil(s/9) blocks are needed. The allocation ceil(limit/9)+2 therefore has spare capacity throughout the permitted limit<=1,000,000. At the actual limit its requested block storage is 444,456 bytes, matching the start record.

The statically initialized ds[1000] table computes the exact digit sum of each integer from zero through 999. Each block weight is the sum of three table lookups, so it is the exact decimal digit sum of that block; implicit leading zeros in a nine-digit block contribute zero. Every index lies between zero and 999.

The residue update starts at 1 and performs residue=residue*u%9 at every exponent, independently of whether a digit sum is evaluated. It therefore equals u^s mod9. Equality S10(u^s)=s necessarily implies u^s==s mod9, so the prefilter loses no equality.

On a compatible pair the program sums nonnegative block weights while total<=s. If total first exceeds s, the unread blocks cannot reduce it, and rejecting the equality is sound. If the loop returns with total<=s, it must have exhausted all active blocks: otherwise its continuation condition would still be true. Thus every printed `equal` or `below` record contains the complete exact digit sum. In particular, the cutoff cannot print a partial total as an equality.

The complete flag is true only after the last base and last exponent were processed. A time or signal stop at any earlier checkpoint leaves it false. Stopping just after processing the final pair is correctly complete. The reviewed log finishes at u=9,s=1,000,000 with complete=true, and the resource log records exit status zero after 718.757 seconds. The source's bounds and the completion record establish the stated scope at the code-review level; this is not a kernel-certified enumeration or a binary/source equivalence proof.

### Independent count consistency

The necessary residue classes for this domain are:

| u | compatible exponents |
|---|---|
| 2 | s=5 or 16 mod18 |
| 3 | s=0 mod9 |
| 4 | s=4 mod9 |
| 5 | s=4 or 11 mod18 |
| 6 | s=0 mod9 |
| 7 | s=7 mod9 |
| 8 | s=10 or 17 mod18 |
| 9 | s=0 mod9 |

Each base has exactly 111,111 compatible exponents through 1,000,000, giving 888,888 total, as reported. The u=3,6,9 row holds already for the equality test at s=1 because s=1 is incompatible; the stable power residue is zero thereafter.

After the large suffix run ended, I independently checked all 80 saved progress low blocks with Python's three-argument pow(u,s,10^9), and checked the two small equality values and their lengths with ordinary Python integers. All checks passed. These probes validate saved endpoints and known hits, not every intervening digit sum.

Together with the previously proved normalization and the explicit no-lift argument for (2,70), the numerical enumeration implies that among normalized cores u=2,...,9 with s<=1,000,000, the only fixed-point lift for arbitrary t>=0 is (u,s,t)=(2,5,0), giving32. The exponent bound remains essential.

## Exact suffix implication

For any positive integer X and m>=1, division by 10^m gives

    X = Q*10^m + R,  0<=R<10^m.

Concatenating the decimal expansion of Q with the m-digit zero-padded expansion of R gives

    S10(X)=S10(Q)+S10(R)>=S10(R).

No distribution assumption is involved. Missing leading zeros in the canonical representation of R do not change its digit sum.

For the normalized candidate,

    k=6*10^9,
    n=k^e=6^e*10^(9e),
    S10(n)=S10(6^e).

A fixed point with the screened exponent would require S10(n)=e. The computed suffix bound instead gives

    S10(n)>=630,014,399>613,612,926=e.

The strict margin from the suffix alone is 16,401,473. The already established length equation gives the full core length

    d(6^e)=6,000,000,000-9e=477,483,666>m,

so Q is positive and one may sharpen the numerical lower bound by one. That sharpening is unnecessary. The code's strict suffix_sum>e criterion is conservative: equality suffix_sum=e would also exclude this specific candidate because Q>0.

## GMP binding and buffer audit

Source: experiments/gmp_suffix.py. The run checks GMP version6.3.0, 64-bit limbs, a 16-byte mpz structure and 64-bit unsigned long. Its ctypes structure allocates the two-int-plus-pointer layout, and all mpz objects are initialized before use and cleared in finally. The Python code does not interpret or access individual GMP limbs. The functions use the expected pointer arguments, unsigned-long scalar exponents, size_t length return, and pointer return for the decimal conversion. The actual exponent and modulus exponent fit comfortably in unsigned long.

The call mpz_ui_pow_ui(mod,10,m) forms the exact integer modulus; mpz_powm_ui computes the exact residue with no floating-point arithmetic. This routine permits the even modulus 10^m; the odd-modulus requirement belongs to the separate mpz_powm_sec function, which is not used. Official API: https://gmplib.org/manual/Integer-Exponentiation .

The conversion allocates mpz_sizeinbase(out,10)+2 bytes, exactly the documented sufficient allocation. sizeinbase may overestimate by one but does not underestimate. get_str receives the caller-owned buffer and returns its address, which the program checks. The string is copied into Python-owned storage before the GMP integers are cleared, so the returned buffer does not depend on freed limb memory. Official documentation: https://gmplib.org/manual/Converting-Integers and https://gmplib.org/manual/Miscellaneous-Integer-Functions . The documented integer fields are described at https://gmplib.org/manual/Integer-Internals .

The weight calculation reads buf.raw, which includes the terminator and any unused capacity. create_string_buffer initializes that capacity with NUL bytes; these are different from ASCII digits and are not counted. Counting ASCII1 through ASCII9 with their numeric weights therefore gives the exact digit sum. ASCII0 is correctly omitted. No sign occurs because the residue is nonnegative. The memoryview used for the digest is restricted to the strlen length, excluding the terminator and spare capacity.

The low-nine-digit modular assertion checks a projection of every computed residue. The optional self-test compares 100 deterministic small cases against Python integers. These are useful cross-checks, not verification of all digits in the large residue. Resource limits affect whether a computation can finish; they do not replace the finish record or certify arithmetic.

After the large run completed, I separately called calculate on 16 deterministic boundary cases, including one-digit residues, zero residues, exact versus truncated powers, 999^999 modulo10^1000, and the actual exponent modulo10,10^9,10^10 and10^30. I compared the complete returned strings and digit sums to independent Python modular exponentiation and a separate per-character digit sum. All passed. I also independently checked the saved large residue's last30 digits using Python pow modulo10^30. All these small checks together took about0.0175 seconds inside Python. No large residue or core was recomputed by this reviewer.

## Pilot and completed run records

The smaller pilot used exponent6,136,129 and m=1,400,000. It returned suffix sum6,298,883 in about1.243 seconds with maxRSS26,604KiB. This establishes only that pilot instance and was not extrapolated as a proof of the actual candidate.

The completed actual run used exponent613,612,926, m=140,000,000 and address-space cap1536MiB. It reports:

    canonical residue digits: 139,999,999
    suffix digit sum: 630,014,399
    decimal residue SHA256:
    6168554f40cc72b3f78cac850120386300d074721903f270684641b7d7caf88c
    first30: 514475435752317159822821557015
    last30: 556208136598550772915955040256
    elapsed: 309.179 seconds
    maxRSS: 696,508 KiB
    process exit status: 0

The suffix has one leading zero when padded to width140,000,000; omitting it is harmless. The source hash recorded by both runs matches the reviewed source. The digest is a reproducibility identifier, not a short mathematical certificate proving the digit sum. The complete decimal residue is not saved in these JSON records, and the first/last digits do not independently certify the interior.

## Reviewed artifact identities

SHA256 values read after completion:

    experiments/core_equalities.c
    93148cd5aaa9a1632b107f9500ab23d20d4cfe70def44d2372f6494221af394d

    experiments/core_equalities_1000000.jsonl
    2c40c6c9b921700c36ba788909dc1decedb8fe32f6eeacbb541ac9cf20b700ac

    experiments/gmp_suffix.py
    f313566343237927f2627bd3be6b41cf56b924e68803c48fe2d774bdae11b4f5

    experiments/gmp_suffix_pilot.jsonl
    faafa6e1e8f770e2fb1ff0c10b8beb3c7ebd6a446618019f1fd55a446d3c4532

    experiments/gmp_suffix_u6_t9.jsonl
    2b2befd6675f14573991b1c8ddf7f5be15e05cac4552d59e134a24af63e61324

## Assessment

No correctness error affecting the reviewed runs was found. The C filter and early cutoff preserve exhaustive equality detection in the stated finite rectangle. The GMP suffix computation has a sound exact mathematical implication and passes the reviewed API, buffer and small arithmetic checks. The u=6,t=9 candidate is excluded numerically, with a substantial strict margin. Neither the finite enumeration nor the suffix result has been independently fully recomputed by this reviewer or certified in Lean; they must remain labeled computational evidence.
