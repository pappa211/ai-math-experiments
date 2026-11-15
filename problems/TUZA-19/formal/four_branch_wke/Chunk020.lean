import Core
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace FourBranch.Chunk020
def rows : List Row := [

]
def segment : Segment := ⟨4,[0,3,2],3,rows⟩
theorem correct : checkSegment segment = true := by decide
#print axioms correct
end FourBranch.Chunk020
