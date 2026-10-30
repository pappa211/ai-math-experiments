import LeanChecker

/-! Verification driver only, outside the mathematical theorem dependency closure.
The installed LeanChecker CLI treats module names as prefixes. This adapter calls
its unchanged replayFromImports API exactly once. Its imported global main is not
executed. TUZA06_REPLAY_MODULE selects one exact module and is recorded in logs.
This uses the standard Lean kernel; it is not an independent kernel implementation
and does not replay pinned Mathlib from an empty environment. -/

unsafe def replayExactSelectedModule : IO Unit := do
  let some moduleName ← IO.getEnv "TUZA06_REPLAY_MODULE"
    | throw <| IO.userError "TUZA06_REPLAY_MODULE must name one exact module"
  if moduleName.isEmpty || moduleName.contains ' ' then
    throw <| IO.userError "Expected one full module name"
  Lean.initSearchPath (← Lean.findSysroot)
  let name := moduleName.toName
  if name.isAnonymous then
    throw <| IO.userError "Empty module name"
  IO.println s!"replaying exactly {name} through installed replayFromImports"
  replayFromImports name
  IO.println s!"PASS exact replay {name}"

#eval replayExactSelectedModule
