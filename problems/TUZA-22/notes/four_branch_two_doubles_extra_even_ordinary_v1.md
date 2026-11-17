> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Ordinary exclusion of two disjoint doubles plus one even single thread

Frozen 2026-11-16 before the research cutoff. Derivation jointly reconstructed by coordinator and restoration. Ordinary proof candidate.

Let L be a closed minimum-CS link with four branch vertices a,b,c,d and complete underlying branch graph. The doubled pairs are ab and cd, each consisting of its direct edge plus an even thread of lengths2t_ab and2t_cd. The single ac path is even of length2t_ac>=2, so the direct edge ac is ABSENT. The remaining singles ad,bc,bd are direct or odd of length2s+1; a direct path is represented by s=0.

Construct P as follows. On the double ab thread take its alternating matching starting at a, leaving b unmatched on that thread. On the double cd thread start at c, leaving d unmatched. On the ac even path match its internal vertices consecutively, leaving exactly one internal vertex unmatched; this uses t_ac-1 edges and no branch endpoint. On the bd path take its FULL alternating perfect matching, including b and d, with s_bd+1 edges (just bd if direct). On any nondirect ad or bc path take its internal perfect matching of size s_j.

Every vertex of L except the one specified ac-interior vertex is matched exactly once. Consequently

    |P|=floor(|V(L)|/2)
       =t_ab+t_cd+t_ac+s_bd+s_ad+s_bc.

The residual R=L-P is bipartite. To verify the entire graph, color the branch vertices with a,c on one side and b,d on the other. Its surviving direct core is a subset of the four-cycle ab,bc,cd,da: ac is absent originally, and bd is either deleted directly or was a nondirect path. Residual double-thread edges are disjoint edges, with at most one attached to their terminal branch vertex. The bd full-path matching leaves only disjoint interior residual edges. An ad/bc internal-path matching leaves endpoint pendant edges and disjoint interior residual edges. The ac path, when t_ac=1, remains the length-two path a-z-c and is consistent with a,c having the same color. When t_ac>=2, its residual consists of an endpoint pendant edge, isolated interior edges, and a pendant length-two path at the other endpoint. All these pieces extend the core coloring without creating an odd cycle.

By the ordinary bipartite matching-cover theorem, R has a vertex cover Q of size nu_matching(R)<=floor(|V(L)|/2)=|P|. Thus P,Q is a WKE tuple with BIPARTITE residual. The accepted ordinary no-bipartite-residual consequence of `coordinator_TF_residual_equal_matching_exclusion_v1.md` excludes it. Equivalently, strict |Q|<|P| is immediately impossible; balanced equality forces nu_matching(R)=|P| and is exactly that theorem's triangle-free equal-matching case.

All thread lengths and all choices of the other three odd/direct paths are included. This proof uses the elementary bipartite matching-cover theorem explicitly, not a finite certificate, GE, Kotzig theorem or a claim that arbitrary triangle-free residual tuples exist. The minimum-CS equal-matching theorem is applied only after the literal matching and bipartite residual above are supplied.
