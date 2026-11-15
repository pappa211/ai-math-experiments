# Independent primary-source audit: CKSU v2 Proposition 13

**Verdict.** The printed Proposition 13 in arXiv:2001.00257v2 is false under its stated assumptions. The supplied K5 configuration is an exact counterexample. The corresponding order-three charging procedure in Section 3 also leaves four triangles uncovered on this input. This does not refute the paper's existential main theorem. Item 18 in this version is **Lemma 18**, whose singleton-private-page hypothesis excludes the witness; its asserted uniqueness follows directly from its definition and is not refuted here.

This is an independent AI source and literal-witness audit. I was given the K5 witness but did not read the producing agent's findings or code before reconstructing it. I had previously inspected other parts of the paper for the fractional-route audit. This is not fresh-context review, Lean verification, author confirmation, human review, an erratum, or publication.

## Source identity and scope

The primary file was downloaded directly from [arXiv v2](https://arxiv.org/pdf/2001.00257v2) into `evidence/cksu_source_audit/2001.00257v2.pdf`. It has 69 pages, 726301 bytes, and SHA-256

    1ec683cf6d609daf53ee967d9f53a93a87c17286ae20a46191070c7ca5688897

The [arXiv record](https://arxiv.org/abs/2001.00257) identifies v2 as the revision of 3 February 2021 and lists no later version at the time checked. This audit concerns those exact bytes, not an uninspected proceedings edition or possible unpublished correction.

I read Section 2.1, the Section 2.2 charging setup, Section 3 through its closing analysis, and Definition 17/Lemma 18. Relevant printed and PDF page numbers agree: setup 6-8; Proposition 13 on 11; order-three assignments on 12; their analysis on 13-14; lending definition on 16-17; Lemma 18 on 17. Full-page renders of pages 6,7,11,12,16,17 were visually inspected. Text extraction initially warned about a missing optional font parser; the rendered pages corroborate the decisive symbols and wording. No dependency was installed.

The setup takes all actual graph triangles and a maximum edge-disjoint packing. Attachment counts refer to how many packed triangles share an edge with a nonpacked triangle. A packed member's type counts its edges supporting singly attached pages. No packing tie-break, K5 exclusion, or preprocessing assumption was found in the relevant setup.

In Proposition 13, a residual type-[1,1] triangle must, after possibly exchanging the packed labels, either contain a base, have a neighboring packed member with exactly one private page and its anchor inside the residual triangle, or have both neighboring members carry exactly one private page in the stated common-anchor configuration. The K5 witness meets none of these alternatives.

## Exact elementary counterexample

Use G=K5 on vertices {v,a,b,c,d}, with packing

    P={vab, vcd}.

The triangles are all ten three-element subsets. The packed triangles are edge-disjoint. Their packing is maximum: a three-packing would use nine of the ten graph edges. Removing a triangle union preserves degree parity, whereas the leftover single edge would have two odd-degree endpoints; K5 has even degree at every vertex. Hence nu(K5)=2.

The support is

    B={va,vb,ab,vc,vd,cd}.

Relative to this support, the private pages and bases are:

| Packed triangle | Singly attached pages | Unique base |
|---|---|---|
| vab | abc, abd | ab |
| vcd | acd, bcd | cd |

The four other nonpacked triangles are vac,vad,vbc,vbd, each doubly attached and of type-[1,1]. There are no hollow triangles. In particular t=vac intersects the packed members on va and vc, and contains neither base. Both private-page counts are two, so the singleton conditions in Proposition 13's second and third alternatives are false. Renaming the two packed members changes nothing.

This is a counterexample to the proposition's literal statement, not merely an absent line in its proof. Every maximum packing in K5 consists of two triangles with exactly one common vertex and therefore has the same configuration up to relabeling. The independent checker finds all fifteen maximum packings and sixty corresponding residual failures. The single displayed configuration already proves the defect; the full K5 enumeration confirms that choosing another maximum packing in K5 does not repair it.

## Exact failure of the augmentation step

For t=vac, the page abc meets t on ac, and the page acd also meets t on ac. Thus the only possible private page on ab avoiding t is abd, and the only possible private page on cd avoiding t is bcd. They share edge bd. Their anchors d and b are different, but those anchors lie reciprocally on the other page's base. Distinct anchors therefore do not imply edge-disjoint private pages.

Consequently {vac,abd,bcd} is not a packing. The first augmentation step in the printed proof does not produce the claimed third triangle. Its hypotheses allow exactly this case of disjoint bases and reciprocal anchors. The statement/proof needs an amended case or a materially narrower hypothesis; this audit does not propose or certify a complete replacement classification.

A separate visible self-comparison of an anchor with itself occurs later in the printed proof. Correcting that typographical expression would not remove the K5 counterexample to the earlier augmentation step.

## Direct consequence for the printed Section 3 procedure

In this input there are no type-zero or type-three packed members, and there are no type-one packed members with a singleton private page. The procedure therefore terminates with weight one on ab and cd, weight one-third on va,vb,vc,vd, and zero on ac,ad,bc,bd. Its total is ten-thirds, but each of vac,vad,vbc,vbd has load only two-thirds. The subsequent singleton-page processing is empty, so no unspecified processing order fixes this input.

This is a failure of the displayed charging procedure as written. It is not a counterexample to the existence of a third-integral cover within budget: assigning one-third to every K5 edge gives every triangle load one, with the same total ten-thirds, at most 2nu=4. An ordinary four-edge cover also exists. Accordingly, the main existential result is neither refuted nor independently repaired by this audit. Dependencies elsewhere in the long proof that invoke Proposition 13 need separate scrutiny if they are to be imported; the entire paper was not audited.

## Why Lemma 18 is different

Definition 17 requires the lending type-one triangle to have exactly one singly attached page. Our two packed triangles each have two, so the K5 lend relation is empty. Lemma 18 is thus vacuously satisfied in the witness.

Its uniqueness also admits a short direct reconstruction. Let the lending triangle be vbc, with base bc, and let its unique private page be abc. In the K4 on {v,a,b,c}, the two remaining faces are vab and vac. The private edges ab and ac occur in no packed member. Therefore, for these two remaining faces to be doubly attached to one other packed triangle, their common edge va must belong to that triangle. A packing has only one member containing a given edge. Thus the possible recipient is unique. This argument uses the singleton private-page assumption and the actual K4 faces; it does not need Proposition 13.

No correction to Lemma 18 is established or indicated by this witness. There is no proposition numbered 18 in the inspected v2; conclusions about a differently numbered edition would require that edition's exact text.

## Evidence, independence, and operational limits

`checks/cksu_prop13_independent.py` uses only the standard library and the literal K5 graph. It imports no producer code. Its receipt `evidence/cksu_source_audit/k5_independent_check.json` retains every edge, actual triangle, maximum packing, private-page classification, attempted three-packing intersection, proposition failure, charging weight, and triangle load. Its finite conclusions agree with the ordinary argument above. No Lean process ran.

`evidence/cksu_source_audit/source_receipt.json` records the PDF hash, download metadata, selected pages and local artifact hashes. PNG page renders and extracted text are retained in the same directory. The check ran on the authorized Darwin host under pinned Python, within the original TUZA-19 clock. Requested model/effort was gpt-6-astra/ultra; no separate serving metadata is asserted. No archive was mutated, author contacted, message sent outside the research team, or publication performed.
