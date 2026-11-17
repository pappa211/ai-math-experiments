> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A classified triangle residual bounds a connected resilient defect-one graph

Status: ordinary proof candidate. This is a precise restriction on one representation, not a general bound for all defect-one graphs.

Let J have connected nonempty shared-edge triangle support, satisfy

    tau(J)=2nu(J)-1,

and preserve its packing number after every single-edge deletion. If some triangle T of J has B(H) for H=J-E(T), then nu(J)<=7.

Put m=nu(H), p=nu(J), and let q be the packing number of the complete newly restored triangle family. The exact one-triangle interface from `two_triangle_restoration_v1.md` gives p=m+q. A minimum H cover plus the three T edges gives

    2m+2q-1=tau(J)<=2m+3,

so q is1 or2.

If q=1, that same exact interface says the entire new family is either a book with a common T base, or precisely a K4 on the three T terminals and one full apex. In the book case deleting its common base removes every new triangle. All surviving triangles are old H triangles, so the packing number drops from m+1 to m, contrary to edge resilience.

In the K4 case, an old H clique block can contain at most one T terminal, since the three terminal pairs are absent in H. Its edge intersection with the new K4 therefore consists of at most one of the three old apex spokes. Any old block not sharing one of these spokes remains in a different triangle component: every actual J triangle is already either an old H triangle or one of the four new K4 triangles. Connectedness forces every old block to meet the new K4. There are consequently at most three old blocks, each with packing number at most two. Therefore p=m+1<=7. Arbitrary old vertex sharing and triangle-free background do not affect this argument.

If q=2, the target cover number is2m+3. The q<=2 interface gives a cover of the entire new family with at most two edges unless it is exactly K5-e (two full apices). Hence that exceptional family is forced. Every old spoke belongs to a three-edge cover of this new family. A supported spoke would overlap an appropriate minimum H cover and give tau(J)<=2m+2. Thus all old spokes are triangle-free in H, and the new K5-e support is disjoint from old triangle support. Connectedness forces H to have no triangles, so m=0 and J has exactly the K5-e triangle component, with p=2.

This exhausts the cases. In particular every connected, packing-edge-resilient, defect-one graph with packing number greater than seven must avoid B after EVERY triangle deletion; an unbounded family must eventually leave this classified-residual representation. The conclusion uses existence of a classified residual, not an assumed classification of arbitrary near-tight graphs.

Dependencies: the independently accepted exact one-triangle page interface, elementary minimum clique covers through a prescribed edge, and actual triangle-component connectivity. No new computation or external theorem is used.
