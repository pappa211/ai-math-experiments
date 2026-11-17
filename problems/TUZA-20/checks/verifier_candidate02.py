#!/usr/bin/env python3
"""Exact frozen Candidate02 test on the previously audited n<=6 universe."""
from verifier_candidate01 import *

def c02(n,E,T,P):
 r=c01(n,E,T,P)
 if not r['eligible']:return {'eligible':False}
 B,A,priv,K=allowed(n,E,T,P)
 bases=frozenset(tuple(e) for e in r['bases']);F=frozenset(tuple(e) for e in r['F'])
 remaining=tuple(t for t in T if not faces(t)&(bases|F))
 available=B-bases-F
 added=cover_at_most(remaining,available,len(P)-len(F))
 out={'eligible':True,'feasible':added is not None,'bases':sorted(bases),'F':sorted(F),'L':r['L'],'gains':r['gains'],'remaining_triangles':remaining,'available_spokes':sorted(available),'spoke_budget_remaining':len(P)-len(F)}
 if added is not None:
  C=bases|F|added;assert len(C)<=2*len(P) and all(C&faces(t) for t in T)
  out['cover']=sorted(C)
 else:
  extra,C=exact_cover(remaining,available)
  out['constrained_cost']=len(bases|F)+extra
  out['constrained_cover']=sorted(bases|F|C)
  opt,sol=exact_cover(T,B);out['unrestricted_allowed_cost']=opt;out['unrestricted_allowed_cover']=sorted(sol)
 return out

def main():
 start=time.time();rows=[];fail=[];controls=[]
 for d in json.load(open(ROOT/'data/verifier_controls.json')):
  E,T=reconstruct(d['n'],d['edges']);P=tuple(tuple(x) for x in d['packing'])
  controls.append({'name':d['name'],**c02(d['n'],E,T,P)})
 for n in range(7):
  pairs=list(combinations(range(n),2));graphs=states=eligible=bad=0
  for mask in range(1<<len(pairs)):
   E,T=reconstruct(n,[e for i,e in enumerate(pairs) if mask&(1<<i)])
   nu,ps=maximum_packings(T)
   for P in ps:
    states+=1;r=c02(n,E,T,P)
    if not r['eligible']:continue
    eligible+=1
    if not r['feasible']:
     bad+=1
     if len(fail)<50:
      d=finite(n,E,P,'C02-failure-'+str(len(fail)));d['candidate']=r;d['graph_mask']=mask;fail.append(d)
   graphs+=1
  rows.append({'n':n,'graphs':graphs,'maximum_packings':states,'eligible_all_type_one_packings':eligible,'failed_candidate_packings':bad})
  print(json.dumps(rows[-1]),flush=True)
 out={'start_utc':datetime.datetime.fromtimestamp(start,datetime.timezone.utc).isoformat(),'elapsed_seconds':time.time()-start,'candidate_sha256':hashlib.sha256((ROOT/'CANDIDATE_02.md').read_bytes()).hexdigest(),'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'counts':rows,'controls':controls,'first_50_failures':fail,'unknown':[]}
 (ROOT/'receipts/verifier_candidate02.json').write_text(json.dumps(out,indent=2)+'\n')
 print('failures',sum(r['failed_candidate_packings'] for r in rows),'elapsed',out['elapsed_seconds'])
if __name__=='__main__':main()
