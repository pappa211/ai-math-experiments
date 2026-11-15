# Late global-route triage: no new mechanism established

Status: rejected proposals, not a new theorem or new necessary-condition campaign. Research on this branch stopped before the coordinator's 20:05 UTC generation deadline. No further census was run.

## Distributions over maximum packings

Let P range over maximum triangle packings of cardinality k, and write b(P) for the 0/1 vector of their used graph edges. Genuine edge-minimal Tuza criticality implies that for each edge set S with |S|<=2, some maximum P has b(P)_e=0 for every e in S. Thus the convex hull of the b(P) meets each corresponding coordinate-zero face. This is an exact way to express the already-known one/two-edge packing resilience; it is not a new transfer theorem.

A proposed distribution with all edge marginals at most a specified theta would require a bound for every nonnegative edge weighting w:

    min_P sum_e w_e b(P)_e <= theta * sum_e w_e.

Indeed averaging the left expression under such a distribution proves the displayed inequality. Pair resilience supplies the zero bound when w has support at most two; it supplies no argument here for arbitrary weight supports. No graph-specific all-weight estimate with a useful next step was found. The generic-criticality finite-incidence obstruction already rules out treating the abstract resilience conditions alone as a graph-realization theorem.

More importantly, even a fractional edge-cover vector of total at most2k would still need an explicit integral-cover conversion. Fractional feasibility is genuinely weaker: in K5 there are ten triangles and each edge lies in three, so summing the fractional constraints shows optimum fractional cover10/3, attained by assigning1/3 to each of the ten edges. Any three integral edges meet at most nine triangles, whereas the edges inside a2+3 vertex partition give a four-cover, so the integral optimum is4. This elementary example does NOT refute a2nu rounding theorem (nu(K5)=2); it shows why the rounding step cannot simply be omitted. No rounding rule, quantified loss bound, or integral separation certificate was obtained.

Therefore the distribution suggestion was rejected at its missing-transfer stage, without promoting it to a conjectured proof or claiming it has been refuted in every possible form.

## Private-witness Hall assignment is an old unresolved obligation

A tempting alternative was to associate minimum-cover edges with packed triangles through their actual private witnesses, then seek two units of capacity per packed triangle by Hall's theorem. Private-witness collisions would require mixed two-cover-edge triangles and all-cover-edge triangles to repair the deficient sets. That is precisely the kind of global compatible-packet obligation already recorded in frozen TUZA-14B, Track A sectionsA1-A4: its exact packet budget and cover-repair identity are proved conditionally, but the required global packet or cheaper cover is not supplied.

The frozen source also gives a literal maximum-private prepacking that cannot extend to a full optimum, despite a mixed reorganization attaining it. Accordingly no extension or Hall claim was inferred merely from choosing a maximum private prepacking. No genuinely different compatibility argument emerged, so this suggestion was rejected as a return to an already-open bridge, not counted as new progress.

Source: frozen public commit d4029fbafc3dffc250b50ed237ad81c3206cd1a0, `problems/TUZA-14B/notes/TRACK_A.md`, whole-file SHA256 fd49f57fc0c028342f9225b65189f870dcf6166d556178c2de8d8fd10c55d1f0. The introductory material through sectionA5 was read from the root-frozen workspace snapshot; its byte hash was independently matched to `git show` of that immutable object. It is used only to identify the already-open obligation and the reason not to retry it.

## Separator or transfer alternative

No new separator operation with an explicit cover/packing transfer and a credible availability argument was found. Inducing a proper subgraph supplies an inductive Tuza bound but does not itself pay for the removed triangles; that missing compatibility is the substantive issue. No separator hypothesis was asserted on actual critical graphs without proof.

This branch therefore closes with no additional global mechanism. The positive common-vertex packing theorem, its local-exchange corollary, and the independently certified failures of the two identification proposals remain the completed results. Unrestricted Tuza remains unresolved, and no claim about a hypothetical positive-defect graph was experimentally tested as though such examples were available.
