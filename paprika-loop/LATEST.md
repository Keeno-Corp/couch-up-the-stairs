The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 25
**Did** Found the floor-2 stall: in the route assist (`simStep`, `tg.y = Math.min(tg.y + .8, my + 1.1)`) the couch's target height is capped to the nearest gripping player's y + 1.1. With D held, P1 is dragged along the low route, far below the couch (P1 y 5.4 vs couch 6.66 at the first mid landing), so the target sat under the flight-2 steps (tops ≈6.9) and the couch jammed against `L1F2` boxes at x≈3.3. Cap raised to `my + 1.9`.
**Saw** `interact` Space+D held, `until floor 3`: met at f1039 (was never met), console clean, thuds 2, slips 1. Continuing to `won` failed: the couch stalled on floor 3 (x .54, y 8.68, tilt 31°) because P1 (held D only) is at y 2.68, ~6 m below it, and Buddy dropped his grip (slot -1, stretch 2.9). `look` and `perf` not run.
**Next** 1) Play floors 3–5 with a scripted climbing route (steer P1 along the `route` samples, not just D) and check the WIN banner; consider capping how far the assist lifts the couch above any gripping player (drop the grip or slow it so players are not left 6 m below). 2) Scripted first-turn slip with dust + 0.3× beat. 3) Merge `stairwell` boxes with `instances`, remove `leftWall`, lighten the stairwell.
**Open** Held-D is not a real player: players get dragged on the grip spring instead of climbing, so WIN by that input is unproven; the tilt peaks at 40° around f576-600 (a tumble). Draw calls (~300) and the `leftWall` fault are untouched.

### Judge 25

**Judge 25 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** I held Space and D with `until floor 3`, and it was met at f1039 (it never was before).
   - `floor` went 1→2 at f304, and the final state has P1 "gripping" true and Buddy slot 2.
   - Held D is not real play. P1 is at y 6.94 and Buddy at y 5.42 (`stretch` 2.77, `lead` -16, `cI` 51 against `myI` 35), so Buddy lags well behind the couch.
   - `tilt` still peaks at 40° at f600. I did not reach floors 4–5 or WIN, and I did not play 2P or R.
2. **Rapier couch + 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.** Doors 2A and 2B, the railings, the switchback and a plant all render, and the couch now reaches floor 3. Floors 4–5 and WIN have still not been reached by playing.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 6.** `slips` is 0→1 at f69, which is still not tied to the first turn. There are 2 `thuds`, and the sound log has grunt, yelp and `couchThud`. There is no dust beat and no slow-motion. The `sparks` object is tiny.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl` reads "Floor 3/5 0:17.3", `div#tilt` "TILT 19°" and `div#grips` "P1: HOLDING Buddy: HOLDING". There is 0 overlap and nothing is cut off. `div#help` is small. The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** The picture is 96% orange.
   - The `couch` takes only 5.9% of the picture, brightness is 57% against 39% around it, and edge contrast is 0.118.
   - The couch sits against a brick patch and orange railings, so it blends in.
   - The player is a small red blob and Buddy is not visible in the frame.
   - The `stairwell` stays a dark, murky brown with transparent-looking railing and slab streaks.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work and the console is clean. I did not run `act`.
7. **Faults: 5.** `perf` gave 112.8 ms a frame on SwiftShader, which is noise. 302 draw calls is real. `leftWall` is "Never visible". Two `stairwell` boxes share the face at x=-3.00. The floor 3 stall and the 6 m lag between the couch and the players are open.

**Next:**
1. **Floors 3–5 and WIN are unproven, and the assist hauls the couch away from the players (asked again).** Replace held D with a route-following input that steers P1 along the `route` samples (or use `act`/`setState` to place the players on floors 4 and 5). Cap how far the assist lifts the couch above any gripping player, or drop the grip, so nobody is left 6 m below. It is done when `interact` with `{until: {won: true}, max: 3000}` succeeds and `look` shows the WIN banner.
2. **Scripted first-turn slip with dust and a 0.3× beat (asked again).** Move the f69 slip to the first switchback and give it a `burst` dust and a short slow-motion. `trace` on `slips` should first change at the turn frame, and a `sheet` moment should show dust beside the knocked player.
3. **Make the couch and players stand out, then cut draw calls.**
   - Darken the brick patch behind the couch and make the railings less orange. Make the red P1 and the green Buddy larger or outlined, and give the camera a closer framing so the `couch` takes about 10% or more. `look` with `sample` should show edge contrast above 0.2.
   - Merge the `stairwell` boxes with `instances` to get under about 150 draw calls. Remove `leftWall` and move one x=-3.00 box off the shared face.

SCORE: 6.4
