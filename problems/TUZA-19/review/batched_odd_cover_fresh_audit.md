# Fresh audit: batched odd-cover obstruction with strict ordinary Tuza slack

Verdict: **PASS** for the exact arbitrarily-large-graph theorem in the frozen target. No material flaw or missing hypothesis was found. The result is an ordinary existence proof, independently reviewed by AI. It is neither an unrestricted Tuza counterexample nor a formal or human verification.

Frozen at 2026-11-15T09:09:47Z. Reviewer: `batched_odd_fresh`, a fresh task context assigned the frozen statement and its dependencies. The mission requested Astra/Ultra; exact serving model and effort are not exposed to this reviewer. The developer identifies this agent as Codex based on GPT-6, and no stronger serving claim is made.

The target is `notes/root_batched_odd_cover_obstruction.md`, SHA256 `240f03702de1bc3f2deadb1be99307c27de26849607b2bd50e8ecd2cffcca4f7`. All sources listed in the companion manifest were read, hash-checked, and left unchanged. The prior batched normalization review and source-attribution audit were consulted; their favorable verdicts were not substituted for reconstructing the arguments below. This reviewer did not repeat the literature search or inspect the source PDFs.

The original clock remains start 2026-11-15T01:53:58Z, research cutoff 09:23:58Z, hard deadline 09:53:58Z. AGENTS.md, MISSION.txt and operations/clock.json were read. Before mathematics, `uname -s` returned Darwin and the canonical workspace root was present. All work was local. The pinned native environment was sourced for a single independent finite check of the eight base triples. No graph census, solver, Lean, remote execution, new environment, or publication was used.

## 1. Exact accepted quantifiers and scope

For every fixed real gamma with 1/2 < gamma < 1, there are arbitrarily large finite simple graphs W of order n such that simultaneously:

- at least n exp(-(log n)^gamma) vertices are universal;
- every graph edge lies in at least that many actual graph triangles;
- every actual triangle has all three edges in some minimum triangle edge cover (TF);
- every vertex link is connected and non-WKE;
- tau(W) < 2nu(W) < pi(W).

Here nu and tau are integral triangle packing and edge-cover numbers. An odd triangle cover meets each actual triangle in one or three edges, and pi is its minimum size. A graph L is WKE if some matching M and some vertex cover Q of L-M satisfy |Q| <= |M|. These meanings are preserved throughout.

The parameter sequence is unbounded, not a claim at every prescribed integer order n. The finite seed is selected by an ordinary probabilistic existence argument. No literal huge graph or full large edge list was produced. The strict ordinary Tuza inequality is certified independently of Tuza's conjecture. The result refutes the odd-cover bound on the stated simultaneous class, but establishes no two-edge packing resilience, minimality, H-O2 counterexample, or conclusion about its TF strengthening. Novelty of the combined obstruction remains unresolved.

## 2. Finite K5 seed: probabilistic proof and actual triangles

The required part of `global_routes_critical_cut_obstruction.md` is valid for L=1. Its proof chooses each five-subset of [N] with probability p=N^(-15/4), with mean total edge count mu=p binom(N,5), asymptotic to N^(5/4)/120. For a fixed two-coloring with class sizes u,v, the number of balanced five-subsets is

    binom(u,2)binom(v,3)+binom(u,3)binom(v,2)
      =u(u-1)v(v-1)(N-4)/12.

The stated bound on u(u-1)v(v-1) gives balanced fraction at most (5/8)N(N-2)/((N-1)(N-3)), at most 3/4 for N>=13. Thus selected unbalanced blocks have mean z>=mu/4. Exponential Markov applied to 2^(-X) yields Pr[X<=z/2]<=exp(-z/8). Since mu/8<=z/2, a union bound over all 2^N colorings is at most 2^N exp(-mu/32), tending to zero.

The expected numbers of Berge cycles of lengths 2 and 3 are at most N^8 p^2=N^(1/2) and N^12 p^3=N^(3/4). The counting uses two cyclic vertices in each incident five-edge and three additional vertices per edge; descriptions with repeated hyperedges are discarded. Markov makes the probability of more than N such cycles tend to zero. Deleting the union of one selected block per original short cycle removes at most N blocks, destroys every short cycle, and leaves more than mu/8-N unavoidable unbalanced blocks in every coloring. Taking N sufficiently large makes this greater than L N. Minimizing unbalanced counts adds over incidence components, so one nonempty component has strictly more than L times its own number of vertices. This provides a finite connected linear five-uniform incidence system without Berge triangles, with no isolates.

Replace each hyperedge by a literal K5. Blocks have disjoint graph edges by linearity. If two edges of a graph triangle have one owner, the third must have that owner: otherwise two owners would share two vertices. Three different owners would form a forbidden Berge triangle. Hence every actual triangle is block-local. The graph is connected by incidence connectedness.

For K5, two disjoint triangles exist. Three would leave one edge from an even-degree graph after deleting an even-degree triangle union, which is impossible. Thus nu(K5)=2. Three edges cannot cover all ten triangles, since each lies in only three; four suffice as the three edges of any chosen triangle plus the opposite edge. This proves tau(K5)=4 and TF. Each link is K4, with any deleted matching having size at most 2 and every residual cover having size at least 2. Thus |Q|>=|M| for every matching and residual cover, although strict non-WKE is not asserted for K4.

With c seed blocks and r seed vertices, exact triangle ownership gives tau(S)=4c=2nu(S), TF, and links that are disjoint unions of K4. A balanced block contributes four monochromatic edges, an unbalanced block at least six. The incidence property therefore gives

    beta(S)>4c+2r>2nu(S).

No resilience fact from the stronger seed note is needed in the transfer, and none is transferred implicitly.

## 3. Role amplification and exact beta identity

The quantitative incidence construction also reconstructs from its displayed elementary proof. For fixed r, let D=2^d, B=2rD and M=B^d. A largest equal-squared-norm level among {0,...,D-1}^d has at least D^d/(d(D-1)^2+1) vectors. Its base-B encodings form a slope set A of size at least M exp(-C_r sqrt(log M)). Every equation u a+v b=(u+v)c with positive integer weights u+v<=r has no base carries. Equal squared norms and the weighted squared-distance identity then force a=b=c.

Use the r-partite blocks {(i,x+i a):0<=i<r}, with x in [1,M] and a in A, on N=r^2 M ambient vertices. Two shared points determine the same slope and start, proving linearity. A Berge triangle would have three distinct intersection roles. Eliminating the starts gives a weighted-average equation among slopes, with positive weights whose sum is at most r-1. It forces coincident blocks, a contradiction. The number of blocks b=M|A| is at least N^2 exp(-C_S sqrt(log N)) after enlarging the fixed constant.

Place the same role-labelled S-copy on every block and discard unused vertices. The same two-owner/three-owner triangle argument gives disjoint copied edge sets and only copy-local actual triangles. Therefore

    nu(H)=bnu(S),  tau(H)=btau(S).

The role parts are independent. For a fixed slope, all M starts provide M nonisolated vertices in each role because S has no isolates; hence N/r<=h<=N. At a vertex, distinct incident copies have disjoint old neighbor sets and no cross-link edges, so its old link remains a disjoint union of K4. TF passes using independent minimum covers on the disjoint copied edge sets.

For every coloring, each S-copy contributes at least beta(S) monochromatic edges, so beta(H)>=b beta(S). For the reverse inequality, fix one optimum coloring of S and give every H-vertex its role's color. This is consistent on shared vertices and makes every copy optimum. Thus

    beta(H)=b beta(S).

This exact equality depends on the supplied role labels; arbitrary unlabelled gluing would not justify it. The incidence ingredient is classical Behrend/Erdos-Frankl-Rodl, with attribution retained in the frozen source audit.

## 4. Batches, all triangles, and exact ordinary covers

Partition each independent role part into full size-q batches and at most one smaller nonempty batch. The counts satisfy sum g_i=h, 1<=g_i<=q, k_1<=r, k<=h/q+r, and k_0>=h/q-r. Add the q-clique A and disjoint private cliques B_i of size s_i=q+g_i+6, adjacent precisely to A and I_i besides their own clique edges. Retain H and add all A-H edges. The order is

    n_W=q+2h+k(q+6).

The local graph J_i on A,B_i,I_i is K_(L_i) minus the I_i-internal edges, with L_i=2(q+g_i+3). Every triangle with a fresh vertex belongs to its J_i. Independence of I_i forbids an old H-edge in J_i. With no fresh vertex, a triangle is old in H, consists of one apex over an H-edge, has two apices and an old vertex and is local to that vertex's batch, or lies wholly in A. Pure A triangles can have several owners but are assigned only once when counting a packing. This exhausts actual graph triangles.

Write a=binom(q,2), e_i=binom(L_i,2)-binom(g_i,2), and t_i=e_i-L_i^2/4. Deleting a triangle cover leaves a triangle-free graph, so Mantel gives a local cover lower bound t_i. Place A union I_i on one side of a balanced local partition and fill that side with three B_i vertices. Since all missing edges are internal to I_i, every edge of the balanced complete bipartite graph is present, attaining the lower bound. Its complementary cover selects every A-edge and A-I_i spoke.

The edge sets E(H) and E(J_i) cover all edges; the only repeated edges between local sets are E(A). Restricting any global cover and subtracting those repetitions proves the lower bound tau(H)+sum t_i-(k-1)a. The compatible local covers just constructed, together with a minimum H-cover, attain it and cover every one-apex H-edge triangle through spokes. Thus, with B=sum_i(t_i-a)+a,

    tau(W)=btau(S)+B.

For TF, an old triangle uses its containing minimum H-cover. A one-apex triangle uses a minimum H-cover containing its old edge, available since that edge lies in an old triangle and H is TF. For a local triangle T, prescribing A union I_i union V(T) on one side uses at most q+g_i+3 vertices, the side capacity. The resulting minimum local cover contains all T-edges, all A-edges and all local spokes, so it remains compatible with every other local cover. These choices prove TF for every triangle type.

## 5. Links and codegrees under the weaker K4 seed property

A clique K_d with a matching removed has no independent triple; every residual cover has at least d-2 vertices. At an old vertex in I_i, the link is the clique A union B_i, its old K4 components, and the edges from A to those components. There are no B_i-to-old-link edges. For a matching, write M_0 for its clique edges, M_j for each old component's edges, and c for cross edges. Then c<=q and 2|M_0|+c<=q+s_i, so |M_0|+c<=floor((s_i+2q)/2). Restricting a residual cover to these disjoint vertex sets gives |Q_0|>=q+s_i-2 and |Q_j|>=|M_j|. Consequently

    |Q|-|M|>=ceil(s_i/2)-2>0.

No extra +1 from the old K4 components is required. The nonempty A connects the link.

At a fresh vertex the link is K_(q+s_i-1) joined to I_i. After deleting a matching an independent set of size at least three must lie entirely in I_i: a clique vertex cannot lose two incident cross edges, and endpoints of a deleted clique edge cannot also lose their cross edges. Thus residual independence number is at most max(g_i,2). The link has 2q+2g_i+5 vertices and matching number at most q+g_i+2. For g_i>=2 the cover-minus-matching gap is at least q+3; for g_i=1 the link is a clique and the gap is at least q+2. The link is connected.

At an apex, each private clique contributes at least s_i-2 vertices to any residual cover. Comparing with half the total link order gives doubled gap at least

    2sum_i(s_i-2)-(h+sum_i s_i+q-1)
      =(k-1)q+2k+1>0.

For q>=2 another apex connects that whole link. Only q>=2 is needed in the asserted eventual family. All links are therefore connected and non-WKE.

Each H-edge has the q apices as triangle common neighbors. Any local clique-part edge has at least q+s_i+g_i-2 common neighbors, and any edge from the clique part to I_i has at least q+s_i-1. These types exhaust all other graph edges, proving minimum triangle codegree at least q.

## 6. Exact odd-cover and cut formula; packing upper bound

For a universal vertex a_0, let x be any odd-cover edge indicator in F2. The triangle a_0uv implies x_uv=1+x_(a_0u)+x_(a_0v). Set z_(a_0)=0 and z_v=1+x_(a_0v). For every edge, including apex edges, x_uv=1+z_u+z_v, the monochromatic indicator. Conversely every vertex coloring gives an odd cover. Hence pi(W)=beta(W), without omitting any edge type.

Fix colors on old vertices and A, and let u_i be the number of color-1 vertices in I_i. The largest local cut is

    L_i^2/4-u_i(g_i-u_i).

Indeed the subtracted term is exactly the missing cross-cut I_i edge count, and B_i can always be colored to balance the complete local graph: neither precolored side has more than q+g_i vertices, while its capacity is q+g_i+3. Different B_i choices are independent.

Writing c_A for the cut edges inside A, the global cut is cut_H+sum_i cut_(J_i)-(k-1)c_A. The penalty is nonnegative because k>=1. A monochromatic A makes it zero and still permits all local balanced extensions. Subtracting the resulting maximum cut from |E(H)|+sum_i e_i-(k-1)a gives exactly

    pi(W)=B+min_z[uncut_H(z)+sum_i u_i(g_i-u_i)]
          >=B+b beta(S).

The shared-A sign and the batch-splitting term are correct. A harmless strengthening, not needed by the target, is that the role-optimum coloring from Section 3 is constant on every batch, so the displayed minimum actually equals beta(H). Thus this construction even has pi(W)=B+b beta(S). The target's weaker lower bound is fully sufficient.

In any packing, at most bnu(S) triangles are old. Assign each local triangle to one containing J_i; its assigned family has at most p_i=floor(e_i/3) triangles by edge disjointness. All remaining triangles have one apex and an H-edge and use two of the qh A-old spokes. This proves

    nu(W)<=bnu(S)+sum_i p_i+qh/2.

Spokes used by local triangles need not be subtracted in this upper bound. With x=q+g_i+3, direct algebra gives

    2p_i-t_i+a<=x(x+1)/3+g_i(g_i-1)/6+q(q-1)/2
                 <=2q^2+4q+4.

The last bound substitutes g_i=q in increasing terms. Therefore the stated lower bound on pi(W)-2nu(W), including the +a correction, follows. For q=o(N), its total adverse cost is O_S(Nq), since k<=h/q+r and h<=N.

## 7. Explicit integral ordinary packing and strict slack

In every full batch, the four groups A,I_i,B_i^1,B_i^2 of size q contain a K_(q,q,q,q) using only cross-part edges. There are 2q+6 fresh vertices, so the two disjoint fresh q-subsets exist. These cross edges exclude E(A), E(H), and every other batch's new edges. In particular shared apex vertices cause no shared packing edges.

The eight displayed triples on parts {a0,a1},{i0,i1},{b0,b1},{c0,c1} were independently reconstructed and checked against all 24 possible cross-part edges. Every triple has three distinct parts and every cross edge occurs exactly once. The local Python 3.12.12 check used standard-library combinations and a multiplicity counter, not the producer's Boolean certificate. This is a literal eight-triangle check only.

For q=2t, replace each of the eight base vertices by t clones. On each base triangle (X,Y,Z), the t^2 triples (X_j,Y_l,Z_(j+l mod t)) use every XY, XZ and YZ clone edge exactly once: for any pair of prescribed endpoints, the missing index is uniquely determined modulo t. Distinct base triples have disjoint base edge pairs. Thus all 8t^2=2q^2 triangles are edge-disjoint. Their union decomposes the cross edges of the four-partite subgraph for every positive integer t, with no prime-power assumption.

Combine these packings over the k_0 full batches and a maximum old H-packing. The ownership check above proves

    nu(W)>=bnu(S)+2q^2 k_0.

For g_i<=q, expansion gives

    t_i-a=(q^2+g_i^2)/2+2qg_i+(11/2)(q+g_i)+6
          <=3q^2+11q+6=C_q.

Thus B<=k C_q+a. Using tau(S)=2nu(S),

    2nu(W)-tau(W)>=k_0(4q^2-C_q)-k_1 C_q-a.

For q>=24, the inequality q^2/2-11q-6>=0 holds at 24 and increases thereafter. Consequently 4q^2-C_q>=q^2/2, C_q<=7q^2/2, and a<=q^2/2. Since k_1<=r, the gap is at least (q^2/2)(k_0-7r-1), strictly positive when k_0>7r+1. This is an explicit integral certificate of ordinary Tuza with strict slack, independent of the odd-cover obstruction.

## 8. Rounding, order, and simultaneous eventual conclusions

Fix the seed S first and then fix gamma in (1/2,1). Along the unbounded incidence sequence put f(x)=x exp(-(log x)^gamma) and q=2ceil(f(4N)/2). Then f(4N)<=q<f(4N)+2, q is even, q tends to infinity, and q=o(N). The order bound is

    n_W<=3N+6N/q+(r+1)q+6r<=4N

for all sufficiently large N. Since the logarithmic derivative of f is 1-gamma(log x)^(gamma-1), f is eventually increasing. Also n_W>=h>=N/r tends to infinity. Hence q>=f(n_W) eventually.

The full rounding-inclusive bound is

    Nq/b <=4exp(C_S sqrt(log N)-(log(4N))^gamma)
             +2exp(C_S sqrt(log N))/N ->0.

The first term tends to zero precisely because gamma>1/2; the second also tends to zero. The fixed positive seed gap beta(S)-2nu(S) absorbs the O_S(Nq) adverse term, so pi(W)>2nu(W) eventually. At the same time

    k_0>=h/q-r>=N/(rq)-r -> infinity.

Thus eventually q>=24 and k_0>7r+1, yielding tau(W)<2nu(W). Taking one common sufficiently large threshold enforces every property simultaneously. No uniformity in the fixed seed-dependent constant is needed, and even rounding does not change either limit.

## 9. Decision and preservation

No correction to the frozen target is required. All graph-level ownership, local cover compatibility, weak seed-link inequalities, odd-cover equivalence, shared-apex counting, explicit packing, and asymptotic quantifiers were reconstructed. The incidental stronger exact pi identity in Section 6 is an audit observation, not a requirement to mutate the frozen producer note.

The theorem is an ordinary all-size existence obstruction to an auxiliary odd-cover gate. It is accompanied by a finite base-design check and this independent AI review. It does not provide a literal huge witness, a Lean certificate, human review, a novelty determination, packing resilience after batching, or any resolution of unrestricted Tuza or H-O2. The seed's resilience must not be transferred to W without a separate proof.

This reviewer created the audit, its manifest, the standalone base checker, and the finite checker receipt. The manifest retains the target and dependency hashes, the local base-check scope and result, and all output hashes. Sources were checked unchanged immediately before and after writing the audit and its supplement.


## 10. Requested reproducibility and exact-identity supplement

Supplement frozen at 2026-11-15T09:11:13Z, within the original research window. The initial audit was frozen at 2026-11-15T09:09:47Z; this addition does not change its PASS verdict or any producer file.

The subsequently supplied `notes/root_batched_odd_cover_exact_identity.md`, SHA256 `57d44a9d95e66f1885272f2e184954772c224f977c15238424e935b6be4189c8`, also passes. The lower bound on its minimum objective is b beta(S), and the role-consistent optimum seed coloring makes every independent batch monochromatic while attaining that bound on H. It therefore proves exactly

    pi(W)=B+b beta(S),
    tau(W)=B+b tau(S),
    pi(W)-tau(W)=b[beta(S)-tau(S)]>0.

This is the same observation reconstructed independently in Section 6 before reading the addendum. It does not give an exact nu(W), is not needed to change the packing bounds, and has no resilience consequence.

At the parent's request, the independently transcribed finite check is retained as `checks/batched_odd_cover_fresh_base.py`, with its successful output in `evidence/batched_odd_cover/fresh_base_receipt.json`. It reconstructs all 24 possible cross edges from the four parts, checks that every proposed triple meets three distinct parts, and checks every cross edge occurs exactly once. The checker uses only the Python standard library and does not consume the producer's base certificate. No additional finite blowup control was needed: the modular-index argument in Section 7 proves all t directly.

Reproduction on the authorized Darwin host, from the mission workspace:

```sh
source LOCAL_ENVIRONMENT
python checks/batched_odd_cover_fresh_base.py
```

The receipt certifies only the eight-triangle base. The arbitrary-size Latin blowup, asymptotic family, strict ordinary Tuza inequality, and exact odd-cover identities remain ordinary mathematical arguments.
