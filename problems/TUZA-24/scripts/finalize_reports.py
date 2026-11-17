#!/usr/bin/env python3
"""Create claim-specific handoff reports only from a passing frozen-source audit."""
from pathlib import Path
import datetime,hashlib,json,sys
w=Path(__file__).resolve().parents[1]
r=Path(sys.argv[1]).resolve()
summary=json.loads((r/'summary.json').read_text());assert summary['status']=='PASS'
freeze=json.loads((w/'operations/accepted_source_freeze.json').read_text())
for m,s in freeze['sources'].items():
 assert hashlib.sha256((w/s['path']).read_bytes()).hexdigest()==s['sha256'],m
assert summary['modules_rebuilt']==freeze['order']
declarations=json.loads((r/'declarations.json').read_text());byname={x['name']:x for x in declarations}
closures=json.loads((r/'target_local_dependency_closures.json').read_text())['targets']
targets=json.loads((w/'operations/audit_targets.json').read_text())
assert set(targets)==set(closures)
rel=r.relative_to(w).as_posix()
source_map={
 'Tuza24.forest_cover_cs':('forest_triangle_cover_cs_v1.md','Full forest-cover CS assembly'),
 'Tuza24.forest_cover_inequality':('challenger_forest_anchored_cover_v1.md','Existential anchor implies inequality'),
 'Tuza24.forest_cover_anchor':('challenger_forest_anchored_cover_v1.md','Selected-cover leaf induction'),
 'Tuza24.pointed_apex_forest':('challenger_forest_anchored_cover_v1.md','Pointed apex-forest lemma'),
 'Tuza24.perfect_apex_link_excluded':('apex_forest_perfect_link_exclusion_v2.md','Complete perfect branch'),
 'Tuza24.nonperfect_apex_link_excluded':('apex_forest_nonperfect_branch_v2.md','Complete nonperfect branch'),
 'Tuza24.minimal_internal_page_augmentation':('apex_forest_nonperfect_branch_v2.md','Section 2 internal triangle form and full footprint'),
 'Tuza24.minimal_safe_external_page_augmentation':('apex_forest_nonperfect_branch_v2.md','Section 2 safe external page form and full footprint')}
entries=[]
conditional={'Tuza24.forest_nonperfect_deficiency_two','Tuza24.forest_safe_allowed_edge','Tuza24.perfect_apex_link_excluded','Tuza24.nonperfect_apex_link_excluded','Tuza24.minimal_internal_page_augmentation','Tuza24.minimal_safe_external_page_augmentation'}
for name in targets:
 d=byname[name]
 default=('forest_triangle_cover_cs_v1.md','Optional equality/K5 refinement') if ('equality' in name or 'five_clique' in name or 'iff_K4' in name) else ('apex_forest_nonperfect_branch_v2.md','Elementary forest matching inputs and nonperfect branch')
 fn,scope=source_map.get(name,default);p=w/'sources/tuza22/notes'/fn
 assert p.is_file(),p
 entries.append({'declaration':name,'status':'KERNEL_CHECKED_CONDITIONAL' if name in conditional else 'KERNEL_CHECKED','status_explanation':'The exact local structural/minimality hypotheses are explicit and are fully discharged in forest_cover_cs.' if name in conditional else 'Exact displayed type independently rebuilt and audited; ordinary structural hypotheses are as stated.','module':d['module'],'formal_source':d['module'].replace('.','/')+'.lean','formal_source_sha256':d['source_sha256'],'exact_type':d['type'],'axioms':d['axioms'],'direct_references':d['direct_references'],'local_closure_declarations':closures[name]['declarations'],'local_closure_modules':closures[name]['modules'],'build_receipt':d['build_receipt'],'ordinary_source':{'copy':p.relative_to(w).as_posix(),'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'scope':scope,'disposition':'Frozen candidate header retained; later TUZA-22 acceptance reviews and independent TUZA-24 reconstruction recorded separately.'}})
ledger={'mission':'TUZA-24','status':'KERNEL_CHECKED','primary_targets':targets[:5],'accepted_source_freeze':'operations/accepted_source_freeze.json','independent_receipt':rel,'all_actual_declarations':rel+'/declarations.json','all_actual_target_closures':rel+'/target_local_dependency_closures.json','ordinary_mathematical_claim_changed':False,'proof_reorganizations':'Minimum-cover exposure certificates; residual edge counts; active deficiency and marking-invariant arguments replace ordered alternating paths without altering claims.','entries':entries}
(w/'THEOREM_LEDGER.json').write_text(json.dumps(ledger,indent=2)+'\n')
peak=summary['max_process_tree_rss_bytes']/1024**2
module_count=len(summary['modules_rebuilt']);new_count=sum(m.startswith('Tuza24.') for m in summary['modules_rebuilt'])
control_count=sum(x['is_theorem'] and x['module'].startswith('Tuza24.Controls') for x in declarations)
axioms=', '.join('`'+a+'`' for a in summary['axioms_used'])
(w/'REPORT.md').write_text(f"""# TUZA-24 final report

The exact full forest-cover CS theorem, standalone inequality, and separately stated existential anchor are **KERNEL_CHECKED**, with a fresh independent source build and actual declaration/axiom audit. The optional K4-only equality refinement is also checked. No ordinary mathematical claim was corrected or weakened.

| Claim | Status | Formal declaration |
|---|---|---|
| Full CS from existence of any actual forest triangle-edge cover | KERNEL_CHECKED | `Tuza24.forest_cover_cs` |
| Standalone `tau(G) ≤ 2 nu(G)` | KERNEL_CHECKED | `Tuza24.forest_cover_inequality` |
| Existential packing/cover anchored to any supplied forest cover | KERNEL_CHECKED | `Tuza24.forest_cover_anchor` |
| Pointed matching/vertex-cover theorem for arbitrary apex forests | KERNEL_CHECKED | `Tuza24.pointed_apex_forest` |
| K5 exclusion and literal K4-only equality inside the forest-cover class | KERNEL_CHECKED | `forestCover_no_five_clique`, `forest_cover_equality_k4` |

For arbitrary finite simple G, the selected cover may be empty, disconnected, nonminimum, or contain extraneous actual edges. The ambient graph may be cyclic or dense and may contain isolated vertices. Full CS asserts both the inequality and equality iff the unchanged general B predicate of literal K4/K5 actual triangle-component support. The optional refinement explicitly excludes K5 and uses a separate literal-K4 predicate; it does not change B.

The anchor returns SOME actual edge-disjoint triangle packing I and SOME actual triangle-edge cover D such that `C ∩ support I ⊆ D` and `|D| ≤ 2|I|`. It does not quantify over prescribed or maximum packings, and D need not be contained in C. The standalone inequality is proved through this independent anchor construction; full CS uses the hereditary-class minimum-failure argument and both completed apex-forest exclusions.

## Proof and review

The final theorem has no size, sparsity, degree, minimum-cover, WKE-availability, unproved matching, or unproved footprint premise. Perfectness and deficiency count the explicit active neighborhood minus the apex. Complete internal/external augmentation footprints are established for the UNION of all new triangle edges in EACH residual clique, including outside pages on deleted rim edges. Proper-subgraph CS is obtained through proved forest-cover heredity, not assumed globally.

The mathematical route follows the accepted TUZA-22 sources and authenticated TUZA-23 foundation. Several proofs were reorganized: minimum-cover certificates replace alternating-path bookkeeping, residual counts replace ordered perfect-forest paths, and exposure/marking invariants simplify deficiency and safe-edge selection. The separate reviewer accepted those changes as scope-preserving. No claim of historical originality is made.

## Verification evidence

Independent receipt: `{rel}`. The reviewer rebuilt {module_count} local modules, including {new_count} TUZA-24 modules, from a frozen copied source closure in a fresh output tree. It audited {summary['audited_constants']} actual constants, including {summary['audited_theorems']} theorem declarations and private/generated helpers. Collected axioms were exactly {axioms}. Source scans and actual audits found no admission, project-defined unproved axiom, unsafe declaration or native proof trust escape. All {control_count} TUZA-24 theorem controls passed; representative controls cover empty/triangle-free graphs, nonminimum covers, cyclic ambient graphs, shared-vertex packing/equality components, rejected invalid inputs, and matching isolates/perfect/nonperfect boundaries.

The clean run completed in {summary['elapsed_seconds']:.1f} seconds; maximum sampled compiler-process-tree RSS was {peak:.1f} MiB under the 2200 MiB limit. All compilation was serialized on the owner's Mac with explicit per-command deadlines. `THEOREM_LEDGER.json` records actual full types, source hashes, references and per-target closures; `INDEPENDENT_REVIEW.md` gives the independent semantic acceptance.

## Limits and handoff

There is no remaining forest theorem proof gap or pending accepted-target verification. Existing pinned native Lean, mathlib and dependency objects remain the disclosed trust boundary; the clean rebuild is of local project sources, not a cold compiler/mathlib rebuild or a second kernel implementation. The theorem supplies no forest cover for arbitrary graphs and therefore does not settle unrestricted Tuza or unrestricted equality classification.

Reusable results include the pointed apex-forest theorem, the separate existential anchor, matching/exposure/original-leaf selection lemmas and complete-footprint augmentation interfaces. See `RESEARCH_REUSE.md`, `DEPENDENCIES.md` and `REPRODUCTION.md`. Frozen source originals were preserved; the repository has zero remotes. The actual final private commit/tree are recorded in the external checkpoint receipt referenced by `FINAL_RECEIPT.md`.
""")
(w/'AXIOM_AUDIT.md').write_text(f"""# Independent axiom and source audit

**PASS.** Frozen sources were independently copied and rebuilt by the separate reviewer, with one monitored compiler tree at a time. Receipt: `{rel}`.

- {module_count} accepted local modules; {summary['audited_constants']} actual constants; {summary['audited_theorems']} theorem declarations, including private/generated helpers.
- Collected axioms: {axioms}; no others.
- No accepted local axiom declaration, unsafe declaration, `sorryAx`, admitted proof, `native_decide` or native trust extension.
- Source hashes before and after the run match the frozen manifest. All selected package revisions match their pinned manifest values.
- Maximum sampled process-tree RSS: {peak:.1f} MiB; serial `-j1 -M2200`; 240-second external per-module timeout.

`declarations.json` contains actual full declaration types, direct references, collected axioms and individual build receipts. `target_local_dependency_closures.json` traverses actual type/proof references among local declarations for every named audit target. The semantic reviewer separately checked explicit hypotheses and discharged their use in full CS; an acceptable axiom list alone is not a scope proof.

The standard axioms above are reported, not hidden. Existing installed native compiler and pinned dependency objects remain trusted inputs; no cold compiler/mathlib rebuild or independent kernel implementation is claimed. Copied provenance modules outside `operations/accepted_build_order.json` are not represented as accepted TUZA-24 theorem claims.
""")
(w/'operations/final_evidence_index.json').write_text(json.dumps({'independent_run':rel,'summary':rel+'/summary.json','declarations':rel+'/declarations.json','target_closures':rel+'/target_local_dependency_closures.json','source_scan':rel+'/source_scan.json','source_freeze':'operations/accepted_source_freeze.json','accepted_build_order':'operations/accepted_build_order.json','dependency_pins':'operations/dependency_pins.json','semantic_reviews':['review/initial_semantic_reconstruction.md','review/interim_anchor_semantic_review.md','review/interim_augmentation_semantic_review.md','review/full_route_semantic_review.md','INDEPENDENT_REVIEW.md']},indent=2)+'\n')
print(json.dumps({'reports_written':True,'modules':module_count,'constants':summary['audited_constants'],'controls':control_count,'peak_mib':peak,'independent_receipt':rel}))
