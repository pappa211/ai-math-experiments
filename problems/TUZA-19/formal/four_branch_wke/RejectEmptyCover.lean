import NegativeChecks
set_option maxRecDepth 10000
set_option maxHeartbeats 0
open FourBranch FourBranch.Negative
example : checkSegment emptyCover = true := by decide
