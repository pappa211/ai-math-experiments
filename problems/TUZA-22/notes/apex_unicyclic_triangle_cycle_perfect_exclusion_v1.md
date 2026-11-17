> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Perfect unicyclic remainder with triangular cycle: full CS exclusion

Frozen ordinary proof candidate, 2026-11-16. All path lengths and all apex adjacencies are arbitrary at their stated parity. No new finite premise is used.

## 1. A general residual-triangle cover substitution

Consider any balanced link reduction in a minimum CS failure: L is a closed link at h, M is a matching of size r, and Q covers L-M with |Q|<=r. Delete all h-spokes and M to obtain K. Standard accounting gives B(K) and nu(K)=nu(G)-r.

Write R=L-M. Suppose an actual triangle T survives in R, and R-E(T) has a vertex cover Q' with |Q'|<=r-2. Then G cannot be a minimum CS failure.

Indeed, T lies in one literal residual K4/K5 block. That block has a cover containing ALL THREE edges of T at cost at most one above its minimum: in K4 the three T edges themselves cover all four triangles, while in K5 those three edges together with the edge on the complementary vertex pair form a minimum four-edge cover. Choose such a cover there, and minimum covers in all other blocks, giving a K cover C_K containing E(T) with

    |C_K|<=2nu(K)+1.

The union of C_K, M, and the h-spokes to Q' covers every G triangle. All outside pages on a deleted M edge retain their actual M base. A removed hub triangle whose rim edge lies outside M and T is hit by Q'; one whose rim edge belongs to T is hit by C_K. Closedness accounts for every removed h-spoke. The total cost is at most

    2nu(K)+1+r+(r-2)=2nu(G)-1,

contradiction. This is a general equality criterion; it is not restricted to the unicyclic application below.

## 2. Triangle with three odd pendant paths

Suppose F=L-w is the triangle abc with a pendant path of odd length 2t_a+1,2t_b+1,2t_c+1 attached at each corresponding cycle vertex. All path interiors are distinct. Set r=3+t_a+t_b+t_c.

Let M be the perfect F matching that starts with the first edge of each pendant path and alternates to its leaf. Let Q contain w, two cycle vertices (say a,b), and the even-position interior vertices of each path. Then |M|=|Q|=r and Q covers L-M. Apex edges are all covered by w, independently of which path vertices see w.

The triangle T=abc survives. Removing its edges from L-M leaves only apex edges and the nonmatching internal gaps on the three pendant paths. These have a cover Q' consisting of w and the same even-position interior vertices, with

    |Q'|=1+t_a+t_b+t_c=r-2.

Section1 excludes the link. This argument allows w to see any subset of the cycle vertices as well.

## 3. Triangle with one odd and one even pendant path

Let the odd path at a be a=x0,x1,...,x_(2t+1)=z_x, and let the even path at b be b=y0,y1,...,y_(2s)=z_y, where t>=0 and s>=1. There is no pendant path at c. Set r=t+s+2, and use

    M={bc, ax1, x2x3,...,x_(2t)x_(2t+1),
             y1y2,y3y4,...,y_(2s-1)y_(2s)},
    Q={w,a,b,x2,x4,...,x_(2t),y2,y4,...,y_(2s-2)}.

Both have size r and Q covers L-M. The two path leaves see w by the minimum-degree-two condition. Balanced deletion yields B(K). Any K4 in L would be {w,a,b,c}; its edge bc was deleted, so each residual block contains at most three L vertices.

If wb or wc is present, the matching Z=(M-{bc}) union {wb} (or {wc}) has size r and avoids E(abc). Append its hub triangles and abc. The matching contributes at most one edge per residual block; abc contributes at most one because bc is absent. Disjoint contributions would require four L vertices. Thus the whole footprint is at most a two-edge star per block and can be avoided by maximum old block packings, giving an impossible r+1 augmentation.

Assume now that neither wb nor wc is present. Any actual page bcu with u outside {h,a} has u outside N(h). Use the alternate matching

    M'={ab,wz_x,x1x2,x3x4,...,x_(2t-1)x_(2t),
                   y1y2,y3y4,...,y_(2s-1)y_(2s)},

of size r. Its hub triangles avoid bc and are edge-disjoint from bcu. Neither b nor c lies in any triangle of L-M: the only F triangle was abc, now broken, and neither vertex sees w. Therefore a residual clique containing b or c contains at most one further L vertex. A disjoint matching edge and page spoke in one block would contradict this. The entire footprint is again at most a two-edge star per block, so the page would augment. Consequently bc has no page except hbc and abc.

The standard extension X=M union {hq:q in Q} contains ha,hb,bc. Remove ha and bc, and add ac. The resulting set has size 2r-1 and still covers every lost triangle. The only bc pages are hbc and abc, now hit by hb and ac. The hub triangles relying on ha have third vertex b,c,x1 or w, and are hit respectively by hb,ac,ax1,hw. Other rim-edge pages retain their M base, and all other hub triangles retain their cover. Combining this smaller extension with a minimum K cover contradicts tau(G)=2nu(G).

This excludes the two-path case with arbitrary additional apex adjacencies and outside pages.

## 4. Assembly for every perfect unicyclic remainder whose cycle is a triangle

The accepted `apex_unicyclic_perfect_remainder_restriction_v1.md` says that a surviving perfect unicyclic F is subcubic with at most three degree-three vertices, and every perfect matching complement has only one P3, P4 or K3 nontrivial component.

If the unique cycle is a triangle, F cannot have zero degree-three vertices because the bare triangle has no perfect matching.

With one degree-three vertex, F is the triangle plus one pendant path. Parity of its order makes that path odd, and the accepted `apex_triangle_odd_pendant_link_exclusion_v1.md` excludes it.

With two degree-three vertices, the morphology permits either two cycle vertices each with a pendant path, or one cycle vertex joined directly to an off-cycle branching vertex with two pendant paths. The second form is impossible already: a perfect matching of the odd cycle with this sole outside attachment must use the joining bridge, whereas the morphology requires the edge between the two degree-three vertices to belong to no perfect matching. In the first form, the two pendant path lengths have opposite parity because |V(F)| is even. Section3 excludes it.

With three degree-three vertices, the morphology is exactly a triangle with three odd pendant paths, excluded by Section2.

Therefore a closed link L in a minimum CS failure cannot have a connected, perfectly matchable unicyclic remainder L-w whose unique cycle is a triangle. The remaining triangle-bearing perfect-remainder cases have cycle length at least four; their triangles necessarily use w. The nonperfect remainder branch remains separate.

## Dependencies and proof scope

All new arguments are ordinary: class-local minimum-CS accounting, literal K4/K5 cover/packing facts, the accepted morphology, and the separately accepted one-odd-path exclusion. No four-branch finite theorem, historical WKE table or Kotzig input is used by this proof.

Frozen dependencies:

- `apex_unicyclic_perfect_remainder_restriction_v1.md`, SHA 64effb6b26ceabbb06b3507282fd6d3e487c6c6c6cf4ad500015d882958461ce;
- `apex_triangle_odd_pendant_link_exclusion_v1.md`, SHA b2e77ded7379826a436aa0c1a69f81c1e0facaec66553477d6facd66fb591f23;
- that one-path argument's accepted `k4_star_boundary_peeling_v1.md` dependency.

The general triangle-cover substitution of Section1 is a potentially reusable interface for broad WKE equality rigidity. It does not prove that every WKE closed link is CS-excludable.
