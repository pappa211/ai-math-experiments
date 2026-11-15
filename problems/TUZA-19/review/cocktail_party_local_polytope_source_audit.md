# Bounded primary-source attribution screen: cocktail-party local packing polytopes

Date: 2026-11-15. Ordinary AI source audit, not human or formal verification. All artifact work was local on Darwin. Original mission start 01:53:58Z, research cutoff 09:23:58Z, hard deadline 09:53:58Z remain unchanged. Requested Astra/Ultra; exact serving metadata is not exposed.

Input inspected: `notes/global_routes_clique_link_polytope_obstruction.md`, SHA256 `58a6165eb965c00ae7c0fc711b9bdaf22a99809c616b2e8e04447bafccb32b07`. The producer checker and computational output were not consulted. This source screen does not replace the separate mathematical review or certify the later all-fixed-k extension.

## Outcome and attribution

There is a direct classical design-theory antecedent for the cocktail-party packing ingredient. Elizabeth J. Billington and C. C. Lindner, **Maximum packings of uniform group divisible triple systems**, Journal of Combinatorial Designs **4**(6) (1996), 397–404, DOI [10.1002/(SICI)1520-6610(1996)4:6<397::AID-JCD2>3.0.CO;2-A](https://onlinelibrary.wiley.com/doi/10.1002/%28SICI%291520-6610%281996%294%3A6%3C397%3A%3AAID-JCD2%3E3.0.CO%3B2-A), explicitly addresses maximum triangle packings of complete equipartite graphs and all possible minimal leaves. The publisher identifies publication year 1996; an online-version date in 1998 is not the publication year.

The publisher abstract and bibliographic record were read directly. Its PDF link returned the abstract page; the full theorem, parameter exceptions, and precise interpretation of prescribed embedded leaves were NOT checked. Consequently this audit does not import an unverified theorem covering all three C4 twin-part patterns. The self-contained doubling proof and literal base packings remain the evidence for the mission result. Any later presentation should cite this classical framework and finish the theorem-level attribution check before claiming originality for a maximum-packing construction.

The precise translation is elementary: CP_r = K_(2,...,2) is the host for a group-divisible triple packing of type 2^r. It has 2r(r−1) edges and all vertex degrees even. For r congruent to 2 modulo 3, a triangle-packing leave has edge count congruent to 1 modulo 3 and all degrees even, so its least possible nonzero size is four, realized only by a C4. The three possible twin-part multiplicity patterns are 2+2, 2+1+1, and 1+1+1+1. These observations explain the relevance of the primary paper; they do not resolve its unpublished-in-this-audit exception list.

## Nearby relaxation literature and scope distinctions

Yuk Hei Chan and Lap Chi Lau, **On linear and semidefinite programming relaxations for hypergraph matching**, Mathematical Programming **135** (2012), 123–148, [DOI](https://doi.org/10.1007/s10107-011-0451-5), [author-hosted primary PDF](https://cs.uwaterloo.ca/~lapchi/papers/hypergraph.pdf), studies the edge-capacity LP, local constraints, Sherali–Adams, and an intersecting-family LP. Sections 4.1–4.2 identify the last with clique inequalities in the *conflict graph*: one vertex per hyperedge, adjacency for intersecting hyperedges. That is different from imposing the entire triangle-packing polytope inside each complete subgraph of the original graph. Their general Sherali–Adams lower bound is k−2 for k-uniform hypergraphs and supplies no positive gap when k=3. It does not establish the CP example or its local witnesses.

For clarity, in an actual graph any pairwise edge-intersecting family of triangles either shares one graph edge or lies in a K4. To verify this, choose abc and abd; a triangle meeting both without containing ab must be acd or bcd, after which every triangle meeting all three is a face of that same K4. Thus the current full-star plus full-original-clique system implies the intersecting-family constraints. This is a direct scope comparison, not an identification of the two relaxations.

Separate first-marginal distributions for all chosen stars and cliques do not constitute a Sherali–Adams or Lasserre certificate. No consistent distributions on intersections, joint moments, or semidefinite constraints were supplied or claimed. Likewise, a search hit about vertex-disjoint triangle packing, or about conflict-graph cliques, does not establish prior art for the exact edge-disjoint system here.

## Bounded search result and remaining uncertainty

Queries covered maximum triangle packings of cocktail-party/equipartite graphs; group-divisible triple packings and C4 leaves; edge-disjoint triangle packing polytopes; link/neighborhood and clique constraints; and local or Sherali–Adams relaxations. Only primary sources support the conclusions above. Nearby search hits were not promoted into mathematical dependencies.

No exact prior statement of the simultaneous full vertex-link plus full original-clique obstruction was located in this bounded search. This is not evidence of novelty or an exhaustive literature review. The all-fixed-k star-union extension, its exact first-marginal obstruction, and its combined TF/two-edge-resilience/non-WKE hypotheses need separate attribution screening if prepared for publication. No additional graph computation, census, or formal verification was run.

Evidence: `evidence/cocktail_party_source_audit/manifest.json`, `billington_lindner_publisher_receipt.json`, and `chan_lau_receipt.json`; the author-hosted Chan–Lau PDF is retained under `sources/cocktail_party_source_audit/`.
