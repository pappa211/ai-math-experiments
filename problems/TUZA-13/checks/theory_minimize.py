#!/usr/bin/env python3
from pathlib import Path
from itertools import combinations
import json,time,fcntl,sys
from core import Graph,BudgetExceeded
from theory_exchange_probe import smaller_cover,Limit
W=Path(__file__).resolve().parents[1]
x=json.loads((W/'witnesses/theory_tau_drop.json').read_text());n=x['input']['n'];es=x['input']['edges'];C=x['minimum_C'];trace=[]
with (W/'evidence/compute.lock').open('a+') as lock:
 fcntl.flock(lock,fcntl.LOCK_EX);end=time.monotonic()+115
 changed=True
 while changed and time.monotonic()<end:
  changed=False
  for e in es[:]:
   new=[f for f in es if f!=e];co=[f for f in C if f!=e]
   g=Graph(n,new,seconds=2)
   try:tau,covers,complete=g.covers(limit=1)
   except BudgetExceeded:trace.append({'delete':e,'status':'tau timeout'});continue
   if tau!=len(co):trace.append({'delete':e,'status':'inherited cover nonminimum','tau':tau});continue
   try:F,nodes,ts=smaller_cover(n,new,co,seconds=1)
   except Limit:trace.append({'delete':e,'status':'eligible cover timeout'});continue
   if F is None:trace.append({'delete':e,'status':'no tau drop'});continue
   es=new;C=co;changed=True;trace.append({'delete':e,'status':'accepted','tau':tau,'eligible_cover':F});break
 g=Graph(n,es,seconds=10);tau,covers,complete=g.covers(limit=10000);r=g.evaluate(g.cover_mask(C))
 F,nodes,ts=smaller_cover(n,es,C,seconds=5)
 out={'input':{'name':'minimized auxiliary tau-drop','n':n,'edges':es},'triangles':ts,'minimum_C':C,'tau_G':tau,'eligible_cover_F':F,'record':r,'all_minimum_covers':[[g.edges[i] for i in range(len(g.edges)) if c>>i&1] for c in covers],'all_minimum_covers_complete':complete,'warning':'Only auxiliary cover-preservation refutation; central two-red conjecture survives.','trace':trace}
 (W/'witnesses/theory_tau_drop_minimized.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k not in ['trace','all_minimum_covers']},indent=2))
