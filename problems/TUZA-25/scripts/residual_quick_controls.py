from residual_archived_exact import optimize,clique
import json

def wheel(k=5):return clique([])|{tuple(sorted((i,(i+1)%k))) for i in range(k)}|{(i,k) for i in range(k)}
rows=[]
for typ,E,n in [('W5',wheel(),6),('K5-e',clique(range(5))-{(3,4)},5),('W5_K4_triangle',wheel()|clique([0,1,5,6]),7),('W5_K5_triangle',wheel()|clique([0,1,5,6,7]),8),('W5_K4_edge',wheel()|clique([0,5,6,7]),8)]:
 r=optimize(n,E); rows.append({'name':typ,**r});print(typ,r['nu'],r['tau'],flush=True)
open('evidence/residual_quick_controls.json','w').write(json.dumps(rows,indent=2)+'\n')
