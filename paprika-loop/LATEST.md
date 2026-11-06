The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 43
**Did** Added `__game.tumble()` (releases grips, `tumbleKick()`, toast, `bang('CRUNCH!')`, knocks standing players); the natural TOO TILTED path in simStep now also fires `bang('CRUNCH!')`. Tightened the ortho zoom in `updateCamera` (`vh = VH + min(spread,1.5)*.3`) so floors 3–4 keep the couch larger.
**Saw** Sheet at floor 3 shows the couch and hoodies larger than before, no console errors. Sheet `steps:[{action:'tumble'}]` did not call `__game.tumble` (frame identical to t0, only a THUD! burst at start), so a tumble/CRUNCH! frame is still unseen. `look` still says "subject couch_body 0%". `perf` not run.
**Next** Trigger the tumble through `eval` (`__game.tumble()`) or by wiring it to `act`, then sheet it; for the subject, try rendering the 3D scene last or accept the harness limit.
**Open** Subject resolution unsolved. Tumble burst unverified visually. Floor-3 couch is still low in frame.

### Judge 43

**Judge 43** (restated with the Surface note settled)

The `Surface: "BufferGeometry" … dense fine detail` line comes from the riso grain and halftone post-pass. The brief asks for both, so I treat it as intended. It doesn't lower the score, and a lighter grain stays as a small item under Next 3.

1. **Plays as DESIGN.md says: 7.** Holding D and Space reached FLOOR 4/5 at 0:33.4 with `crashes` 2, `thuds` 4 and `slips` 3, and both grips read HOLDING. I did not play local 2P, 1/2/R, or the floor-5 WIN.
2. **Rapier couch and 5-floor stairwell: 8.** The switchbacks, railings, landings and doors 1A–5A render, and the couch is carried up to floor 4. I did not reach the floor-5 landing.
3. **Slide-back, tumble and ragdoll with a comic burst: 6.** `__game.tumble()` made Buddy's `state` read `rag`, showed "TOO TILTED!" and a CRUNCH! star burst, and a natural crash came within 34 s. No flattened player is visible in the frame, because the camera is at y 15.98 and Buddy is at y 10.9.
4. **HUD: 8.** `FLOOR n/5`, the timer, the `TILT` bar, the P1/Buddy chips and the toast show in printed type with 0 overlap. I did not see the WIN banner.
5. **Riso look: 8.** The five inks, halftone, grain, navy outlines and misregistration read, and the frame is close to LOOK-board.png.
6. **Orthographic cutaway camera: 6.** At floor 4 the couch is mid-frame but small, and a fallen player is cropped out.
7. **Toy hoodie characters and puffy couch: 6.** Both read well at floor 1 and match the sheets, but the players are out of frame or tiny at floor 4.
8. **Comic bursts and a lamp glow per floor: 7.** CRUNCH! is large and legible, and lamps show on every floor. I did not see a burst on a natural slide.
9. **`window.__game` and one `index.html` with vendor: 7.** The `__game` methods, including `tumble`, are present and there are no console errors. `look` still says "couch_body drew no pixel", the fourth session in a row.

**Faults: 6.** There are no console errors. The subject is unresolved in `look`. `perf` read 127 ms a frame on SwiftShader, 191 draw calls and 45,473 triangles. That is not a fault on a software renderer.

**Next:**
1. **Keep the players in frame on every floor.** In `updateCamera`, centre on the midpoint of the couch and both players, with a lower bound on the zoom. After `__game.tumble()` at FLOOR 4, `look` should show the ragdolled Buddy next to the burst.
2. **Fire the comic burst on a natural slide-back and on every ragdoll.** Add `bang('OOF!')` when a player's state turns `rag` and `bang('THUD!')` on couch landings. A plain hold-D run with `interact` look should show a burst at each `crashes` and `thuds` event.
3. **Make the subject resolve in `look`.** Render the 3D scene to screen last with the post-pass as an overlay quad, or add a copy of `couch_body` under the scene `look` treats as main. A plain `look` should then print a non-zero percentage for the subject. Also lower the grain contrast a little so the "reads as noise" Surface line goes away.

SCORE: 6.9
