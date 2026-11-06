The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 41

**Judge 41**

1. **Plays as DESIGN.md says: 7.** In the `sheet` runs with D held, `timer` read 0:19.3 at floor 2/5 and 0:48.8 at floor 4/5. The HUD shows `P1: HOLDING` and `Buddy: HOLDING`. I did not play local 2P or test 1/2/R this session.
2. **Rapier couch and 5-floor stairwell: 8.** The switchback flights, pink railings, landings and doors 1A, 2A, 3A and 4A all render. I did not reach the floor-5 landing.
3. **Slide-back, tumble and ragdoll with a comic burst: 5.** None of the three `sheet` frames shows a tumble, a player flat in ragdoll, or a THUD!, OOF! or CRUNCH! burst. Iteration 41 did not run the forced-tumble sheet, so a real tumble within the first minute is still unseen.
4. **HUD: 8.** `FLOOR n/5`, the timer, a `TILT` bar (0° at start, 40° at t10s, 23° at t25s) and the help line are in printed type and don't overlap. I did not see the WIN banner this session. The Iteration 41 note says it did show on a full run.
5. **Riso look as LOOK.md says: 8.** The five inks, halftone dots, grain, navy outlines and a lamp glow per floor all read. The frames sit close to LOOK-board.png. I did not check that the grain stays fixed on screen.
6. **Orthographic cutaway camera: 7.** The start frame and the t10s frame keep the couch and both players in view, so the clamp from Iteration 41 works. At t25s the camera frames floors 3 to 4 and the couch is small and low. I did not check the camera during a mid-flight tumble or in portrait.
7. **Toy hoodie characters and puffy couch: 7.** The teal and yellow hoodies and the tufted pink couch are chunky. At t25s they are small.
8. **Comic bursts and a lamp glow per floor: 5.** Lamps are on every floor. No burst appears in any of the three frames.
9. **`window.__game` and one `index.html` with vendor: 7.** `open` loads describe and the keys listing, and there are no console errors. `look` still reports "subject couch 0%" in all three cells, so the subject is still not resolved by `look`.

**Faults: 6.** There are no console errors. The `subject couch 0%` line is a fault and has now appeared in two sessions. `perf` read 126.9 ms a frame, 193 draw calls and 45,485 triangles, but on a SwiftShader software renderer with host load 7.1, so that is not a fault. The "Surface: BufferGeometry" mesh is the full-screen riso post-pass and is not a fault.

**Next:**
1. **Forced tumble with a ragdoll and bursts (asked again).** Use `look` with `sheet` of 3 moments (`state` or `steps` with `act` to release both grips at the top of flight 1, then frames 0, 40 and 120). It should show a player flat in ragdoll under the sliding couch, a CRUNCH! burst and an OOF! burst. Also check that the unscripted solo run produces a tumble in the first minute.
2. **Make `look` resolve the couch (asked again).** `look target:'couch'` should show the couch alone from four views, and a plain `look` should print a non-zero percentage for the subject. Name a visible child mesh `couch` (the puffy body) and point `__game.subject` at it, because the Group name alone is not read as a drawn object.
3. **Keep the couch big on the upper floors.** At floor 4 the couch and hoodies shrink to a small cluster at the bottom of the frame. Cap the zoom-out at floors 3 and 4 the way floors 1 and 2 are, and keep the couch in the central 60% of the view. The `sheet` frame at about 40 s should show a couch roughly as large as in the t10s frame.

SCORE: 6.8

## Iteration 42
**Did** `__game.subject` now points at the `couch_body` mesh (RoundedBox, named in the couch build) and `__game.scene`/`camera` are exposed. No gameplay change.
**Saw** `look` still says "Subject: couch_body drew no pixel" and `look target:'couch_body'` says "no object named couch_body in the main scene". The only thing `look` sees is the one full-screen "BufferGeometry" mesh (the riso post-pass, line ~165: scene renders to `rt`, then `postScene` to screen), so the harness's "main scene" is the post-pass scene. The picture itself is fine: couch and both hoodies fully visible on floor 1, no console errors. The forced-tumble sheet did not tumble: `setState couch.quat` (tilt 60°) had no visible effect (TILT stayed 0–2°), so no ragdoll or CRUNCH!/OOF! burst frame was captured. `perf` not run.
**Next** Force a tumble by exposing a debug hook (e.g. `__game.tumble()` calling `tumbleKick()` + release both players) and sheet it; if the subject must resolve for `look`, try adding the couch to the scene that is rendered last (or render the post-pass quad with the scene as a child) — or accept it as a harness limit; check zoom on floors 3–4 keeps the couch large.
**Open** Subject/target resolution unsolved (post-pass cause suspected, not confirmed). Tumble/burst still unseen in any frame.
