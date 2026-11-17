> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Four-cone counterexample to D-all and D-some-extension

Frozen proposed proof for fresh independent AI review. No Tuza counterexample: the graph has tau44 and nu32. The exact claim defeated is the universal choice of maximum private packing for a minimum cover. D-some-choice is not defeated; the same graph and cover admit another maximum private packing with a32-triangle extension.

## 1. Clebsch input and exact local data

Use the triangle-free Clebsch graph L on the16 even subsets of {0,1,2,3,4}, represented by even five-bit masks. Two masks are adjacent precisely when their XOR has four bits. Let z be a new apex, adjacent to every L vertex. The accepted TUZA-21 ordinary proof supplies:

- alpha(L)=5;
- every independent five-set is a neighborhood N(v), and every vertex outside it has at least two neighbors inside it;
- the cone has triangle-cover number11, and every minimum cover comprises eleven spokes outside some N(v), with no rim edges;
- the cone's triangle-packing number is8.

These are declared inputs at their exact source scope, not newly claimed discoveries. The subsequent deductions are ordinary arguments.

Fix the independent set I=N(0)={15,23,27,29,30}. The following five L edges form a matching M saturating I:

    (30,3), (29,6), (27,5), (23,9), (15,17).

Its six unmatched vertices are

    U={0,10,12,18,20,24},

and the complete induced edge set on U is

    B={(10,20),(12,18)}.

The incoming boundary is

    A={(5,27),(9,23)} subset M.

Each of A and B is an induced2K2, their endpoint sets are disjoint, and J=A union B is a matching of four edges. Every A edge and every B edge have extra cross-adjacencies in L, outside J. Explicitly the two cross edges for the four pairs are:

| A edge | B edge | Cross edges |
|---|---|---|
| 5–27 | 10–20 | 5–10,27–20 |
| 5–27 | 12–18 | 5–18,27–12 |
| 9–23 | 10–20 | 9–20,23–10 |
| 9–23 | 12–18 | 9–18,23–12 |

All four J edges have XOR difference30. These literal data are small enough for direct bit-count checks.

## 2. Cyclic gluing and all actual triangles

Take four copies of the cone, numbered0,1,2,3 cyclically, with distinct apices. In each copy identify the outgoing boundary vertices with the next copy's incoming vertices by

    10_i=5_(i+1), 20_i=27_(i+1),
    12_i=9_(i+1), 18_i=23_(i+1).

No other identifications or edges are made. Since incoming and outgoing endpoint sets within a copy are disjoint, each shared vertex belongs to exactly two consecutive pieces; nonconsecutive pieces are disjoint. Consecutive pieces intersect in exactly the induced2K2 boundary. In particular, no triangle lies in an intersection.

Every actual triangle belongs to one piece. If two of its edges belong to the same piece, their three vertices belong there; an edge on two vertices of an intersection is already present in both pieces because the intersection is induced. If all three edges needed distinct pieces, their three pairwise intersections would form a triangle in the piece-intersection graph C4, impossible. Consequently all triangles are precisely the40 apex triangles from each piece,160 in total. This argument does not omit crossing triangles: it excludes them from the actual literal union.

The graph has52 vertices and216 edges. Its triangle family is shared-edge connected through the boundary edges and has no common apex or other common vertex.

## 3. A minimum44-edge cover: ordinary lower bound

The cover C takes, in every piece, the eleven spokes z_i v with v outside I. This is a44-edge cover of every actual triangle.

We prove it is minimum. First show alpha(L-J)<=6. If W were an independent seven-set in L-J, then L[W] would be a matching contained in J. It cannot contain an A edge and a B edge simultaneously, because the displayed cross-adjacencies would also occur within W and lie outside J. Hence L[W] contains at most two edges. With at most one edge, removing one endpoint would leave an independent six-set, contradicting alpha(L)=5. With exactly two edges, remove one endpoint of each. The remaining five-set I' is independent, but either removed vertex has exactly one neighbor in I' (its matched partner), contradicting the declared outside-neighborhood property for independent five-sets. This proves alpha(L-J)<=6.

For any triangle-free link K, the cone's triangle-cover number equals the ordinary vertex-cover number of K, hence |V(K)|-alpha(K): spokes give the upper bound, and replacing each selected rim edge by one endpoint's spoke converts any mixed edge cover to a spoke cover without increasing its size. Thus the cone over L-J has cover number at least10.

Now let D be any triangle cover of the four-piece graph, and write D_i for its restriction to piece i and s_i=|D_i intersection J_i|. These restrictions cover the respective cones. If s_i=0 then |D_i|>=11. If s_i=1 then |D_i|>=12, because no minimum eleven-edge cover of the original cone contains a rim edge. If s_i>=2, deleting its s_i selected boundary edges leaves a cover of the cone over L-J, so |D_i|>=10+s_i. In every case,

    |D_i| >= 11 + s_i/2.

Let f be the number of selected globally shared rim edges. Each is counted in two restrictions, and every other edge belongs to one piece, so

    |D| = sum_i |D_i| - f,
    sum_i s_i = 2f.

Therefore |D|>=44. Together with C, this proves tau(G)=44 by an ordinary argument using the declared Clebsch facts. The independently reproducible16-state local cover table and256-state global DP are corroboration, not a hidden mathematical oracle for this lower bound.

## 4. A maximum private packing with no extension

Let Q consist of the five apex triangles z_i ab for ab in M in every piece. Thus |Q|=20. They are edge-disjoint: each M is a matching; a boundary edge in B_i is used only as its identified incoming A edge in Q_(i+1), and is not used by Q_i. All other edges are exclusive to one piece.

Every triangle of Q has exactly one edge in C, because every M edge joins I to its complement. For this C, the entire private family F_C comprises precisely the apex triangles whose rim edge crosses that cut in its piece. The twenty spokes at I, five per apex, meet every private triangle. Hence any private packing has size at most20. Q attains20, proving that Q is maximum in F_C. This is an explicit matching upper certificate, not a greedy-optimality assertion.

Q is already inclusion-maximal in the full triangle family. A triangle in piece i avoiding Q_i would need both endpoint spokes unmatched by M. Its rim therefore lies in L[U]=B_i, and that edge is used by Q_(i+1). Thus no actual triangle avoids Q. Equivalently G-E(Q) has no triangles, so its packing number is0 and the exact maximum extension size is20.

Consequently

    |C|=44 > 40=2|Q|,

where C is a minimum ordinary cover, Q is a maximum private packing, and Q itself is a full maximal packing. This refutes D-all. Because no full packing properly extending this Q exists, it also refutes D-some-extension for the displayed C,Q.

## 5. Quantifier boundaries and full graph optimum

There is no Tuza violation. In each local Clebsch graph, XOR with15 gives a perfect matching of eight edges. Every shared rim edge has XOR30, so these matchings avoid every boundary edge. Their four apex packings combine to32 triangles. Conversely every actual triangle belongs to exactly one piece, each of which has packing number8, so nu(G)=32. Thus tau(G)=44<64=2nu(G).

D-some-choice is not refuted. The certificate supplies a different maximum private packing Q' of size20 for the same minimum cover C, avoiding all shared rim edges, and an explicit full extension of size32. It can be chosen without a solver: take the five I-crossing edges within each XOR15 perfect rim matching; the full four perfect matchings extend those twenty private triangles to32. Both edge-disjointness and private membership can be checked directly. This graph therefore satisfies the existential-choice version.

The unrestricted D-some-choice conjecture remains open. A bad choice of maximum private packing defeats neither existence of a successful choice nor unrestricted Tuza.

## 6. Artifacts and evidence limits

- `evidence/challenger_D_counterexample.json`: literal graph, every actual triangle, minimum C, bad Q, private-family20-edge upper cover, full32-packing, alternate Q', and successful32-extension.
- `scripts/challenger_cycle_two_matching.py`: literal construction and exact conditional-cover corroboration.
- `scripts/challenger_cycle_two_certificates.py`: explicit packing and private-cover certificates.
- `evidence/challenger_cycle_two_matching.json`: all16 local conditional-cover states, their minimizing W witnesses, and global256-pattern result.
- `operations/challenger_cycle_two_matching.json`: Mac execution receipt;0.116s, no resource termination.

The proposed proof above uses accepted ordinary Clebsch facts and elementary graph arguments; it has not been Lean formalized. The generators use existing NetworkX only for the alternate successful packing, whose output is directly checkable. The decisive bad Q and all mathematical lower bounds have explicit ordinary certificates. Fresh independent reconstruction is required before promotion from proposed to accepted.
