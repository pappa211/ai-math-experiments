/-
Copyright (c) 2023 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Kim Morrison, Sebastian Ullrich
-/
import Lean.CoreM
import Lean.Replay

open Lean

unsafe def replayFromImports (module : Name) : IO Unit := do
  let mFile ← findOLean module
  unless (← mFile.pathExists) do
    throw <| IO.userError s!"object file '{mFile}' of module {module} does not exist"
  -- Load all module data parts (exported, server, private)
  let mut fnames := #[mFile]
  let sFile := OLeanLevel.server.adjustFileName mFile
  if (← sFile.pathExists) then
    fnames := fnames.push sFile
    let pFile := OLeanLevel.private.adjustFileName mFile
    if (← pFile.pathExists) then
      fnames := fnames.push pFile
  let parts ← readModuleDataParts fnames
  if h : parts.size = 0 then throw <| IO.userError "failed to read module data" else
  let (mod, _) := parts[0]
  let (_, s) ← importModulesCore mod.imports |>.run
  let env ← finalizeImport s mod.imports {} 0 false false (isModule := true)
  let mut newConstants := {}
  -- Collect constants from last ("most private") part, which subsumes all prior ones
  for name in parts[parts.size-1].1.constNames, ci in parts[parts.size-1].1.constants do
    newConstants := newConstants.insert name ci
  let env' ← env.replay newConstants
  env'.freeRegions

/-- Runtime cap via the pinned Lean C runtime symbol also declared privately in Lean.Shell. -/
@[extern "lean_internal_set_max_memory"]
opaque setReplayMaxMemory (max : USize) : BaseIO Unit

unsafe def main (args : List String) : IO UInt32 := do
  unless args.length = 1 do
    throw <| IO.userError "Expected exactly one full module name"
  let memory := ((← IO.getEnv "TUZA06_REPLAY_MEMORY_MB").bind String.toNat?).getD 1900
  if memory > 2200 || memory = 0 then
    throw <| IO.userError "Replay memory limit must lie between 1 and 2200 MiB"
  setReplayMaxMemory ((memory * 1024 * 1024).toUSize)
  initSearchPath (← findSysroot)
  let name := args.head!.toName
  if name.isAnonymous then
    throw <| IO.userError "Empty module name"
  IO.println s!"replaying exactly {name}; standard LeanChecker body; limit {memory} MiB"
  replayFromImports name
  IO.println s!"PASS exact replay {name}"
  return 0
