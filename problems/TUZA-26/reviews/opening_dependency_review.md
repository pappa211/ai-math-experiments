> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Opening dependency audit: accepted at exact scopes

Frozen independent ordinary reconstruction and bounded finite check, TUZA-26, 2026-11-16. Verdict: **PASS at the explicit scopes below; no load-bearing gap found in the five requested opening dependencies.** This is an AI mathematical review, not external peer review or Lean verification. The minimum-CS extraction and named strict-restoration chain remain archived dependencies rather than a fresh full-chain audit here.

Host authentication: Darwin, LOCAL_HOST, OWNER, real home `PRIVATE_HOME_REMOVED`, real research root `PRIVATE_PATH_REMOVED`. Pinned Python 3.12.12 was selected through migration/env.sh. TUZA-25 HEAD was the requested 04bdbfd9794d2218e096ddd90a039b41e80c6d8f, with empty tracked/untracked status; TUZA-22 HEAD was d048e6e8207d9dece8ee23af6e5085726d826db4, also clean. Source files were read only. The configured request is Astra/Ultra; no independently observable serving attestation is claimed.

## 1. Critical-edge deletion really preserves single-edge resilience

Accepted PROVED_ORDINARY: every actual J triangle must be K4-completed; delta(J)=2; CS must hold on the relevant proper subgraphs. For a critical edge e, put p=nu(J), R=J-e. Deletion gives nu(R)=p-1 and tau(R) in {2p-3,2p-2}. The upper alternative would be tight B. A J-K4 containing e leaves a diamond in R: its two triangles share an edge and put both missing-edge endpoints in one literal clique component, contradiction. Thus delta(R)=1.

If f were critical in R, L=J-{e,f} has nu=p-2 and, by cover extension and proper CS, tau=2p-4 and B. Every J-K4 containing either deleted edge must contain both, or its surviving diamond again forces an absent edge. Disjoint e,f determine at most one such K4. For adjacent e=uv,f=uw, two distinct fourth vertices x,y would yield old triangles vwx,vwy in one B component, hence old xy; the old triangle uxy then forces missing uv. Again at most one K4 contains every lost triangle. A packing uses at most one triangle from that K4, contrary to loss two. This verifies resilience, not merely numerical defect.

Connectivity needs connected nonempty triangle support in J. All supported edges other than e survive in a K4 or a diamond. Every removed e-page's diamond lies in the unique defect-one component: it cannot lie in a tight clique containing both endpoints of e. Therefore restoration cannot connect any other R component to it; connected J forces connected R. No every-triangle extension, two-edge resilience, or missing-triangle parent is inherited.

## 2. Matching deletion and the indispensable P4 cover saving

Accepted PROVED_ORDINARY: J is K4-completed, tau(J)=2p-3, M is a two-edge matching with nu(J-M)=p-2 and tau(J-M)=2p-5, and proper CS holds where used. A further critical f would make L=J-(M union {f}) tight B with nu=p-3. Restoring three edges would then have packing gain three and cover gain three.

The three endpoint shapes are exhaustive. A three-edge matching, or P3 plus a disjoint edge, permits at most two completing K4s: a third creates old triangles merging a literal B component across a missing edge. Thus packing gain is at most two. For P4, S={ab,bc,cd}, that packing bound is false. Instead add ab,cd to a minimum L cover. The only uncovered new pages can be bcz at outside apices. K4 completion permits at most one apex of type abcz and one of type bcdz. The first requires an old cover through cz, the second through bz. If both exist, their old literal clique components are distinct, because a common component would contain b,c and force missing bc. Minimum covers through those edges therefore combine, proving tau(J)<=tau(L)+2. This contradicts cover gain three and proves resilience of J-M.

Fresh exact negative control: union of K4s 0246,0124,0123,1235,1357, deleting 01,12,23. The checker obtains J=(nu,tau)=(5,6), L=(2,4), old supports K4[0246] and K4[1357], background 03,14,25. Thus the packing-only surrogate is REFUTED; the accepted cover-saving lemma survives.

Component additivity gives one resilient defect-one active component plus tight literal K4/K5 components. It does not make the entire matching residual connected or classify its active component.

## 3. Exact leaf and marked-boundary formulas

Accepted PROVED_ORDINARY, only for the specified actual leaf with no additional crossing triangles. Retain the old overlap, every vertex, and all background. Put p=nu(H), F=E(A).

| Actual attachment | Exact packing | Exact cover |
|---|---|---|
| K4 on triangle A | max(p,1+max_f nu(H-f)) | min(tau(H)+1,3+tau(H-F)) |
| K5 on triangle A | max(p+1,2+max_f nu(H-f)) | min(tau(H)+3,4+tau(H-F)) |
| K5 on K4 A | max(p,1+max_f nu(H-f),2+max_M nu(H-M)) | min(2+tau(H),4+min_U tau(H-E(U)),6+tau(H-F)) |

Here f ranges over F, M over the three perfect matchings of A, and U over its four triangles. The packing alternatives enumerate all possible new triangles and their old-edge footprints. Cover formulas follow by conditioning on selected fresh spokes. In the last formula, a spoke set Z has exact cost |Z|+|E(A minus Z)|+tau(H-E(A minus Z)); the sixteen possibilities reduce to the displayed terms. Full packing gain b, together with final resilience, forces predecessor resilience by nu(G-f)<=nu(H-f)+b. This implication is unavailable at submaximal gain.

For matching reconstruction, K4-completion confines every outside-apex restored page to a surviving diamond in the unique active component. A tight residual component Q can meet outside triangles only through one old A crossedge f_Q. It cannot contain both endpoints of either missing matching edge. Connected restored support makes that boundary nonempty; distinct Q have distinct boundary edges, at most four total.

Delete only E(Q) minus {f_Q}. Let F be all retained boundary edges and r=sum nu(Q). Then nu(H)=r+nu(K) and **tau(H)=2r+tau(K-F)**. For a K cover D, the exact additional cost of Q is 2nu(Q)-1 if f_Q is in D and 2nu(Q) otherwise. Therefore the residual objective is min_D(|D|-|D intersect F|), exactly tau(K-F). This does not require simultaneous eligibility in an unmarked minimum K cover. Arbitrary shared vertices are harmless because triangle supports are edge-disjoint. A one-edge triangle boundary alone is not a fresh vertex-gluing certificate.

## 4. Frozen C12 and complete 210-insertion domain

The frozen list is nine central-K4 star models, with one to three leaves on distinct edges of one star, each leaf K4 or K5, modulo leaf-size permutation; two K5s sharing one edge; W5; K5-e. These are exactly the twelve archived labelled representatives. The fresh checker directly regenerates and compares every edge set and every provided clique-piece certificate.

| Model | n | m | Internal nonedges | nu | tau |
|---|---:|---:|---:|---:|---:|
| star_4 | 6 | 11 | 4 | 2 | 3 |
| star_5 | 7 | 15 | 6 | 3 | 5 |
| star_44 | 8 | 16 | 12 | 3 | 5 |
| star_45 | 9 | 20 | 16 | 4 | 7 |
| star_55 | 10 | 24 | 21 | 5 | 9 |
| star_444 | 10 | 21 | 24 | 4 | 7 |
| star_445 | 11 | 25 | 30 | 5 | 9 |
| star_455 | 12 | 29 | 37 | 6 | 11 |
| star_555 | 13 | 33 | 45 | 7 | 13 |
| two_K5_edge | 8 | 19 | 9 | 4 | 7 |
| W5 | 6 | 10 | 5 | 2 | 3 |
| K5-e | 5 | 9 | 1 | 2 | 3 |

Fresh VERIFIED_FINITE: every one of the 210 labelled internal missing-edge insertions was optimized directly, without symmetry reduction, sampling, imported solver, or timeout. Exactly four have defect two; all four are K4-completed and have only the inserted edge critical, hence no wholly critical triangle. They are the four symmetric missing-pair insertions in star_4, one graph type. All reported archived optima and new-triangle lists agree. Every seed's defect one, entire triangle support, and every-edge resilience were also independently checked.

The application with arbitrary background is ordinary, separate from this finite domain: each new e-page has a J-K4 completion whose surviving diamond lies entirely in R support. Every page endpoint and old spoke is therefore in that support. Hence all actual triangles of R+e coincide with support(R)+e; background-only vertices and old background edges create no further page. This requires K4-completion of the predecessor J. Without it, the 210 finite cases do not exhaust the restoration interface.

## 5. All twelve structural properties and named matching reconstruction

Accepted PROVED_ORDINARY, also independently VERIFIED_FINITE for all twelve: every model has a universal support vertex and no induced C4. Use the star center, a common two-K5 endpoint, the W5 hub, or one of the three K5-e universal vertices. Fresh edge-glued cliques are chordal by eliminating fresh leaf vertices; K5-e has two simplicial nonadjacent vertices. In W5 a four-cycle through the hub has a chord and four rim vertices cannot form a cycle. No assertion of chordality is made for W5.

A universal vertex means no actual background edge can join two support vertices: it would itself be triangular through that vertex. In named matching reconstruction, outside-apex pages lie in retained diamonds. Writing I=A intersect V(C), |I|<=1 disconnects triangle support, |I|=4 induces a forbidden C4, |I|=2 compares edge-attached K4/K5 and gains one, and |I|=3 compares exact triangle-leaf formulas max(p,1+b) and max(p+1,2+b), again gaining one. Tight pieces can first be peeled on both sides. Every surviving predecessor triangle retains a K4 completion: zero matching-edge completions lie wholly in C; one-edge completions retain their C diamond; two-edge completions are precisely central A. This accepts the zero-gain exclusion at its stated premises.

## Evidence, quarantine, and remaining gap

The new files are scripts/opening_checks.py and evidence/opening_checks.json. The one serial standard-library run took 0.9374 seconds, exploring 20,685 packing and 264,659 covering recursion states. Exact packing branches on whether a graph edge is unused or used by exactly one incident triangle; exact cover branches on the three ways to hit a selected triangle. Actual triangle-conflict components split additively. Returned packing/cover witnesses are checked explicitly. No numerical process remains.

No Lean command was run: Lean coverage for these reviewed ordinary arguments is NOT_RUN. Historical TUZA-23/24 receipts do not formalize this whole chain. Broad historical generator totals, the claimed ten-vertex census, and every unreviewed earlier restoration dependency remain at their archived status; they are not promoted by this small checker.

Quarantined inferences: proper-subgraph CS classifies defect zero only; it cannot name a defect-one support. The separate minimum-Q choice operates only inside fixed G and only after every membership predicate and strict supported-edge decrease is established. Q does not inherit original-residual triangle extension, two-edge resilience, or a missing-triangle parent. The leaf exclusions do not prove configuration availability, predecessor K4-completion, low degree, apex rigidity, or global R. In particular minimum-degree-at-least-four unknown cores still have no available local reduction from these five dependencies alone.
