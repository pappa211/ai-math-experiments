> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Tail-search implementation review

2026-10-27, Session01. Scope: experiments/tail_search.py, its imported gmp_suffix.py, and the completed1001..100000 pilot. Source review plus small independent checks only; no extended scan, long arithmetic run or Lean build was performed.

## Conclusion

No unsound skip or arithmetic/boundary error affecting the reviewed pilot was found. The implementation safely encloses every possible length exponent, rejects only by necessary congruence or an exact digit-sum obstruction, and fully checks every surviving pair. Its saved coverage stops at the last completely processed k. The wall-time and signal controls are soft between-k controls, so an in-flight k may finish after the requested duration; this must be allowed for when scheduling around the original14:45:56UTC checkpoint.

The pilot is computational evidence for1001<=k<=100000, not a Lean proof or an all-k result.

## MPFR enclosure and native integer conversions

main enforces2<=start<=limit<=10,000,000. Thus k and k-1 fit the target's64-bit unsigned long and are exactly representable at128-bit precision. Enclosure.bounds additionally asserts that mpfr_set_ui returns exact. The MPFR storage and signatures match the checked64-bit platform:32-byte structure, signed-long precision/exponent fields, int sign and pointer storage. The code initializes and clears every MPFR object; it does not access the internal limb data.

The rounding modes are obtained by their runtime names, avoiding an assumed numeric enumeration. For alpha=log10(k), the calls give

    loglo<=alpha<=loghi,
    a=RNDD((k-1)/loghi)<=(k-1)/alpha,
    b=RNDU(k/loglo)>=k/alpha.

The logarithm's lower enclosure is checked finite and positive. In this bounded positive input range, the other results are also finite and far from underflow/overflow. The asserted ternary-return signs agree with the chosen rounding directions.

mpfr_get_ui(a,RNDU) and mpfr_get_ui(b,RNDU) are mathematical ceilings of these finite positive values. Their values fit unsigned long by a wide margin; the explicit k*9 bound also rejects a saturated overflow return. Subtracting one from the upper ceiling occurs in Python integers. Therefore the inclusive range

    ceil(a),...,ceil(b)-1

contains all integers satisfying(k-1)<=s*log10(k)<k. The half-open upper endpoint is handled correctly even at exact integer boundaries. Every integer in the outer range is processed, and an empty range safely gives no candidates.

The GNU MPFR documentation of directed rounding, logarithms and conversion underlies this argument: https://www.mpfr.org/mpfr-current/mpfr.html#Rounding , https://www.mpfr.org/mpfr-current/mpfr.html#Transcendental-Functions , https://www.mpfr.org/mpfr-current/mpfr.html#Conversion-Functions . The installed version checked by the source is4.2.1. No ordinary floating-point approximation is used in the production candidate selection.

## Necessary filters and exact full fallback

pow(k,s,9)==s%9 is necessary for S(k^s)=s and is computed with exact Python modular arithmetic. Removing complete factors of10 gives k=10^t*u, so S(k^s)=S(u^s). The u=1 skip invokes the already proved pure-ten-power exclusion; k=1 is outside the accepted input range.

The suffix call returns R=u^s mod10^m for m=(s+3)//4+32, using the previously reviewed exact GMP routine. Its dependency hash matches that earlier review. The weight function counts ASCII digits in the caller-owned zero-initialized buffer; terminator and spare NUL bytes contribute nothing. Since S(u^s)>=S(R), weight(buf)>s is a sound exclusion. The code makes no inference that a short residue is the full core.

Every suffix that does not exceed s triggers full_core(u,s), using exact mpz_ui_pow_ui. The returned decimal buffer is owned independently of the GMP object, which is cleared only after conversion. The length is actual strlen, not the possibly-one-too-large mpz_sizeinbase estimate; sizeinbase+2 is used only for safe allocation. Acceptance requires both

    weight(full_core)==s,
    actual_core_digits+t*s==k.

These conditions are exactly the digit-sum and length conditions for n=u^s*10^(t*s). A full digit-sum mismatch rejects independently of length, and a length mismatch rejects an outer-enclosure extra. No fixed-point candidate is reported from a suffix alone. Python arithmetic prevents overflow in m,t*s and the counters; scalar GMP arguments fit unsigned long throughout the permitted range.

The known32 entry is recognized only after these full checks. Any additional candidate records its k,s,u,t, exact core length and decimal core file. That would be a numerical candidate requiring subsequent proof work, not an automatic Lean result.

## Stop, exceptions and checkpoint coverage

The program checks its stop flag and elapsed time before starting each k. Once k starts, all outer-interval exponents are processed before last_completed_k advances. A SIGTERM or SIGINT requests stopping rather than raising an immediate exception. Thus a normal stop completes the current k and saves a correct final prefix. A successful additional candidate also stops only after its k is finished.

The initial checkpoint declares empty coverage, last_completed_k=start-1, complete=false. Periodic checkpoints occur only after finishing a k, and the final complete flag is true exactly when the requested limit has been processed. Counters are not saved mid-k. The temporary-file replacement keeps a previously saved checkpoint intact until the next serialization completes.

An assertion, allocation failure, unexpected exception or hard kill before the final save leaves the earlier completed checkpoint, not a false extension to the unfinished k. On restart, coverage must be taken from the saved last_completed_k, not the last printed candidate or a wall-time estimate. A result with additional_candidates is not a no-hit result even if it happened at the requested final k.

Operational limitation: --seconds is a between-k check, and the fixed RLIMIT_CPU5500/5510 is not a per-request wall-time deadline. Both the self-test and an in-flight GMP call can exceed a shorter requested duration before the next check. An extension should leave explicit finishing margin before the session checkpoint and use the principal researcher's external monitoring/cutoff. This is a scheduling limitation, not an unsound mathematical skip.

## Pilot and self-test evidence

The saved pilot runs1001 through100000 inclusive and reports:

    complete=true; last_completed_k=100000
    enclosed_exponent_candidates=21775
    mod9_survivors=2433
    suffix_exclusions=2433
    pure_ten_exclusions=0; full_core_checks=0
    known=[]; additional_candidates=[]
    elapsed_seconds=4.487220341805369

The resource file records exit status0 and about4.53 seconds wall time. The lack of full-core checks in this pilot is not a missing fallback: all2433 congruence survivors already satisfied an exact suffix rejection.

The endpoint self-test uses an ordinary logarithm only to seed an exponent, then corrects it in both directions with exact integer comparisons against10^(k-1). It subsequently enumerates the exact half-open interval by multiplication. Therefore its inclusion assertions do not depend on the floating seed being accurate. For every k=2,...,10000 it asserts that every exact candidate is in the MPFR enclosure. The saved totals are2856 exact and2856 enclosed; together with the inclusion assertions, those totals show no enclosure extras in this test range.

Minor non-blocking test issue: the second loop's comment says it additionally detects enclosure extras, but its body is merely `if exact_length_condition: pass`. That loop itself records or asserts nothing. The aggregate counts above remain useful, and extras would be safe anyway. The comment should be changed or an explicit extras counter added if this diagnostic is retained; it does not invalidate the search or the completed pilot.

## Independent small checks in this review

Without extending the scan, I checked:

- Exact rational interval endpoints for k=10^r, r=1,...,7. These include lower integer endpoints at10 and1000, and empty intervals with strict integer upper endpoints at100,10000 and100000.
- Ten selected k values(2,3,9,11,99,101,999,1001,9999,10001) using an independent integer binary search for the first exponent reaching10^(k-1), followed by exact enumeration. All returned candidate sets matched the enclosures.
- Four full_core conversions, at(u,s)=(2,5),(2,70),(12,11),(17,333), comparing their complete strings, lengths and independently counted digit sums with ordinary Python integers.

All checks passed, taking about0.0228 seconds inside Python. These checks exercise the fallback absent from the pilot and critical endpoint cases; they are not a second complete1001..100000 run.

## Artifact identities and provenance

Reviewed SHA256 values:

    experiments/tail_search.py
    a47100157a65a594c8805401ba69eaa972cc1950c67d1d23c411d4fc8612857a

    experiments/gmp_suffix.py
    f313566343237927f2627bd3be6b41cf56b924e68803c48fe2d774bdae11b4f5

    experiments/tail_search_pilot.json
    8a4d111d8b6a9268547f1f1927ecbee8dd544aa67f6ec73d3a6353923e6b72d9

The pilot's recorded source hash matches the reviewed tail_search.py. Its own JSON records only that main-source hash, not the imported gmp_suffix.py hash; the latter is recorded here for reproducibility. This is not a defect in the current arithmetic, but future provenance records would be clearer if they included both.

No blocking correctness finding was identified. Any broader range must remain bounded by actual completed checkpoints and retain the numerical-evidence label.
