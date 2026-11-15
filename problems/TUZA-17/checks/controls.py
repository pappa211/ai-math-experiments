"""Independent coordinator controls; all triangles reconstructed from actual edges."""
import sys,json,time,signal,resource
from pathlib import Path
from itertools import combinations
from exact_core import Graph,rainbow_coloring,vertex_cover
start=time.monotonic();signal.alarm(55);resource.setrlimit(resource.RLIMIT_CPU,(55,60))
rows=[]
def row(name,g,ac=True):
 d={'name':name,'n':g.n,'edges':g.edges,'triangles':g.triangles,'nu':g.nu(),'tau':g.tau(),'packing':g.pack_witness(),'cover':g.cover_witness(),'status':'PASS'}
 col=rainbow_coloring(g);d['triangle_edge3color']=col
 if ac and col is not None:
  results=[]
  for mask in range(1<<g.n):
   X=[v for v in range(g.n) if mask>>v&1]
   if not g.tri_free_link(X):continue
   G=g.apex(X);lam,cert=g.lambda_cover(X);p=G.nu();assert g.tau()+lam<=2*p
   results.append({'X':X,'lambda':lam,'nu_G':p,'budget':2*p-g.tau(),'min_cover_certificate':cert})
  d['AC_results']=results
 else:d['AC_status']='NOT_APPLICABLE' if col is None else 'NOT_RUN'
 rows.append(d)
row('empty',Graph(0,[]));row('triangle',Graph(3,combinations(range(3),2)));row('K4',Graph(4,combinations(range(4),2)));row('K5',Graph(5,combinations(range(5),2)))
for k in [2,4]:row('book_'+str(k),Graph(k+2,[(0,1)]+[(u,v) for v in range(2,k+2) for u in [0,1]]))
# Archived four-port graph: each eligible apex decomposition verified anew.
E=[(0,1),(0,2),(0,3),(0,4),(0,7),(1,2),(1,3),(1,4),(1,5),(2,3),(2,5),(2,6),(3,6),(3,7),(4,5),(4,7),(5,6)]
full=Graph(8,E);fr=[]
for z in range(8):
 X=[u if v==z else v for u,v in E if z in (u,v)]
 H=Graph(8,[(u,v) for u,v in E if z not in (u,v)])
 if not H.tri_free_link(X):fr.append({'z':z,'status':'NOT_APPLICABLE','reason':'induced link contains triangle'});continue
 col=rainbow_coloring(H);assert col is not None
 lam,cert=H.lambda_cover(X);assert H.tau()+lam<=2*full.nu()
 fr.append({'z':z,'status':'PASS','X':X,'H_edges':H.edges,'H_coloring':col,'nu_H':H.nu(),'tau_H':H.tau(),'lambda':lam,'nu_G':full.nu(),'certificate':cert})
# Natural-apex controls: triangle-free H, so AC automatic; finite matching/cover witnesses.
D={1,2,4,8,15};Ecle=[e for e in combinations(range(16),2) if e[0]^e[1] in D];cle=Graph(16,Ecle);assert not cle.triangles
Ccle=[x for x in range(16) if x not in D];assert all(u in Ccle or v in Ccle for u,v in Ecle)
Mcle=[(x,x^1) for x in range(0,16,2)];assert len(set(sum(([u,v] for u,v in Mcle),[])))==16
EJ=[e for e in combinations(range(13),2) if (e[1]-e[0])%13 in {1,5,8,12}]
Evb=[(2*u+i,2*v+j) for u,v in EJ for i in range(2) for j in range(2)];vb=Graph(26,Evb);assert not vb.triangles
I={2*v+i for v in [0,2,4,6] for i in range(2)};Cvb=[x for x in range(26) if x not in I];assert all(u in Cvb or v in Cvb for u,v in Evb)
Mvb=[tuple(sorted((2*i,2*((i+1)%13)+1))) for i in range(13)];assert set(Mvb)<=set(vb.edges) and len(set(sum(([u,v] for u,v in Mvb),[])))==26
natural=[{'name':'Clebsch_cone','status':'PASS','scope':'automatic natural apex only','H_trianglefree':True,'minimum_H_cover':[],'spoke_cover_vertices':Ccle,'page_matching':Mcle,'AC_cost':11,'two_nu_G':16},{'name':'VB27_hub','status':'PASS','scope':'automatic natural apex only','H_trianglefree':True,'minimum_H_cover':[],'spoke_cover_vertices':Cvb,'page_matching':Mvb,'AC_cost':18,'two_nu_G':26}]
# Cartesian K4 square K5: independently verify exhaustive triangle decomposition.
Ecart=[(5*i+j,5*k+l) for i in range(4) for j in range(5) for k in range(i,4) for l in range(5) if 5*i+j<5*k+l and ((i==k) != (j==l))]
cart=Graph(20,Ecart);blocks=[set(5*i+j for j in range(5)) for i in range(4)]+[set(5*i+j for i in range(4)) for j in range(5)]
assert all(sum(set(t)<=B for B in blocks)==1 for t in cart.triangles)
assert len(cart.triangles)==4*10+5*4
# Fano is ABSTRACT, not a graph counterexample.
lines=[sum(1<<x for x in t) for t in [(0,1,2),(0,3,4),(0,5,6),(1,3,5),(1,4,6),(2,3,6),(2,4,5)]]
assert all(a&b for a,b in combinations(lines,2))
tau=min(s.bit_count() for s in range(1<<7) if all(s&t for t in lines));assert tau==3
fano={'status':'PASS','scope':'abstract control only; NOT_APPLICABLE as graph counterexample','nu':1,'tau':3,'two_point_deletion_preserves_nu':all(any(not (line&S) for line in lines) for S in [sum(1<<x for x in t) for k in [1,2] for t in combinations(range(7),k)])}
assert fano['two_point_deletion_preserves_nu']
# Actual K4/K5 block family sharing one vertex; direct full triangle decomposition.
blocks2=[[0,1,2,3],[0,4,5,6,7],[0,8,9,10]]
g2=Graph(11,[e for B in blocks2 for e in combinations(B,2)])
assert all(sum(set(t)<=set(B) for B in blocks2)==1 for t in g2.triangles)
out={'status':'PASS','rows':rows,'four_port':fr,'natural_apex_controls':natural,'cartesian':{'status':'PASS','actual_triangle_count':len(cart.triangles),'nu':13,'tau':26,'method':'full actual triangle decomposition + elementary K4/K5 optima','AC_status':'NOT_APPLICABLE','reason':'contains K5; each graph-vertex apex has nontrianglefree link'},'vertex_sharing_blocks':{'status':'PASS','nu':4,'tau':8,'triangle_count':len(g2.triangles)},'Fano':fano,'K10_K11':{'status':'NOT_RUN','reason':'prior66 certificates not newly decisive; natural-apex AC hypotheses fail (remainder contains K5 and link contains triangles)'},'python':sys.version,'elapsed_seconds':time.monotonic()-start,'max_RSS_bytes':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss}
Path('evidence/controls.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k in ['status','python','elapsed_seconds','max_RSS_bytes']}))
