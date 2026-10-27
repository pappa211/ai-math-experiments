> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Independent consistency review of the Session 01 draft report

2026-10-27. Reviewed the draft `notes/SESSION_01_REPORT.md` read at 13:55:52 UTC. Line references below refer to that snapshot. Root owns the report; this review did not edit it. The intentional stop-time, process, and final-checkpoint placeholders were not treated as defects.

## Conclusion

The report's principal conclusions, formal bounds, numerical totals, and verification levels agree with the inspected handoffs and evidence records. It correctly says neither frozen target is proved, distinguishes numerical coverage through five million digit counts from the formal 10004-digit bound, and does not misrepresent the sampled independent check or same-GMP cross-check as a second exhaustive proof.

Three wording corrections should be made to preserve exact mathematical scope. They do not invalidate a reported theorem or numerical result.

1. **Line 57, pure-ten boundary.** Replace “Positive pure powers of ten cannot be digit-count bases of fixed points” with “Powers `10^t` with `t>0` cannot be digit-count bases of fixed points.” The formal theorem assumes a positive exponent. The value `1=10^0` is itself the digit-count base of known fixed point 1. The existing phrase may intend positive exponent, but is ambiguous.

2. **Line 75, approximation versus matching prefix.** Replace “Its exponential approximation controls only a short prefix” with “Its exponential approximation provides only a short range of absolute decimal precision and does not by itself guarantee a matching prefix.” The late note explicitly distinguishes numerical closeness from common digits because a decimal-grid boundary may lie between the two values. The conclusion about insufficient precision for a digit-sum witness remains correct.

3. **Line 111, candidate scope.** Replace “It leaves at most two candidates per sum, usually one” with “After the established finite exclusions, at most two possible additional fixed points remain per prescribed sum, and at most one when `s` is not 4 modulo 18.” Unrestricted length candidates need not number at most two (`s=6` has bases 2,3,4,5). The report gives the correct regional hypothesis earlier; preserve it in this condensed statement. Alternatively say explicitly “length/modulo-9 candidates in the region `k>=2s`.”

Two further clarifications would help, although the surrounding text already limits their interpretation:

- **Line 107:** narrow “Congruence and finite-residue methods do not close the argument” to “The reviewed fixed-modulus necessary-condition sieves do not close the argument.” The witness construction does not prove that every conceivable adaptive-modulus or power-sensitive congruence method must fail.
- **Line 127:** after proposing the family `k=10^T+1`, explicitly note that this diagnostic lies in the `u>=s` normalized domain and does not itself address the complementary `u<s` gap. The report already says a proof covers only a subfamily; this specifies which gap it would leave.

## Evidence and scope cross-checks

- The finite, digit-sum, sparsity, inverse-length, and adjacent-residue statements match the completed handoffs and the previously reviewed source declarations. The distinctions between actual fixed points, length candidates, and non-fixed containment witnesses are correct elsewhere in the report.
- `scan_modular_100000.json` is complete through 100000 and records 22184 candidates, 2483 modulo-9 survivors, and only known points 1 and 32. The base-1 case is handled separately, consistent with the report table.
- `tail_search_1000000.json` is complete for 100001..1000000 and records 158877 enclosed candidates and 17616 survivors, all suffix-excluded.
- `tail_search_5000000.json` is complete for 1000001..5000000 and records 621733 enclosed candidates and 69733 survivors, all suffix-excluded; elapsed time 4385.164028 seconds and peak RSS 21220 KiB match the report.
- The sums are exactly 802794 candidates and 89832 survivors. The caveat that outward enclosures may include extra candidates is retained correctly.
- `tail_search_independent_large.json` records complete=true, eleven distinct sampled bases, six suffix checks, all six exclusion flags true, elapsed time 33.867738 seconds, and matching current-source provenance. The report accurately limits this to sampled CPython arithmetic verification.
- `core_equalities_1000000.jsonl` has a completed terminal record for u=9,s=1000000 and exactly the two equality events (2,5),(2,70). The report does not turn this into an all-exponent assertion or confuse the prefiltered `below=0` counter with a universal lower bound.
- `normalized_100.json` contains the two stated large survivors. `gmp_suffix_u6_t9.jsonl` and its recheck both record suffix sum 630014399 and SHA-256 `6168554f40cc72b3f78cac850120386300d074721903f270684641b7d7caf88c`. The report correctly labels them two numerical paths through the same GMP library.
- For the unresolved exponent 11235304926103517236760601181978660, `floor(s/9)+1` is exactly 1248367214011501915195622353553185, matching the minimum number of explicit decimal positions needed for a strict digit-sum-excess certificate. The report appropriately allows compressed symbolic arguments to evade that explicit-size limitation.
- `SESSION_01_VERIFIED_SNAPSHOT.json` and `FINAL_VERIFICATION_FOLLOWUP.md` agree on source revision `17a0a5a2b4c1f08e5bcb9c0a8330596dc880a201`, 109 modules, 46 named audits, 109 module-only replays, and log completion at 13:26:17.815136 UTC. The saved resource records show infrastructure 6.63 seconds and research 637.53 seconds, peak research RSS 2112472 KiB, zero swaps, and exit status zero.
- The report explicitly limits replay to selected modules against imported environments and does not claim an external kernel, full dependency replay, independent clean checkout, or verification of a completed final target. This is consistent with the follow-up record. This critic review itself did not replay any Lean verification.

## Attribution and hypothesis labels

The polynomial statement is correctly restricted to the formalized field hypotheses and identified as known mathematics. The Mattarei handoff says the characteristic-zero bound was already known before that paper; “recorded in Mattarei” would be a slightly more precise phrase than “attributed to Mattarei” if avoiding any implication about original priority. The report already disclaims novelty, so no unsupported novelty claim was found.

The BBM summary properly retains its additional term-count uniformity while noting missing gap and prime-exponent hypotheses. The H discussion and references to L0, L, and C match the redirect memo and do not promote them into proved lemmas. The proposed first diagnostic distinguishes strict failure from an actual equality. No source is presented as an imported Lean axiom.

No new research, numerical scan, large arithmetic computation, or Lean build was started. No owned processes remain running. Root retains responsibility for final timing/process/Git fields at the authorized checkpoint.

## Principal follow-up

The three required wording corrections and both optional scope clarifications were applied to the draft report after this review. The polynomial result is now described as recorded in Mattarei. A later separately reviewed informal sharpening is added under the informal-results heading, with its own source note. Final timing and process fields remain to be completed at the checkpoint.

Final timing/process fields were completed at2026-10-27 14:46:45 UTC; no closure placeholders remain. The later110-module final integration was checked by root and is evidenced by SESSION_01_FINAL_VERIFIED_SNAPSHOT.json.
