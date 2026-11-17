from challenger_cone_modifications import *
masks=[x for x in range(32) if x.bit_count()%2==0];ix={v:i for i,v in enumerate(masks)}
L={tuple(sorted((ix[a],ix[b]))) for a,b in combinations(masks,2) if (a^b).bit_count()==4}
N=[ix[v] for v in masks if v.bit_count()==4];x=ix[0]
cases=[('star_K4',L|set(combinations(sorted([x]+N[:3]),2))),('independent_K4',L|set(combinations(sorted(N[:4]),2))),('independent_K5',L|set(combinations(sorted(N),2)))]
# Different three-added-edge geometry: three-neighbor triangle versus path-like completion.
rows=[]
for name,E in cases:
 t=time.monotonic()
 try:r=solve(E,seconds=60,qcap=96)
 except TimeoutError:r={'status':'UNKNOWN_TIMEOUT'}
 r.update(name=name,edges=sorted(E|{(v,16) for v in range(16)}),seconds=time.monotonic()-t);rows.append(r)
 (ROOT/'evidence/challenger_k4_rim.json').write_text(json.dumps({'mechanism':'K4/K5 base obstruction over Clebsch rim; exact changed optima','rows':rows},indent=2)+'\n')
 print(name,r['status'],r.get('tau'),r.get('private_optima'),r.get('private_deficient_states'),r.get('q_checked'),flush=True)
 if r['status']=='COUNTEREXAMPLE_D_ALL':break
