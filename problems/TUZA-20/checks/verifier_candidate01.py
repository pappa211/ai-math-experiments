#!/usr/bin/env python3
"""Candidate 01 constrained allocations, independently reconstructed by verifier."""
from verifier_exact import *

def c01(n,E,T,P):
 B,A,priv,K=allowed(n,E,T,P)
 bases=[];tips=[]
 for p in P:
  b=set(e for q in priv[p] for e in faces(q)&B)
  if len(b)!=1:return {'eligible':False}
  base=next(iter(b));bases.append(base)
  tips.append(frozenset(next(iter(set(q)-set(base))) for q in priv[p]))
 bases=frozenset(bases)
 centers=[next(iter(set(p)-set(next(iter(set(e for q in priv[p] for e in faces(q)&B)))))) for p in P]
 ownbases=[next(iter(faces(p)&bases)) for p in P]
 L=[];gains=[]
 for i,p in enumerate(P):
  if len(tips[i])!=1:continue
  g=edge(centers[i],next(iter(tips[i])))
  if g in E:
   assert g in B
   L.append(i);gains.append(g)
 F=frozenset(gains)-bases
 exceptional=[]
 for i,j in combinations(range(len(P)),2):
  if centers[i]==centers[j] and set(ownbases[i]).isdisjoint(ownbases[j]) and tips[i]==frozenset(ownbases[j]) and tips[j]==frozenset(ownbases[i]):exceptional.append((i,j))
 assert len(set(i for q in exceptional for i in q))==2*len(exceptional)
 assert not set(L)&set(i for q in exceptional for i in q)
 spokes=[faces(p)-bases for p in P]
 groups=[];options=[]
 for i,j in exceptional:
  groups.append([i,j]); ss=sorted(spokes[i]|spokes[j]);options.append([frozenset(c) for k in range(3) for c in combinations(ss,k)])
 paired=set(i for q in exceptional for i in q)
 for i in range(len(P)):
  if i not in L and i not in paired:
   groups.append([i]);options.append([frozenset()]+[frozenset([e]) for e in sorted(spokes[i])])
 clauses=tuple((faces(t)&B)-bases for t in T if not faces(t)&bases)
 assert all(len(c) in [2,3] for c in clauses)
 tried=0;sol=None
 for choice in product(*options):
  tried+=1
  S=frozenset().union(*choice)
  if all((F|S)&c for c in clauses):sol=S;break
 result={'eligible':True,'feasible':sol is not None,'bases':sorted(bases),'L':L,'gains':gains,'F':sorted(F),'exceptional_pairs':exceptional,'groups':groups,'residual_clauses':[sorted(c) for c in clauses],'assignments_tested':tried,'total_assignments':__import__('math').prod(map(len,options)),'S':sorted(sol) if sol is not None else None}
 if sol is not None:
  C=bases|F|sol
  assert len(C)<=2*len(P) and all(C&faces(t) for t in T)
  result['cover']=sorted(C)
 return result

def main():
 start=time.time();rows=[];fail=[];controls=[]
 for d in json.load(open(ROOT/'data/verifier_controls.json')):
  E,T=reconstruct(d['n'],d['edges']);P=tuple(tuple(x) for x in d['packing'])
  r=c01(d['n'],E,T,P);controls.append({'name':d['name'],**r})
 for n in range(7):
  pairs=list(combinations(range(n),2));graphs=states=eligible=bad=0
  for mask in range(1<<len(pairs)):
   E,T=reconstruct(n,[e for i,e in enumerate(pairs) if mask&(1<<i)])
   nu,ps=maximum_packings(T)
   for P in ps:
    states+=1;r=c01(n,E,T,P)
    if not r['eligible']:continue
    eligible+=1
    if not r['feasible']:
     bad+=1
     if len(fail)<50:
      d=finite(n,E,P,'C01-failure-'+str(len(fail)));d['candidate']=r;d['graph_mask']=mask;fail.append(d)
   graphs+=1
  rows.append({'n':n,'graphs':graphs,'maximum_packings':states,'eligible_all_type_one_packings':eligible,'failed_candidate_packings':bad})
  print(json.dumps(rows[-1]),flush=True)
 out={'start_utc':datetime.datetime.fromtimestamp(start,datetime.timezone.utc).isoformat(),'elapsed_seconds':time.time()-start,'candidate_sha256':hashlib.sha256((ROOT/'CANDIDATE_01.md').read_bytes()).hexdigest(),'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'counts':rows,'controls':controls,'first_50_failures':fail,'unknown':[]}
 (ROOT/'receipts/verifier_candidate01.json').write_text(json.dumps(out,indent=2)+'\n')
 print('failures',sum(r['failed_candidate_packings'] for r in rows),'elapsed',out['elapsed_seconds'])
if __name__=='__main__':main()
