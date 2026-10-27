/-
Copyright 2026 The Formal Conjectures Authors.
Licensed under the Apache License, Version 2.0.
See ../reference/LICENSE (relative to the proof project).

Definition copied from the frozen upstream challenge. Do not modify.
-/
import Mathlib.Data.Nat.Digits.Defs

namespace OeisA113010

open Nat

def a (n : ℕ) : ℕ :=
  ((10).digits n).length ^ (List.sum ((10).digits n))

end OeisA113010
