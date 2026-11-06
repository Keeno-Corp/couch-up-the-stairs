**Judge 37 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.**
   - Holding Space+D for 200 frames put `couch` at x 3.11, y 2.97 on Floor 1/5 at 0:03.1, with `grips.0` P1 on slot 0.
   - Buddy's `grips.1.slot` fell to -1 after his slip, so he is off the couch.
   - 1/2/R and P2 were not played, and `act` was not run.
2. **Rapier couch, 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.**
   - Door "1B" (the label in the look; the brief says 1A), the `stairwell` railing posts, the brick gap and the stair treads all read.
   - Floors 2–5 and the WIN landing were not reached this session.
3. **Slide-back/tumble ragdoll, get up; clip in first minute: 7.**
   - `slips` went 0→1 at f117 (about 2 s of play). `players.1.state` changed "stand"→"rag" and `div#toast` showed "WHOOPS! BUDDY SLIPPED!".
   - The sound line reports a grunt and a yelp.
   - The look at f202 shows only the green hood, partly cut off at the bottom-left. The `couch` is the clear subject, but the tumble itself is hard to read.
   - Buddy's get-up was not re-checked. The last session saw "rag" until f273, so Buddy is out for about 2.6 s.
   - Nobody is bowled over: P1 stayed "stand".
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 9.**
   - `div#tl` "Floor 1/5 0:03.1", `div#tilt` "TILT 31°", `div#grips` "P1: HOLDING Buddy: *KO*" and `div#toast` show. There are 0 overlaps, 0 off-screen and 0 cut off.
   - The toast text is low-contrast orange on the orange wall.
   - The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The Subject `couch` is 16% of the picture at [554, 324, 1114, 694]. It is brighter than its surround (57% against 34%), with edge contrast 0.19.
   - `player*` is now 5.3%, up from 0.46%, but the box [231, 586, 815, 799] still reaches the bottom edge. The red hood is half cut off and the green one is mostly hidden behind the railing.
   - The picture is 85% orange and 11% red, so the scene is still monochrome warm.
   - The `couch` model, its cushions and the paper read well.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.**
   - `describe` and `observe` work (`dbg.couchIdx` 10, `lv`, `inp`), and the console is clean.
   - `act` and `setState` were not run.
7. **Faults: 6.**
   - `perf` gave 116.8 ms a frame at host load 1.4 on SwiftShader, so it is noise.
   - Draw calls are still 286 (unchanged for six sessions), with 19,700 triangles.
   - `Never visible` is none, and there are no `Lighting:` or `Surfaces:` fault lines.
   - Buddy's `dbg.lead` was -4 and `stretch` 2.06 at f117.

**Next:**
1. **Frame the players and make the tumble readable.**
   - The red hood is clipped at the bottom, so lift the camera target or move it back by about 1 unit so both hoods sit fully in frame.
   - On the slip, add a short shake, dust `burst` and a quick camera nudge toward Buddy.
   - `look` with `sample` at the bottom pixels (about y 760) should show no hood cut at the edge, and `player*` should not reach y 799.
2. **Make Buddy's get-up and rejoin fast.**
   - The last session saw "rag" until f273, about 2.6 s. Return him to "stand" sooner and re-grab slot 2 within about 1 s.
   - Last session `lead` was -9 at f491 after the slip.
   - `interact` Space+D x500 with `trace: ["players.1.state", "players.1.dbg.lead", "grips.1.slot"]` should show `state` back to "stand" by about f200 and `grips.1.slot` returning to 2.
3. **Cut 286 draw calls.**
   - Merge the 42 `stairwell` boxes by material, or use `instances` from `fx.js`.
   - `perf` should report under 150 draw calls.
   - Also add a green or blue accent (for example a rug, a plant or a coloured door) to break the 85% orange.

SCORE: 7.0
