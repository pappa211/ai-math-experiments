> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent R1 reconstruction and unconditional CS corollary

Reviewer role: TUZA-22 independent verifier. First reconstruction recorded before reporting correctness to the producer. Reviewed `notes/r1_proof_v1.md`; source hash and completion timestamp below. No census or symbolic producer consultation supplied a proof step.

**Verdict: ACCEPT the frozen R1 proof as an ordinary all-size proof. Also ACCEPT the stronger corollary that CS holds for every graph formed by adding all three missing edges on an independent triple of a B graph.** Neither conclusion proves unrestricted CS or a two-edge blocker. No Lean verification or novelty claim is made.

## Elementary avoidance inputs, explicitly reconstructed

For K4, a maximum packing has one triangle; choosing the triangle on the other three vertices avoids every edge of a star centered at the remaining vertex. For K5, maximum packing size is two (the elementary parity proof is given in the R2 review). Up to relabeling there are only two patterns of two distinct forbidden edges. If they are 01 and02, triangles034 and123 avoid them and are edge-disjoint. If they are01 and23, triangles024 and134 avoid them and are edge-disjoint. Thus any at-most-two-edge footprint in a K5 can be avoided. Single edges may be included in a minimum clique cover as established in the R2 review. All facts extend componentwise to B graphs because triangle components have disjoint edge supports.

## Reconstruction of R1

Let independent terminals a,b,c in H be completed to T=abc, and put m=nu(H). The old packing plus T gives nu(G)>=m+1; an old minimum cover plus all three added edges gives tau(G)<=2m+3. If tau(G)=2nu(G), integrality forces nu(G)=m+1 and tau(G)=2m+2.

Every new triangle other than T has exactly one added edge and an outside apex: abx,acx,bcx. No triangle contains exactly two added edges. Every old clique component contains at most one terminal, since the three terminals are pairwise nonadjacent in H. Therefore each selected page contributes at most one supported old edge in any one component. For two pages, all such edges in a component are incident to its single terminal, hence form a star with at most two edges. Avoid them in K4 by star avoidance and in K5 by two-edge avoidance, and combine all block packings. Any two edge-disjoint pages could consequently be appended to an old maximum packing, giving size m+2. Under equality they therefore must pairwise intersect in edges.

If no pages exist or all pages use a single base, one edge of T hits every new triangle; adding it to an old minimum cover contradicts tau(G)=2m+2. Otherwise choose pages on distinct bases, say abx andacy. Since x,y lie outside the terminal triple, they share an edge precisely when x=y. All pages on either of these bases must share that apex, by intersecting the fixed page on the opposite base. Every page on the third base must also have this apex. The old spokes ax,bx,cx then exist, so closure supplies all three pages and the new triangle family is exactly the four faces of K4 on a,b,c,x.

If an old spoke, say ax, is triangle-supported in H, take an old minimum cover containing ax and add bc; these two opposite K4 edges hit all new triangles, again giving cover size at most2m+1. Thus all three old spokes are background. The new K4's edge support is disjoint from all old triangle support, and no other new triangle exists. Old components therefore remain literal K4/K5 components and exactly one K4 component is added. This proves B(G).

## Stronger unconditional corollary

**Theorem.** For every B graph H and independent triple a,b,c in H, G=H+{ab,ac,bc} satisfies tau(G)<=2nu(G), with equality if and only if B(G).

Proof. The same base bounds give nu(G)>=m+1 and tau(G)<=2m+3. If nu(G)>=m+2, then tau(G)<=2nu(G)-1, proving strictness. Otherwise nu(G)=m+1. The two-page avoidance argument above still applies, without any cover assumption, so all pages pairwise intersect in edges. The resulting new triangle family either shares one base edge (including the no-page case, for which any edge of T suffices), or is exactly the four faces of a K4 as shown above. In the former case one extra edge covers all new triangles; in the latter two opposite K4 edges do. Hence tau(G)<=2m+2=2nu(G). Equality now implies B(G) by R1, and B(G) implies equality by component additivity. QED.

This proof can avoid citing a general pairwise-edge-intersecting triangle-family classification: the explicit page analysis already supplies the required common-edge/K4 dichotomy. If that classification is stated separately, it is valid for actual triangles, but no abstract 3-uniform-hypergraph substitute should be used.

## Adversarial questions resolved

- The terminal-independent hypothesis is essential to the proof's footprint claim and is exactly present in R1. No theorem for arbitrary three added edges has been inferred.
- A component can include one terminal and arbitrarily many outside vertices, but at most two edges from the two selected pages enter it. All have the same terminal endpoint. This is a proved symbolic footprint bound, not a fixed-core enumeration.
- When pages have two different bases, the fourth K4 face is forced by actual edge closure. It is not omitted or assigned a nonexistent triangle.
- Old supported spokes are handled by a deliberately chosen minimum cover. No claim that every minimum cover contains that spoke is used.
- Outside attachments may touch the new K4 vertices. They cannot merge triangle components through a new triangle because the entire new family has already been classified. They cannot merge through an old spoke because each spoke was proved background under equality.
- m=0 is allowed, and T itself guarantees a nonempty augmented triangle family.
- Neither R1 nor the stronger corollary assumes CS on arbitrary proper subgraphs.

## Consequence for the minimal-CS route

Using the independently reconstructed M0 and residual accounting as declared inputs, a minimum CS failure G with k=nu(G) cannot have a tight triangle residual H=G-E(T), since proper-subgraph CS would imply B(H) and R1 would imply B(G). Thus every triangle residual must satisfy nu(H)=k-1 and tau(H)=2k-3 (with nonnegative values, so k>=2). Adding E(T) to a minimum residual cover yields a minimum G-cover containing all three edges of T. This is a necessary condition, not a contradiction: K5 has that cover containment property. The defect-one residual structure and blocker remain unproved global obligations.

Reviewed frozen source SHA-256: `f47bb0354a449061ff422e2cadf27f14acb9c264016c2dcd5cf717f23731a119`.
First reconstruction completed UTC: 2026-11-15T21:50:39.491535+00:00.
