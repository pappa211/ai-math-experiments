# CKSU Proposition 13: narrow dependency audit of the half-integral argument

Verdict: the missing exceptional K5-pair case does **not** invalidate the inspected Section 4/appendix uses of Proposition 13. After adding the independently accepted fourth classification case, the later uses either have a singleton owner already, or concern triangles whose packed-edge coverage never changes. An explicit preservation paragraph would make this dependency clear. This conclusion does not verify the whole half-integral theorem or its other structural lemmas.

## Frozen inputs and reading scope

Primary source: Chalermsook, Khuller, Sukprasert and Uniyal, *Multi-Transversals for Triangles and the Tuza's Conjecture*, arXiv:2001.00257v2, revised 3 February 2021, https://arxiv.org/pdf/2001.00257v2 . The preserved 69-page PDF has SHA256 `1ec683cf6d609daf53ee967d9f53a93a87c17286ae20a46191070c7ca5688897`.

The corrected classification used as input is `notes/root_cksu_order3_repair.md`, SHA256 `a0a8b8a2c8cdf3e0c028661bef9ce51c7586b13ffaed695ea99aa02ffe2c7ab9`; its accepted independent reconstruction is `review/cksu_order3_repair_fresh_audit.md`, SHA256 `be98f11d9368f1355440d2ab23ebd67283621c8d2435a698a63e03fbde32e407`. I did not re-audit that entire construction here.

I searched every occurrence of the token 13 from page 14 onward in the preserved full text, and independently in a fresh PyMuPDF extraction. The two citations at the top of page 14 belong to Section 3, before Section 4 starts, and are outside this audit. Other occurrences denote Observation 13, figures, edge subscripts, fractions, or the set A13. There are three later citation locations, containing four direct Proposition 13 references: page 20; twice on page 44; and page 59. The relevant definitions, charging rules and neighboring arguments were read. Pages 20, 39, 44 and 59 were also visually checked.

Line numbers below refer to `evidence/cksu_source_audit/extracted_text.txt`, SHA256 `1d1833bf8bdf36bd2bd618ace09c33040e1db79f89c5a8d281315faf4453deda`. Printed and one-based PDF page numbers coincide. The selected numbered lines, both independent search inventories, renders and source receipt are in `evidence/cksu_half_prop13_dependency/`.

## The exceptional pair retains a permanent cover certificate

Use the accepted fourth case: packed owners p=vab and q=vcd have bases ab and cd, and their full private tip sets are exactly {c,d} and {a,b}. The four remaining K5 edges ac,ad,bc,bd are outside the entire packed support B. Both owners have two private pages, so neither is a singleton.

The Section 4.1 rule assigns weight one to each base and one-half to each nonbase packed edge (page 14, lines 655–657). Thus the four residual triangles vac,vad,vbc,vbd each receive one-half from each of their two packed edges. The four private pages are covered by a full base, and the two packed triangles have total weight two. This certifies every actual triangle inside the K5 without using any cross-edge credit.

The singleton restriction is explicit in Definition 17, pages 16–17, lines 746–756: the first member of a lend relation has exactly one singly attached triangle. Every positive-index chain member is such a lender. The original construction on page 18 and the detailed Satisfy-and-Truncate construction on page 39 both start with a type3 head and then add only type1 lenders to the preceding member. In the detailed algorithm, the starting condition is at lines 2094–2098 and the growing condition at 2106–2111. Consequently neither exceptional owner can occur anywhere in a chain. It cannot be a head because its type is one, and cannot be any later member because it has two private pages.

The fact that exceptional owners are absent from chains also protects their packed edges against changes made to overlapping structures. Here is the support argument, rather than an assumption that distinct private K4s are vertex-disjoint:

- A type3 private K4 contains only its own three packed edges; its other three edges are outside all of B.
- A singleton lender's K4 contains its own three packed edges, its private page's two nonbase edges outside B, and the remaining diagonal, which is precisely the gain edge in the preceding packed chain member. Thus every packed edge in an operated chain K4 belongs to a member of that chain.
- The chain credit changes, satisfaction and truncation rules affect these chain supports or type3 supports. They therefore cannot decrease a packed edge of either exceptional owner. This also agrees with the explicit credit-loss statement in Observation 4, page 20, lines 934–936.
- Definition 44's flexible-credit supports are the K4s of unsatisfied chain tails and non-head type3 owners (page 43, lines 2286–2294). They contain no exceptional packed edge by the same support argument. Thus those exceptional edges are unchanged even in the analytical fixed-credit function f_fix; Fact 10.2 on page 44, line 2300, explicitly records this for non-tail type1 owners.
- In the final phase, the type1 members of A are chain tails (page 21, lines 1008–1010), refined to unsatisfied tails in the appendix (page 59, lines 3068–3071). The only pin operations are on those type1 members or type3 members; their K4 supports are as above (page 26, lines 1243–1253). Type0 discharge operations only add credit (lines 1241–1242).

Therefore the two packed half-edges in each exceptional residual remain present throughout the displayed charging operations and in f_fix. Cross edges may overlap other structures or have their credits changed; the certificate does not use them. The same conclusion applies when several exceptional pairs overlap in vertices or in nonpacked cross edges.

## Exact later references and their conditions

| Source location | Relevant condition | Effect of the added fourth case |
|---|---|---|
| Section 4.2, page 20, lines 951–956; collective citation at line 953 | The potentially-uncovered type[1,1] class has a null nonbase edge of a chain tail. | Such a tail is a singleton. An exceptional pair has no chain owner and retains its two-half-edge certificate, so it does not enter the potentially-uncovered class. |
| Claim 45, page 44, lines 2314–2327; Proposition 13.2 at line 2325 | The proof assumes t is uncovered by f_fix and chooses one owner to be an unsatisfied chain tail. In this branch t uses nonbase edges of both owners. | Case 1 is absent because neither edge is a base; case 4 is absent because the tail has one private page. The valid singleton case 2 can therefore be used exactly as written. Its private tip in t yields the corresponding lend relation. |
| Claim 45, page 44, line 2340; Proposition 13.3 | Same tail and nonbase conditions; the preceding case 2 branch has been excluded. | The amended classification still leaves case 3 as the only possibility. No exceptional-pair branch remains. This audit does not verify the subsequent several-page alternate-packing contradiction. |
| Claim 49, pages 58–59, lines 2988–2992 and 3031–3041; Proposition 13.2 at line 3039 | The type1 owner has a half base and has already been placed in a chain. The argument produces an additional private page with a different anchor. | A chain member is already a singleton by Definition 17 and the construction. That alone gives the needed contradiction. The printed reference to Proposition 13.2 is imprecise/redundant; it can be replaced by the chain-membership singleton property. The K5 exception cannot arise. |

The page 59 use is not a new unrestricted application of the defective type[1,1] classification. Its ambient triangle has type[1,3,3], and the only imported fact at that line is uniqueness of the private anchor of its chain member.

## Dependency conclusion and limits

A sufficient local correction to this dependency is: append the fourth case to Proposition 13, then note at the start of the half-integral analysis that its exceptional owners never join a chain and their packed-edge credits stay at least their initial values. Their four residual triangles are therefore permanently covered. At Claim 49, cite the chain-definition singleton property directly. No new charge assignment is needed for these K5 pairs in Section 4, in contrast with the order-three construction.

This settles only the propagation of the identified Proposition 13 defect through the inspected later citations and through the preservation of the omitted case. It does not establish the correctness of Proposition 15, the alternate-packing and chain lemmas, Claims 45–49 in full, Lemma 21, the final algorithm, another publication version, or the 69-page half-integral theorem. It supplies no integral rounding bridge and no new bound. The original globally quantified Proposition 13 still requires correction; this audit does not rehabilitate its printed proof.

Verification level: ordinary source-based AI dependency review, with independent text-search inventories and visual page checks; no mathematical solver, formal verification, author confirmation, remote computation, contact or publication. All local work used the authorized Darwin workspace and original mission clock. Requested reviewer controls were Astra/Ultra; precise serving metadata was not exposed.
