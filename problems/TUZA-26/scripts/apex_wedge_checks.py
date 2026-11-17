from apex_exact import *
import json,time
start=time.time()
H={edge(i,(i+1)%5) for i in range(5)}|{edge(i,5) for i in range(5)}
v,a,b,c=0,4,5,1;e=edge(a,b);f=edge(b,c)
J={x for x in H if v not in x};K=J-{e,f}
profiles={name:Solver(E).certificate() for name,E in [('H',H),('J',J),('K',K),('K_plus_e',K|{e}),('K_plus_f',K|{f})]}
assert [(profiles[z]['nu'],profiles[z]['tau']) for z in profiles]==[(2,3),(2,2),(1,1),(1,1),(1,1)]
assert profiles['H']['single_edge_resilient'] and not profiles['K']['single_edge_resilient']
branches=[]
for g in sorted(K):
 if Solver(K-{g}).nu()==1:continue
 old=H-{e,f,g};X=Solver(old)
 assert not X.T
 branches.append({'critical_g':g,'old_edges_retaining_v_star':sorted(old),'old_background':sorted(old),'old_nu':X.nu(),'old_tau':X.tau(),'restored':sorted([e,f,g]),'shape':'star' if b in g else 'P3_plus_edge'})
# Two inherited failures of generic resilience descent; they are NOT defect-one children.
A=clique((0,1,2,3))|clique((0,1,2,4))|clique((0,1,3,5));B=A|clique((0,1,2,3,6))
C=A|clique((0,2,3,6));D=C|clique((1,2,3,7))
negative=[]
for name,old,new,expected in [('seven_vertex_defect_three',A,B,(3,4,4,5)),('eight_vertex_defect_two',C,D,(4,5,4,6))]:
 X=Solver(old);Y=Solver(new);px=X.certificate();py=Y.certificate()
 assert (px['nu'],px['tau'],py['nu'],py['tau'])==expected
 assert not px['single_edge_resilient'] and py['single_edge_resilient']
 negative.append({'name':name,'predecessor':px,'child':py})
print(json.dumps({'status':'VERIFIED_FINITE','scope':'Sharp W5 wedge with all critical K deletions, plus two frozen generic-descent negative controls; no exploratory census.','wedge_vertices':{'v':v,'a':a,'b':b,'c':c},'profiles':profiles,'fragile_branches':branches,'generic_resilience_descent_negative_controls':negative,'seconds':time.time()-start},indent=2))
