from apex_exact import *
import json,time
SRC='problems/TUZA-25/evidence/residual_edge_exchange_seeds.json'
start=time.time();rows=[]
for seed in json.load(open(SRC)):
 E=set(map(tuple,seed['edges']));X=Solver(E);t=X.tau();elig=[];inel=[]
 for f in X.E:
  q=X.tau([f]);assert q in (t,t-1)
  (elig if q==t-1 else inel).append(f)
 name=seed['name']
 if name=='central_K4_star_4':expected=E-{(0,1),(2,3),(4,5)}
 elif name=='central_K4_star_5':expected={(0,2),(0,3),(1,2),(1,3)}
 elif name in ['central_K4_star_44','central_K4_star_45','central_K4_star_55']:expected={(0,3)}
 else:expected=set()
 assert set(inel)==expected,(name,inel,expected)
 U=set(X.universal());assert all(set(f)&U for f in inel)
 pairs=[]
 for f,g in combinations(inel,2):
  V=set(f)|set(g);third=(clique(V)&E)-{f,g}
  if third:pairs.append({'edges':[f,g],'type':'third_old_edge','extra_edges':sorted(third)});continue
  common=set(f)&set(g);assert len(common)==1
  a=next(iter(common));u=next(iter(set(f)-{a}));v=next(iter(set(g)-{a}))
  bs=[b for b in U-{a,u,v} if all(edge(b,z) in E for z in [a,u,v])]
  assert bs and edge(u,v) not in E and name=='central_K4_star_4'
  pairs.append({'edges':[f,g],'type':'crossing_diamond','second_universal':bs[0]})
 rows.append({'name':name,'tau':t,'eligible_edges':elig,'ineligible_edges':inel,'universal_vertices':sorted(U),'pair_geometry':pairs})
 X.pack.cache_clear();X.cover.cache_clear()
# Exact local cover/packing response properties for literal cliques.
cliques=[]
for n in [4,5]:
 E=clique(range(n));X=Solver(E);r=X.nu();t=X.tau()
 for k in [0,1,2]:
  for F in combinations(sorted(E),k):
   adjacent=k<2 or bool(set(F[0])&set(F[1]))
   if n==4 and not adjacent:continue
   assert X.nu(F)==r
   if n==5:
    # Find an actual minimum D cover containing all F.
    C=next((C for C in combinations(sorted(E),t) if set(F)<=set(C) and all(set(C)&T for T in X.F)),None)
    assert C is not None
   cliques.append({'n':n,'boundary':F,'nu_after_deletion':X.nu(F)})
print(json.dumps({'status':'VERIFIED_FINITE','scope':'All12 C12 eligibility sets and all ineligible-edge-pair geometries, plus all allowed<=2-edge K4/K5 avoidance/minimum-cover controls. Independent exact recurrence.','source':SRC,'models':rows,'clique_controls':cliques,'seconds':time.time()-start},indent=2))
