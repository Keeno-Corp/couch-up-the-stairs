The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 81
**Did** `index.html` `printMat` fragment shader: reverted the `pin` hash to `floor(fp*.9)` (4 inks) and paper grain `hash(floor(fp))*.002`, which iteration 80 had coarsened. Nothing else changed.
**Saw** `interact` (key 1, hold D, until floor [3,9]) reached floor 3 at 15.3 s, thuds 4, slips 1, no console errors. The look at floor 3 now reads as the riso print again: teal, yellow and pink inks, halftone, doors 1A, railing, pink couch with both movers fully visible left of the stairs. That fixes the grey mush from judge 80. No burst word in this frame. `look` still reports "couch drew no pixel" although it is plainly on screen. `perf` not run.
**Next** Draw the couch and movers in front of the stair mesh when they overlap (renderOrder/depthTest); make `bang()` show a big THUD/OOF/CRUNCH over the couch and force a flat ragdoll when the couch slides over a player; run to the WIN banner at floor 5 and test 2P.
**Open** Couch and movers are small at VH 3.5. The `postpass` hash is solved by revert, but its cause was never isolated. WIN and 2P unverified.

### Judge 81

**Judge 81.** I played one solo run (key 1, hold D and Space) to `thuds` 3 and took one `look` and one `perf`. The page loads with no console errors. I did not try 2P, R or the WIN banner, so those parts are scored from what the run showed.

**Scores**

1. **Plays as DESIGN.md says, 6.** The solo run reached `floor` 4 at 21.7 s with `thuds` 3 and `slips` 1. P1 and Buddy were both `gripping`, and the Sound line shows grunt, oof and couchThud firing. The couch is climbing (`pos.y` 13.4, `tilt` 24.7). 2P and R were not tried.
2. **Rapier couch, 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN at floor 5, 6.**
   - The yellow flights, pink railings and green landings read well.
   - Two different floors both show a door labelled "1A" in the look at `floor` 4, so the door numbers look wrong.
   - WIN was not reached.
3. **Tumble, ragdoll, burst within the first minute, 4.** The run had 3 thuds and 1 slip, but the look caught no burst word and no flat ragdoll. Both movers were in `state` "stand".
4. **HUD in printed type, 8.** `div#tl` "FLOOR 4/5 0:21.7", the `div#tilt` meter, `div#grips` and `div#help` are crisp on cream cards with pink and teal misregistration, and none overlap. The WIN banner was not seen.
5. **Riso look, 8.** The `postpass` frame matches LOOK-board: teal, yellow, pink and cream inks, halftone gradients, grain, navy outlines and misregistration. The grey mush from judge 80 is gone.
6. **Ortho side-on camera, 6.** `cam.y` is 13.86 and the couch and both movers are fully visible left of the stairs. The zoom shows about 2 floors, not the whole cutaway, so the "keep the whole composition" focus is only partly met.
7. **Toy hoodie characters and puffy couch, 7.** The teal-hood mover, the cream-hood buddy and the pink couch with cushions are chunky and readable. They are still small in frame next to refs/sheets/mover.png and couch.png.
8. **Impact bursts and a lamp glow per floor, 4.** The floor lamps and ceiling bulbs are drawn, but no THUD, OOF or CRUNCH word showed in the look.
9. **`window.__game` and starts playing on load, 7.** `observe`, `interact` and the `until` steps work, and `describe` returned JSON.
10. **Faults, 5.**
    - `look` still says "couch drew no pixel" although the couch is plainly on screen.
    - `perf` is 118 ms a frame with 196 draw calls and 45.5k triangles. This is a software renderer with host load 2.3, so it is no signal.
    - The WIN, 2P and burst parts are unverified.

**Next:**
1. Make the tumble comedy visible. In `bang()`, draw a large "THUD!/OOF!/CRUNCH!" burst over the couch on slide and hit. Force a flat ragdoll when the couch slides over a player and hold it about 1.5 s. Check with `interact` with `until: {thuds: [5, 99]}` and `look: true`. A burst word and a mover with `state` "down" should show. This has been asked in judges 80 and 81 (asked again).
2. Enlarge the couch and movers: lower `VH` slightly, or scale the characters about 1.3×, so they match mover.png and couch.png. Check with `look` at `floor` 2; the couch should fill roughly 15% of the width. Fix the duplicate door labels so each floor shows its own 1A..5A. Also fix `couch drew no pixel` by giving the couch mesh a named group or `userData` that `look` can find (asked again).
3. Run to floor 5 and check the printed WIN banner. Use `interact` with `until: {floor: [5, 9]}` and then a few more frames, with `look: true`, to see the banner. Then try key 2 with arrows and Enter to test 2P. Fix the WIN-while-on-floor-4 bug if it appears.

SCORE: 6.1
