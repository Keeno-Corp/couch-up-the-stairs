The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

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

## Iteration 30
**Did** `updateCamera` in index.html: camera target y is now `c.y*.6 + my*.4 + .1` (was the plain average of couch and group), and the y follow rate is 6 (was 3.5), so the couch stays in frame. A trial with 0.7 weight and +.6 put stair boxes in front of the couch (2.3%); I reverted it.
**Saw** After a 300-frame Space+D hold the couch is 6.8% [607,31,975,382] and fully in frame (was cut by the top edge). Console clean, 0 HUD overlaps. 92% of the picture is orange. The stairwell is 57 boxes. The x=-3.00 shared face is still there. I ran no perf and played no floors 3–5 or WIN.
**Next** 1) Route-following input or setState to prove floors 4–5 and WIN. 2) Merge the stairwell boxes with `instances` and move one x=-3.00 box. 3) Tie the slip to the first switchback.
**Open** The couch is still only 6.8% of the picture, below the 8% asked for. The slip timing and slow-motion are unchecked.
