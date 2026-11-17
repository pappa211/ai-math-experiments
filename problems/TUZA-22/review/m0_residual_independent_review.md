> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# M0 and residual package — independent review

Reviewed the reconstruction in `notes/restoration.md` §§1–6 against the exact CS/B definitions and the already reviewed R1/R2 theorems. Verdict: **ACCEPT at ordinary-proof scope**. M0, the one-edge insertion lemma, the elementary deletion bounds and the worked diagnostic are reconstruction of existing inputs; they are not new architecture advances.

A failure of CS has tau>=2nu because B implies equality universally, so the only possible failures are a Tuza violation or tight non-B graph. Triangle-free edges can be removed without changing either optimum or B. Multiple triangle components would each be proper subgraphs; additivity and their CS statements exclude a failure. Thus a minimum failure has nonempty connected triangle support and every edge is supported.

For k=nu(G), deleting one edge drops a maximum packing by at most one. A drop to k-1 would give tau(G)<=2k-1 by proper-subgraph CS and reinsertion, impossible. Thus nu(G-e)=k. If tau(G-e)=2k, proper-subgraph CS supplies B(G-e), and the supported insertion edge supplies a new triangle and a packing gain by Lemma A, impossible. Hence tau(G-e)<=2k-1, while reinsertion and tau(G)>=2k force equality and tau(G)=2k. This argument uses no sparsity hypothesis.

For H=G-E(T), a packing of H extends by T, so nu(H)<=k-1; restoring the three edges gives tau(H)>=2k-3. Proper-subgraph CS gives tau(H)<=2nu(H). If k>=2 this forces nu(H)=k-1 and tau(H) in{2k-3,2k-2}; if k=1, nonnegativity and the packing bound force nu(H)=tau(H)=0. Tightness is established before any B(H) conclusion.

For S of size at most two lowering nu, tau(G-S)>=2k-|S|>=2k-2 and proper-subgraph CS gives tau(G-S)<=2nu(G-S)<=2k-2. Thus equality holds, |S|=2, nu(G-S)=k-1 and B(G-S). R2 excludes this residual in a minimum CS failure. R1 excludes every tight triangle residual, including k=1. Therefore every remaining minimum CS failure has two-edge packing resilience, k>=2, and every triangle residual has nu=k-1,tau=2k-3. Each triangle is consequently contained as all three edges in a minimum G-cover. These properties are necessary, not contradictory: K5 satisfies the local identities and resilience but is B.

The worked K4 attachment diagnostic is also correct. The two residual edges bu,cv cannot be opposite edges of a residual K4 because both required edges bc anduv are absent there. A maximum residual packing avoids them; appending abu,acv,uvw gives k+1 actual edge-disjoint triangles. Endpoints b,c lie outside the deleted K4 because ab,ac are absent in the triangle residual. No hidden graph support or incidence assumption is needed.

Conditional global chain remains exactly R2 plus H-D-CS-min plus M0 implies CS. R1 additionally removes the tight-triangle-residual branch. No conclusion about original H-D follows without proving an implication between its universal tight-residual premise and these different defect-one premises.

Reviewed source SHA-256 at first review: `e84b97c9188ed3d232546b99febbf8eff08683e39c55270f927d142a3b1b5197`.
Review completed UTC: 2026-11-15T21:59:02.964277+00:00.
