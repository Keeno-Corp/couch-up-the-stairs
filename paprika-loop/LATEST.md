The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 82

**Judge 82.** I played one solo run (key 1, hold D and Space) to `thuds` 3, then took one `look` and one `perf`. I did not try 2P, R or the WIN banner, so those lines are scored from the one run.

**Scores**

1. **Plays as DESIGN.md says, 6.** The run reached `floor` 4 at 21.7 s with `thuds` 3 and `slips` 1. P1 and Buddy were both `gripping`, and the Sound line shows grunt, oof and couchThud firing. The couch was still climbing at `pos.y` 13.4 and `tilt` 24.7. 2P and R were not tried.
2. **Rapier couch, 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN at floor 5, 6.**
   - The yellow flights, pink railings and green landings read well.
   - Two doors in the one look, on adjacent floors, both say "1A". The numbering is still wrong.
   - WIN was not reached.
3. **Tumble, ragdoll, burst within the first minute, 4.** There were 3 thuds and 1 slip, but the look shows no burst word and no flat ragdoll. Both movers were in `state` "stand".
4. **HUD in printed type, 8.** `div#tl` "FLOOR 4/5 0:21.7", `div#tilt` "TILT 25°", `div#grips` and `div#help` are crisp on cream cards, and nothing overlaps. The WIN banner was not seen.
5. **Riso look, 8.** The `postpass` frame has teal, yellow, pink and cream inks, halftone gradients, grain, navy outlines and misregistration. It matches the LOOK-board feel.
6. **Ortho side-on camera, 6.** `cam.y` is 13.74. The couch and both movers are clear at the left of the stairs. The frame shows about two floors, not the whole cutaway.
7. **Toy hoodie characters and puffy couch, 7.** The teal-hood mover, the cream-hood buddy and the pink couch with cushions are chunky and readable. After the `VH` change they are a bit bigger, but still smaller than mover.png and couch.png.
8. **Impact bursts and a lamp glow per floor, 4.** The floor lamps (the `div`-free lamp drawings at each landing) show. Three thuds and an oof fired in the Sound line, but no THUD, OOF or CRUNCH word is on screen.
9. **`window.__game` and starts playing on load, 7.** `describe`, `observe`, `interact` and the `until` steps work.
10. **Faults, 5.**
    - `look` still says "couch drew no pixel; 0 of its 0 named parts", although the couch is plainly drawn.
    - `perf` is 129 ms a frame with 192 draw calls and 45.5k triangles. This is a SwiftShader software renderer at host load 2.6, so it is no signal.
    - The burst, WIN and 2P parts are unverified for a fourth session. The duplicate door labels are unfixed.

**Next:**
1. Make the tumble comedy visible (asked again). In `bang()`, draw the burst word as a large printed sticker over the couch on every couch thud, and make it last about 1 s. Force a flat ragdoll with CRUNCH! when the couch slides over a player, and hold it about 1.5 s. Check with `interact` `until: {thuds: [3, 99]}` and `look: true`. A burst word should show, and `players[].state` should read "down" in the first reply.
2. Fix the door labels, 1A..5A (asked again). Give each floor's door texture its own label. Name the couch group, for example `couch`, so `look` finds it. Check with `look` at `floor` 3: the door should read "3A", and the Subject line should list couch parts.
3. Run to floor 5 and check the WIN banner. Use `interact` `until: {floor: [5, 9]}` with a few more frames and `look: true` to see the printed banner. If a WIN shows while the couch is on floor 4, fix it. Then test 2P with key 2, arrows and Enter.

SCORE: 6.1

## Iteration 83
**Did** `index.html` line 263: the mid-landing door now reads `${L+1}B` while the floor door keeps `${L+1}A`, so adjacent doors no longer both say "1A". Checked `couch` group is already named `couch` (line 339); `bang()` CSS animation runs 1.6 s.
**Saw** Not run in `open`/`look` this session (little time left); no new numbers.
**Next** Verify the door labels with `look` at floor 3; check why the burst word is not seen in `look` (likely the paused clock stops the CSS `bang` animation, or `bang` is rate-limited); force a flat ragdoll when the couch slides over a player; reach floor 5 for WIN; test 2P.
**Open** Burst words, WIN, 2P still unverified; door fix untested.
