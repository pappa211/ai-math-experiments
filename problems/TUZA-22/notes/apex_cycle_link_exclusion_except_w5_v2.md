> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Every apex-cycle closed link is excluded except the full five-wheel

Corrected frozen v2 ordinary proof candidate, 2026-11-16. The unreviewed v1 draft used the wrong alternate matching at the endpoints of an odd gap; Section5 below supplies the explicit valid pair P_0,P_1. The v1 is preserved and is not an accepted proof. This is an all-size equality reduction with arbitrary outside attachments. It has no finite census or Kotzig premise.

## Statement

Let L be a closed link component at h of a minimum combined-CS failure, globally or within an edge-subgraph-hereditary class. Suppose L-w is a cycle C_n. Then necessarily n=4 and w is adjacent to all four cycle vertices: L is the five-vertex wheel W5.

The conclusion does NOT exclude W5. That link is genuinely non-WKE and remains a separate local obstruction. For every other n and apex-neighbor set the proof supplies a strict contradiction. Link minimum degree ensures that S=N_L(w) has at least two vertices. For n=3 the whole link has order four and is already forbidden by the authenticated M3 local package, so assume n>=4.

Throughout this proof L is K4-free: deleting w from a K4 would leave a triangle of C_n. Thus every literal clique block of any balanced residual contains at most three L vertices.

## 1. Two reusable augmentation audits

A WKE pair P,Q with r=|P|, |Q|<=r produces a balanced B residual K by deleting all h-spokes and P. If a strict pair occurs it already contradicts minimum-CS accounting; otherwise nu(K)=nu(G)-r.

**Rim audit.** Suppose an actual L triangle T meets P, and Z is a matching of size r in L-E(T). The hub triangles on Z plus T are edge-disjoint. In each old block Z contributes at most one edge, since there are at most three L vertices. The triangle T contributes at most one surviving edge because its P edge was deleted; two remaining T edges in one clique would force the missing one back. Disjoint contributions would require four L vertices. The entire footprint is therefore a star of at most two edges, simultaneously avoidable by a maximum K4/K5 packing. This appends r+1 triangles, impossible.

**External-page audit.** Suppose f in P belongs to no L triangle, Z is another size-r L matching avoiding f, and either L is triangle-free or NEITHER endpoint of f belongs to any L triangle. Codegree at least two supplies a page fz other than its hub page. Its apex z lies outside N(h), by closedness and the absence of an L triangle on f. The two page spokes survive in K and cannot both be in one residual block because f was deleted. The matching again contributes at most one edge per block. If a matching edge and a page spoke were disjoint in one block, that block would contain the page endpoint and two other L vertices. These form an L triangle, contrary to the endpoint hypothesis (or to triangle-freeness). Thus the whole footprint is a two-edge star or smaller, and the r hub triangles plus the page augment, impossible.

All outside pages are covered by the deleted P bases in the balanced accounting. These audits do not restrict their number or incidence.

## 2. Even cycles of length at least six

Let n=2r, r>=3. Choose a vertex a=0 in S. Number the cycle 0,1,...,2r-1. Select the cycle matching

    M0={12,45,67,...,(2r-2)(2r-1)},

which has r-1 edges and exposes exactly 0 and 3. Set P=M0 union {w0}, of size r. The graph C_n-M0 has two disjoint P3 components centered at0 and3 and otherwise isolated edges. It therefore has a vertex cover Q0 of size r-1. With Q=Q0 union {w}, P,Q are WKE.

If L contains a triangle, choose a=0 as an endpoint of an adjacent pair 0,b in S. The actual triangle T=w0b meets P in w0. One of the two alternating perfect cycle matchings avoids the cycle edge0b. It has size r and uses no w-edge, so it is a matching Z in L-E(T). The rim audit excludes the case.

If L has no triangle, f=w0 belongs to P and any alternating perfect cycle matching has size r and avoids f. The triangle-free external-page audit excludes this case.

This is why longer even wheels need not share the W5 obstruction: the two exposed cycle vertices0,3 supply two separate P3 cover savings. In particular a full apex on C6 or a longer even cycle is WKE and receives a valid equality augmentation here.

## 3. The four-cycle

Write its cyclic vertices0,1,2,3. There are three relevant neighbor-set types other than all four.

- If S={0,2}, use P={01,23}, Q={0,2}. The link is triangle-free. The alternate matching {03,12} avoids f=01, so the external-page audit applies.
- If S={0,1}, use P={01,23}, Q={0,1}. The triangle T=w01 meets P, and Z={12,30} avoids T. Apply the rim audit.
- If S={0,1,2}, use P={w1,03}, Q={0,2}. The graph L-P is covered by Q. Again T=w01 meets P and Z={12,30} avoids T, so apply the rim audit.

Every two-neighbor or three-neighbor set is one of these up to a cycle symmetry. The remaining four-neighbor graph is exactly W5 and is not claimed excluded.

## 4. Odd cycles: balanced perfect matchings

Let n=2r+1>=5. For each a in S let M_a be the unique perfect matching of the even path C_n-a. Set

    P_a={wa} union M_a,  |P_a|=r+1.

The graph C_n-M_a has one P3 centered at a and r-1 isolated edges, hence a cover of size r. Adding w gives a cover Q_a of L-P_a of size r+1. Thus every a in S supplies a balanced tuple.

If S is independent in the cycle, L is triangle-free. Choose distinct a,b in S. The alternate P_b avoids f=wa in P_a, and the external-page audit applies.

Now suppose S contains adjacent cycle vertices. If there are exactly two vertices in S, their direct cycle edge, the two-edge path through w, and the other cycle path of even length give two nondirect even threads between the same degree-three endpoints. The accepted ordinary parallel-thread exclusion rules this out, including arbitrary outside pages.

It remains to treat |S|>=3 and at least one adjacent pair.

## 5. Odd-cycle parity gives a rim augmentation or a safe odd gap

Choose an adjacent pair in S and label it0,1 in cyclic order, so the remaining vertices are2,...,2r. The matching M_u of C_n-u avoids the edge01 exactly when u is odd and u is not1; this follows by listing the consecutive matched pairs in the path after u is removed. For u even it contains01.

If some u in S has odd index u>=3, take initial P_0 and rim triangle T=w01. The alternate Z=P_u has size r+1, uses neither w0 nor w1, and its cycle matching avoids01. Thus Z lies in L-E(T), and the rim audit applies.

More generally, the same test applies after cyclic relabeling to ANY adjacent pair of S. Suppose none of these tests succeeds. Relative to our pair0,1 all additional S vertices therefore have even indices. Let p be the smallest and q the largest such additional index.

If p>2, the path from1 to p has odd length p-1>=3 and contains no other S vertex. If q<2r, the path from q forward to0 has odd length 2r+1-q>=3 and contains no other S vertex. If neither happens, p=2 and q=2r. Since n>=5 these are distinct. Apply the rim test to the adjacent pair1,2: the additional neighbor2r has cyclic index2r-1, which is odd and at least3 relative to that pair. This contradicts the assumed failure of every rim test.

The two possible long gaps give an EXPLICIT pair of alternate matchings; using the two endpoints of the same odd gap would not flip its internal matching and is not asserted.

- If p>2, vertices2 and3 lie strictly between the consecutive S vertices1 and p, so neither belongs to S. The edge f=23 lies in M_1 but not in M_0. Use the initial balanced tuple P_1 and alternate P_0.
- If q<2r, vertices q+1 and q+2 lie strictly between the consecutive S vertices q and0, so neither belongs to S. Here q is even, and f=(q+1)(q+2) lies in M_0 but not in M_1. Use initial P_0 and alternate P_1.

Both statements follow directly from M_0={12,34,...,(2r-1)(2r)} and M_1={23,45,...,(2r)0}. In either case f's endpoints lie outside S. Since the only triangles of L have w as a vertex and an S-S cycle edge as rim, neither endpoint belongs to any L triangle. The safe-endpoint external-page audit applies, giving the final contradiction.

This exhausts all odd cycles, completing the theorem.

## Scope and significance

The proof completely handles the cycle remainder, with unbounded cycle length and arbitrary apex-neighbor patterns. It does not extend a WKE inequality certificate without checking equality: each case has a literal rim augmentation, an external-page augmentation with full old-block footprints, or the previously accepted ordinary parallel-thread contradiction.

The exact remaining cycle-remainder obstruction is W5. General connected unicyclic remainders with attached trees still require their own treatment. The previously proved perfect triangular-cycle remainder exclusion is complementary: its attached paths may create arbitrarily many apex adjacencies, while the present theorem settles every bare cycle other than W5.

Dependencies: authenticated class-local M0/M3/codegree and elementary K4/K5 avoidance; `parallel_thread_link_exclusion_v1.md` (SHA 6eec22bff2400c5a3c07a43d41649a7b8e0d6e08f31d23c8e6e020c6f82718c4). No historical WKE census, four-branch finite theorem, Kotzig theorem, or newly executed finite search is used.
