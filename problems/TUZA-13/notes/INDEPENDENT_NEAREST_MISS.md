# A nine-vertex nearest miss with a short exact proof

This is a verified nearest miss, **not a counterexample**. It is the isolated-vertex-free relabeling of discovery `nearest_loss_9.json`; the original is retained unchanged. Literal data and the original-to-normalized map are in `witnesses/independent_nearest_9_normalized.json`.

Take three copies of K4 on

    Q1={0,1,7,8}, Q2={0,2,3,6}, Q3={2,4,5,8}.

They have pairwise intersections {0}, {2}, {8}, respectively, and share no edges. There are nine vertices and eighteen edges. The full triangle family consists of the twelve K4 faces and exactly one additional triangle Z={0,2,8}. To see completeness, a triangle using more than one block cannot have two edges in the same block unless all its vertices lie there; a triangle using three different blocks must use the three pairwise intersection vertices, giving Z.

Choose

    C={02,08,28,17,36,45}.

Each block contributes an opposite edge pair, which covers its four faces. C also contains all three edges of Z. Thus C is a triangle cover. Any cover requires at least two edges from each K4, and their edge sets are disjoint. Consequently tau=6 and C is minimum.

Every K4 face has exactly one red edge; Z has three. Therefore the eligible family is exactly the twelve block faces. Any two faces of a K4 share an edge, so an eligible packing has at most one triangle per block, giving nu_eligible<=3. Selecting one face from each attains three because the blocks share no edges. Hence

    nu_eligible=3=ceil(tau/2).

The full graph has packing four: Z together with faces {1,7,8}, {2,3,6}, {4,5,8}. They share vertices but no graph edges. Conversely at most one face from each of the three blocks and at most Z can be selected, so full nu=4.

There are exactly nineteen minimum covers. Each must choose a minimum two-edge cover in each K4, with three choices per block. In each block one of these choices contains its edge of Z, and two do not. Out of 3^3=27 choices, exactly 2^3=8 fail to cover Z; hence nineteen remain. Exactly one chooses all three Z edges, giving the displayed cover with eligible optimum three. For every other optimum cover Z is eligible; the same four-packing works, so eligible optimum four. The independent exhaustive checker agrees with this full classification.

This example explains a sharp limitation: all-red triangles can be necessary to achieve full nu even when the eligible packing merely meets the half-cover threshold. It still leaves the target inequality valid, with equality.

Two other independently reconstructed connected near misses were checked with all minimum covers: normalized `nearest_loss_3` has (n,m,tau,nu,nu_eligible)=(9,20,7,5,4), with 36 optimum covers; `nearest_loss_0` has (10,24,9,6,5), with 126 optimum covers. These stated eligible numbers refer to the supplied covers. Their complete cover profiles and literal data are in the corresponding `evidence/independent_normalized_nearest_*.json` files; no isomorphism classification beyond deleting isolated vertices and relabeling is claimed.
