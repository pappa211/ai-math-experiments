> Public derivative of a historical mathematical route audit. Operational details are omitted; original-input and public-file identities are separate in SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Cover-preserving loss of packing stability with K4/K5 equality blocks

Status: complete ordinary conditional structural lemma, proposed for use inside a minimum-S-counterexample proof. This extends the frozen tripartite boundary deduction to equality remainders with K5 blocks and replaces its adjacent-edge appeal to a tripartite closed-boundary theorem by a direct argument. It does not classify arbitrary stable deficit-one graphs. No computation or Lean check was run. Historical novelty is unassessed; the K4-only source is frozen TUZA-04 BOUNDARY_ROUTE.md.

## Exact statement

Let K have nu(K)=k, tau(K)=2k-1, with nu(K-f)=k for every edge f. Let d be an edge with tau(K-d)=tau(K), and suppose K-d has a packing-essential edge e. Put Q=K-{d,e}. Assume Q satisfies Tuza and, at equality, has only K4/K5 triangle components. These assumptions are supplied when K is a proper edge-subgraph of a minimum failure of combined statement S in a hereditary class.

Then d and e are disjoint. The unique triangle component of K that is not an isolated K4 or K5 is a central K4 with either one or two clique leaves, each leaf K4 or K5, attached along one of two distinct central edges sharing a vertex. Each attached leaf meets the central K4 exactly in its attachment edge; if two leaves occur, their vertices outside the central K4 are disjoint. Other triangle components may share vertices, but not edges, with this component. Triangle-free background edges are retained and are not asserted absent.

The premise that Q satisfies the equality classification is explicit. It must not be replaced by an unconditional assertion about all 5-degenerate equality graphs, since that is part of the main open target.

## Forced equality and the free e-page

Stability gives nu(K-d)=k, and essentiality gives nu(Q)=k-1=q. As tau(K-d)=2k-1, one-edge cover loss and Tuza imply tau(Q)=2q. Thus the triangle components of Q are K4/K5 blocks.

Write e=xy. Each Q block contains at most one old spoke across all e-pages of K-d. A block cannot contain x and y. If it contained xt1 and xt2 from two pages, yt1t2 would be a Q triangle sharing t1t2 with the block, forcing y into that block and hence the absent edge xy. The same argument applies at y.

If every e-page touched a Q block, choose a minimum block cover containing its unique touched spoke. Their union would cover K-d with 2q edges, contrary to tau(K-d)=2q+1. Hence there is an e-page A=xyz in K-d whose spokes xz,yz lie in no Q triangle block. They are triangle-free edges of Q.

Since e is stable in K, K-e has packing k=q+1 and therefore has a d-page. Every d-page in K-e must intersect A: otherwise a maximum Q packing can avoid its at-most-one old edge per block, and append that page and A, giving q+2 triangles. Here A contributes no block edge because it is free.

## Adjacent d,e are impossible

Rename adjacent edges d=px and e=py. A free e-page has form A=pyr with r different from x, because d is absent in K-d. Any d-page in K-e that meets A must be B=pxr.

If xy exists, the edges xy,xr,yr form a Q triangle, contradicting that yr is a free A spoke. Thus the closing case is impossible.

Suppose xy is absent. Any other e-page C=pys, s different from r, is edge-disjoint from B. Its apex cannot be x because xy is absent. In Q, B has only the potentially active spoke xr, since pr is free. A block cannot contain both spokes ps,ys of C because py is absent. It also cannot contain xr together with ps, since that would require missing px, or together with ys, since that would require missing xy. Thus every Q block can avoid the old edges of B and C, and these two triangles append to a Q packing, contradiction. Therefore A is the only e-page. B is already the only possible d-page. There is no triangle using both d,e because xy is absent. All triangles outside Q are consequently A,B, which share the Q-triangle-free edge pr. Deleting pr leaves packing number at most q, contradicting the stability of K.

This argument uses only clique-block compatibility; no tripartite full triangle hypergraph or closed-boundary theorem is assumed.

## Disjoint d,e force the central K4

Return to e=xy and the free A=xyz. A d-page intersecting A, with d disjoint from xy, forces d=zw for a fourth vertex w, and its apex is x or y. Choose B=xzw, interchanging x,y if necessary.

There is no e-page C=xyt with t outside {z,w}. Such C is disjoint from B. Among B's old edges only xw may lie in a Q block, since xz is free. A Q block sees at most one of xt,yt, because xy is absent. If it also sees xw, the pair with xt is adjacent and can be avoided by a K4 face or a K5 maximum packing. The pair xw,yt cannot occur in a clique block because it would require missing xy. Therefore C and B append to a maximum Q packing, contradiction.

Every d-page has already been restricted to xzw or yzw. If xzw were the only one, then xyw could not be an e-page: its old edge yw together with yz and restored zw would force yzw. The only new triangles would then be xyz,xzw, both on free edge xz. Deleting xz would lower nu(K), contradicting stability. Thus both d-pages occur, and they force all four faces on {x,y,z,w}: xyz,xyw,xzw,yzw. These are exactly the triangles outside Q.

## Attachment structure and deficit

The central K4 can meet old block supports only on xw and yw: xy,zw are absent from Q, and xz,yz are free. The two possible attachment edges belong to different blocks, since a block containing both would contain the absent xy. A block attached on xw cannot also contain y or z, because this would require xy or zw; similarly for yw. Two attached blocks cannot share an additional vertex t, since both would then contain wt and belong to the same triangle component. Their private vertices are therefore distinct, as claimed.

At least one attachment occurs. Otherwise the central K4 is an independent triangle component and tau(K)=tau(Q)+2=2q+2, contradicting tau(K)=2q+1. All Q blocks not attached remain separate triangle components because the four central faces are the entire new triangle family.

For clarity, the resulting component has packing number one plus the sum of its leaf packing numbers. A central face avoiding the common attachment vertex is disjoint from every leaf block; conversely a packing uses at most one central face and at most each leaf's maximum. Its cover number is one plus the sum of leaf cover numbers: choose a minimum cover of one attached leaf containing the attachment edge and add the opposite central edge. The central face opposite the common attachment vertex requires an edge outside the leaf supports, giving the matching lower bound. Thus this component has deficit exactly one; the other K4/K5 components have deficit zero.

## Use and limitation

In a dense-link deficit-one remainder, this identifies the only possible structural result of a cover-preserving deletion that first destroys packing-edge stability, provided the equality descendant remains within the minimum-counterexample induction. It does not show such a deletion sequence exists, preserve tau under unions of deletions, or show an arbitrary stable remainder has this form. Any proposed iteration must prove its own total cover preservation.

## Corollary for the localized K6 deficit-one remainder

The exceptional component in the lemma has independence number at most three: at most one vertex can be chosen in the central clique, and at most one private vertex from each of at most two leaf cliques. Consequently, for the localized K6 deficit-one remainder described in DENSE_REMAINDER_AUDIT.md, any tau-preserving single-edge deletion preserves packing-edge stability. Otherwise the lemma would classify its unique deficit-one component as one of these cores, whereas it contains the five independent rim vertices.

A conditional iteration is also valid if a sequence of deletions is already proved to preserve tau(K) and retains every old spoke belonging to an original external page. At each stage Tuza and monotonicity preserve packing number k. As long as stability has not yet failed, the augmentation by any external page plus four local B triangles forces both page spokes into the unique deficit-one component, exactly as in the localization proof. The original external bases meet all five rim vertices: if their endpoints lay in at most four rim vertices, the original graph would have the seven-edge cover extension already ruled out. Therefore the retained page spokes keep all five rim vertices in that component. At the first attempted loss of stability the structural lemma would force independence number at most three, a contradiction.

This corollary permits no automatic deletion union. A proposed sequence must separately establish cover preservation and retention of the specified page spokes; neither property follows from the mere existence of individually cover-preserving deletions in the original graph.
