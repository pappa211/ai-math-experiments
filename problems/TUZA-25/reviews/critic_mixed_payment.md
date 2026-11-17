> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: payment limitations addendum

**PASS**, with the surcharge reference made explicit below. Reviewed `notes/mixed_payment_limitations.md`, SHA-256 `3bf39c397b02c461e662c5d72b3e0c287f7c8918fd5a5bd37b827ad9ba660adc`. This is an ordinary proof reconstruction; the formulas do not rely on the listed finite examples.

For r K4 petals sharing only uv, a triangle cannot use private vertices from two petals, so every actual triangle belongs to exactly one petal. Each petal contributes at most one ordinary packed triangle, and choosing ua_i b_i in every petal attains r while avoiding uv. This proves both nu(G_r)=r and nu(G_r-uv)=r.

After deleting uv, the two remaining triangles in each petal share its private edge a_i b_i. Those private edges give a cover of size r, and the r-packing proves its minimality. A cover containing uv still needs one private-petal edge for the two triangles avoiding uv, so its optimum is r+1. A cover avoiding uv needs at least two edges from each petal, since no remaining edge meets all four local triangles; the pair ua_i,vb_i covers all four. Thus tau(G_r)=min(r+1,2r)=r+1 and tau(G_r;{uv})=2r.

On the forbidden branch, the two uv-pages in each petal have disjoint two-edge allowed footprints, giving a mixed packing of size 2r. Conversely each petal has five allowed edges and every local triangle consumes at least two of them, so it packs at most two. Allowed edges from different petals are distinct. This proves nu(G_r;{uv})=2r for every integer r>=1.

The claimed surcharge is specifically

    tau(G_r;{uv}) - tau(G_r-uv) = r.

The surcharge relative to the original cover optimum would instead be r-1. The addendum is correct with the stable-deletion reference; subsequent summaries should state that reference rather than use an ambiguous bare word "surcharge". The packing jump is Delta=r, and the forbidden instance has slack 2nu-tau=2r=2Delta. A hypothetical generic saving of only one would leave a forbid-branch budget excess 2Delta-1. This family refutes the broad bounded-surcharge surrogate, not a statement with additional minimum-counterexample hypotheses. For r>=2 its ordinary slack is r-1>0.

The constructive combined-failure reduction also checks. From an active mixed instance satisfying tau>=2nu, delete the allowed footprint S of any N-hit triangle. Appending that triangle and extending a cover imply nu(H;N)<=nu(G;N)-1 and tau(H;N)>=tau(G;N)-|S|. If |S|=1, then tau(H;N)>=2nu(H;N)+1, and the independently reviewed peeling reduction produces an ordinary Tuza violation. If |S|=2, then tau(H;N)>=2nu(H;N). An active residual therefore remains a mixed strictness failure and can be processed again.

When N first becomes inactive after a size-two deletion, the residual is an ordinary combined failure unless it is B. But B would satisfy every hypothesis of Lemma 4 for the preceding active graph and force that graph to be strict, contradicting the maintained failure. The B endpoint is therefore impossible. Every deletion lowers the nonnegative allowed-edge count, so the process terminates. This is a finite failure-preserving transformation under the premise that a failure is supplied; it does not produce an actual failure or assume either universal conjecture.

No disagreement remains. The reviewed main theorem and this addendum together explain why the paid peeling/restoration reduction is materially different from trying to bound every individual forbid-branch packing jump or cover surcharge.
