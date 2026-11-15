# TUZA-18 replay receipt

**PASS.** Both frozen proof files match the original checkpoint and the independent checker reproduced every mathematical result from the original run. The reconstructed argument establishes the scoped common-vertex theorem and its local exchange corollary. [Reconstruction](RECONSTRUCTION.md)

## Source and scope

Original workspace `https://github.com/pappa211/ai-math-experiments/blob/main/problems/TUZA-18`, commit `57708a8413929012d9ca8d15b0f925b3ef6b51e8`, annotated tag `tuza18-final-checkpoint`, tag object `f321778765a10f2bd4cf100b85988abca0e9c275`. The original worktree was clean with zero remotes before and after execution. All 303 files listed in the frozen manifest matched both their recorded SHA-256 and their Git blob IDs. The manifest itself matched the tag's recorded digest `026a1cf95f849123548b43fe4783d18558b3707eb35687151f4da14723de8525`. [Source verification — excluded historical file; disposition](../TUZA-16-19-SOURCE_MANIFEST.json) · [Tag object — inspected source/access record](../../papers/tuza-16-19-research-summary/LITERATURE_RECHECK.md)

A separate replay attachment was unavailable. The selected scope follows the common-vertex independent review bundle in the frozen reproduction guide. Both proof texts, the prior reconstruction, the checker source, and the prior result were extracted directly from the tagged commit and also checked against the review manifest. [Review manifest](frozen/review/star_fresh_manifest.json)

| Original proof | SHA-256 |
|---|---|
| [Common-vertex maximum packing](frozen/notes/criticality_star_pk_theorem.md) | `f08cc442241eef4b790bc4b5228c958045593f97ebf56c1259a6f6b1ffe5488b` |
| [Local exchange dichotomy](frozen/notes/criticality_star_local_dichotomy.md) | `ef9e1a69c6722a648eb35549295e80d18b2e062ee6b2d6421bf91dbbcf8c7575` |

The reconstruction was written for this replay from the two frozen proof texts. The checker was authored independently during the original run and executed here. Its output is bounded supporting evidence. The mathematical reconstruction is the all-size argument.

## Execution and comparison

On the Apple Silicon Mac, pinned Python 3.12.12 ran in isolated mode with assertions enabled. Execution began at **2026-11-15 01:43:47.465818 UTC** and completed at **01:43:49.308537 UTC**, exit status 0, with empty stderr. The only checker change redirected its output to the replay folder. The patch and original script are included. [Execution record](checker_execution.json) · [Exact patch](output_path.patch) · [Frozen checker](frozen/review/star_fresh_verify.py)

| Check | Result |
|---|---:|
| Exhaustive fixed-packing graph instances | 41,984 |
| Targeted additional runs | 10 |
| Constructed covers verified | 7,720 |
| Augmentations verified | 34,274 |
| Locally stable packings with a larger packing in the same graph | 72 |

The exhaustive domains use \((n,k)=(5,0),(6,1),(7,2),(7,3)\), where \(n\) is the vertex count and \(k\) is the size of the fixed common-vertex packing. All domain results, all targeted case outputs, the explicit locally stable nonmaximum example, and all aggregate counts matched. Only elapsed time and the digest of the script with the redirected output differed. [Comparison](checker_comparison.json) · [Checker result](checker_result.json) · [Frozen result](frozen/review/star_fresh_verifier.json)

## Reproduction

The driver can be copied to an empty scratch directory and invoked with the pinned interpreter. It reads the original workspace through read-only Git commands and writes all replay evidence where the driver lives. The saved package has a checksum inventory. [Driver — excluded historical file; disposition](../TUZA-16-19-SOURCE_MANIFEST.json) · [SHA-256 inventory](SHA256SUMS)

```sh
source LOCAL_ENVIRONMENT
python -I run_replay.py
```
