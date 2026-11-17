> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A simplicial degree-four vertex: paid positive-gain deletion and the neutral frontier

Frozen ordinary proof candidate v1, TUZA-26, 2026-11-17. Independent review required. This broadens the actual one-vertex K5 operation without assuming that every predecessor triangle is K4-completed. The positive-gain branch is excluded. The neutral branch is reduced to exact opposite-pair defect-one residuals; its complete restoration remains OPEN.

## Setting and exact initial transfers

Let Q be the conditional minimum unknown support inside fixed minimum-CS G, with the accepted core constraints, including single-edge resilience, minimum support degree at least four, and every actual Q triangle contained in a minimum Q cover. Write nu(Q)=k,tau(Q)=2k-1. Suppose c is a degree-four simplicial vertex, with neighborhood A={a,b,d,e} a literal K4. Let J=Q-c, retaining every other edge and vertex.

Every new c-triangle uses an A edge. A packing has at most two such triangles; if two, their A edges form an opposite matching of the K4. Hence the exact packing response is

    nu(Q)=max(nu(J),
              1+max_{f in E(A)}nu(J-f),
              2+max_{opposite M in A}nu(J-M)).

Each upper bound is attained by appending the corresponding one or two c-triangles. Any J cover meets some A edge ab; adding the two c-spokes to the other two A vertices covers all remaining c-pages. Therefore

    tau(Q)<=tau(J)+2.

Proper CS on J gives nu(J)>=k-1. Thus only positive gain nu(J)=k-1 and neutral gain nu(J)=k remain. All old J edges remain supported: the only old edges in new c-triangles lie in the already triangular K4 A.

## 1. Positive gain is an actual paid descent

Suppose p=nu(J)=k-1. The cover transfer and proper CS force tau(J) in{2p-1,2p}, so J has defect one or zero.

If J is tight B, its literal A clique lies in one old tight component D. If D=K4, adding c turns just D into K5, leaving every other triangle component unchanged, so Q is tight B, contradiction. If D=K5, adding c creates K6 minus one edge on D union{c}. It has a four-packing: with A={a,b,d,e} and fifth old vertex z, use

    cab, cde, zad, zbe.

Appending maxima from the other old components raises packing by two over J, contrary to the assumed gain one. Thus J has defect one.

### Resilience of this particular predecessor

Suppose f were critical in J. Then J-f is B with nu=p-1 and tau=2p-2. If f is an A edge, the surviving K4-f diamond has two triangles sharing an edge; one old literal tight clique would force the missing f, impossible. Hence f lies outside A, and the intact A belongs to a literal K4/K5 component Z of J-f.

If Z=K4, adjoining c replaces it by K5 and raises packing by exactly one. Thus nu(Q-f)=p, contradicting Q's resilience because nu(Q)=p+1. If Z=K5, adjoining c makes K6-e, which has a five-edge triangle cover. The old Z costs four cover edges, so tau(Q-f)<=tau(J-f)+1=2p-1; restoring f costs at most one and gives tau(Q)<=2p, contradiction.

Therefore J is resilient. This is the previously accepted general K4-to-K5-vertex resilience lemma (apex_k5_triangle_leaf_v2.md, Section3), with its numerical premises established here. It does not require predecessor-wide K4 completion.

Consequently deletion of c has exact payment

    nu(Q)=nu(J)+1, tau(Q)=tau(J)+2,

and produces a genuinely smaller resilient defect-one support.

### Complete named reconstruction

Every new c-page meets J through an A edge. All A triangles belong to one old component, so triangle connectivity of Q forces J to have exactly that one component; any other component would remain separate. Since J is supported, no extra background edge remains. Its active support is strictly smaller than Q, inside fixed G, and is therefore named C12 by Q's explicit minimum.

W5 contains no K4. If J=K5-e, A excludes one of the two nonadjacent peripheral vertices; that untouched vertex retains degree three in Q, contrary to minimum degree four.

For a fresh edge-glued C12 model, every K4 clique lies within one of its literal K4/K5 pieces. If A is a whole K4 piece, adding c simply upgrades that piece to a K5 with the same fresh attachment edges. Q remains in the exact fresh K4/K5 edge-gluing class. Its given defect one invokes the archived exact classification and puts Q in C12, contradiction.

If A lies in a K5 piece D, that piece is a leaf in the named construction (or one side of the double-K5 model). Its complement has a maximum packing avoiding their shared attachment edge: choose a root K4 maximum avoiding that edge and each other leaf maximum avoiding its own attachment, or choose a maximum of the other K5 avoiding the shared edge. Thus nu(J)=2+nu(outside D), with an outside maximum avoiding the attachment. The displayed K6-e four-packing combines with that outside maximum, giving nu(Q)>=nu(J)+2, again contrary to gain one.

This excludes the positive-gain branch completely by actual deletion, verified payment, resilience and legitimate fixed-G naming. No defect-two graph has been named.

## 2. Neutral gain has exact defect three and opposite-pair marks

Suppose nu(J)=k. The exact packing response forces EVERY A edge to be critical in J:

    nu(J-f)=k-1 for every f in E(A).

It also forces every opposite pair M to lose two units:

    nu(J-M)=k-2.

Indeed a larger residual would accept the two disjoint c-pages and exceed k; the reverse bound follows from two edge deletions.

The cover transfer gives tau(J)>=2k-3. Choose a minimum Q cover containing the actual triangle cab, using the accepted universal triangle-cover premise. It contains ca,cb,ab. It cannot contain a third c-spoke: removing its at least three c-spokes would give a J cover of size at most2k-4. Thus it uses exactly those two c-spokes. The remaining c-page cde forces the opposite edge de into its old part. Removing ca,cb therefore gives a J cover of size2k-3 containing the opposite pair {ab,de}.

Hence

    tau(J)=2k-3, delta(J)=3,

and EVERY opposite matching M lies in a minimum J cover, by choosing the appropriate c-triangle. Consequently each actual residual R=J-M satisfies

    nu(R)=k-2, tau(R)=2k-5, delta(R)=1.

These are the exact enabled residuals. If such R is resilient, its active component can be named by minimum-Q reasoning, but its full two-edge restoration and background still require a proof. If R is fragile at f, then

    S=J-(M union{f}) satisfies B,
    nu(S)=k-3=m, tau(S)=2m.

Thus J=S+M+f has packing gain THREE and cover increase THREE; Q restores the simplicial c as well, with total gain three and cover increase five over S. This is not the already solved three-edge gain-two profile. The earlier R3 theorem cannot be substituted for this different payment.

Each of the three bases in M union{f} has an S-bare ordinary page: otherwise the whole-one-base footprint lemma would let a minimum S cover meet all ordinary pages on that base, and adding the other two bases would cover J with2m+2 edges, contrary to tau(J)=2m+3. Mixed triangles are covered by one of those other restored edges. This is a verified useful starting point for the remaining central-K5 operation, not a completed classification.

## Current remaining operation

The unresolved neutral case retains all actual outside pages. A proposed augmentation seeks three edge-disjoint ordinary pages on M union{f}, together with a central c-triangle on an unused old A-cycle edge, compatible with a maximum S packing. Bare pages make this plausible, but arbitrary supported third-page footprints can create opposite-edge obstructions in old K4 pieces. No universal avoidance or fresh-gluing assertion is being assumed.

The companion work on the nonsimplicial degree-four cap is distinct: notes/apex_degree_four_cap_descent_v1.md applies at codegree two and excludes its defect-two and hub-ineligible defect-three branches by an actual W5-chord reconstruction. The present simplicial case includes the star555 sharp control's neighbor pattern and is not covered by that earlier degree-four cap note.

No numerical process, broad census, contraction, or all-graph classification was used. The positive branch is an actual paid reduction awaiting independent review; the neutral opposite-pair profile and the compulsory bare-page fact are ordinary deductions. Availability/completion of the neutral restoration remains OPEN.
