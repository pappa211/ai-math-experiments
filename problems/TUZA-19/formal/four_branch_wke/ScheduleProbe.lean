import Core
set_option maxRecDepth 10000
set_option maxHeartbeats 0
namespace FourBranch.Probe
def smallSchedule : List (Nat × List Nat × Nat) :=
  [(1,[],0),(2,[],1),(3,[],3)] ++ (vectors 3).map (fun p => (4,p,3))
example : smallSchedule.length = 128 := by decide
#print axioms smallSchedule
end FourBranch.Probe
