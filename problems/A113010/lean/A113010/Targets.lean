import A113010.Definition

namespace OeisA113010

/-- Find a fixed point other than the two specified in the original challenge. -/
def ExistenceTarget : Prop :=
  ∃ n : ℕ, a n = n ∧ n ≠ 1 ∧ n ≠ 32

/-- Establish that no other fixed point exists, for the same frozen definition. -/
def NonexistenceTarget : Prop :=
  ¬ (∃ n : ℕ, a n = n ∧ n ≠ 1 ∧ n ≠ 32)

-- These are alternative propositions, not assumed or admitted theorems.
#check ExistenceTarget
#check NonexistenceTarget

end OeisA113010
