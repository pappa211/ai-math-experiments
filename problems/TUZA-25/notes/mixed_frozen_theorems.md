> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Mixed Tuza: exact reductions and the final two-edge restoration

Frozen for fresh independent review, 2026-11-16. Coordinated derivation by the mixed worker and coordinator. Status before review: **PROVED_ORDINARY (author reconstruction), independent review pending**. No Lean claim, literature-priority claim, or unrestricted Tuza/CS proof is made.

## Definitions and scope

G is a finite simple graph; all its actual triangles count. N is a triangle-free subset of E(G). Put A=E(G)\N and q=|A|. A mixed cover uses only A and meets every triangle. A mixed packing is a set of actual triangles whose footprints E(T)\N are pairwise disjoint. Its optimum is nu(G;N); the cover optimum is tau(G;N). N is *active* when some actual triangle meets N. B(G) means every nonempty shared-graph-edge triangle component has literal K4 or K5 edge support. B is vacuous on triangle-free graphs. Background edges remain in every graph throughout unless explicitly deleted.

## Theorem 1: finite-capacity semantics

Set M=q+1. Give every edge in A weight/capacity 1 and every edge in N weight/capacity M. The minimum weighted triangle-cover cost is tau(G;N), and the maximum integer capacity-bounded triangle multiset size is nu(G;N).

Proof. A covers all triangles, because N is triangle-free, so a weighted cover costs at most q. Any cover using an N edge costs at least M>q, hence every optimum avoids N. Every triangle uses at least one A edge, so an integer feasible packing uses at most q triangles and cannot repeat a triangle. Consequently capacity M on N is never binding. Conversely each mixed packing has size at most q and satisfies those capacities. If q=0 then G is triangle-free, and both optima are zero. Literal infinity is unnecessary.

## Theorem 2: exact branch and fan identities

For e in A, preserving the vertex universe,

    tau(G;N) = min(1+tau(G-e;N), tau(G;N union {e})).

The second term is +infinity, and is not an admissible mixed instance, when N union {e} contains a triangle. Proof: partition covers according to whether they contain e. The two admissible children have one fewer allowed edge, so q is a well-founded induction measure.

Write e=uv, H=G-e, W={w: uvw is an actual triangle}, and D(w)={uw,vw}\N. For admissible N union {e}, every D(w) is nonempty, and D(w) are mutually disjoint. With D(U)=union_{w in U}D(w),

    nu(G;N union {e}) = max_{U subset W} (|U|+nu(H-D(U);N)),
    nu(G;N) = max(nu(H;N), 1+max_{w in W} nu(H-D(w);N)).

Omit the second alternative when W is empty. Partition a packing by the triangles using e; these are exactly a subset of its pages. Conversely append those pages to any packing of the displayed residual. This is exact accounting, not a new availability theorem.

## Theorem 3: exact paid peeling; equivalence of the inequalities

Assume ordinary Tuza holds for every finite simple graph. Then tau(G;N)<=2nu(G;N) for every admissible mixed instance. Conversely the latter universal statement includes N empty, so is **equivalent to ordinary Tuza**.

More precisely, choose ANY inclusion-maximal mixed packing P consisting only of triangles meeting N. Let r=|P| and S=union_{T in P}(E(T)\N). Then:

1. |S|<=2r, with strict inequality if P contains a triangle having two N edges.
2. H=G-S has no triangle meeting N: an unhit such triangle would extend P.
3. tau(G;N)<=|S|+tau(H), because a minimum cover of H can avoid the nontriangular N edges.
4. nu(G;N)>=r+nu(H), by appending an ordinary maximum packing of H to P.

Thus ordinary Tuza on H pays the cover bound exactly; any saving 2r-|S| transfers as strict slack. No conjectural generic strictness, forbid-branch packing-jump bound, or finite enumeration is used. If N is active then r>=1 and S is nonempty, so the residual is genuinely smaller in q. The unresolved universal obligation in this reduction is exactly ordinary Tuza on the residual, not a stronger weighted statement.

## Lemma 4: final size-two restoration over B

Let u,v,w be distinct. In G let uv be in N, while a=uw and b=vw lie outside N. Put H=G-{a,b}. Assume N is triangle-free, no H triangle meets N, and B(H). Write m=nu(H). Then

    tau(G;N) <= 2nu(G;N)-1.

All other N edges and all background edges are retained. A *new a-page* is an actual triangle uwx with x different from v; define new b-pages vwy analogously (y different from u). The triangle uvw is handled separately.

Proof. H's literal clique components have maximum packings of size 1 for K4 and 2 for K5 and covers of sizes 2 and 4; these combine across edge-disjoint triangle components. Therefore tau(H)=2m. A cover of H together with a,b gives tau(G;N)<=2m+2. Its cover can avoid N, because N is inactive in H. The triangle uvw together with an H maximum packing gives nu(G;N)>=m+1.

If there is no new a-page, then b alone covers every triangle not in H; likewise if there is no new b-page, a suffices. This gives tau(G;N)<=2m+1<=2nu(G;N)-1.

Otherwise choose new pages uwx and vwy. Their apices differ: if x=y, the old edges ux,vx,uv form an H triangle meeting N, contrary to inactivity. Hence the two chosen pages are edge-disjoint. Every literal old clique contains at most one of u,v,w: a,b are absent from H; a clique containing u,v would make the N edge uv triangular in H. Thus the old edges of the chosen pages meet any old clique in at most two edges sharing its sole terminal. Each clique has a maximum packing avoiding these edges. In K4 use the triangle avoiding that terminal. In K5, for two prohibited edges za,zb (other vertices a,b,c,d), use triangles zcd and abc; zero/one prohibited edge is easier and can be extended to two prohibited star edges. Their union is an H maximum packing avoiding all old edges of both selected pages. Append both pages. They may themselves use other N edges; this only relaxes capacity and causes no difficulty. Therefore nu(G;N)>=m+2, and tau(G;N)<=2m+2<=2nu(G;N)-2. This proves the stated strict bound.

## Theorem 5: equivalence of the combined equality statements

Ordinary CS is equivalent to the following universal mixed statement:

    tau(G;N)<=2nu(G;N),
    with equality iff N is inactive and B(G).

In particular, ordinary CS implies strictness whenever N meets a triangle. This does not prove ordinary CS.

Proof of the forward implication. Induct on q. For inactive N, the optima are ordinary and the conclusion is precisely CS. If N is active choose a triangle T meeting N and let S=E(T)\N; its size s is 1 or 2. Put H=G-S. A mixed H packing together with T gives nu(G;N)>=1+nu(H;N), and adding S to an H cover gives tau(G;N)<=s+tau(H;N).

If s=1, the non-strict residual inequality pays strict slack immediately. If s=2 and N remains active in H, the inductive strict bound does so. If s=2, N is inactive in H, and B(H) fails, ordinary CS gives the residual strict bound. The sole remaining case is s=2, N inactive in H and B(H), exactly Lemma 4 (the unique N edge of T is uv). It gives strictness directly. Equality for inactive N follows from CS. Conversely specialize to N empty.

The non-strict residual inequality used above is available from Theorem 3 under ordinary Tuza, which is part of CS; alternatively it is included in the inductive statement.

## Minimal-failure audit

For the mixed inequality alone, choose a counterexample minimizing q among all finite vertex universes (a least nonnegative q exists; no vertex-count assumption is needed). For each e outside N, deletion minimality plus the cover recurrence yields nu(G-e;N)=k and tau(G-e;N)=2k, where k=nu(G;N), since deleting an allowed edge lowers packing by at most one. For admissible forbiddance, minimality gives nu(G;N+e)>=k+1. No generic strictness is needed for this consequence.

Moreover a triangle with just one allowed edge e would give exact identities tau(G;N)=1+tau(G-e;N) and nu(G;N)=1+nu(G-e;N), contradicting minimal failure. Thus such a minimum counterexample has no triangle containing two N edges; every additional forbiddance is consequently admissible. This stronger conclusion needs the just-proved minimality argument and is not an ordinary-counterexample lemma imported without proof.

Theorem 3 further shows that any mixed counterexample would yield an ordinary Tuza counterexample by the displayed paid reduction. Theorem 5 similarly relates the combined statements but does not claim arbitrary mixed equality failures transfer numerically through every peeling step: its proof uses the explicit final restoration lemma.

## Consequence for campaign choice

The delete-or-forbid inequality and reported strictness are not independent stronger targets once ordinary Tuza and ordinary CS, respectively, are separated. The peeling transfer closes the missing budget by a different branch: remove the outside support of an N-hit packing. It also handles arbitrarily large forbid packing jumps. This supports using mixed instances as a language for local certificates, but does not by itself furnish an induction step for an unresolved ordinary graph with N empty. The remaining bridge to unrestricted Tuza is still an available ordinary reduction/rigidity theorem.
