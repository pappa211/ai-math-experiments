> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Triangle/K4 leaf regions: exact profiles and the remaining branch

Frozen for independent review, 2026-11-16. Ordinary proofs below are provisional pending fresh critic. This note concerns actual proper leaf regions, not an assertion that arbitrary response tables identify replaceable regions.

## Setup

Let H be a finite simple graph, A a literal clique of H, and G obtained by adding the fresh vertices and missing edges of one K_s on A plus those vertices. No actual triangle crosses this piece boundary. Equivalently for a frozen-F leaf in a graph with background edges, delete only the piece's newly added edges E(K_s)\E(A), never the old separator edges E(A), to obtain H and retain the full vertex universe and all background edges. The identities concern present triangles; they do not discard background information needed by a future restored triangle. Write p=nu(H), d(H)=2nu(H)-tau(H). For an old-edge set X, write H-X for edge deletion.

## Exact profiles

**K4 on a triangle A, one fresh vertex x.** With F=E(A):

    nu(G)=max(p, 1+max_{f in F} nu(H-f)),
    tau(G)=min(tau(H)+1, 3+tau(H-F)).

At most one new triangle fits in a packing because each uses two of the three new spokes. A chosen page uses exactly its old base f. An H cover includes at least one A edge. If it includes all three, no new spoke is needed; otherwise one spoke covers every remaining new page. Conversely a G cover with no new spoke must include all three old bases; one with a new spoke costs at least tau(H)+1.

**K5 on a triangle A, two fresh vertices x,y.** With F=E(A):

    nu(G)=max(p+1, 2+max_{f in F} nu(H-f)),
    tau(G)=min(tau(H)+3, 4+tau(H-F)).

A single triangle xya uses no old base, so p+1 is attainable. At most two new triangles can be packed. Every pair uses at least one old base. For every base bc, the pages xya and xbc use just that base and are disjoint, so the formula is exact. To see the upper bound two: three new triangles would have to be one xy-page and one x-page and one y-page; after the xy-page at a, both other pages would use the same old base bc.

If an old cover includes all three A edges, the extra edge xy covers all remaining new triangles, for total 4+tau(H-F). Otherwise a missing old base forces two new spokes (one for each fresh apex); including xy then costs at least three new edges. If xy is omitted, the three xy-pages have disjoint spoke pairs and also force at least three. Three suffice: when the old cover contains ab, use xc,yc,xy. This proves the cover formula.

**K5 on a K4 A, one fresh vertex x.** Let F=E(A), let M range over the three perfect matchings of A, and let U range over its four triangles. Then

    nu(G)=max(p, 1+max_{f in F}nu(H-f), 2+max_M nu(H-M)),
    tau(G)=min(2+tau(H), 4+min_U tau(H-E(U)), 6+tau(H-F)).

Two new pages fit exactly when their bases form a perfect matching; at most two fit because there are four spokes. For the cover formula, if Z subset A is the set of selected new spokes, every old edge on A\Z must be forced into the old cover. Its exact cost is

    |Z| + |E(A\Z)| + tau(H-E(A\Z)).

Minimize over the sixteen Z. The |Z|=2 terms have minimum 2+tau(H): every H minimum cover uses at least one edge of A, and forcing that edge costs exactly tau(H). The |Z|>=3 terms are dominated; the other cases give the displayed formula. In particular the cover increase is at most two.

## Full gain implies resilience descent

If a proper leaf has at most b mutually disjoint new triangles and nu(G)=nu(H)+b, then final one-edge resilience implies one-edge resilience of H: for each old edge f,

    nu(G)=nu(G-f)<=nu(H-f)+b<=nu(H)+b.

Equality forces nu(H-f)=nu(H). Here b=1,2,2 for the three cases above. This implication requires the full packing gain; final resilience alone does not imply descent.

## Defect-one graphs covered by K4s cannot have critical edges

Assume every actual triangle of H lies in a literal K4 and CS holds for every H-f. If tau(H)=2nu(H)-1, then H is one-edge packing resilient.

Proof. Suppose f is critical and put p=nu(H). Deleting one edge lowers packing by at most one, so nu(H-f)=p-1. Cover deletion gives tau(H-f)>=tau(H)-1=2p-2. CS on H-f forces equality and B(H-f). The critical edge f lies in a triangle; complete it to a literal K4 in H. Removing f leaves two triangles sharing their opposite edge. Their component in H-f contains all four K4 vertices, so a literal K4 or K5 component would also contain f, a contradiction. This proves resilience.

Every graph in the clique branch of frozen F has the K4-completion property. In the minimum-CS residual application, the stated proper-subgraph CS premises are available. This lemma is not asserted for arbitrary graphs without these premises.

## What remains after the identities

For a final defect-one resilient G with proper-subgraph CS:

- A K4 triangle leaf with full gain 1 descends to a resilient predecessor and increases defect by at least one. In the zero-gain case all three separator edges are packing-critical. The cover bound forces d(H)<=2; d(H)=0 is impossible by B resilience, and d(H)=1 is impossible by the preceding K4-completion lemma when H is itself a frozen-F assembly. Thus the unresolved predecessor has **defect exactly two and a packing-critical separator triangle**.
- A K5 triangle leaf has gain 1 or 2. Full gain 2 descends and increases defect by at least one. Gain 1 means every separator edge is critical; in a frozen-F predecessor the same argument narrows it to defect two.
- A K5-on-K4 leaf with full gain 2 raises defect by at least two and cannot occur in a final defect-one graph if its predecessor satisfies Tuza. At gain 1, the predecessor has defect at most one; if defect one and still a frozen-F assembly, the K4-completion lemma supplies resilience. At gain 0, all six K4 edges are critical, and the predecessor defect is at most three. This remaining case is not eliminated here.

These are correctness/payment statements for a real region. Their availability in the general minimum-CS residual still depends on proving membership in F (or finding such a region directly). Even within F, the critical-triangle defect-two branch and the low-gain K4-separator branch need a structural argument. No intermediate resilience was assumed.

## Counterexample to unconditional descent and actual finite coverage

The targeted search used roots K4/K5; fresh K4 attachments on triangles and fresh K5 attachments on triangles/K4s; at most ten vertices and at most five attachments. It excluded edge attachments deliberately because the other worker owns their transfer. Graphs were deduplicated by isomorphism (WL hash was only a bucket, with exact isomorphism confirmation). All completed profiles use exact finite recurrences. No timeout occurred in this run.

There were 3,380 distinct child graphs and 17,014 leaf presentations; 3,588 presentations ended one-edge resilient, and 2,048 such presentations had a nonresilient predecessor. The sole distinct defect-one graph in this restricted overlap-only universe was K5-e (four presentations). There were no defect-one descent failures. This is a targeted falsification exercise, not a classification theorem or evidence that all hard states are exhausted.

A smallest found descent failure has root clique 0123, K4 additions on 0124 and 0135, then K5 addition on 01236. The six-vertex predecessor has nu=3,tau=4, and deleting 23 lowers nu to 2. The seven-vertex result has nu=4,tau=5 and survives all single-edge deletions. It has defect three, not defect one.

There is also a defect-two descent failure: start K4 0123, then add one K4 vertex on each face, 0124,0135,0236,1237. Before the last vertex the seven-vertex graph has nu=4,tau=5 and is not resilient. The final eight-vertex graph has nu=4,tau=6 and is resilient. Thus zero-gain repair is real even quite near defect one. It cannot be excluded by a generic descent argument.

The exact witnesses and compact graph identities are in `evidence/mixed_residual_bridge_search.json`; generator and local exact checker are `scripts/mixed_residual_bridge_search.py` and `scripts/mixed_exact.py`. Repeated equivalent failure records were omitted from the compact receipt; all counts, graph identities, and representative witnesses for every observed (overlap size,piece size,defect) failure type are retained.


## Dated supersession — 2026-11-16 16:55:54 UTC

The earlier local statement that matching reconstruction remains unresolved is superseded, at its exact conditional scope, by [Named-core matching reconstruction](mixed_named_matching_reconstruction_frozen.md). Together with the matching-deletion resilience theorem and the exact marked-edge component transfer, that proof excludes the zero-gain configuration when its smaller active component is named by the explicitly stated wider-class minimality. It does not supply a leaf region, prove broad rigidity/frozen-F availability, or prove unrestricted CS/Tuza. The earlier numerical/proof arguments are retained unchanged; consult the final reconstruction note and fresh critic receipt for authoritative scope and review status.
