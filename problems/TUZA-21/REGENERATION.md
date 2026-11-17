> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Explicit regeneration and stopping decision

Regeneration occurred after the initial PK reduction failed and ordinary H-D component peeling reached an all-size occupied-attachment gap. It changed the proof architecture, rather than adding one optional gain or retaining an old cover irreversibly.

## New starting point: minimum ordinary covers

C21-C fixes a minimum ordinary cover C and seeks enough edge-disjoint private witness triangles F_C (exactly one C edge). Its seven-item record was frozen before testing in notes/private_cover_candidate.md. Minimum cardinality, the triangle-free complement, and literal shared endpoints gave a plausible source of exchange inequalities. Its main objections were conflicts among private witnesses and omission of triangles with two or three C edges.

Small exact controls did not expose a failure. They were not treated as positive structural evidence. The coordinator then used the cone representation: for triangle-free L, a maximum independent set U gives a minimum spoke cover of the cone of size |V(L)|-alpha(L), while private packings use at most alpha(L) spokes into U. The Clebsch graph has16vertices and alpha5, so this defeats the proposed bound. Independent reconstruction further classified ALL minimum cone covers and proved private optimum5 for each of them. Thus even changing to a favorable minimum cover does not repair C21-C. The exact diagnosis is loss of two-cover-edge triangles.

## Successor with all triangle types retained

C21-D permits a maximum private packing Q to extend to an inclusion-maximal full packing P and asks for |C|<=2|P|. Every-extension, some-extension, and some-choice variants were kept separate. The pretest record is notes/pk_successor_candidate.md.

For cones, the full triangle problem is ordinary matching: endpoints of any maximal matching cover the link, so this successor succeeds on Clebsch for a concrete reason. Outside cones no corresponding endpoint-covering, two-unit charge, or valid augmentation lemma emerged. The34-case/31-edge-set bounded screen examined341 minimum covers, one cover-family prefix capped at64; all examined states were already private-feasible. It tested zero deficient states, and thus gives no evidence for the repair. Unexamined states remain UNKNOWN. The candidate is STALLED/CONJECTURE, not refuted or confirmed.

## Other representations seriously considered

The detailed scout assessment in notes/regeneration_pk_assessment.md considers (i) retaining all C-edge color patterns and minimum-cover replacement inequalities, (ii) exchanging edges in a maximum triangle-free spanning subgraph, and (iii) coupled link matchings at multiple apices. Their plausible structural bases are respectively global optimality, complement optimization, and the genuine cone matching theorem. Their strongest objections are the absence of an exchange/integrality theorem, unavailable bounded augmentation or termination, and crossing-edge/mixed-triangle compatibility. An exact optimizer would retain information but would not discharge the missing theorem. None supplies a credible concrete next action warranting further proof effort in this campaign.

## Decision

STOP this campaign after closeout, while retaining H-D, A1, PK, and the full-extension proposals as open at their stated quantifiers. The reason is exhausted supported mechanisms after explicit regeneration, not the failure of the first two rules, not a fixed round count, and not a lack of more computable examples. The scoped k2 theorem and negative results are retained honestly as such. No statement of impossibility for Tuza or future research is made, and no follow-on campaign is authorized or started.

The mission did not approach its three-hour review or hard deadline. Actual research-stop and closeout timestamps are recorded in operations/clock.json and FINAL_RECEIPT.md. The final private commit and clean worktree audit are reported non-self-referentially in the owner answer.
