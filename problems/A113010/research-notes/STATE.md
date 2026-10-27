> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Session 02 CLOSED — PARTIAL_INSIGHT

Actual start:2026-10-27 15:27:41 UTC. Research/synthesis stop:2026-10-27 15:55:09 UTC. Elapsed:27 minutes 28 seconds. Authorized maximum checkpoint:15:57:41 UTC. No new research is authorized.

Zero credible new global routes, no additional fixed point, and no complete solution candidate. Two informal structural diagnostics and several exact counterexamples were independently reviewed. No new Lean theorem or compilation; frozen sources and prior proof results remain unchanged. Recommendation:STOP. See SESSION_02_ULTRA_REPORT.md, SESSION_02_CRITIC.md, and SESSION_02_CLOSURE.json. All research agents completed; no unattended research experiments remain.

The Session 01 handoff is preserved verbatim below. Its previous no-further-window restriction was superseded only for the now-closed Session 02.

---

# Research state — Session 01 handoff

Session01 CLOSED at2026-10-27 14:46:45 UTC. All mathematical computation, review, and subagent work is finished. Final verification passed. No new research was initiated after the six-hour checkpoint. Neither frozen target is proved; no additional fixed point or complete solution candidate exists.

## Authorization and time

- Actual start:2026-10-27 08:45:56UTC.
- Six-hour checkpoint:2026-10-27 14:45:56UTC.
- Recorded stopping time:2026-10-27 14:46:45 UTC. Elapsed:6 hours 0 minutes 49 seconds.
- No further window is authorized. After the checkpoint report, stop and await explicit user authorization.
- Canonical workspace:the original research workspace.
- Trusted baseline:7f7e4c8e7298b811b1d8e68bf83df45ecf673445.
- Latest verified proof-source revision:9fae4ce09c9a254cb679b1ebd6611b4c2bd13f70.
- Exact frozen function:a n=((10).digits n).length^(List.sum((10).digits n)). Definition, targets, Lean4.33.1, and all dependency pins are unchanged.

## Current mathematical position

Every fixed point is n=k^s with k=d(n),s=S(n), and10^(k-1)<=k^s<10^k. For k>=10 there is at most one possible exponent. Exact trailing-zero normalization for k=10^t*u gives S(u^s)=s and t*s+d(u^s)=10^t*u. Powers10^t with t>0 are excluded as fixed-point digit counts; base1 remains allowed. For fixed u>=2,s there is at most one scaling t.

Lean proves only1 and32 with d(n)<=10004 (equivalently n<10^10004), and only1 and32 at all sizes when S(n)<=2500. Any additional point has k>=10005,s>=2501,at least278 nonzero digits,and strictly more than75percent zero digits. Generally r*s<k whenever10^r<=k. These conditions are compatible and supply no global cutoff.

At each fixed digit sum there are at most two actual fixed points; at most one unless s=4(mod18). Every s>=4 has some nontrivial length-compatible base. The formal sharpened ratio(x+1)^s<3*x^s for x>0,s<=x yields a two-consecutive-base restriction once a compatible k>=s is chosen. The full classification that every s>=7 has exactly one or two consecutive nontrivial length bases, together with the tiny exceptional tables, is reviewed informal mathematics; its global wrapper was not formalized. See INVERSE_LENGTH_SHARPENING_REVIEW.md and LEAN_INVERSE_LENGTH_SHARPENING_HANDOFF.md.

The explicit unbounded length/mod9 family also has S(k)=2 and gcd(k,10)=1. Compatible-residue witness constructions do not assert that the witness is a power. The known polynomial support bound is formalized; carry and fixed-polynomial separation deductions remain informal and nonuniform on the actual length curve. No novelty claim or complete solution route is made.

## Numerical evidence only

The completed searches cover potential fixed points with at most5,000,000digits and find no additional point:802,794 exact or conservatively enclosed exponent candidates,89,832 mod9 survivors. All final-interval survivors were suffix-excluded. This is not the Lean bound. Eleven sampled CPython integer checks completed, with six whole suffix strings agreeing with GMP and all six sums exceeding their exponent. Sampling is not exhaustive independent verification.

The finite core scan2<=u<=9,s<=1000000 found S(u^s)=s only at(2,5),(2,70). A140million-position suffix excludes u6,t9,s613612926 numerically: digit sum630014399. Both large arithmetic paths used GMP. The u4,t35,s11235304926103517236760601181978660 length/mod9 survivor remains unresolved; its digit sum is unknown. Direct suffix excess would require more than10^33 positions even in the best case. See RESOURCE_AND_CERTIFICATE_LIMITS.md.

## Verification and process state

Final integrated verification passed110 warning-free module builds,52 named transitive audits,and110 module-only replays. Allowed axioms only:propext,Classical.choice,Quot.sound. Runtime11:10.39,peakRSS2,295,148KiB,exit0; finished2026-10-27T14:35:44.762989UTC. Exact source/log hashes and all nine freshly checked pinned clean tracked dependency trees are in SESSION_01_FINAL_VERIFIED_SNAPSHOT.json. Earlier109-module evidence is historical and preserved. The baseline infrastructure check also passed, including the intentional negative compiler test.

No unfinished helper goals or incomplete proof drafts remain. Both subagents are complete and report no owned processes. A14:39UTC remote process audit found no workspace subprocesses; the identified leftover local verifier connection transport was then closed after confirming remote exit0. The final timed closure audit found no workspace subprocesses; see SESSION_01_CLOSURE.json. No external kernel, full dependency replay, cached-artifact provenance reconstruction, or clean final-target verification is claimed. No final candidate exists to trigger that separate acceptance procedure.

## Assessment and continuation

Assessment:MODERATE PROGRESS. Exactly one recommendation:REDIRECT.

The principal obstacle is conceptual: exclude S(k^s)=s uniformly on the length curve, including normalized cores u<s, or construct an actual equality. H for k>=s and10 not dividing k remains unproved and is stronger than necessary; even H leaves u<s. REDIRECT_RESEARCH_MEMO.md gives exact sufficient statements and a diagnostic first question on(10^T+1)^(10^T/T),T=4*10^j,j>=1. Proving that family alone would still leave the rest open. Further enumeration by itself does not resolve the target.

A fresh authorized session should read SESSION_01_REPORT.md,LEAN_STATUS.md,APPROACHES.md,REDIRECT_RESEARCH_MEMO.md,and REPRODUCTION_NOTES.md. Preserve the exact targets and distinguish proved,informal,numerical,and hypothetical results. No automatic continuation, new runtime reconfiguration, or push is authorized by these notes.
