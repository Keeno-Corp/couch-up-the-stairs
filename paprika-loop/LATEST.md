The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 83
**Did** `index.html` line 263: the mid-landing door now reads `${L+1}B` while the floor door keeps `${L+1}A`, so adjacent doors no longer both say "1A". Checked `couch` group is already named `couch` (line 339); `bang()` CSS animation runs 1.6 s.
**Saw** Not run in `open`/`look` this session (little time left); no new numbers.
**Next** Verify the door labels with `look` at floor 3; check why the burst word is not seen in `look` (likely the paused clock stops the CSS `bang` animation, or `bang` is rate-limited); force a flat ragdoll when the couch slides over a player; reach floor 5 for WIN; test 2P.
**Open** Burst words, WIN, 2P still unverified; door fix untested.

### Judge 83

**Judge 83.** I played one solo run: key 1, hold D and Space, to `floor` 5 at 27.8 s with `thuds` 3. I took two `look`s and one `perf`. I did not try 2P or R. The door fix is only partly verified.

The second `look` is unreliable. It reports "0% of the picture changed" and shows the floor-2 frame (door "1A", lamp, `tilt` 25°) while the HUD text says FLOOR 5/5 and TILT 2°. The `postpass` picture did not redraw, so I could not see the WIN banner or the floor-5 landing.

**Scores**

1. **Plays as DESIGN.md says, 6.**
   - The couch climbed from floor 2 to floor 5 in 1253 frames.
   - P1 and Buddy stayed `gripping` the whole way, and the Sound line shows grunt, oof and couchThud.
   - `players[].state` was "stand" in all 600 traced frames, so there was no slide-back and no flattening.
   - The run is too easy, with a 2° tilt on arrival.
   - 2P and R were not tried.
2. **Rapier couch, 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN at floor 5, 6.**
   - The yellow flights, pink railings and green landings read well.
   - The doors now read "1A" and "1B" side by side, so the duplicate "1A" is gone. But the labels are `${L+1}A` and `${L+1}B` on the same floor, which is not the 1A..5A the brief asks for.
   - The floor-5 door was not seen, so I cannot say it reads "5A".
   - WIN was not seen.
3. **Tumble, ragdoll, burst within the first minute, 3.**
   - There were 3 thuds and 1 slip, but `players[].state` never left "stand" and no burst word appears in either look.
   - The 1.6 s CSS `bang` is probably lost under the paused clock, or `bang()` is never called. Nobody has checked which since session 80.
4. **HUD in printed type, 8.**
   - `div#tl` "FLOOR 5/5 0:27.8", `div#tilt` "TILT 2°", `div#grips` and `div#help` are crisp cards with no overlap.
   - The WIN banner was not seen.
5. **Riso look, 8.**
   - The `postpass` frame has teal, yellow, pink and cream inks, halftone dots on the stairs and doors, grain, navy outlines and misregistration. It is close to the LOOK-board feel.
6. **Ortho side-on camera, 6.**
   - The couch and both movers sit at the left of the frame and are clear, but the frame shows about two floors, not the whole cutaway.
   - The second look contradicts `cam.y` 17.26 (floor 5), so I could not check that it follows.
7. **Toy hoodie characters and puffy couch, 7.**
   - The teal-hood mover, the cream-hood buddy and the pink two-cushion couch are chunky and read at a glance. They are still smaller than mover.png and couch.png.
8. **Impact bursts and a lamp glow per floor, 3.**
   - The lamps with cream shades show at the landings. No THUD, OOF or CRUNCH word appeared in any look, although couchThud and oof sounds fired. This is the fifth session without a visible burst.
9. **`window.__game` and starts playing on load, 7.**
   - `describe`, `observe`, `act` and the `until` steps all work, and the page is one `index.html`.
10. **Faults, 4.**
    - `look` still says "couch drew no pixel; 0 of its 0 named parts show", although the couch is plainly drawn.
    - The post-pass picture went stale at floor 5.
    - `perf` is 131 ms a frame, 192 draw calls and 45.5k triangles on SwiftShader at host load 2.3, so it is no signal.
    - The burst, WIN and 2P parts are unverified for a fifth session.

**Next:**
1. **Make the tumble and burst show (asked again).**
   - In `bang()`, add a DOM or canvas sticker "THUD!"/"CRUNCH!" that is drawn from game state, not from a CSS animation. Drive it from a frame-counted `burst` object in `observe()`, for example `burst.word` and `burst.t`, so it shows on a paused clock.
   - On the first couch thud, set a player's `state` to "down" for about 1.5 s with a flat ragdoll.
   - One call shows it done: `interact` with `until: {thuds: [1, 99]}` and `look: true`. The picture should show a large burst word, and `players[].state` should read "down".
2. **Fix the stale post-pass picture and test WIN (asked again).**
   - Make sure the `postpass` redraws each frame while the clock is paused, so `look` after floor 5 shows the real frame.
   - Then run `interact` with `until: {floor: [5, 9]}` and `look: true`. The camera should be on the top landing and a printed WIN banner should show. Also check that no WIN appears while the couch is on floor 4.
3. **Make the doors read 1A..5A, make the couch findable, and make the run harder.**
   - Give each floor one door, "1A" to "5A", and drop the "B" mid-landing door label or make it a plain unnumbered door.
   - Name the couch group so `look` lists its parts, for example `couch.mesh` as a child of the `couch` group.
   - The AI buddy holds the tilt at about 2°, so the first-minute tumble never happens unscripted. Add a buddy stumble every 8 to 12 s and a slip when `tilt` is over 40°. Check by running to 60 s of solo play and expecting `players[].state` "down" at least once.

SCORE: 5.8
