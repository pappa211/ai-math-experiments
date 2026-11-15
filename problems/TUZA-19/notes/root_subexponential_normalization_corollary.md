# Subexponential error and universal-clique corollaries

Status: ordinary deductions from the frozen near-quadratic amplifier and batched simultaneous normalization; independent reconstruction requested. This is a conditional equivalence, not a solution of Tuza or an originality claim.

Fix a real a with 1/2<a<1, and for n>=2 write

    f_a(n)=n exp(-(log n)^a),
    E_a(n)=n^2 exp(-(log n)^a),

with natural logarithms. Then each of the following is equivalent to unrestricted Tuza:

1. There exist uniform constants C,n0 such that every n-vertex graph with n>=n0 satisfies tau<=2nu+C E_a(n).
2. Tuza holds on all graphs with at least f_a(n) universal vertices, TF, every vertex-link component non-WKE, and minimum triangle codegree at least f_a(n), simultaneously.

Both converse directions are immediate by restriction or C=0. For the forward directions, use a fixed hypothetical minimal counterexample G and the classical incidence sequence H from notes/global_routes_quantitative_amplification.md, with

    N/r<=h<=N, b>=N^2 exp(-C_G sqrt(log N)),
    delta(H)=b delta(G)>0.

The functions f_a and E_a are increasing for all sufficiently large arguments, by logarithmic derivatives 1-a(log n)^(a-1) and 2-a(log n)^(a-1). Since a>1/2,

    E_a(N)/b <= exp(C_G sqrt(log N)-(log N)^a) -->0.

The uniform error inequality applied to H contradicts its exact positive defect for large N, proving statement1's implication.

For statement2, use the batched construction of notes/root_batched_universal_tf_nonwke.md with

    q=ceil(f_a(4N)).

Here q tends to infinity and q=o(N). Its frozen order estimate therefore gives n_W<=4N eventually. Monotonicity implies q>=f_a(n_W). The frozen defect loss is O_G(Nq)=O_G(N^2 exp(-(log(4N))^a))=o(b); rounding contributes only O(N), also o(b). Hence delta(W)>0 for large N, while all simultaneous TF, link, universal-vertex and codegree conclusions of the batched theorem hold. This contradicts the restricted statement and proves its implication.

For example a=2/3 gives a single explicit normalized class with n exp(-(log n)^(2/3)) universal vertices, a quantity larger than n^beta for every fixed beta<1 at sufficiently large n. The seed-dependent constant C_G is absorbed because (log N)^a dominates sqrt(log N); no fixed coefficient at exponent a=1/2 is asserted. This proof also does not reach n/(log n)^C universal vertices, an arbitrary unspecified o(n^2) error, or a linear proportion of universal vertices.

Dependencies: notes/global_routes_quantitative_amplification.md (SHA4ddc162df0ceb5072b948d64cf7d09df1e2e7641d66dceb038aecce6cbb48d53), notes/root_batched_universal_tf_nonwke.md (SHAd4ff2e5f0539b43fedc54fab7eef87a01717b43103577e5862b7739a63101913). Classical EFR/Behrend attribution and scope are unchanged. No computation, Lean process, preservation of packing resilience, or preservation of edge-minimality is claimed.
