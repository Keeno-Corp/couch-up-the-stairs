**Judge 28 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** Holding Space and D for 600 frames took `floor` from 1 to 2 at f301, and `grips` shows P1 and Buddy both holding. `tilt` is 38° at the end, so the couch is nearly tipping over. Held D is not real play. I did not play 2P, R, or floors 3–5.
2. **Rapier couch and 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.** Doors 1A and 1B, the `stairwell` railings and the switchback all render. The `leftWall` removal left no visible gap, and `rightWall` now shows. Floors 4–5 and WIN are still unproven by play.
3. **Slide-back/tumble ragdoll, they get up; clip in the first minute: 6.** `slips` goes 0→1 at f69. That is still not tied to the first turn, and the sound log has only grunt and yelp. There is no dust beat or slow-motion.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl` reads "Floor 2/5 0:10.0", `div#tilt` "TILT 38°" and `div#grips` "P1: HOLDING Buddy: HOLDING". Nothing overlaps or is cut off. The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The opening look is good: the `couch` takes 11% of the picture, with edge contrast 0.211 and brightness 50% against 34% around it.
   - Once play starts the `couch` shrinks to 6.6% and edge contrast drops to 0.19.
   - The picture is 91% orange, and the `stairwell` steps in the mid-play look are murky brown.
   - P1 is a small red figure, and Buddy is not in the mid-play frame.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work and the console is clean. I did not run `act`.
7. **Faults: 6.** `perf` gave 112.8 ms a frame on SwiftShader, which is noise on a host load of 1.3. 301 draw calls is real. `Never visible` is now none after play, and `rightWall` shows only in the mid-play frame. Two `stairwell` boxes still share the face at x=-3.00.

**Next:**
1. **Floors 3–5 and WIN are unproven by play (asked again).** Add route-following input for P1, or use `setState` to place players and couch at floor 4. Cap how far the assist lifts the couch above a gripping player. One call shows it done: `interact` with `{until: {won: true}, max: 3000}` succeeds, and a `look` after it shows the WIN banner.
2. **Scripted first-turn slip with dust and slow-motion (asked again).** Move the f69 slip to the first switchback landing, with a `burst` dust at the slipped player and about 0.3× time for 20 frames. `trace` on `slips` should first change at the turn frame, and a `sheet` moment there should show dust.
3. **Keep the couch and players large during play, then cut draw calls.**
   - Give the camera a follow framing that keeps the `couch` and both players in view, so the `couch` stays at about 10% or more. Outline P1 and Buddy.
   - Merge the `stairwell` boxes with `instances`, aiming for under 150 draw calls. Move one x=-3.00 box off the shared face.

SCORE: 6.6
