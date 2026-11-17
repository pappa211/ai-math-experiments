> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent triple-selection profiles and K9 control review

Status: ACCEPTED ORDINARY exactly as necessary profiles and an actual-graph cover control. No selection or extension theorem follows from this receipt. No computation or Lean check was performed.

For any actual edge set F, a cover containing F restricts outside F to a cover of G-F, and the converse extension is immediate. Thus the constrained optimum is exactly |F|+tau(G-F). Under all-double-defect-two, each prescribed disjoint triangle pair is jointly eligible in a minimum G cover, with the cover allowed to depend on the pair.

For three prescribed edge-disjoint triangles, appending all three gives nu(S)<=k-3; proper CS and tau(S)>=2k-9 give nu(S)>=k-4. A cover of S+V uses at least one V edge, and deleting all its V edges leaves a cover of S. Hence tau(S)+1<=tau(S+V)=2k-6. Combining these bounds gives precisely the five displayed rows, with the listed defects and surcharges. No triple extension or inherited resilience is assumed. The tight low-packing row yields the displayed restoration cube (2,2)/(3,5)/(4,8) directly from the actual double and single residual profiles.

The K9 control is exact. The degree-sum/Cauchy proof gives Mantel's bound 20, attained by K4,5, hence tau=16. Any two edge-disjoint triangles can be placed internally in a 4+5 partition: a shared-vertex pair fits in the size-five part, and disjoint triangles can be placed one in each part. For the three center-sharing triangles, a triangle-free nonbipartite graph has at most 17 edges: a shortest odd cycle is induced, and cycle lengths 5,7,9 give the respective bounds 17,14,9 by independent neighbor sets on the cycle and the outside-edge bound. A bipartite graph has at most 18 edges unless its parts are 4+5; in that case a represented leaf pair of the windmill forces at least two of the 20 cross edges to be missing. The displayed 5+4 partition attains 18. Thus a cover required to contain the three triangles has size exactly 18, whereas every pair lies in a size-16 cover. The twelve affine lines over F3^2 partition all 36 edges, proving nu=12 without an optimizer.

K9 is not a tight parent and is packing-fragile after every edge deletion. It refutes only promotion of pairwise cover containment to common triple containment from that cover condition alone. The full actual-parent selection question and the paid restoration cube remain open. This control introduces no new numerical search or defect-two naming.

Bound source: notes/apex_actual_parent_triple_selection_v1.md, SHA-256 524fd503c10a5c28804f867900b324faf5c34685bdd90acf920ad032ccbf8d0c.
