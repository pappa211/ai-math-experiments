# Frozen matching-five link lemmas and AC budget-six consequence

Frozen 2026-11-04 after the author sent the complete proof to root and Track B. This is an exact snapshot of the later sections in BOUNDARY_A.md, preserved for criticism. The original TUZA-17 clock/deadline are unchanged.

## Independently checked tight-frontier intersection obstruction

Coordinator proposal independently reconstructed by Track A. Assume m=b-1, choose ANY maximum L matching M, and suppose J=H-M is tight with k=nu(J)=p-m. Let R be the intersection of ALL maximum ordinary matchings of L. Then

    |R|>=m-1.

Proof. The declared graphical equality consequence gives k edge-disjoint K4 blocks containing all J triangles. Suppose f in M lies in an H triangle Q and some maximum L matching N avoids f. The triangle Q contains exactly one L edge, f, because L is induced triangle-free. It shares at most one edge with each J K4: sharing two would put all three Q vertices into that complete block and force f into J, impossible.

Each block contains at most one N edge, since it contains at most two X vertices. If a block sees both an N edge and a Q edge, the former has both endpoints in X and the latter has one endpoint in X and one outside; they share their X endpoint. Thus the two edges are adjacent, and a K4 face avoiding both exists. Pick such a face in every block. These k faces are edge-disjoint and avoid Q and every N edge. The m apex pages of N are mutually edge-disjoint and avoid Q because N omits f. Together with Q they give k+m+1=p+1 triangles, contradiction.

Therefore every old-supported f in M belongs to R. Cover J with2k edges and add only the old-supported M edges. Every H triangle missing from J uses an M edge, necessarily old-supported, so this covers H at cost at most2k+|R|. But frontier arithmetic gives tau(H)=2p-b=2k+m-1. Rearrangement proves |R|>=m-1. QED.

This proof is PROVED_USING_PUBLISHED_INPUT through the exact tight-J equality extraction. It does not replace a minimum cover by an arbitrary one in an AC argument; it supplies only the displayed necessary structural condition.

### R for the complete matching-five link classification

For every triangle-free F with mu(F)=5,vc(F)=7, |R|<=1. More exactly, R is nonempty only when F consists of two C5s and a disjoint K2, plusisolates; then it is the K2 edge.

If no vertex is essential, no edge belongs to every maximum matching, since its endpoints would then be essential. In the essential-vertex representation, a matching formed from one center-leaf edge and maximum matchings in the two C5s avoids every center-cycle edge and can avoid any chosen cycle edge. If there are at least two leaves, alternate the chosen leaf to avoid any center-leaf edge. If there is just one leaf but the center has a cycle neighbour x, match center to x, take a perfect matching of C5-x, and a maximum matching of the other C5; this avoids the sole leaf edge and still has size5. Only the disconnected single K2 case leaves a forced edge. All claims concern exact ordinary matching states of the link.

## Every matching-five, cover-seven link has a cover-critical allowed edge

Call an edge e **cover-critical** here if vc(F-e)=vc(F)-1, and **allowed** if some maximum ordinary F matching contains e. These terms concern the LINK, not triangle covers or triangle packings of H.

**Lemma.** Every finite triangle-free F with mu(F)=5 and vc(F)=7 contains an edge that is both cover-critical and allowed.

For the essential-vertex representation above, choose any C5 edge. Deleting it leaves a five-vertex path with a2-vertex cover. Choose the star center, this2-cover, and a3-cover of the other C5, obtaining6vertices. The chosen edge lies in a maximum matching consisting of a center-leaf edge and suitable two-edge matchings in each C5. Thus it has both properties.

For the no-essential case with two components, choose a C5 edge again; its deletion lowers the total cover number by one, and it is allowed. It remains to handle the11-vertex triangle-free factor-critical component F with independence number4.

### Elementary eleven-vertex lemma

Every triangle-free graph on11vertices with independence number4 has a cover-critical edge.

Choose a maximum independent set A of size4, and let B be the other7vertices. If some x in B has just one neighbour a in A, then A union {x} becomes independent after deleting xa, proving that edge cover-critical. Zero neighbours would already contradict alpha(F)=4. Hence assume every x in B has at least two A-neighbours.

Adjacent B vertices must have disjoint A-neighbourhoods, or they form a triangle with a shared A-neighbour. Consequently every B edge joins vertices whose A-neighbourhoods are complementary2-subsets of A. There are three complementary pairs of2-subsets; write their class sizes as (p_i,q_i), i=1,2,3. Let r count B vertices having three or four A-neighbours. These r vertices are isolated in F[B]. Selecting the larger class from each complementary pair, together with these r vertices, is independent, so

    (7+r+sum_i |p_i-q_i|)/2 <= 4.

The nonnegative integer r+sum_i|p_i-q_i| is odd, since the numerator is even. Therefore it equals1.

If r=0, exactly one pair is unbalanced by one. Select its larger class, whose A-neighbourhood is some2-set S, and fix a in A-S. From each balanced pair select the side whose A-neighbourhood omits a. These choices give an independent4-set C inside B, none of whose vertices is adjacent to a. Thus C union {a} is independent of size5, contradiction.

If r=1, every pair is balanced. Let w be the unique B vertex with three or four A-neighbours, and choose a neighbour a of w in A. From each complementary pair select the side omitting a, and include w. This is an independent4-set C. Its only neighbour of a is w. Deleting edge aw makes C union {a} independent of size5, so aw is cover-critical. This proves the eleven-vertex lemma.

Finally every edge uv of a factor-critical component is allowed: take a perfect matching of F-u, let vw be its edge covering v, and replace vw by uv. The result is a maximum F matching containing uv. Thus the cover-critical edge from the eleven-vertex lemma is also allowed. This completes the classification-based lemma. QED.

All arguments in this subsection are elementary and unbounded in the number of irrelevant isolated vertices; the only finite orders arise from the proved matching decomposition. No graph census or solver was used.

## Consequence: b<=6 is now settled for AC, subject to internal criticism

This is a joint deduction from the preceding shape lemmas and the coordinator's cover-loss observation; it does not assert raw-boundary nonrealizability. Suppose an eligible instance with b=6 failed AC. Matching bounds and the earlier b<=5/saturation results force m=5 and lambda=vc(L)=7. Choose a cover-critical allowed edge e from the lemma and a maximum matching M containing it. Every minimum H cover must omit e, since a cover containing e would leave residual link vertex cover at most vc(L-e)=6. Therefore tau(H-e)=tau(H).

Delete e first and the other four M edges next. Then

    tau(H-M)>=tau(H)-4=2p-10=2(p-5).

Aharoni and the packing identity bound the same quantity above by2nu(H-M)<=2(p-5), forcing J=H-M to be tight. The independently checked intersection obstruction gives |R|>=m-1=4. The complete link classification gives |R|<=1. Contradiction.

Thus every eligible b=6 instance satisfies AC, and together with earlier cases this proves AC whenever b<=6. Evidence category is PROVED_USING_PUBLISHED_INPUT through Aharoni/HNS; the new link classification and cover-critical-edge lemma are PROVED_ORDINARY. Historical originality remains UNESTABLISHED, and independent_final_verification remains NOT_RUN. This proof has been sent for internal AI criticism; no positive status should be inferred beyond its exact hypotheses.

The next numerical AC-obstruction window has b>=7. This does NOT prove that full eligible parameter instances at the earlier raw boundaries cannot exist. Raw realizability and AC failure are different questions; no eligible boundary embedding has been constructed here.
