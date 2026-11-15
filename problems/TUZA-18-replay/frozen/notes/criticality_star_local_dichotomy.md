# A two-member exchange certificate for common-vertex packings

Status: ordinary corollary of the common-vertex PK proof; independent review requested. No global maximum-packing premise is needed here.

Let G be a finite simple graph, and let P be any edge-disjoint triangle packing whose members all contain a vertex v. Let k=|P|. Define B, private triangles, private K4 completions, and A(P) exactly as in `criticality_star_pk_theorem.md` (frozen theorem SHA256 f08cc442241eef4b790bc4b5228c958045593f97ebf56c1259a6f6b1ffe5488b).

Exactly the following nonexclusive dichotomy holds: either

1. there are R contained in P with j=|R| in {0,1,2} and j+1 pairwise edge-disjoint actual G triangles whose edges avoid every member of P minus R; or
2. there is a triangle cover C contained in A(P) with |C|<=2k.

In the first case, retaining P minus R and inserting the displayed triangles gives a packing of size k+1. The alternatives are not asserted to be exclusive.

## Proof by auditing the hypotheses used in the frozen theorem

Suppose the first alternative fails. All deductions in the frozen proof remain valid:

- A triangle avoiding B, including an old triangle without a matching base or an apex triangle on two unmatched neighbors, would be a j=0 augmentation. Hence all the preliminary actual-triangle classifications hold.
- For two active matching pairs, two disjoint old pages and an unused apex triangle between their four endpoints would be a j=2 augmentation. This is the entire premise used in the 2-by-2 interpair classification, including the exclusions of one edge and two disjoint edges, the unique-tip conclusion for a two-edge star, and the locked-tip conclusions for P4 and C4.
- At an active matched pair with an unmatched neighbor of v, an old page with a different tip and the private apex page would be a j=1 augmentation. Thus the unmatched-neighbor state is still a private K4 terminal sink.

The directed-component analysis, independent-set leaf exchange, surplus accounting, and final all-triangle cover verification use no further optimality premise. They produce the same C contained in the ORIGINAL A(P), of size at most 2k. This proves the dichotomy.

In particular, every star packing stable under all such replacements of at most two members has the stated cover, even if a much larger exchange could increase its cardinality. This does not assert that arbitrary graphs admit a star packing stable under these exchanges: an augmentation can destroy the common-vertex property, so iterating the first alternative does not establish an unrestricted Tuza algorithm.

The proof is constructive in the finite sense. Inspecting all actual triangles and page pairs either exhibits one of the displayed small augmentations or builds the directed components and the cover by explicit leaf operations. The statement is a structural certificate dichotomy, not a claim based on a finite graph census.
