# Continuing independent audit: coordinated private-page rotation

Verdict: the exact operation, type3 ledger, lexicographic consequence and unbounded-loss fan are correct. No cover-transfer theorem follows from the ledger alone. Ordinary independent reconstruction by the coordinator; not fresh-context, Lean or human verification.

Audited input: notes/packing_routes_page_rotation.md, SHA25638d665979b25527e5adb983e1d42773ba2f96a4ca98b427e99eceedd918adc10. I read the proof before inspecting any producer checker; I have not imported or rerun that checker. The frozen TUZA18 private-page0/1/3 classification is the declared local dependency.

The selected bases form a matching because the old triangles share x, so the new z-pages are disjoint and avoid the unselected support by privacy. Their support changes exactly by removing xu and adding zu for u in the base-endpoint set. The xz edge cannot be newly outside support. If a rotated member had a different private K4 apex w, then the three edges za_i,a_iw,wz were all outside the old support, forming an augmenting triangle. This verifies that the rotated members remain type1, an essential part of the exact type3 count.

An old private completion is disrupted precisely when one of its spokes is an added zu edge. This gives the two stated endpoint cases. Such an old member cannot contain x, by old packing disjointness in the first case and old completion privacy in the second. A replacement completion would therefore require apex x. In the case where the old triangle contains z, the xz condition prevents it. These checks justify the exact genuinely lost set, rather than merely an upper bound.

A new completion for an unchanged old non-type3 member must use a freed xu edge. If x is outside the member its new apex is x; if x is inside the member its new apex is u. The stated outside-support tests are also sufficient. Hence the created and lost sets exhaust all changes and k3(P')−k3(P)=|C|−|D|. Maximizing k3 before the degree-square objective gives the primary inequality for every move and the secondary inequality only when the primary value is unchanged. No incompatible optimization orders are combined.

The loss fan has exactly the displayed book faces and K4 faces, with no triangles across fresh pairs. Triangle ownership bounds packing by n+1; the displayed packing attains it. One rotation really changes all n old type3 members to type1. The cover {zu,uv} union {a_i b_i} hits every face and is in both stated permitted sets. Thus loss count cannot be bounded by a constant times the number of rotated members. Any further use must exploit common destruction edges and cover all cross-group triangles; neither obligation is discharged here.

No mathematical correction is requested. The proof is a valid local operation and accounting lemma with an explicit global applicability gap.
