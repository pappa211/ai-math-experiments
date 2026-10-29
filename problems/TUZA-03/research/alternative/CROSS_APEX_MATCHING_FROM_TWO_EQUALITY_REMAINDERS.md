> Curated source from TUZA-03/alternative/CROSS_APEX_MATCHING_FROM_TWO_EQUALITY_REMAINDERS.md. Original SHA-256: `76dfe97ace069966a2598230686969d04d3693e33e497311b73728be852f5daa`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# Cross-apex edges form a matching: two equality remainders


Assume the critical equations nu(H)=h, tau(H)=2h-1, nu(G)=h+2, tau(G)=2h+5. Restore the bowtie triangles vab and vcd. Both individual new families are exact two-apex families, with disjoint apex sets P1={p,q}, P2={r,s}. The same-family apex pairs are nonadjacent. Assume at least one mixed terminal edge; relabel terminals so ac is present. There may also be the other mixed edge bd.

For ANY chosen cross-apex edge pr (after independently relabeling the apex pairs), use the five-packing
    vac, abp, vbq, cdr, vds
and its old footprint
    A_pr={ac,ap,bp,bq,vq,cr,dr,ds,vs}.
If ac is the only mixed edge, A_pr union {ab,cd} covers all new triangles. If bd is also present, A_pr union {vb,cd} does so. In either case there is an eleven-edge new-family cover with old part A_pr. Thus J_pr=H-A_pr is an equality graph with packing h-3.

The triangle vpr survives in J_pr and therefore belongs to an equality K4
    K_pr={v,p,r,x}.
Its fourth vertex x lies outside W={v,a,b,c,d,p,q,r,s}: every terminal a,b,c,d misses v in H, while q misses p and s misses r. (The restored triangle edges are absent from H.) Thus all edges from x to v,p,r are old edges outside the boundary deletion set.

Suppose another cross-apex edge shares an endpoint with pr. By interchanging the two apex families if necessary, write it as ps. Repeat the preceding extraction with ps as the chosen edge, swapping the names r and s. The resulting equality graph J_ps contains vps and forces a K4 in H on
    K_ps={v,p,s,y},
where again y lies outside W.

Now examine this second K4 inside the FIRST equality graph J_pr. Of its six edges, exactly vs belongs to A_pr: vp and ps survive, and the three edges incident to y survive because A_pr lies wholly within W. Consequently J_pr contains the two triangles
    vpy and psy,
which share the graph edge py, while vs is absent.

Every J_pr-triangle lies in one of its isolated edge-disjoint K4 face families. The two displayed triangles share an edge, so they must belong to the same equality K4. Their vertex union is {v,p,s,y}; that K4 requires vs to be present. This contradicts its deletion.

Therefore no two cross-apex edges can share an endpoint. The cross-apex graph is a matching and contains at most two edges.

The proof does not combine packings or covers from different remainders. Each remainder is independently forced by the same critical equations; the contradiction is a concrete missing-edge conflict between their forced K4s.

## Consequence

For a one-mixed-triangle exact-two-apex bowtie with disjoint apex sets, only zero, one, or two DISJOINT cross-apex edges remain. These are handled by SINGLE_CROSS_APEX_SINGLE_MIXED_BOWTIE.md and SINGLE_MIXED_TWO_CROSS_APEX_BOWTIE.md. The longer three-cross-edge argument is preserved as a valid independent candidate route but is no longer needed for the shortest proof architecture.

Together with COMMON_APEX_BOWTIE_RESTORATION.md and the two-mixed-triangle results, this is a candidate completion of all exact-two-apex bowties having at least one mixed triangle. Acceptance remains conditional on independent review of the cited proofs.
