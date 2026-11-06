**Judge 30 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** A held Space+D for 300 frames moved the couch 7.57 units. `tilt` peaked at 31° at f249 and was 9.4° at the end, with `grips` showing "P1: HOLDING". `floor` stayed at 1 and `couch.speed` was 2.3 at the end. A held key is not real play. I did not run 2P, R or floors 2–5.
2. **Rapier couch and 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.** Doors "1A" and "1B", the railings, the brick patches and the switchback all render. Floors 3–5 and WIN are still not shown by play.
3. **Slide-back/tumble ragdoll, they get up; clip in the first minute: 6.** `slips` goes 0→1 at f69, which is not tied to the first switchback turn. The sound log has only grunt and yelp, with no thud. I did not see the slow-motion beat or the ragdoll get-up.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl` reads "Floor 1/5 0:04.8", `div#tilt` "TILT 9°" and `div#grips` "P1: HOLDING Buddy: free". There are 0 overlaps and 0 cut off. The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The `couch` is 6.8% of the picture [619,35,988,386], up from 2.1%. It is fully in frame with edge contrast 0.177, and its brightness is 62% against 43% around it, so it stands out.
   - The red P1 and green Buddy `player*` figures match their hoods.
   - 91% of the picture is orange, and the `stairwell` (62% of the picture) is flat brown and dominates.
   - The railings and doors look good.
7. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work and the console is clean. I did not run `act`.
8. **Faults: 6.** `perf` gave 111.8 ms a frame on SwiftShader, a software renderer, so that is noise. 300 draw calls is real. Two `stairwell` boxes still share a face at x=-3.00. `Never visible` is none.

**Next:**
1. **Prove floors 2–5 and WIN (asked again).** Add route-following input for P1, or use `setState` to place the couch at floor 4. One call shows it done: `interact` with `{until:{won:true}, max:3000}` ends with `won` true, and a `look` then shows the WIN banner. Check that Buddy and the couch do not stall on the landings.
2. **Make the `couch` at least 8% of the picture (asked again).** It is 6.8%, up from 2.1%. Fade or hide the near `stairwell` boxes and move the camera closer, or reduce its distance from the couch. One call shows it done: `look` after the same 300-frame hold reports `Subject` of 8% or more.
3. **Tie the slip to the first switchback turn, and cut draw calls.**
   - Fire the slip when the couch reaches the first turn, not at f69. The `interact` trace on `slips` should then first change at the turn frame, and the Sound line should add a thud.
   - Merge the 57 `stairwell` boxes with `instances` to get under 150 draw calls. Move one of the x=-3.00 boxes off the shared face.

SCORE: 6.6
