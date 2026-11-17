#!/usr/bin/env python3
"""Independent literal reconstruction and exact certificate for C02 refutation."""
from verifier_candidate02 import *
import signal

def main():
 start=time.time();signal.alarm(90)
 blocks=[(0,1,2,4,5),(0,1,3,6),(1,6,7,8),(1,8,9,10),(1,3,10,11)]
 E=set().union(*(set(combinations(b,2)) for b in blocks))
 P=((0,1,3),(1,2,4),(0,2,5),(1,6,7),(1,8,9),(1,10,11))
 d=finite(12,E,P,'C02-saturated-private-pair-four-lending')
 EE,T=reconstruct(12,E);B,A,priv,K=allowed(12,EE,T,P)
 assert len(E)==29 and len(T)==26 and d['nu']==6 and A==B
 actual_blocks=[]
 for t in T:
  own=[i for i,b in enumerate(blocks) if set(t)<=set(b)]
  assert len(own)==1;actual_blocks.append({'triangle':t,'unique_block':own[0]})
 assert sum(len(b)==5 for b in blocks)==1 and sum(len(b)==4 for b in blocks)==4
 # K5 has no3-packing by parity; each K4 has at most1. Unique triangle ownership bounds nu by6.
 r=c02(12,EE,T,P);assert not r['feasible'] and r['constrained_cost']==13
 R=set(map(tuple,r['bases']));F=set(map(tuple,r['F']))
 assert len(R)==len(F)==6 and not R&F
 missed=[t for t in T if not faces(t)&(R|F)];assert missed==[(0,1,2)]
 fixed=R|F|{(0,1)};assert all(faces(t)&fixed for t in T)
 # Six disjoint residual pair clauses certify c(P)>=12 after six forced bases.
 pair_triangles=((0,1,6),(1,7,8),(1,9,10),(1,3,11),(0,2,4),(1,2,5))
 pair_clauses=[(faces(t)&B)-R for t in pair_triangles]
 assert all(len(c)==2 for c in pair_clauses)
 assert len(set().union(*pair_clauses))==12
 optC=R|{(0,2),(1,3),(1,6),(1,8),(1,10),(2,5)}
 assert len(optC)==12 and optC<=B and all(optC&faces(t) for t in T)
 assert d['restricted_cost']==12
 # Unrestricted optimum, by exact recursion and explicit10-edge witness.
 tau,C=exact_cover(T,EE);assert tau==10
 H=set().union(*(set(combinations(b,2)) for b in blocks[1:]))
 _,HT=reconstruct(12,H)
 hcost,HC=exact_cover(HT,frozenset(H));assert hcost==6
 hfixed=1+exact_cover(tuple(t for t in HT if (0,1) not in faces(t)),frozenset(H-{(0,1)}))[0]
 assert hfixed==7
 shared={(1,3),(1,6),(1,8),(1,10)}
 records=[]
 for k in range(5):
  for chosen in combinations(sorted(shared),k):
   ss=set(chosen);adj=sum(len(ss&set(combinations(b,2)))==2 for b in blocks[1:])
   lb=8+adj-k
   records.append({'selected_shared_spokes':chosen,'blocks_with_both':adj,'cover_lower_bound':lb})
   assert lb>=6
   if lb==6:
    assert k==2
    # Every block has exactly one selected shared spoke; a2-edge K4cover must use its opposite edge.
    b0=set(blocks[1]);e=next(iter(ss&set(combinations(blocks[1],2))));opp=tuple(sorted(b0-set(e)))
    assert opp!=(0,1)
 d.update({'candidate02':r,'candidate02_missed_triangles':missed,'forced_gain_optimum_cover':sorted(fixed),'original_optimum_explicit_cover':sorted(optC),'original_lower_bound_disjoint_residual_pairs':[{'triangle':t,'clause':sorted(c)} for t,c in zip(pair_triangles,pair_clauses)],'blocks':blocks,'unique_triangle_block_ownership':actual_blocks,'unrestricted_tau':tau,'unrestricted_optimum_cover':sorted(C),'H_cover_number':hcost,'H_cover_number_forcing_01':hfixed,'H_shared_spoke_counting_cases':records,'ordinary_certificate_notes':['Triangle ownership unique among one K5 and four K4 blocks; packing upper bound2+4=6.','Six private bases forced; six disjoint residual pair clauses need six additional support edges.','All six distinct nonbase gains plus bases miss exactly012; adding01 proves forcedgain optimum13.','H=union four K4blocks in cycle has sharedspokes13,16,18,1-10. Withr selected andt adjacent selected pairs, anyHcover has size at least8+t-r; equality6 requires two opposite sharedspokes and their four opposite edges, excluding01.','Thus anyfull cover omitting01 costs>=4+6=10; including01 costs>=4+7-1=10. Exact10cover provided.']})
 producer=json.load(open(ROOT/'data/saturated_private_pair_four_probe.json'))
 assert E==set(map(tuple,producer['edges'])) and T==tuple(map(tuple,producer['triangles']))
 d['producer_literal_graph_agreement']=True
 (ROOT/'data/verifier_candidate02_counterexample.json').write_text(json.dumps(d,indent=2)+'\n')
 signal.alarm(0)
 receipt={'started_utc':datetime.datetime.fromtimestamp(start,datetime.timezone.utc).isoformat(),'elapsed_seconds':time.time()-start,'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'n':12,'edges':len(E),'triangles':len(T),'nu':d['nu'],'all_maximum_packings':d['maximum_packings_count'],'c_P':d['restricted_cost'],'constrained_cost':r['constrained_cost'],'tau':tau,'ordinary_maximum_certificate':'one K5 plus four K4 blocks; unique triangle ownership','all_size_claim':False}
 (ROOT/'receipts/verifier_candidate02_counterexample.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt))
if __name__=='__main__':main()
