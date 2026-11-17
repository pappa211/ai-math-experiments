> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: matching deletion and resilient defect-one residuals

**PASS for the three-edge restoration lemma and matching-deletion resilience theorem.** Reviewed the proof initially frozen in `notes/mixed_matching_deletion_resilience_frozen.md`, SHA-256 `010bb103062c4a3ee2dee9deb120f50f3a0d54dc0936bec800e21e0652340b33`. The final reviewed application update has SHA-256 `22eaeebb2dcc4a122cd03c6f556570e885fe4671bf8f890fe675363c8b550978`; the revised zero-gain note has SHA-256 `73618e4d80c07daf3a85a208466ecd442a598f390d1177882dfd4c8ade4699f5`. The theorem and three-shape proof are unchanged. A subsequently coordinated weakening of the leaf connection is independently justified below: its matching-loss identity needs zero packing gain, not the triangle-extension hypothesis used in the first draft.

## Three-edge restoration

Let L=J-S be B, with S three distinct edges containing a two-edge matching. A K4 of J containing exactly one deleted edge would leave a diamond in L. Its two surviving triangles share an edge, putting all four K4 vertices in one literal B component and forcing the missing edge. This is impossible. Hence every completing K4 of a lost triangle contains at least two S edges.

The three possible endpoint graphs are exhaustive: a three-edge matching; a two-edge path disjoint from one edge; or a three-edge path. A triangle and a three-edge star have matching number one and are excluded.

For three disjoint edges ab,cd,ef, each pair determines exactly one possible completion K4. If all three exist, old triangles ace,bce share ce in L; their B component contains a,b and forces deleted ab. Thus at most two completion K4s exist. Every lost triangle lies in their union, and any packing uses at most one triangle from each K4. Packing gain is at most two.

For S={ab,ae,cd} on five distinct vertices, the disjoint pairs specify K4[abcd] and K4[aecd]. A completion containing ab,ae has form K4[abez]. If two distinct fourth vertices z,z' occur, old triangles bez,bez' share be. Their B component forces zz'. If zz'=cd, this is already impossible; otherwise az,az',zz' form an old triangle joining a to the component and forcing ab. Thus there is at most one such fourth vertex. If all three possible K4s exist, their old edges form triangles bce,bde sharing be, forcing deleted cd in their common B component. Again at most two K4s contain all lost triangles, so packing gain is at most two.

For S={ab,bc,cd}, cover with the outer edges ab,cd. The only unhit lost triangles can be bcz with z outside {a,b,c,d}. A completing K4 must contain another deleted edge, so it is of type abcz or bcdz. There is at most one external apex of each type: two first-type apices create old triangles acx,acx' in one B component, force xx', then the old triangle bxx' forces missing bc. The second type is symmetric.

For a first-type apex x, an old minimum cover can contain cx in its literal B component; for a second-type apex y, one can contain by in its component. Those two components must be distinct, because otherwise they contain both b and c while bc is absent. These minimum local covers therefore combine without conflict into a minimum L cover covering every remaining bc-page. This also works if x=y: the old components can share that vertex, and the page is covered. Adding ab,cd gives tau(J)<=tau(L)+2. No bound of two on packing gain is required in this path case.

Thus all cases exclude the simultaneous values nu(J)=nu(L)+3 and tau(J)>=tau(L)+3. Every lost triangle is accounted for via its actual K4 completion, including outside apices and background edges that become triangular on restoration.

## Resilience after deleting a matching

Assume J is K4-completed, has tau(J)=2p-3, and a matching M satisfies nu(J-M)=p-2 and tau(J-M)=2p-5. If f were critical in R=J-M, then L=R-f has nu=p-3. Cover extension gives tau(L)>=2p-6, and proper-subgraph CS gives equality and B(L). For S=M union {f}, J would then have packing gain three and cover gain three over L, contradicting the three-edge lemma. Hence R is one-edge resilient and defect one.

The proper-CS premise is used only to make L tight B and, later, to make component defects nonnegative and classify defect-zero components. It does not classify the defect-one graph R. Component additivity gives one resilient defect-one component and any number of tight literal K4/K5 components; it does not establish that the full R has connected support.

## Leaf connection: unnecessary extension premise removed

For a zero-gain K5-on-K4 leaf, let the new vertex be x and the old K4 be A. For every opposite pair M={ab,cd}, the new triangles xab and xcd are edge-disjoint: they share the vertex x, but no edge. Both append to any J-M packing. Therefore

    nu(J-M)+2 <= nu(G)=nu(J)=p.

Deleting two old edges lowers packing by at most two, so equality follows: nu(J-M)=p-2 for every perfect matching M. This uses only zero packing gain and the actual leaf incidence. It is also immediate from the independently accepted exact leaf packing formula. The every-triangle-extension premise in the first zero-gain note was unnecessary.

The minimum-cover argument is also independent of triangle extension. If a minimum J cover contained an entire A triangle U, the valid one-spoke leaf cover would give tau(G)<=4+tau(J-U)<=tau(J)+1, contradicting tau(J)=2p-3 and tau(G)=2p-1. Thus the cover's restriction to A is a triangle-free K4 cover. Such a set is an opposite pair, a four-vertex path, or a four-cycle; each contains a perfect matching M. For that M, restricting the minimum cover and extending by M give tau(J-M)=tau(J)-2=2p-5. This supplies precisely the matching-deletion theorem's hypotheses, provided J itself has K4-completion and proper-subgraph CS.

Consequently the smaller active defect-one component can be reached without inheriting triangle extension from the parent. It still need not have an actual missing-triangle parent, a prescribed attachment interface, three-vertex connectivity, or membership in the frozen family. Reconstructing J and the original leaf graph from this component together with the tight components and background edges remains a separate obligation.

## Independently checked negative control

`reviews/critic_matching_control.py` reconstructs the five stated K4 pieces, all actual triangles, and exact packing and cover optima. It verifies (nu(J),tau(J))=(5,6) and (nu(L),tau(L))=(2,4) for S={01,12,23}. The old support is exactly the two literal K4s 0246 and 1357; old background edges are 03,14,25. The receipt is `reviews/critic_matching_control.json`.

Thus packing gain three is real in the path case, while the cover gain is only two. This refutes the discarded packing-only surrogate and supports the need for the separate cover argument. It does not refute the stated three-edge lemma or supply a minimum-counterexample example.

This review is ordinary independent AI reconstruction plus one exact finite control. No unrestricted Tuza/CS result, classification of all smaller defect-one graphs, or universal replacement availability is claimed.
