import Chunk002
set_option maxRecDepth 10000
set_option maxHeartbeats 0
namespace FourBranch.Negative

def missingRow : Segment :=
  { Chunk002.segment with rows := Chunk002.rows.tail }
def emptyCover : Segment :=
  { Chunk002.segment with rows := match Chunk002.rows with
    | [] => []
    | r::rs => { r with cover := [] } :: rs }
def repeatedMatching : Segment :=
  { Chunk002.segment with rows := match Chunk002.rows with
    | [] => []
    | r::rs => { r with matching := r.matching ++ r.matching } :: rs }
theorem missing_row_rejected : checkSegment missingRow = false := by decide
theorem empty_cover_rejected : checkSegment emptyCover = false := by decide
theorem repeated_matching_rejected : checkSegment repeatedMatching = false := by decide
#print axioms missing_row_rejected
#print axioms empty_cover_rejected
#print axioms repeated_matching_rejected
end FourBranch.Negative
