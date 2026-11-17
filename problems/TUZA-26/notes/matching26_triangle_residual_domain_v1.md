> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Frozen triangle-residual named-support reconstruction domain

Frozen before the main certificate search, 2026-11-16. This is a new gain-one/cover-two interface, distinct from the original minimum-CS parent's strict triangle restoration. Independent review REQUIRED. The hypothesis that the selected defect-one triangle residual is resilient is modular here; it is being established separately.

## Precise conditional universe

Let Q be the fixed minimum unknown core inside a fixed minimum-CS failure, with the previously obtained properties: triangle-supported and triangle-connected, three-vertex-connected, minimum degree at least four, single-edge resilient, all edges cover-eligible, and NO packing blocker pair. Let T=abc be an actual Q triangle such that R=Q-E(T) is resilient and has defect one. Write nu(R)=r. No-blockers preserves the packing number after deleting the first two T edges, and the third deletion loses at most one unit. Conversely T appends to every R packing, so the total loss is exactly one. Thus nu(Q)=r+1 and tau(Q)=2r+1; the residual has tau(R)=2r-1.

Proper-subgraph CS and component additivity give one active resilient defect-one component C and otherwise literal tight K4/K5 components. The active support is strictly smaller than Q, so the separate minimum-Q choice names C as one exact frozen C12 member. This naming does not follow from CS alone.

Every old tight clique contains at most one of a,b,c because all three terminal pairs are absent in R. If it contains one terminal, its only possible outside-used edges arise from ordinary page families on the two restored bases incident to that terminal. The whole-one-base footprint lemma gives at most one edge for each family, and the two edges are adjacent at the terminal. A clique containing no terminal has no ordinary-page footprint. The restored triangle itself has no old edge, and there is no exactly-two-restored-edge triangle distinct from T. Thus every old tight clique has COMPLETE outside-triangle boundary of at most two adjacent edges. The accepted boundary lemma excludes all such pieces in Q, even with arbitrary shared vertices and background.

Hence the entire old triangle support is exactly C, with arbitrary retained background. In the remaining domain proof this is a premise independent of how the old pieces were removed.

## All-size vertex confinement

Every Q vertex outside V(C) union{a,b,c} occurs in no old triangle and can only be the apex of an ordinary restored page. Since every incident Q edge is triangular, all its neighbors belong to{a,b,c}; its degree is at most three. Thus every support vertex is in V(C) union the three terminals. C is induced in R by its universal vertex. Every outside terminal's old neighbor set in C is independent, or an old outside triangle would occur.

Every restored base has an ordinary page. Indeed no-blockers implies that deleting the other two triangle edges preserves nu(Q)=r+1. The graph R plus that single base must therefore have a new triangle. This use of the no-blocker premise is explicit.

If no terminal belongs to C, no new triangle contains an old C edge, contradicting triangle connectivity.

Suppose exactly a belongs to C, with b,c outside. Let B=N_R(b) intersect V(C), D=N_R(c) intersect V(C). Both are independent and exclude a. The ordinary bc-pages have apices X=B intersect D, which is nonempty by the preceding one-base-restoration argument. Triangle connectivity also requires an ab- or ac-page sharing a C edge: its apex lies in (B union D) intersect N_C(a).

Any such supported page with apex y and any bare bc-page with apex x!=y are edge-disjoint. A maximum C packing avoids the supported page's sole C footprint by C resilience, so both pages append and give r+2, contradiction. Therefore X is a singleton{x}, and every supported ab/ac page has that same apex. Every old edge bz with z outside D must be supported by an ab-page, since it is in neither an old triangle nor a bc-page. This forces z=x, impossible because x belongs to D. Hence B is contained in D; symmetrically D is contained in B. Thus B=D={x}, and each outside vertex b,c has degree three (two restored triangle neighbors and x), contradiction.

Consequently either exactly two or all three triangle terminals lie in C. No other vertex/background pattern is omitted.

## Complete finite families

### All three terminals inside

The restored triangle is an independent triple T in C, and Q is exactly C plus its three missing pair edges. There are160 such labeled independent triples across the twelve fixed graphs. The earlier1192 count was ALL tested vertex triples, not independent triples.

### Exactly two terminals inside

Name the inside nonedge ab and outside terminal c. The ENTIRE graph is

    Q = C + ab + {cv : v belongs to {a,b} union I},

where I is an independent subset of C excluding a,b. Minimum degree at c gives |I|>=2; every C12 has independence number at most three, so |I| is two or three. Every old c-I edge must become triangular through a or b, so I is contained in N_C(a) union N_C(b); the generic support filter checks this condition. The no-blocker premise additionally requires a page on each of ac,bc, equivalently nonempty intersections of I with both neighborhoods. No other old background is possible after the all-size vertex confinement and inducedness of C.

The frozen generator scripts/matching26_triangle_domain.py enumerates every internal independent triple, and every internal nonedge ab together with every independent I of size two or three disjoint from its endpoints. It reconstructs the entire actual triangle family and asserts that removing the three restored edges leaves exactly C's actual triangles.

It applies only necessary rejection filters: actual minimum degree below four; an actual unsupported edge; an inactive ordinary base (which certifies a two-edge packing blocker); or an actual separator of at most two vertices. Every rejection records a concrete certificate. No cover or packing optimization is part of domain generation.

## Frozen counts and planned certificate protocol

The first domain run yielded:

-160 all-inside presentations;
-6512 one-outside presentations;
-3267 minimum-degree rejections;
-2558 unsupported-edge rejections;
-72 inactive-base/two-edge-blocker rejections;
-645 separator rejections;
-130 structurally retained candidates (36 all-inside,94 one-outside).

The domain generation took about1.015 seconds with one local process, no optimizer. Maximum retained order is13. Complete rows and source hashes are in evidence/matching26_triangle_domain.json.

For each retained Q, a maximum C packing plus the restored triangle T gives an explicit packing of size r+1. Therefore a cover of size at most2r proves defect at least two and rejects the target profile, without trusting cover optimality. A packing of size r+2 is an alternative direct rejection of the required gain-one profile.

The first cheap certificate attempt will enumerate feasible minimum C covers from the literal clique pieces, then add one restored triangle edge and check EVERY actual Q triangle. Only actual resulting covers will be promoted; failure to find one will remain UNRESOLVED and trigger a separately stated packing/certificate attempt. A representative bounded benchmark precedes the full130-case certificate scan. No global graph census or exact solver is authorized implicitly by this domain freeze.

## Global role and remaining premises

If this complete finite interface is excluded, any resilient defect-one triangle residual in the no-blocker minimum Q is impossible. This does NOT show that a triangle residual of defect one exists, or prove its resilience; those are distinct obligations. The remaining defect-two/critical frontier and eventual unrestricted Tuza availability arrow are OPEN.

The dependency order stays inside fixed G: proper-subgraph CS and minimum-Q name the active residual only after resilience and defect one are supplied; the already accepted small-boundary theorem removes tight pieces; the present no-blocker/minimum-degree geometry supplies this finite interface. The finite check must not be cited as a general classification of defect-one supports.
