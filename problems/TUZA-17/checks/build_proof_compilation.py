"""Compile frozen mathematical arguments without modifying their source notes."""
from pathlib import Path
import hashlib,json,datetime
R=Path('.');parts=[];manifest=[]
intro=r'''# Complete proofs and obstructions

This compilation is the mathematical deliverable for TUZA-17. The controlling final statements are: full AC unresolved; all b≤6 settled using Aharoni/HNS; budget7/vc9 additionally settled using declared McKay catalogue completeness; first remaining conditional window b7,m6,lambda=vc(L)=8, with full eligible H realization UNKNOWN. Private ear reductions and the strengthened limitation/nonsaturation results retain their exact scopes. No global availability or independent final verification is claimed.

The chapters reproduce the specified frozen notes or explicitly selected mathematical sections. Original files and critic hashes are preserved. Early phrases such as “first frontier,” “pending review” and weaker small-budget bounds are historical within those notes; they do not override the final statement above. The preferred ear proof is addendum5, not an unqualified extension of the outside-marking identity. The final nonsaturation proof uses the complete elementary matching argument, not the earlier unproved Tutte–Berge alternative. `evidence/proof_compilation_inputs.json` records exactly which bytes/sections were compiled.

## Dependency map and the equality interface

The ordinary branches use actual graph triangles, edge-disjointness, the known criticality package, and elementary matching arguments supplied below. The AC equality branches additionally use Aharoni's tripartite inequality and the Haxell–Narins–Szabó equality theorem at its exact tripartite hypothesis. For H with a rainbow triangle-edge colouring, graph edges are hypervertices and actual triangles are hyperedges of a tripartite3-uniform hypergraph; its matching/cover numbers are exactly nu(H),tau(H). Deleting graph edges preserves this structure.

Here is the complete graph-specific extraction/exhaustion interface, already present in the authenticated TUZA-01/TUZA-03 sources. HNS supplies a home-base partition at equality tau=2nu=2k. Its truncated-Fano pieces each contain a loose3-cycle on six hypervertices. For each central triple R={r1,r2,r3}, choose one saturating matching in each of the three auxiliary bipartite graphs. If wi(R) is the matched W-vertex in part i, the three hyperedges {r2,r3,w1}, {r1,r3,w2}, {r1,r2,w3} form a loose3-cycle. Different central triples have disjoint supports: same-part choices differ by the matching property, different-part choices by the tripartition, and W is disjoint from all central triples and Fano pieces. Together these yield k loose cycles with disjoint hypervertex supports. This is a consequence of the declared HNS definitions/theorem, not a new proof of that deep theorem.

In a graph triangle hypergraph, name two triangles in one loose cycle uvx and uvy. The third shares one edge other than uv with each. Those two shared graph edges must meet, so the third is uxy or vxy; the cross choices ux/vy and vx/uy are disjoint and impossible. Thus the six support edges form an actual K4. Disjoint hypervertex supports give k edge-disjoint K4s, which may share graph vertices. Finally suppose another actual triangle Q is not a face of one of them. Q shares at most one edge with each K4, since sharing two would put its three vertices in that complete block. Choose a face in each block avoiding that possible shared edge and append Q. This gives k+1 disjoint triangles, contradicting nu=k. Therefore ALL actual triangles are precisely block faces; edges outside the blocks are triangle-free. This exhaustion is essential when choosing covers, and no arbitrary tight graph is assigned this structure.

The budget≤6 proof depends on that interface, but not on any Ramsey catalogue. The budget7/vc9 corollary additionally accepts the explicitly inspected primary catalogue's completeness; only its one record was locally independently verified. Every full proof below retains these dependency boundaries.

'''
parts.append(intro)
def add(path,title,selector=None):
 raw=(R/path).read_text();body=selector(raw) if selector else raw
 manifest.append({'path':path,'sha256':hashlib.sha256(raw.encode()).hexdigest(),'selection':'explicit mathematical sections' if selector else 'whole note'})
 parts.append('\n---\n\n# '+title+'\n\nSource: `'+path+'`.\n\n'+body+'\n')
add('notes/A_RESULTS.md','A1. Strengthened colour-deletion obstruction and scoped separator reconstruction')
add('notes/A_ELEMENTARY_MATCHING_BLOCKER.md','A2. Complete ordinary critical nonsaturation proof')
add('notes/A_SLS_PROPOSAL.md','A3. Exact supported-link intermediary tested')
add('notes/A_SLS_RESULT.md','A4. All-minimum-cover refutation of that intermediary')
def select_b(s):
 blocks=s.split('\n## ');keep=[]
 for b in blocks[1:]:
  number=b.split('.',1)[0]
  if number in ['1','2','3','4','5','8','9']:
   if number=='8': b=b.split('**Corollary AC-small-budget.**')[0]
   keep.append('## '+b)
 return '\n\n'.join(keep)
add('notes/B_FROZEN_v1.md','B1. Exact identities, saturated-budget theorem and essential-edge cases',select_b)
add('notes/B_FROZEN_ADDUM_1.md' if (R/'notes/B_FROZEN_ADDUM_1.md').exists() else 'notes/B_FROZEN_ADDENDUM_1.md','B2. Safe matched endpoints and elementary small-budget bound')
add('notes/B_FROZEN_ADDENDUM_2.md','B3. Tight-deletion component transfer with arbitrary outside incidence')
add('notes/B_CORE_LIMITATION.md','B4. Stable slack-one core counterexamples and finite stopping point')
add('notes/B_FROZEN_ADDENDUM_5.md','B5. Preferred complete deterministic ear reductions')
add('notes/BOUNDARY6_FROZEN_LINK_LEMMA.md','B6. Complete small-link classification and critical-edge lemma')
add('notes/CRITIC_BUDGET_SIX.md','B7. Combined budget-six proof and independent mathematical verification')
add('notes/B_FRONTIER_MATCHING_CERTIFICATE.md','B8. General matching certificate and unbounded Petersen limitation')
add('notes/BOUNDARY7_PROBE.md','B9. Budget-seven link shapes and explicit matching certificates')
add('notes/CRITIC_CATALOGUE_SCOPE.md','B10. Exact catalogue-dependent elimination and its audit boundary')
add('notes/B_BOUNDARY_REALIZABILITY.md','B11. Full-instance realizability constraints and remaining unknown')
parts.append('\n---\n\n# Final scope\n\nThese arguments neither construct a full eligible difficult-boundary H,X pair nor prove that such a pair cannot exist. They do not solve full AC or unrestricted Tuza. All finite tests are supplementary to the stated proofs, except explicitly declared complete finite records, whose verification scope is recorded. Historical originality is UNESTABLISHED. New Lean and independently commissioned final verification are NOT_RUN.\n')
(R/'PROOFS_AND_OBSTRUCTIONS.md').write_text(''.join(parts))
(R/'evidence/proof_compilation_inputs.json').write_text(json.dumps({'compiled_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'inputs':manifest},indent=2)+'\n')
print('Compiled',len(manifest),'proof sources;',len(''.join(parts).split()),'words')
