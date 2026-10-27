> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Adjacent residue refinement — completed

Session01, 2026-10-27. Source: proof/A113010/AdjacentResidues.lean. Imports the completed InverseLength module. Neither frozen target is proved.

- adjacent_power_mod_nine_iff: for every k and positive s, both k^s and (k+1)^s equal s modulo9 iff s%18=4 and k%9=4.
- fixed_eq_of_same_digitSum_mod_ne_four: two fixed points with equal digit sums are equal if that sum is not4 modulo18.
- distinct_fixed_same_digitSum_mod_eighteen: contrapositive formulation.

The finite9-by18 residue table is discharged by ordinary decide, with a separate s1 case and a proved exponent-period reduction. The fixed-point corollary uses the inverse two-base theorem and the previously proved classification for sums at most2500. All three public transitive axiom audits report only propext, Classical.choice, Quot.sound. No admissions or compiler-trusted decision procedure. Final warning-free build and module-only leanchecker replay both exited0. Imported environments are reused; this is not an external independent kernel or final-candidate clean checkout.

## Final build resources

```text
	Command being timed: "scripts/lean.sh --wfail build A113010.AdjacentResidues"
	User time (seconds): 3.60
	System time (seconds): 1.06
	Percent of CPU this job got: 119%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 0:03.89
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 1848536
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 1
	Minor (reclaiming a frame) page faults: 78694
	Voluntary context switches: 9558
	Involuntary context switches: 604
	Swaps: 0
	File system inputs: 72
	File system outputs: 2688
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```

## Module replay resources

```text
	Command being timed: "scripts/lean.sh env leanchecker -v A113010.AdjacentResidues"
	User time (seconds): 1.68
	System time (seconds): 3.12
	Percent of CPU this job got: 100%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 0:04.80
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 1562504
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 0
	Minor (reclaiming a frame) page faults: 63184
	Voluntary context switches: 85
	Involuntary context switches: 177
	Swaps: 0
	File system inputs: 0
	File system outputs: 8
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```
