from apex_probe import Exact,ROOT
from pruned_cut_probe import maxpackings
import networkx as nx,json,time,hashlib
from pathlib import Path
start=time.time();bad=[];allbad=[];tested=0
for idx,g in enumerate(nx.graph_atlas_g()):
 ex=Exact(g);ps=list(maxpackings(ex,ex.all));maxv=max(len(set().union(*(set(ex.tris[i]) for i in P))) if P else 0 for P in ps)
 rows=[]
 for P in ps:
  vp=set().union(*(set(ex.tris[i]) for i in P)) if P else set()
  if len(vp)!=maxv:continue
  tested+=1;B=0
  for j in P:B|=ex.tm[j]
  books=[]
  for j in P:
   priv=[i for i,t in enumerate(ex.tm) if i!=j and (t&B).bit_count()==1 and (t&B)&ex.tm[j]]
   bases={next(k for k in range(len(ex.edges)) if (ex.tm[i]&B)>>k&1) for i in priv}
   if len(bases)==1:
    e=ex.edges[next(iter(bases))];tip=next(v for v in ex.tris[j] if v not in e)
    books.append(dict(triangle=j,base=e,tip=tip,private_pages=priv))
  collisions=[(a['triangle'],b['triangle'],a['tip']) for a in books for b in books if a['triangle']!=b['triangle'] and a['tip'] in b['base']]
  rows.append(dict(P=P,books=books,collisions=collisions,pure_type1=len(books)==len(P)))
 fail=[r for r in rows if r['collisions']]
 if fail:
  record=dict(atlas_index=idx,edges=ex.edges,triangles=ex.tris,nu=ex.pack(ex.all),max_vertex_support=maxv,lexmax_packings=len(rows),failing_lexmax_packings=len(fail),witness=fail[0],all_bad=len(fail)==len(rows))
  bad.append(record)
  if record['all_bad']:allbad.append(record)
result=dict(claim='Vertex-support-maximum maximum packings have no mixed anchor/tip role between type1 members; weaker exists such role-consistent lexmax packing',graphs=1253,packings_checked=tested,counterexamples_all_quantifier=bad,counterexamples_exists_quantifier=allbad,elapsed=time.time()-start,source_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
(ROOT/'evidence/apex_role_probe.json').write_text(json.dumps(result,indent=2));print(json.dumps(dict(checked=tested,bad=len(bad),allbad=len(allbad),elapsed=result['elapsed'])));
if bad:print(json.dumps(bad[0]))
