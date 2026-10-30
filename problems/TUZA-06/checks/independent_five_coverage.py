"""Independent bounded verification of actual Lean five-link data (5/6 vertices).
Standard library only. No import of the author's generator, no broader census.
Checks graph coding, relabel witnesses, min-degree classes and K221 certificates.
This Python check is supporting evidence, not a formal proof or attachment census.
"""
from pathlib import Path
from itertools import combinations, permutations, product
from functools import lru_cache
import re,json,hashlib,datetime
w=Path(__file__).resolve().parents[1]
base=w/'lean/Tuza06/FiveCoverage'
src=(base/'Basic.lean').read_text()
slots=[tuple(map(int,p)) for p in re.findall(r'\{(\d),(\d)\}',src.split('def slot',1)[1].split('def graphEdges',1)[0])]
assert slots==list(combinations(range(5),2))
repbody=src.split('def representative',1)[1].split('def Relabel',1)[0].split('![',1)[1].rsplit(']',1)[0]
repstrings=[]; level=0; start=None
for j,c in enumerate(repbody):
 if c=='{':
  if level==0:start=j
  level+=1
 elif c=='}':
  level-=1
  if level==0:repstrings.append(repbody[start:j+1])
reps=[frozenset(tuple(sorted(map(int,p))) for p in re.findall(r'\{(\d),(\d)\}',s)) for s in repstrings]
assert len(reps)==11
perms=list(permutations(range(5)))
def image(E,p):return frozenset(tuple(sorted((p[a],p[b]))) for a,b in E)
def canonical(E):return min(tuple(sorted(image(E,p))) for p in perms)
def lehmer_perm(p):
 answer=list(range(5))
 for a,b in [(0,p%5),(1,1+(p//5)%4),(2,2+(p//20)%3),(3,3+(p//60)%2)]:
  answer=[b if x==a else a if x==b else x for x in answer]
 return tuple(answer)
leanperms=[lehmer_perm(p) for p in range(120)]
assert len(set(leanperms))==120 and set(leanperms)==set(perms)
assert len({canonical(E) for E in reps})==11

def parse_witness(text):
 tokens=re.findall(r'if|then|else|b|\d+|[(),]',text); pos=0
 def atom():
  nonlocal pos
  if tokens[pos]=='if':
   pos+=1; assert tokens[pos]=='b';pos+=1
   bit=int(tokens[pos]);pos+=1;assert tokens[pos]=='then';pos+=1
   yes=atom();assert tokens[pos]=='else';pos+=1;no=atom()
   return ('if',bit,yes,no)
  assert tokens[pos]=='(';pos+=1
  if tokens[pos].isdigit():
   a=int(tokens[pos]);pos+=1;assert tokens[pos]==',';pos+=1
   b=int(tokens[pos]);pos+=1;assert tokens[pos]==')';pos+=1
   return ('pair',a,b)
  expr=atom();assert tokens[pos]==')';pos+=1
  return expr
 answer=atom();assert pos==len(tokens),(pos,len(tokens))
 return answer

def evaluate(node,b):
 if node[0]=='pair':return node[1:]
 return evaluate(node[2] if b[node[1]] else node[3],b)

def eligible(E):return all(sum(a in e for e in E)>=2 for a in range(5))
def colorable(E):return any(all(c[a]!=c[b] for a,b in E) for c in product(range(3),repeat=5))
seen=set(); checked=0; repcounts=[0]*11; allclasses=set(); colorclasses=set(); threecolorable=0
chunkhash={}
for k in range(64):
 p=base/f'Chunk{k:02}.lean';s=p.read_text();chunkhash[p.name]=hashlib.sha256(p.read_bytes()).hexdigest()
 joinbody=s.split('def join',1)[1].split('def witness',1)[0].split('![',1)[1].split(']',1)[0]
 entries=[x.strip() for x in joinbody.split(',')]
 assert entries[:4]==['b 0','b 1','b 2','b 3'] and len(entries)==10
 assert all(x in ['true','false'] for x in entries[4:])
 witness=s.split('def witness',1)[1].split(':=',1)[1].split('/--',1)[0]
 tree=parse_witness(witness)
 for b in product([False,True],repeat=4):
  bits=b+tuple(x=='true' for x in entries[4:]);assert bits not in seen;seen.add(bits)
  E=frozenset(slots[j] for j in range(10) if bits[j])
  if eligible(E):
   r,pnum=evaluate(tree,b);assert 0<=r<11 and 0<=pnum<120
   assert image(E,leanperms[pnum])==reps[r],(k,b,r,pnum,E)
   checked+=1;repcounts[r]+=1;allclasses.add(canonical(E))
   if colorable(E):threecolorable+=1;colorclasses.add(canonical(E))
assert len(seen)==1024 and checked==253 and len(allclasses)==11
assert threecolorable==212 and len(colorclasses)==8
# Check top-level groups cover all chunks; proof gluing itself is kernel checked.
imports=[]
for k in range(8):
 s=(base/f'Group{k}.lean').read_text()
 names=re.findall(r'^import Tuza06.FiveCoverage.(Chunk\d+)',s,re.M)
 assert len(names)==8;imports+=names
assert sorted(imports)==[f'Chunk{k:02}' for k in range(64)]
# Independent K221 finite check.
R=frozenset([(1,3),(1,4),(1,5),(2,3),(2,4),(2,5),(3,5),(4,5)])
E=R|frozenset((0,a) for a in range(1,6))
bad={frozenset(p) for p in [[(1,3),(2,4)],[(1,4),(2,3)],[(1,5),(2,5)],[(3,5),(4,5)]]}
T=[(t,frozenset(combinations(t,2))) for t in combinations(range(6),3) if frozenset(combinations(t,2))<=E]
def packing_count(forbidden):
 cand=[m for t,m in T if not m&forbidden]
 def search(start,used,need):
  if not need:return True
  for j in range(start,len(cand)):
   if not cand[j]&used and search(j+1,used|cand[j],need-1):return True
  return False
 return max(n for n in range(5) if search(0,frozenset(),n))
pairvals={}
for f,g in combinations(sorted(R),2):
 result=packing_count(frozenset([f,g]));pairvals[frozenset([f,g])]=result
 assert (result<3)==(frozenset([f,g]) in bad)
for f in R:assert sum(f in pair for pair in bad)==1
for pair in bad:
 f,g=tuple(pair)
 if not set(f)&set(g):
  for k in R:
   if k in pair or (set(k)&set(f) and set(k)&set(g)):assert set(k)&{1,2}
assert packing_count(frozenset())==4
C4={(0,1),(0,2),(3,5),(4,5)}
assert all(m&C4 for t,m in T)
assert not any(all(m&set(C) for t,m in T) for C in combinations(E,3))
result={'status':'PASS','utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'scope':'Bounded 1024 five-vertex encodings and one six-vertex K221 core only. No outside-attachment enumeration; no broader graph census.','slots_exact':True,'permutations_distinct':120,'encodings_checked':1024,'eligible_min_degree_two':253,'eligible_isomorphism_types':11,'three_colorable_eligible':212,'three_colorable_types':8,'actual_lean_relabel_witnesses_checked':253,'representative_labeled_counts':repcounts,'all64chunks_covered_by8groups':True,'K221':{'triangles':len(T),'nu':4,'tau':4,'rim_pairs':28,'good_pairs':24,'bad_pairs':4,'partner_matching_and_terminal_condition':True},'basic_source_sha256':hashlib.sha256(src.encode()).hexdigest(),'chunk_source_sha256':chunkhash}
(w/'checks/independent_five_coverage_results.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='chunk_source_sha256'},indent=2))
