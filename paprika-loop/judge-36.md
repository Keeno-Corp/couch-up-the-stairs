**Judge 36 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.**
   - Holding Space+D for 500 frames took the `couch` to `floor` 2 at f249 (`couch` y 6.19), with P1 and Buddy both on `grips` (slots 0 and 2).
   - Buddy now holds his grip: `grips.1.slot` goes to 2 at f14 and stays there.
   - He still lags. `players.1.dbg.lead` has a low of -13 at f302 and is back at -3 at f499, with `stretch` 1.93.
   - 1/2/R and P2 were not played.
2. **Rapier couch, 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.**
   - Door "2A", the `stairwell` railing posts, the brick gap, the plant and the papers all read.
   - Floors 3–5 and the WIN were not reached.
3. **Slide-back/tumble ragdoll, get up; clip in first minute: 3.**
   - `slips` stayed 0 for all 500 frames, and `players.0.state` stayed "stand".
   - The builder's own Open predicted this. Raising the L0F1 threshold to .92 left the tumble unseen at the first turn.
   - The tumble clip is the brief's key beat and was not seen.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 9.**
   - `div#tl` "Floor 2/5 0:08.3", `div#tilt` and `div#grips` show, with 0 overlaps and 0 cut off.
   - The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The Subject `couch` is 13% of the picture at [408, 194, 901, 648] and is brighter than its surround (50% against 35%).
   - Edge contrast is only 0.161, and the picture is 92% orange and brown.
   - The players are tiny: `player*` is 0.46% of the picture and sits cut off at the bottom edge. The green hood is only just visible and the red one is off-frame.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.**
   - `describe` and `observe` work and the console is clean.
   - `act` was not run, and `couchIdx` is not in `observe()` as a top-level path.
7. **Faults: 6.**
   - `perf` gave 115 ms a frame at host load 1.6. That is SwiftShader, so it is noise.
   - 286 draw calls has not changed in five sessions.
   - `Never visible` is none, and there are no `Lighting:` or `Surfaces:` fault lines.

**Next:**
1. **Make the tumble happen, and make it reliable (asked again).**
   - `slips` is 0 after 500 frames of Space+D, so the slip never fires. The prog>.92 gate on L0F1 is too strict.
   - Fire it on a timer or position instead. For example, trigger when the `couch` first crosses the turn landing, or at the latest by about f300 if it has not fired.
   - Check that the slip bowls a player into ragdoll and that they get up.
   - One call shows it done: `interact` Space+D x500 with `trace: ["slips", "players.0.state", "players.1.state"]`. `slips` should change between f250 and f450, and a state other than "stand" should appear and then return to "stand".
2. **Make Buddy keep pace (asked again).**
   - `lead` still drops to -13 at f302, and `stretch` stays above 1.9.
   - In `aiThink`, when `lead` < -6, raise his speed or re-path him to the lower corner slot.
   - One call shows it done: the same `interact` with `trace: ["players.1.dbg.lead"]`. The low should stay at -6 or above.
3. **Widen the camera and cut draw calls (asked again).**
   - Pull the camera back or lower it so both players' hoods sit fully in the frame. In a `look` after the same `interact`, `player*` should be above 1.5% and not clipped at the bottom edge.
   - Merge the 58 `stairwell` boxes by material, or use `instances`. `perf` should report under 150 draw calls.

SCORE: 6.4
