# Track A follow-up: realizability of the first AC numerical boundary

Started2026-11-04T01:21:51Z in the same TUZA-17 mission, original deadline unchanged. User steering asks about actual eligible H,X, not just a bare triangle-free link. This agent shares the coordinator context. No heavy search is running.

## Frozen exact target

For eligible H,X, put L=H[X], G=H+zX, p=nu(G), b=2p-tau(H), and m=mu(L). Investigate whether an actual eligible instance can have

    b=5,  m=4,  vc(L)=6.

The previously established necessary m<=b rules out b=4,m>=5. The b<=4 AC theorem is already proved elsewhere in this mission. A naked graph L with matching4 and vertex cover6 does not establish realizability of the displayed full-instance target. Even a realization would not refute AC unless every minimum H cover remained incompatible.

## Unbounded exact link-shape classification — PROVED_ORDINARY

**Lemma.** A finite triangle-free graph F satisfies mu(F)=4 and vc(F)=6 if and only if its nontrivial connected components are exactly two C5s. Isolated vertices are arbitrary.

**Proof.** The reverse implication follows by additivity: each C5 has matching2 and vertex cover3. For the forward implication, suppose a vertex v is covered by every maximum matching of F. Then mu(F-v)=3. The elementary triangle-free matching bound vc(J)<=2mu(J)-2 for mu(J)>=3, proved in B_FROZEN_ADDENDUM_1.md, gives vc(F-v)<=4. Adding v gives vc(F)<=5, a contradiction. Thus every vertex can be missed by some maximum matching.

Apply the elementary Gallai lemma, proved in A_ELEMENTARY_MATCHING_BLOCKER.md, separately to each connected component: every component has odd order and a matching missing exactly one vertex. This includes isolated vertices. A nontrivial triangle-free component cannot have order3 (the only factor-critical graph of that order is a triangle), so it has matching number at least2. Total matching number4 leaves just two possibilities: one9-vertex component, or two5-vertex components, with arbitrary isolates.

Every triangle-free graph on9vertices has an independent set of size4. Here is a short complete proof. First, every triangle-free6-vertex graph has an independent3-set: if a vertex has degree at least3, take three neighbours; otherwise a vertex has at least three nonneighbours, among which some pair is nonadjacent, or they would form a triangle, and take that pair with the vertex. Now suppose a triangle-free9-vertex graph had independence number at most3. Its degrees are at most3 because every neighbourhood is independent. If any degree were at most2, at least6vertices remain outside its closed neighbourhood; their independent3-set, together with the chosen vertex, is an independent4-set. Therefore every degree would be3, impossible because the degree sum27 is odd. This proves the claim and excludes the9-vertex component, whose cover number is at most5.

Each of the two5-vertex components is factor-critical and triangle-free. It has minimum degree at least2: removing the sole neighbour of a degree1 vertex would leave an isolated vertex and prevent a perfect matching. It has maximum degree at most2: if v had at least3neighbours, those neighbours are independent; after deleting v, four remaining vertices containing an independent3-set cannot have a perfect matching. Thus every degree is2, and connectedness forces C5. QED.

All invoked matching ingredients have complete elementary proofs saved in this mission. No equality theorem about unrestricted triangle packings is used. Historical originality is UNESTABLISHED; this is an exact structural classification for the boundary test, not a solution of AC.

## What the shape lemma does and does not prove

Any genuine first-boundary realization must induce two disjoint5-cycles plusisolates on X. It is insufficient to attach an arbitrary outside graph and report those link parameters: b=2nu(G)-tau(H) still has to equal5 under the full actual triangle family. The original H may couple the two link components through outside edges; that coupling cannot be discarded without a separate theorem.

At this freeze the full H,X realizability remains UNDER_INVESTIGATION. No eligible witness with b=5 is asserted yet. The tight matching-deletion case has the component-separation theorem in B_FROZEN_ADDENDUM_2.md; the stable slack-one case can still have outside interactions and is not removed by this link-shape classification alone.

## Later update: b=5 AC elimination is not a nonrealizability theorem

The coordinator and fresh critic supplied the following additional argument after the initial shape freeze. If b=5,m=4 and AC failed, the shape lemma gives L=2C5 plusisolates and lambda=6. Deleting ANY cycle edge reduces vc(L) to5. Hence every minimum H cover would avoid every L edge. This implies tau(H-e)=tau(H) for each e in L: otherwise a residual cover of size tau(H)-1 plus e would be a minimum H cover containing e.

For a maximum L matching M of size4, delete one edge with zero cover loss and then the other three, obtaining

    tau(H-M)>=tau(H)-3=2p-8=2(p-4).

Aharoni on H-M and the apex packing bound give the reverse chain

    tau(H-M)<=2nu(H-M)<=2(p-4),

so H-M is tight. The previously proved tight-deletion component transfer separates the two C5 link components; each component's matching number2 is an already settled AC case. The transfer proves AC, contradiction. Thus ALL b<=5 instances satisfy AC.

This argument depends on the declared Aharoni/HNS equality inputs through the tight-deletion transfer. It excludes AC failure at b=5; it does not prove that raw parameters b=5,m=4,vc(L)=6 cannot occur in some eligible H. No such realization has been found by this scout.

## Revised first numerical AC obstruction target: b=6,m=5,vc(L)=7

The revision follows a proved case elimination, not a patched conjecture. The literal AC statement is unchanged. For matching5, every triangle-free link has vc<=7: an essential vertex reduces to matching4 with cover<=6; otherwise the factor-critical decomposition below and the9-vertex independent-set argument give the bound. Combining m<=b, the saturated m=b theorem and these cover bounds leaves b=6,m=5,vc(L)=7 as the next possible AC obstruction parameters. Realizability still requires a full eligible H,X.

### Complete shape description for mu(F)=5,vc(F)=7

Exactly one of the following descriptions applies, allowing arbitrary additional isolated vertices:

1. **An essential-vertex representation:** begin with two disjoint C5s and isolated vertices, add a new vertex v, join it to at least one of those isolated vertices, and optionally join it to an independent vertex subset of each C5. The new leaf neighbours can be arbitrarily numerous.
2. **No essential vertex, two nontrivial components:** a C5 and a7-vertex triangle-free factor-critical graph of independence number3.
3. **No essential vertex, one nontrivial component:** an11-vertex triangle-free factor-critical graph of independence number4.

Here “essential” concerns ordinary maximum MATCHINGS of F, not triangle packings of H.

Proof. If v is matching-essential, mu(F-v)=4 and vc(F-v)>=vc(F)-1=6; the known upper bound makes equality. The previous classification gives two C5s and isolates. Triangle-freeness makes N(v) independent within each cycle. Every independent subset of a C5 is contained in a minimum3-vertex cover: the only nontrivial case is a nonadjacent pair, handled by cyclic symmetry with {0,2} contained in {0,2,3}. If v had no isolated neighbour, minimum cycle covers containing all its cycle neighbours would together cover F with6vertices. Thus a leaf neighbour is necessary. Conversely, one leaf edge plus maximum cycle matchings gives matching5. Any cover either selects v in addition to six cycle-cover vertices, or omits v and selects a leaf in addition to those six; cover number is7.

If no vertex is essential, Gallai makes each component factor-critical. Nontrivial triangle-free components contribute matching number at least2. A partition of5 therefore has one component of matching5/order11, or components of matching3/order7 and matching2/order5. The latter order5 component is C5. Triangle-free graphs on7vertices have independence at least3, and on11vertices have independence at least4 (restrict to any9vertices). Cover number7 forces equality in the indicated independence bounds, yielding the stated descriptions. The converse follows from additivity and factor-criticality. QED.

This classification is a constraint on the actual LINK and does not provide an eligible surrounding H. In particular C5 disjoint-union C7 and2C5 disjoint-union K2 are examples of possible link shapes, not full boundary witnesses.

## Ordinary packing-footprint constraints on realizations

Let P be any maximum H triangle packing. Since H[X] is induced triangle-free, each H triangle contains at most one L edge. Therefore its link footprint F=P-edges intersect E(L) has at most h=nu(H) edges. Every matching of L-F appends its apex pages to P, so

    a=nu(G)-h >= mu(L-F).

For an odd cycle C_(2k+1), reducing its matching number from k to at most j<k requires at least2k+1-2j deleted edges. Indeed after deleting f>=1 edges, the remaining graph is a disjoint union of paths with2k+1-f edges, and its matching number is at least ceil((2k+1-f)/2). This supplies the following necessary lower bounds on h, without assuming an actual Tuza counterexample:

| Link | Budget | (D(H),a) | Necessary h |
|---|---:|---|---:|
| 2C5 |5|(1,2)|>=5|
| 2C5 |5|(3,1)|>=8|
| 2C5 |5|(5,0)|>=10|
| C5 disjoint-union C7 |6|(2,2)|>=7|
| C5 disjoint-union C7 |6|(4,1)|>=10|
| C5 disjoint-union C7 |6|(6,0)|>=12|
| 2C5 disjoint-union K2 |6|(2,2)|>=6|
| 2C5 disjoint-union K2 |6|(4,1)|>=9|
| 2C5 disjoint-union K2 |6|(6,0)|>=11|

For b=6, the nominal D=0,a=3 case is impossible at matching5 under the eligible equality theorem: tight H consists of K4 blocks; each block contains at most one L edge, and its maximum packing can avoid that edge. Consequently every maximum L matching appends to a maximum H packing, forcing a=5. This uses the declared scoped equality input, not unrestricted equality structure.

The table is only a necessary footprint calculation; it is not a proof that any listed regime is realizable. It explains why very small H searches may miss the literal target. No heavy computation was run for this follow-up, and no full eligible boundary witness is currently asserted.

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

## Final disposition at Track A handoff

The budget<=6 deduction was accepted by the fresh internal critic (notes/CRITIC_BUDGET_SIX.md). The coordinator authenticated the external thirteen-vertex Ramsey catalogue and its isomorphism to the displayed C13; notes/CRITIC_CATALOGUE_SCOPE.md accepts that separately declared completeness input, not an internally recomputed census. With that input, the budget7,cover9 branch is also settled. The first remaining conditional numerical AC branch is b=7,m=6,lambda=vc(L)=8. A full eligible H,X realization at that boundary is UNKNOWN; none was constructed here. Literal AC remains unresolved. No further search is running or authorized by this handoff, and independent_final_verification remains NOT_RUN. Earlier freezes are preserved as chronology rather than silently promoted.
