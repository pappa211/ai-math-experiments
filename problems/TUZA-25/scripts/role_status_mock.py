"""Mock status-flow regression; no ORTools algorithm execution claimed."""
from pathlib import Path
import types,sys,importlib.util,json
W=Path(__file__).resolve().parents[1]
cp=types.ModuleType('ortools.sat.python.cp_model'); cp.OPTIMAL=4;cp.FEASIBLE=2;cp.INFEASIBLE=3;cp.MODEL_INVALID=1;cp.UNKNOWN=0
state={'status':0,'value_calls':0}
class Var:
 def Not(self):return self
 def __radd__(self,x):return 0
class Model:
 def NewBoolVar(self,x):return Var()
 def AddBoolOr(self,x):pass
 def Maximize(self,x):pass
class Solver:
 def __init__(self):self.parameters=types.SimpleNamespace()
 def Solve(self,m):return state['status']
 def Value(self,v):
  assert state['status'] in (cp.OPTIMAL,cp.FEASIBLE)
  state['value_calls']+=1;return 1
cp.CpModel=Model;cp.CpSolver=Solver
for name in ['ortools','ortools.sat','ortools.sat.python']:sys.modules[name]=types.ModuleType(name)
sys.modules['ortools.sat.python.cp_model']=cp
spec=importlib.util.spec_from_file_location('role_corrected',W/'scripts/role_status_corrected.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
rows=[]
for st in [0,1,2,3,4]:
 state.update(status=st,value_calls=0);r=m.max_family(2,[(0,1)])
 if st not in (2,4):assert r==(None,False) and state['value_calls']==0
 else:assert r==([0,1],st==4) and state['value_calls']==2
 rows.append({'status':st,'result':r,'value_calls':state['value_calls']})
m.max_family=lambda *args,**kwargs:([0],False)
assert m.role_test(3,[(0,1),(0,2),(1,2)])==('unknown',None,0,None)
m.max_family=lambda *args,**kwargs:(None,False)
assert m.role_test(3,[(0,1),(0,2),(1,2)])==('unknown',None,0,None)
(W/'evidence/role_status_mock.json').write_text(json.dumps({'status':'PASS_MOCK_CONTROL_FLOW_ONLY','cases':rows,'feasible_baseline_rejected':True,'missing_baseline_rejected':True,'actual_ortools_run':'NOT_RUN_DEPENDENCY_ABSENT'},indent=2)+'\n')
print('PASS:5 mock statuses; feasible/missing baselines rejected; actual ORTools NOT_RUN')
