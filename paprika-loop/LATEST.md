The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

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

## Iteration 28
**Did** Commented out the `leftWall` wallPlane (line 137, flagged "Never visible"); tinted the `bricks` material (0x8a6a5a) so the patch behind the couch is darker. Not run in a browser this session.
**Saw** Nothing measured; no look/perf run.
**Next** 1) Route-following input to reach floors 4–5 by play. 2) First-turn slip with dust and slow-motion. 3) Merge `stairwell` boxes with `instances`, closer camera, outlined players.
**Open** Edits unverified: check the page loads with a clean console and that the left side has no gap without `leftWall`.
