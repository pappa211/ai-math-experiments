import Std
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace FourBranch
abbrev Edge := Nat × Nat
structure Graph where
  n : Nat
  edges : List Edge
  deriving DecidableEq, BEq, Repr
structure Row where
  states : List Nat
  n : Nat
  edges : List Edge
  matching : List Edge
  cover : List Nat
  deriving DecidableEq, BEq, Repr
structure Segment where
  branches : Nat
  headStates : List Nat
  suffixLength : Nat
  rows : List Row
  deriving DecidableEq, BEq, Repr

def vectors : Nat → List (List Nat)
  | 0 => [[]]
  | k+1 => (List.range 5).flatMap fun s => (vectors k).map (s :: ·)
def pairs (b : Nat) : List Edge :=
  (List.range b).flatMap fun u => ((List.range b).filter fun v => u < v).map (u, ·)
def build : List Edge → List Nat → Nat → Graph
  | [], _, n => ⟨n, []⟩
  | _, [], n => ⟨n, []⟩
  | (u,v)::ps, s::ss, n =>
    let added : List Edge := match s with
      | 0 => []
      | 1 => [(u,v)]
      | 2 => [(u,n),(v,n)]
      | 3 => [(u,n),(n,n+1),(v,n+1)]
      | 4 => [(u,v),(u,n),(v,n)]
      | _ => []
    let fresh := if s == 3 then 2 else if s == 2 || s == 4 then 1 else 0
    let rest := build ps ss (n+fresh)
    ⟨rest.n, added ++ rest.edges⟩
def canonical (b : Nat) (s : List Nat) : Graph := build (pairs b) s b
def degree (es : List Edge) (v : Nat) : Nat :=
  (es.filter fun e => e.1 == v || e.2 == v).length
def admissible (b : Nat) (s : List Nat) : Bool :=
  let g := canonical b s
  (List.range b).all fun v => decide (3 ≤ degree g.edges v)
def rawVectors (s : Segment) : List (List Nat) :=
  (vectors s.suffixLength).map (s.headStates ++ ·)
def domain (s : Segment) : List (List Nat) :=
  (rawVectors s).filter (admissible s.branches)
def validRow (b : Nat) (r : Row) : Bool :=
  let g := canonical b r.states
  decide (r.states.length = (pairs b).length) && r.states.all (· < 5) &&
  (r.n == g.n) && decide r.edges.Nodup && decide g.edges.Nodup &&
  r.edges.all (g.edges.contains ·) && g.edges.all (r.edges.contains ·) &&
  r.edges.all (fun e => decide (e.1 < e.2 ∧ e.2 < r.n)) &&
  r.matching.all (r.edges.contains ·) &&
  decide ((r.matching.flatMap fun e => [e.1,e.2]).Nodup) &&
  decide r.cover.Nodup && r.cover.all (· < r.n) &&
  decide (r.cover.length ≤ r.matching.length) &&
  r.edges.all (fun e => r.matching.contains e || r.cover.contains e.1 || r.cover.contains e.2)
def checkSegment (s : Segment) : Bool :=
  decide (s.rows.map Row.states = domain s) &&
  s.rows.all (validRow s.branches)
def AllChecks : List Segment → Prop
  | [] => True
  | s::ss => checkSegment s = true ∧ AllChecks ss
end FourBranch
