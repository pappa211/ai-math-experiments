"""Targeted exact certificates for B=K7 minus two disjoint edges; standard library."""
import itertools,json,time,pathlib
start=time.monotonic(); V=range(7)
E={tuple(e) for e in itertools.combinations(V,2)}-{(1,2),(3,4)}
T=[t for t in itertools.combinations(V,3) if all(e in E for e in itertools.combinations(t,2))]
def find_pack(avoid,k):
 candidates=[(t,set(itertools.combinations(t,2))) for t in T if avoid not in set(itertools.combinations(t,2))]
 def rec(i,left,used,sel):
  if not left:return sel
  if len(candidates)-i<left:return None
  for j in range(i,len(candidates)):
   t,es=candidates[j]
   if not used&es:
    r=rec(j+1,left-1,used|es,sel+[t])
    if r:return r
  return None
 return rec(0,k,set(),[])
results={str(e):find_pack(e,5) for e in sorted(E)}
assert all(results.values())
cover=sorted(set(itertools.combinations([0,1,2],2))|set(itertools.combinations([3,4,5,6],2)))
cover=[e for e in cover if e in E]
assert len(cover)==7
assert all(set(itertools.combinations(t,2))&set(cover) for t in T)
out={'graph':{'vertices':list(V),'edges':sorted(E),'triangles':T},'avoidance_packings':results,'cover':cover,'runtime_s':time.monotonic()-start,'status':'EXACT_CERTIFICATES_FOUND','limits':'n=7,19 edges; bounded certificate search, no unbounded inference from enumeration'}
pathlib.Path('evidence/dense_six_probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'representatives':{str(e):results[str(e)] for e in [(1,3),(1,5),(5,6)]},'cover':cover,'elapsed':out['runtime_s']}))
