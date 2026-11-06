**Judge 84.** I played one solo run: key 1, D and Space held, until `floor` 5 at 27.8 s with `thuds` 5 and `slips` 1. I took one `look` and one `perf`. I did not try 2P or R, and I did not see WIN.

The `look` picture is stale again, as it was in judge 83. The HUD says FLOOR 5/5, but the canvas shows the floor-1/2 stairs and door "1A". The `postpass` picture is not redrawn after the long `until` run, so the floor-5 landing and the WIN banner were not visible.

**Scores**

1. **Plays as DESIGN.md says, 6.**
   - The couch went from floor 1 to floor 5 in 1684 frames with P1 and Buddy `gripping` throughout. `tilt` peaked at 40.4° at frame 575, and `burst.word` went WHOOPS! then THUD!.
   - The trace shows a real stumble: 5 thuds, 1 slip, and `burst.live` ["THUD!"].
   - It arrives at floor 5 with `tilt` 2.2° and both players "stand", so the run is still easy.
   - 2P and R were not tried.
2. **Rapier couch, 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN at floor 5, 6.**
   - The yellow flights, pink railings, green landings and cream floor lamps read well.
   - The mid-landing door label is now empty, which is good.
   - The floor-5 door "5A" and the WIN banner were not seen.
3. **Tumble, ragdoll, burst within the first minute, 5.**
   - Last session's trace showed "rag" states at frames 119–182. Here `burst.word` WHOOPS! started at frame 119, so the ragdoll event happens inside the first minute.
   - The picture still shows no burst word, so a viewer judged from `look` sees nothing.
4. **HUD in printed type, 8.**
   - `div#tl` "FLOOR 5/5 0:27.8", `div#tilt` "TILT 2°", `div#grips` and `div#help` are crisp, with 0 overlap and 0 cut off.
   - The WIN banner was not seen.
5. **Riso look, 8.**
   - The `postpass` frame has halftone on the stairs and doors, grain, misregistration, navy outlines and a cream, teal, yellow and pink palette.
   - It reads as the LOOK-board.
6. **Ortho side-on camera, 6.**
   - The couch and movers sit at the left, and the camera shows about two floors, not the whole cutaway.
   - `cam.y` is 17.26 (floor 5) while the picture shows floor 1/2, so I could not check that it follows.
7. **Toy hoodie characters and puffy couch, 7.**
   - The teal-hood P1, the cream-hood Buddy and the pink two-cushion couch are chunky and clear.
   - They are still somewhat smaller than mover.png and couch.png.
8. **Impact bursts and a lamp glow per floor, 4.**
   - The `burst` state exists, but it is an HTML overlay that no `look` captures, and the picture shows no THUD, OOF or CRUNCH word.
   - The lamps are drawn with a cream shade and a halftone glow.
9. **`window.__game` and starts playing on load, 7.**
   - `observe` gives `burst`, `states[]`, `dbg`, `couch` and `cam`. The `until` steps work, and the page is one `index.html`.
10. **Faults, 4.**
    - `look` says "couch drew no pixel; 0 of its 0 named parts show", although the couch is drawn.
    - The `postpass` picture went stale at floor 5.
    - `perf` is 129 ms a frame, 192 draw calls and 45.5k triangles on SwiftShader at host load 2.4. That is no signal, but 192 draw calls is a lot for a flat-ink scene.
    - WIN and 2P are unverified for a sixth session.

**Next:**
1. **Fix the stale `postpass` and show WIN (asked again).**
   - Make the post pass render on every `look` or paused step, so the picture matches `cam.y`. Check that the camera lands on the floor-5 landing and shows a printed WIN banner. Check that no WIN appears while the couch is on floor 4.
   - One call shows it done: `interact` with `until: {floor: [5, 9]}` and `look: true`. The picture should show door "5A" and a WIN card, with `cam.y` near 17.
2. **Put the burst word into the canvas (asked again).**
   - Draw THUD!/WHOOPS!/CRUNCH! as a sprite or in the post pass, driven by `burst.live`, so `look` captures it. Make it big, with a navy outline and pink or yellow fill, and shake the ink on impact.
   - One call shows it done: `interact` with `until: {burst: {n: [1, 99]}}`, `look: true` and a `sample` at the burst's pixels. The picture shows the large word.
   - Also make a player visibly flat during "rag", and check that `states` shows "rag" with a flat pose in the picture.
3. **Make the couch findable and the run harder.**
   - Name the couch group (`couch`, with `couch.mesh` as a child) so `look` lists its parts.
   - Add a buddy stumble every 8 to 12 s and a slip when `tilt` is over 40°, so a flat, comic tumble happens more than once per run. The aim is a run that arrives at floor 5 with `tilt` above 10° and at least 2 "rag" events. Check it by tracing `states` over 1700 frames.
   - Enlarge the movers and couch about 15% toward mover.png and couch.png, and keep the stairs and couch in frame.

SCORE: 6.1
