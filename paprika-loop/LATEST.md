The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 42

**Judge 42**

1. **Plays as DESIGN.md says: 7.** With D and Space held, `timer` read 0:19.0 at FLOOR 3/5 and 0:49.0 at FLOOR 4/5. The HUD shows `P1: HOLDING` and `Buddy: HOLDING`, and the `TILT` bar moves between 4° and 14°. The idle run at 0:39.1 is back on FLOOR 1/5 with the couch lying on its side at the foot of the flight, so the slide-back does happen. I did not play local 2P, 1/2/R, or the floor-5 WIN.
2. **Rapier couch and 5-floor stairwell: 8.** The switchback flights, pink railings, landings and doors 1A–5A all render. The couch visibly rides the flights. I did not reach the floor-5 landing.
3. **Slide-back, tumble and ragdoll with a comic burst: 5.** The idle40s cell shows the couch fallen at the bottom of floor 1. No player is flat in ragdoll and no THUD!, OOF! or CRUNCH! burst is in any of the four frames. Iteration 42 did not add the `__game.tumble()` hook it planned, so the tumble clip moment is still unproven.
4. **HUD: 8.** `FLOOR n/5`, the timer, the `TILT` bar, the P1/Buddy status chips and the help line are in printed type and don't overlap. I did not see the WIN banner this session.
5. **Riso look as LOOK.md says: 8.** The five inks, halftone dots, grain, navy outlines, a lamp glow per floor and the post-pass all read. The frames sit close to LOOK-board.png.
6. **Orthographic cutaway camera: 7.** The start frame keeps the couch and both players in view. On floors 3 and 4 the couch is still small and sits low in the frame, and the camera crops the lower flight. I did not check the camera in portrait.
7. **Toy hoodie characters and puffy couch: 7.** The teal and yellow hoodies and the tufted pink couch read as chunky toys at floor 1. They shrink on the upper floors.
8. **Comic bursts and a lamp glow per floor: 4.** Every floor has a lamp. No burst appears in any frame, including the idle40s frame after the couch fell.
9. **`window.__game` and one `index.html` with vendor: 7.** `open` loads describe and the keys listing and there are no console errors. `look` reads "subject couch_body 0%" and lists only "Mesh" as on screen, so the page still does not resolve the subject (third session).

**Faults: 6.** There are no console errors. `look` still shows "subject couch_body 0%", so the subject is unresolved. `perf` read 126.7 ms a frame, 193 draw calls and 45,485 triangles, but on a SwiftShader software renderer, so that is not a fault. The cost splits into the scene pass (84.8 ms) and the screen post-pass (37.2 ms).

**Next:**
1. **Forced tumble and a burst frame (asked again).** Add `__game.tumble()` that calls `tumbleKick()`, releases both grips and spawns the burst. Then run `look` with `sheet` on `{steps:[{action:'tumble'}], frames:30}` and frames 60 and 120. It should show a player flat in ragdoll and a CRUNCH! or OOF! burst. Also fire a burst when the couch lands after a slide-back, since the idle run slid back with no burst.
2. **Keep the couch big on floors 3 and 4.** At FLOOR 3/5 and 4/5 the couch and hoodies are small and low in the frame. Clamp the ortho zoom to the floor 1–2 size and centre on the couch. The `sheet` frame at about 49 s should show a couch roughly as large as in `t0`.
3. **Make `look` resolve the subject (asked again).** It reports "main scene" as the post-pass quad. Either add the couch mesh to the scene `look` treats as main (for example `scene.add` a hidden clone, or render the 3D scene to screen last with the post-pass as an overlay quad), or accept that harness limit and say so in DESIGN.md. After the change, a plain `look` should print a non-zero subject percentage.

SCORE: 6.7

## Iteration 43
**Did** Added `__game.tumble()` (releases grips, `tumbleKick()`, toast, `bang('CRUNCH!')`, knocks standing players); the natural TOO TILTED path in simStep now also fires `bang('CRUNCH!')`. Tightened the ortho zoom in `updateCamera` (`vh = VH + min(spread,1.5)*.3`) so floors 3–4 keep the couch larger.
**Saw** Sheet at floor 3 shows the couch and hoodies larger than before, no console errors. Sheet `steps:[{action:'tumble'}]` did not call `__game.tumble` (frame identical to t0, only a THUD! burst at start), so a tumble/CRUNCH! frame is still unseen. `look` still says "subject couch_body 0%". `perf` not run.
**Next** Trigger the tumble through `eval` (`__game.tumble()`) or by wiring it to `act`, then sheet it; for the subject, try rendering the 3D scene last or accept the harness limit.
**Open** Subject resolution unsolved. Tumble burst unverified visually. Floor-3 couch is still low in frame.
