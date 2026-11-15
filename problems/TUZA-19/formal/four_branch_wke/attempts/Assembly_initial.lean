import Chunk000
import Chunk001
import Chunk002
import Chunk003
import Chunk004
import Chunk005
import Chunk006
import Chunk007
import Chunk008
import Chunk009
import Chunk010
import Chunk011
import Chunk012
import Chunk013
import Chunk014
import Chunk015
import Chunk016
import Chunk017
import Chunk018
import Chunk019
import Chunk020
import Chunk021
import Chunk022
import Chunk023
import Chunk024
import Chunk025
import Chunk026
import Chunk027
import Chunk028
import Chunk029
import Chunk030
import Chunk031
import Chunk032
import Chunk033
import Chunk034
import Chunk035
import Chunk036
import Chunk037
import Chunk038
import Chunk039
import Chunk040
import Chunk041
import Chunk042
import Chunk043
import Chunk044
import Chunk045
import Chunk046
import Chunk047
import Chunk048
import Chunk049
import Chunk050
import Chunk051
import Chunk052
import Chunk053
import Chunk054
import Chunk055
import Chunk056
import Chunk057
import Chunk058
import Chunk059
import Chunk060
import Chunk061
import Chunk062
import Chunk063
import Chunk064
import Chunk065
import Chunk066
import Chunk067
import Chunk068
import Chunk069
import Chunk070
import Chunk071
import Chunk072
import Chunk073
import Chunk074
import Chunk075
import Chunk076
import Chunk077
import Chunk078
import Chunk079
import Chunk080
import Chunk081
import Chunk082
import Chunk083
import Chunk084
import Chunk085
import Chunk086
import Chunk087
import Chunk088
import Chunk089
import Chunk090
import Chunk091
import Chunk092
import Chunk093
import Chunk094
import Chunk095
import Chunk096
import Chunk097
import Chunk098
import Chunk099
import Chunk100
import Chunk101
import Chunk102
import Chunk103
import Chunk104
import Chunk105
import Chunk106
import Chunk107
import Chunk108
import Chunk109
import Chunk110
import Chunk111
import Chunk112
import Chunk113
import Chunk114
import Chunk115
import Chunk116
import Chunk117
import Chunk118
import Chunk119
import Chunk120
import Chunk121
import Chunk122
import Chunk123
import Chunk124
import Chunk125
import Chunk126
import Chunk127
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace FourBranch
def segments : List Segment := [Chunk000.segment,Chunk001.segment,Chunk002.segment,Chunk003.segment,Chunk004.segment,Chunk005.segment,Chunk006.segment,Chunk007.segment,Chunk008.segment,Chunk009.segment,Chunk010.segment,Chunk011.segment,Chunk012.segment,Chunk013.segment,Chunk014.segment,Chunk015.segment,Chunk016.segment,Chunk017.segment,Chunk018.segment,Chunk019.segment,Chunk020.segment,Chunk021.segment,Chunk022.segment,Chunk023.segment,Chunk024.segment,Chunk025.segment,Chunk026.segment,Chunk027.segment,Chunk028.segment,Chunk029.segment,Chunk030.segment,Chunk031.segment,Chunk032.segment,Chunk033.segment,Chunk034.segment,Chunk035.segment,Chunk036.segment,Chunk037.segment,Chunk038.segment,Chunk039.segment,Chunk040.segment,Chunk041.segment,Chunk042.segment,Chunk043.segment,Chunk044.segment,Chunk045.segment,Chunk046.segment,Chunk047.segment,Chunk048.segment,Chunk049.segment,Chunk050.segment,Chunk051.segment,Chunk052.segment,Chunk053.segment,Chunk054.segment,Chunk055.segment,Chunk056.segment,Chunk057.segment,Chunk058.segment,Chunk059.segment,Chunk060.segment,Chunk061.segment,Chunk062.segment,Chunk063.segment,Chunk064.segment,Chunk065.segment,Chunk066.segment,Chunk067.segment,Chunk068.segment,Chunk069.segment,Chunk070.segment,Chunk071.segment,Chunk072.segment,Chunk073.segment,Chunk074.segment,Chunk075.segment,Chunk076.segment,Chunk077.segment,Chunk078.segment,Chunk079.segment,Chunk080.segment,Chunk081.segment,Chunk082.segment,Chunk083.segment,Chunk084.segment,Chunk085.segment,Chunk086.segment,Chunk087.segment,Chunk088.segment,Chunk089.segment,Chunk090.segment,Chunk091.segment,Chunk092.segment,Chunk093.segment,Chunk094.segment,Chunk095.segment,Chunk096.segment,Chunk097.segment,Chunk098.segment,Chunk099.segment,Chunk100.segment,Chunk101.segment,Chunk102.segment,Chunk103.segment,Chunk104.segment,Chunk105.segment,Chunk106.segment,Chunk107.segment,Chunk108.segment,Chunk109.segment,Chunk110.segment,Chunk111.segment,Chunk112.segment,Chunk113.segment,Chunk114.segment,Chunk115.segment,Chunk116.segment,Chunk117.segment,Chunk118.segment,Chunk119.segment,Chunk120.segment,Chunk121.segment,Chunk122.segment,Chunk123.segment,Chunk124.segment,Chunk125.segment,Chunk126.segment,Chunk127.segment]
theorem all_segments_checked : AllChecks segments :=
  ⟨Chunk000.correct,
  ⟨Chunk001.correct,
  ⟨Chunk002.correct,
  ⟨Chunk003.correct,
  ⟨Chunk004.correct,
  ⟨Chunk005.correct,
  ⟨Chunk006.correct,
  ⟨Chunk007.correct,
  ⟨Chunk008.correct,
  ⟨Chunk009.correct,
  ⟨Chunk010.correct,
  ⟨Chunk011.correct,
  ⟨Chunk012.correct,
  ⟨Chunk013.correct,
  ⟨Chunk014.correct,
  ⟨Chunk015.correct,
  ⟨Chunk016.correct,
  ⟨Chunk017.correct,
  ⟨Chunk018.correct,
  ⟨Chunk019.correct,
  ⟨Chunk020.correct,
  ⟨Chunk021.correct,
  ⟨Chunk022.correct,
  ⟨Chunk023.correct,
  ⟨Chunk024.correct,
  ⟨Chunk025.correct,
  ⟨Chunk026.correct,
  ⟨Chunk027.correct,
  ⟨Chunk028.correct,
  ⟨Chunk029.correct,
  ⟨Chunk030.correct,
  ⟨Chunk031.correct,
  ⟨Chunk032.correct,
  ⟨Chunk033.correct,
  ⟨Chunk034.correct,
  ⟨Chunk035.correct,
  ⟨Chunk036.correct,
  ⟨Chunk037.correct,
  ⟨Chunk038.correct,
  ⟨Chunk039.correct,
  ⟨Chunk040.correct,
  ⟨Chunk041.correct,
  ⟨Chunk042.correct,
  ⟨Chunk043.correct,
  ⟨Chunk044.correct,
  ⟨Chunk045.correct,
  ⟨Chunk046.correct,
  ⟨Chunk047.correct,
  ⟨Chunk048.correct,
  ⟨Chunk049.correct,
  ⟨Chunk050.correct,
  ⟨Chunk051.correct,
  ⟨Chunk052.correct,
  ⟨Chunk053.correct,
  ⟨Chunk054.correct,
  ⟨Chunk055.correct,
  ⟨Chunk056.correct,
  ⟨Chunk057.correct,
  ⟨Chunk058.correct,
  ⟨Chunk059.correct,
  ⟨Chunk060.correct,
  ⟨Chunk061.correct,
  ⟨Chunk062.correct,
  ⟨Chunk063.correct,
  ⟨Chunk064.correct,
  ⟨Chunk065.correct,
  ⟨Chunk066.correct,
  ⟨Chunk067.correct,
  ⟨Chunk068.correct,
  ⟨Chunk069.correct,
  ⟨Chunk070.correct,
  ⟨Chunk071.correct,
  ⟨Chunk072.correct,
  ⟨Chunk073.correct,
  ⟨Chunk074.correct,
  ⟨Chunk075.correct,
  ⟨Chunk076.correct,
  ⟨Chunk077.correct,
  ⟨Chunk078.correct,
  ⟨Chunk079.correct,
  ⟨Chunk080.correct,
  ⟨Chunk081.correct,
  ⟨Chunk082.correct,
  ⟨Chunk083.correct,
  ⟨Chunk084.correct,
  ⟨Chunk085.correct,
  ⟨Chunk086.correct,
  ⟨Chunk087.correct,
  ⟨Chunk088.correct,
  ⟨Chunk089.correct,
  ⟨Chunk090.correct,
  ⟨Chunk091.correct,
  ⟨Chunk092.correct,
  ⟨Chunk093.correct,
  ⟨Chunk094.correct,
  ⟨Chunk095.correct,
  ⟨Chunk096.correct,
  ⟨Chunk097.correct,
  ⟨Chunk098.correct,
  ⟨Chunk099.correct,
  ⟨Chunk100.correct,
  ⟨Chunk101.correct,
  ⟨Chunk102.correct,
  ⟨Chunk103.correct,
  ⟨Chunk104.correct,
  ⟨Chunk105.correct,
  ⟨Chunk106.correct,
  ⟨Chunk107.correct,
  ⟨Chunk108.correct,
  ⟨Chunk109.correct,
  ⟨Chunk110.correct,
  ⟨Chunk111.correct,
  ⟨Chunk112.correct,
  ⟨Chunk113.correct,
  ⟨Chunk114.correct,
  ⟨Chunk115.correct,
  ⟨Chunk116.correct,
  ⟨Chunk117.correct,
  ⟨Chunk118.correct,
  ⟨Chunk119.correct,
  ⟨Chunk120.correct,
  ⟨Chunk121.correct,
  ⟨Chunk122.correct,
  ⟨Chunk123.correct,
  ⟨Chunk124.correct,
  ⟨Chunk125.correct,
  ⟨Chunk126.correct,
  ⟨Chunk127.correct,
  True.intro⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩
def header (s : Segment) : Nat × List Nat × Nat :=
  (s.branches, s.headStates, s.suffixLength)
def expectedSchedule : List (Nat × List Nat × Nat) :=
  [(1,[],0),(2,[],1),(3,[],3)] ++ (vectors 3).map (fun p => (4,p,3))
theorem schedule_complete : segments.map header = expectedSchedule := by decide
-- This equation closes the prefix/suffix partition of all six pair states.
theorem six_state_vectors_complete :
    vectors 6 = (vectors 3).flatMap (fun p => (vectors 3).map (p ++ ·)) := by decide
theorem raw_domain_count :
    (vectors 0).length + (vectors 1).length +
    (vectors 3).length + (vectors 6).length = 15756 := by decide
def countBranch (b : Nat) : Nat :=
  ((segments.filter (fun s => s.branches == b)).map (fun s => s.rows.length)).sum
theorem retained_domain_counts :
    countBranch 1 = 0 ∧ countBranch 2 = 0 ∧
    countBranch 3 = 10 ∧ countBranch 4 = 5365 := by decide
theorem total_certificates : (segments.map (fun s => s.rows.length)).sum = 5375 := by decide

def FiniteCertificateStatement : Prop :=
  AllChecks segments ∧
  segments.map header = expectedSchedule ∧
  vectors 6 = (vectors 3).flatMap (fun p => (vectors 3).map (p ++ ·)) ∧
  (countBranch 1 = 0 ∧ countBranch 2 = 0 ∧ countBranch 3 = 10 ∧ countBranch 4 = 5365) ∧
  (segments.map (fun s => s.rows.length)).sum = 5375

theorem complete_finite_certificate : FiniteCertificateStatement :=
  ⟨all_segments_checked, schedule_complete, six_state_vectors_complete,
    retained_domain_counts, total_certificates⟩
#print axioms all_segments_checked
#print axioms schedule_complete
#print axioms six_state_vectors_complete
#print axioms raw_domain_count
#print axioms retained_domain_counts
#print axioms total_certificates
#print axioms complete_finite_certificate
#check complete_finite_certificate
end FourBranch
