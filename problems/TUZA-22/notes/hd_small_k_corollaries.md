> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Explicit class-minimality audit and original H-D through k=4

TUZA-22 challenger reconstruction. Status: PROOF_USING_DECLARED_INPUT, with the exact historical inputs below. These are scoped corollaries; original H-D for all packing numbers remains open. No hypothesis transfer from H-D-CS is made.

## 1. Restricted CS from the packing-three obstruction proof

Let K_j be the class of all finite simple graphs G with nu(G)<=j, for j<=3. This class is subgraph-closed: deleting vertices or edges cannot create a larger triangle packing. Suppose CS failed somewhere in K_3, and choose a failure with the fewest actual graph edges, discarding isolated vertices.

Every proper subgraph remains in K_3 and satisfies CS by this **within-class** minimality. Therefore the archived M0 combined-minimality lemma applies at its explicitly class-independent scope. It supplies tau=2nu, connected nonempty triangle support, no triangle-free edges, and the stated single-edge identities. The archived M3 local package also applies to an edge-minimum combined obstruction in any subgraph-closed class; it is not limited to the mad<7 conclusion of TUZA-15. In particular it gives edge codegree at least two and minimum degree at least five.

The already reviewed two-triangle restoration theorem proves CS for every graph with nu<=2 directly: remove the edges of a maximum packing of at most two triangles, leaving a triangle-free B graph, and restore those actual triangles. This use is acyclic and needs no claim that an unrestricted minimum failure must have small packing.

Thus the chosen within-class failure has k=3. Reviewed R1 rules out a tight triangle residual, so the exact elementary residual bounds give tau(G-E(T))=3 for every triangle T. A residual minimum cover together with E(T) is a six-edge minimum cover containing a triangle. The six-edge cover kernel from notes/k3_cover_kernel_proof_v1.md uses only minimum degree5, codegree2, nu<=3 and this cover. It yields n<=9. Its separate density lemma yields mad(G)<7. Only now do we invoke the historical TUZA-15 theorem T0, which proves CS under exactly mad<7, giving a contradiction.

Consequently:

    Every finite simple graph with nu(G)<=3 satisfies CS.

The logical correction matters: merely proving that a globally minimum unrestricted failure has nu>=4 would not by itself exclude a nonminimum failure of packing number3. The argument above repeats the minimality construction inside the hereditary class K_3, where every invoked local input retains its hypotheses.

Dependencies retained explicitly: reviewed R1 and two-triangle restoration (current ordinary proofs); the six-edge kernel and its density lemma (current ordinary proofs); archived M0 and M3 at their class-independent local scopes; archived T0 at its exact mad<7 scope. This is not a fresh verification of the full TUZA-15 proof or a Lean claim.

## 2. Original H-D transfer through k=4

Assume the original H-D premises: G contains a triangle, k=nu(G), and for **every actual triangle** S,

    nu(G-E(S))=k-1,
    tau(G-E(S))=2k-2.

If k<=4, choose any actual triangle T. Its residual H has nu(H)=k-1<=3, so the restricted CS theorem applies. The given equality tau(H)=2nu(H) then implies B(H). The reviewed theorem notes/hd_one_classified_residual_v1.md now applies with all of its original H-D hypotheses and the explicitly obtained classified residual.

It follows that original H-D holds for k<=4. More precisely:

- for k=1, the full triangle family is a book or a literal K4, so there is a one- or two-edge packing blocker;
- for 2<=k<=4, every actual triangle component is a literal K4, and there are exactly k components. Any opposite-edge pair in one component lowers nu by one.

The latter classification implies tau(G)=2k for these original-H-D graphs. It does not describe arbitrary tight graphs with packing k, and it is not a theorem about H-D-CS-min: that obstruction has defect-one triangle residuals, while the premises used here require every triangle residual to be tight.

## 3. Separate evidence levels

The k<=3 original-H-D corollary needs only the ordinary restricted CS theorem for nu<=2 plus the ordinary one-classified-residual theorem. The k=4 extension additionally invokes the historical M3/T0 inputs through the restricted CS proof for nu<=3. These scopes should be kept distinct in the status ledger.

Neither corollary supplies an all-size blocker. For k>=5, the required residual equality classification is not available from these results. Universal CS would supply it and imply original H-D by the same explicit transfer, but universal CS remains conjectural.
