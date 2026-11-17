> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Payment limitations and constructive consequence

This addendum supplements, without modifying, the frozen theorem file under critic review.

## A stable deletion can have unbounded forbid-cover surcharge

For integer r>=1, let G_r be the union of r literal K4s on {u,v,a_i,b_i}, with only uv shared and no other edges. Put e=uv and N empty. Every actual triangle lies in exactly one petal. Then

    nu(G_r)=nu(G_r-e)=r,
    tau(G_r-e)=r,
    tau(G_r)=r+1,
    nu(G_r;{e})=2r,
    tau(G_r;{e})=2r.

Proof. A petal has at most one ordinary packed triangle, and triangles ua_i b_i attain one per petal without e. Deleting e leaves two triangles per petal with common private edge a_i b_i, so one cover edge per petal is exact. A cover using e costs r+1; one avoiding it requires two edges per petal, hence the original cover optimum is min(r+1,2r)=r+1. After forbidding e the two pages uva_i,uvb_i have disjoint two-edge footprints, giving two packed triangles per petal; five allowed edges and footprint size at least two bound this by two. Every petal requires two allowed cover edges, attained by ua_i and vb_i.

Thus the stable-delete surcharge is r, not at most one, while the packing jump is Delta=r and forbid slack is exactly 2r=2Delta. Generic strictness of just one unit leaves an arbitrarily large unpaid amount. This refutes only that broad surcharge surrogate; for r>=2 these graphs have ordinary slack r-1 and are not minimum-counterexample candidates. It is therefore not a refutation of a sharper minimal-CS restoration mechanism.

## Failure-preserving reduction behind the combined equivalence

The proof also gives an explicit conditional certificate transformation. Suppose N is active and tau(G;N)>=2nu(G;N), a failure of the claimed active strictness. Choose any triangle T meeting N and delete its allowed footprint S, leaving H. Always

    tau(H;N)>=tau(G;N)-|S|,
    nu(H;N)<=nu(G;N)-1.

If |S|=2, these inequalities imply tau(H;N)>=2nu(H;N). If N remains active, repeat. If N becomes inactive, H is an ordinary CS failure unless it is B; Lemma 4 excludes the B case because that would have made the predecessor strict. If |S|=1, the residual has tau(H;N)>=2nu(H;N)+1; the paid peeling of Theorem 3 then produces an ordinary Tuza violation. Each step strictly lowers the allowed-edge count. Thus any active mixed combined failure yields an ordinary combined failure by a concrete finite reduction. No new minimality assumption or universal conjecture is used for the transfer.

These statements are ordinary deductions pending fresh-critic confirmation; they do not exhibit an actual failure.
