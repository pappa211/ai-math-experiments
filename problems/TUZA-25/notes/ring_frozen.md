> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Frozen K5 ring claim, 2026-11-16

The graph has pairs P_i={2i,2i+1} and x_i=8+i, i modulo4, and exactly the clique-union edges of Q_i=P_i union P_(i+1) union {x_i}. Claim: n12,m36,t40,nu8,tau12, connected nonempty triangle support, every edge triangular, two-edge packing resilience, dim H^1(F2)=1. This corrects no planning value: tau12 and dimension1 are extra quantities to check. Only the resilience-implies-trivial-cohomology extrapolation is refuted; neither defect-one rigidity nor cut-cover Tuza is refuted.

Each triangle lies in one Q_i: an x_i triangle is local, while among pair groups the cycle C4 has no three-group clique; a triangle on two consecutive groups is local. Distinct cliques overlap only in four pair edges; each K5 packs at most2, by degree parity if three triangles used nine of its ten edges. Exact witnesses for all 1+36+630=667 deletion sets establish the matching lower bound8. The certificate is generated from actual triangles, not imported verdicts. A fresh checker must independently reconstruct this graph and verify all witnesses and the upper bound.

For cover lower bound, restrict a cover to each Q_i. Each needs4 edges because each K5 edge hits3 of its10 triangles. Summing counts at most |C|+4, hence |C|>=12. All four pair edges plus, for each x_i, both edges to P_i gives a12-edge cover. A suitable alternating coloring of the pair groups with x_i colored like P_i realizes this as a cut complement. Thus neither odd-cover/cut-cover minimum nor Tuza fails here.

Let F be the six edges from P_0 to P_1 union{x_0} inside Q_0 only. No overlap pair edge is selected. F meets each actual triangle evenly (a local cut in Q_0; zero elsewhere). The actual cycle 0-2-4-6-0 meets F once, so F is not a cut. Compute rank(delta0)=11, rank(delta1)=24 independently to check dim H1=36-11-24=1. The elementary cocycle/non-cut argument alone proves nonzero H1.

No formal Lean claim; finite certificates plus ordinary graph arguments, awaiting fresh AI reconstruction.
