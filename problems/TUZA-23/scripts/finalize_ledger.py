from pathlib import Path
import json,hashlib
w=Path(__file__).resolve().parent.parent
vr=Path('verification/independent-20261116T092129409939Z');v=w/vr
a=json.loads((v/'declarations.json').read_text());by={x['name']:x for x in a}
source=w/'sources/tuza22/notes/r2_proof_v1.md';m0=w/'sources/tuza22/notes/restoration.md'
def src(p):return {'path':str(p.relative_to(w)),'sha256':hashlib.sha256(p.read_bytes()).hexdigest()}
specs=[
('maximum_packing','Tuza.exists_max_packing','Any finite triangle family; maximum is attained'),
('actual_minimum_cover','Tuza.graph_min_cover','Any finite simple graph; minimum attained by actual graph edges'),
('cover_optimum_bridge','Tuza23.tau_le_iff_graph_cover','Any finite simple graph and natural threshold; actual-edge cover formulation'),
('component_equivalence','Tuza06.componentCliques_iff_decomposition','Actual shared-edge components iff exhaustive edge-disjoint literal K4/K5 decomposition'),
('packing_additivity','Tuza06.nu_union_eq','Finite triangle families with disjoint edge supports'),
('cover_additivity','Tuza06.tau_union_eq','Finite triangle families with disjoint edge supports'),
('component_graph_realization','Tuza23.triangles_supportGraph','Actual triangle family closed under shared-edge adjacency'),
('K4_parameters','Tuza06.k4_parameters','Arbitrary labelled vertex set of cardinality four'),
('K5_parameters','Tuza06.k5_parameters','Arbitrary labelled vertex set of cardinality five'),
('clique_prescribed_cover','Tuza23.clique_min_cover_containing','Literal K4/K5 and one prescribed edge'),
('clique_edge_avoidance','Tuza23.clique_max_packing_avoiding','Actual K4/K5 clique and one prescribed edge'),
('B_implies_equality','Tuza06.componentCliques_equality','Actual component B property'),
('one_edge_insertion','Tuza23.one_edge_insertion','B(H), actual old nonedge, and existence of a new triangle'),
('whole_page_footprint','Tuza23.whole_page_footprint','Exhaustive old clique decomposition, distinct nonadjacent endpoints; ALL ordinary page spokes'),
('simultaneous_minimum_cover','Tuza23.blocks_min_cover_footprint','Exhaustive old clique decomposition; entire prescribed footprint has at most one edge per component'),
('simultaneous_maximum_packing','Tuza23.blocks_max_packing_footprint','Same footprint condition; maximum old packing avoids the prescribed family'),
('nonbare_page_cover','Tuza23.min_cover_all_nonbare_pages','B(H), distinct nonadjacent endpoints; all actual single-insertion triangles'),
('tight_increment','Tuza23.tight_two_insertion_increment','Exact R2 hypotheses and at least one new triangle'),
('bare_page_availability','Tuza23.tight_pair_bare_page','B(H), one named old nonedge, and exact two-edge cover increment'),
('cross_page_intersection','Tuza23.page_intersects_bare','Old B, actual containing graph, exact packing increment, one nonedge-containing triangle and one bare triangle'),
('adjacent_case','Tuza23.adjacent_tight_impossible','Two distinct adjacent old nonedges and the forced exact increments'),
('disjoint_case','Tuza23.disjoint_tight_restoration','Two disjoint old nonedges and the forced exact increments'),
('R2','Tuza23.r2','ONLY: finite simple H; F at most two distinct old nonedges; B(H); tau(H+F)=2nu(H+F)'),
('M0','Tuza23.minimal_cs_package','MinimalCS: G fails unrestricted CS, every strict same-vertex edge-subgraph satisfies CS'),
('minimum_failure_exists','Tuza23.exists_minimal_cs','An explicit CS failure on a fixed finite vertex type'),
('hereditary_minimum_failure','Tuza23.exists_minimal_cs_in_class','An explicit failure in a stated edge-subgraph-hereditary class on the same finite vertex type'),
('exact_R2_type_guard','Tuza23.Controls.exact_r2_type','The exact required exported type, including old B'),
]
targets=[]
for key,name,hyps in specs:
 x=by[name];conditional=key in ['M0','minimum_failure_exists','hereditary_minimum_failure']
 local=w/(x['module'].replace('.','/')+'.lean')
 origin=src(m0 if conditional or key=='component_graph_realization' else source)
 if not x['module'].startswith('Tuza23'):
  origin={'public_commit':'4b72b6d5b4f71fcefa3f0314483bf58ce809d7b4','path':'problems/TUZA-06/lean/'+x['module'].replace('.','/')+'.lean','sha256':x['source_sha256']}
 targets.append({'target':key,'declaration':name,'status':'KERNEL_CHECKED_CONDITIONAL' if conditional else 'KERNEL_CHECKED','ordinary_or_prior_formal_source':origin,'formal_source':str(local.relative_to(w)),'formal_source_sha256':x['source_sha256'],'exact_type':x['type'],'explicit_hypotheses':hyps,'transitive_project_axioms':[],'standard_axioms':x['axioms'],'unproved_mathematical_inputs':'Proper-subgraph CS / existence of a failure is explicit in the conditional statement; not a universal CS proof' if conditional else 'None beyond stated hypotheses','verification_receipt':str(vr/'summary.json'),'declaration_audit':str(vr/'declarations.json'),'module_build_receipt':x['build_receipt']})
targets += [{'target':'forest_cover_CS','status':'ORDINARY_ONLY','formal_declaration':None,'exact_statement':'For every finite simple G, existence of ANY actual-edge triangle cover C with selectedGraph(C).IsAcyclic implies CS(G).','plan':'FOREST_FORMALIZATION_PLAN.md','unformalized_obligations':'Forest matching/alternating-reach interface; anchored construction; complete perfect/nonperfect apex-forest footprint exclusions; assembly','ordinary_source':src(w/'sources/tuza22/notes/forest_triangle_cover_cs_v1.md')},{'target':'unrestricted_Tuza_and_universal_CS','status':'INCOMPLETE','meaning':'OPEN. Not proved or refuted by this mission; no universal blocker is assumed in R2.'}]
(w/'THEOREM_LEDGER.json').write_text(json.dumps({'status':'FINAL_ACCEPTED','verification':str(vr/'summary.json'),'all_actual_local_constants_audit':str(vr/'declarations.json'),'source_semantic_reviews':['review/specification_v1_review.md','review/foundation_semantic_review.md','review/accounting_m0_semantic_review.md','review/r2_final_semantic_review.md'],'targets':targets},indent=2,ensure_ascii=False)+'\n')
(w/'operations/accepted_build_order.json').write_text(json.dumps(json.loads((v/'summary.json').read_text())['modules_rebuilt'],indent=2)+'\n')
print('ledger targets',len(targets))
