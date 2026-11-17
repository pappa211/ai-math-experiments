from apex_exact import *
import json,time
start=time.time();cases=[]
E1=clique(range(4))|clique([0,1,4,5,6])
E2=clique(range(5))|clique([0,1,5,6,7])
E3=clique(range(4));n=4
for i in [1,2,3]:
 V=[0,i,n,n+1,n+2];E3|=clique(V);n+=3
for name,E,x,y,A,expected in [('K4_K5_edge',E1,5,6,[0,1,4],[(3,5),(2,3),(2,2)]),('two_K5_edge',E2,6,7,[0,1,5],[(4,7),(3,5),(3,4)]),('thirteen_vertex_star555',E3,11,12,[0,3,10],[(7,13),(6,11),(6,10)])]:
 P={e for e in E if y not in e};J={e for e in P if x not in e};X=Solver(E);Y=Solver(P);Z=Solver(J)
 vals=[(X.nu(),X.tau()),(Y.nu(),Y.tau()),(Z.nu(),Z.tau())];assert vals==expected,(name,vals)
 assert set(v for e in E if y in e for v in e)-{y}==set(A)|{x}
 assert set(v for e in E if x in e for v in e)-{x}==set(A)|{y}
 assert X.connected() and Y.connected() and X.supported() and Y.supported()
 px=X.certificate();py=Y.certificate();assert px['single_edge_resilient'] and py['single_edge_resilient']
 cases.append({'name':name,'private_x':x,'deleted_y':y,'old_triangle_A':A,'Q':px,'P':py,'J':{'edges':Z.E,'nu':Z.nu(),'tau':Z.tau()},'literal_leaf_D':sorted(set(A)|{x,y})})
 for W in [X,Y,Z]:W.pack.cache_clear();W.cover.cache_clear()
E=clique(range(6))-{(4,5)};X=Solver(E);C={(0,4),(0,5),(1,2),(1,3),(2,3)}
assert all(C&T for T in X.F) and X.tau()==5 and X.nu()==4
print(json.dumps({'status':'VERIFIED_FINITE','scope':'Three explicitly specified paid-leaf controls, allsingledeletions inQ/P, and K6-minus-edge five-cover control; no graph census. The complete outside boundary of each chosen K5 may be smaller than the oldtriangle A, which the theorem permits.','cases':cases,'K6_minus_edge':{'edges':X.E,'nu':X.nu(),'tau':X.tau(),'explicit_five_cover':sorted(C)},'seconds':time.time()-start},indent=2))
