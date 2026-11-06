The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 29
**Did** Added `slowT` in index.html: the buddy slip (`slipFlag` block) now sets `slowT = .35`, and `loop` runs the sim at 0.3× while it counts down. Dust `burst` on the slip was already there.
**Saw** Page loads, console clean. Holding Space+D 500 frames: slips 0→1 at f69, floor 1→2 at f317, tilt 19°, 0 off-screen HUD. The couch is 2.1% of the picture (small, high up-left); the stairwell wall block dominates the frame. Floors 3–5 and WIN were not played this session. Two `stairwell` boxes still share x=-3.00.
**Next** 1) Camera framing that keeps the couch and both players large. 2) Route-following input to prove floors 4–5 and WIN. 3) Merge the `stairwell` boxes (draw calls ~300).
**Open** The slip fires at f69, not tied to the first switchback landing. The slow-motion was not checked frame by frame.

### Judge 29

**Judge 29 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** Holding Space+D for 400 frames took `floor` from 1 to 2 at f317, and `grips` shows P1 holding. `tilt` peaked at 31° at f249 and fell to 0.03°. The couch `speed` is 0.09, so it stalled after f345. A held key is not real play. I did not run 2P, R or floors 3–5.
2. **Rapier couch and 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.** Door "1B", the railings, the switchback and the landing all render. Floors 3–5 and WIN are still unproven by play.
3. **Slide-back/tumble ragdoll, they get up; clip in the first minute: 6.** `slips` goes 0→1 at f69. That frame is not tied to the first switchback turn. The sound log has only grunt and yelp. The builder's slow-motion was not confirmed.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl` reads "Floor 2/5 0:06.4", `div#tilt` "TILT 0°" and `div#grips` "P1: HOLDING Buddy: free". There are 0 overlaps and 0 cut off. The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.**
   - The `couch` is 2.1% of the picture [675,112,799,381], with edge contrast 0.144, and it is mostly tucked behind the stairs wall.
   - The `stairwell` wall block (58% of the picture) dominates and is flat brown.
   - 92% of the picture is orange.
   - The `player*` figures (red P1, green Buddy) are big, readable and match the hoods.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work, and the console is clean. I did not run `act`.
7. **Faults: 6.** `perf` gave 111.7 ms a frame on SwiftShader, which is noise. 301 draw calls is real. Two `stairwell` boxes still share the face at x=-3.00. `Never visible` is none.

**Next:**
1. **Camera framing keeps the `couch` large (asked again).** The `couch` is 2.1% of the picture and the `stairwell` wall hides it. Aim the follow camera at the midpoint of the `couch` and both players, and pull it out from behind the wall block, for example by hiding or fading the near `stairwell` boxes. One call shows it done: `look` after the same 400-frame hold reports `Subject` of 8% or more, with `couch` visible.
2. **Prove floors 4–5 and WIN (asked again).** Add route-following input for P1, or use `setState` to place the couch at floor 4. The call that shows it done is `interact` with `{until:{won:true}, max:3000}`, and a `look` then shows the WIN banner.
3. **Tie the slip to the first switchback landing, and cut draw calls.**
   - Fire `slips` when the couch reaches the first turn. `trace slips` should then first change at the turn frame instead of f69, and a `sheet` moment there should show the dust `burst`.
   - Merge the 59 `stairwell` boxes with `instances` to get under 150 draw calls. Move one of the x=-3.00 boxes off the shared face.

SCORE: 6.4
