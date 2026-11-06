The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 31

**Judge 31 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** A held Space+D for 300 frames moved the `couch` 7.63 units with `tilt` peaking at 31° at f246. `grips` shows "P1: HOLDING". `floor` stayed at 1 and `won` stayed false. The brief's 1/2/R keys and P2 were not played.
2. **Rapier couch and 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.** Doors "1A" and "1B", the railings, the brick patches and the switchback all render. Floors 2–5 and WIN are still not shown by play.
3. **Slide-back/tumble ragdoll, they get up; clip in the first minute: 6.** `slips` goes 0→1 at f69, which is not tied to the first turn. The sound log has grunt and yelp, no thud. The ragdoll get-up was not seen.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl` reads "Floor 1/5 0:04.7", `div#tilt` "TILT 9°" and `div#grips` "P1: HOLDING". There are 0 overlaps and 0 cut off. The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The `couch` is 8.7% of the picture [605,51,1022,448]. It is fully in frame after the +.5 camera change, brightness 64% against 44%, edge contrast 0.185.
   - The red P1 and green Buddy `player*` figures match their hoods.
   - 92% of the picture is orange, and the flat brown `stairwell` (60%) dominates.
   - The railings and doors look good.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work and the console is clean. I did not run `act`.
7. **Faults: 6.**
   - `perf` gave 119.7 ms a frame at host load 1.4. That is SwiftShader, a software renderer, so it is noise.
   - 287 draw calls is real.
   - Two `stairwell` boxes share a face at x=-3.00.
   - `Never visible`: `rightWall`, 21 units and in view.

**Next:**
1. **Prove floors 2–5 and WIN (asked again).** Give P1 route-following input, or use `setState` to put the `couch` and players at floor 4. One call shows it done: `interact` with `{until:{won:true}, max:3000}` ends with `won` true, and a `look` then shows the WIN banner. Check that Buddy and the couch do not stall on the landings.
2. **Tie the slip to the first switchback turn, and add a thud (asked again).** Fire it when the couch reaches the first turn, not at f69. The `interact` trace on `slips` should then first change at the turn frame, and the Sound line should list a thud.
3. **Cut draw calls and fix the wall faults (asked again).**
   - Merge the 55 `stairwell` boxes with `instances` to get under 150 draw calls. `perf` should report under 150.
   - Move one of the x=-3.00 boxes at least 0.000075 units off the shared face.
   - Fix `rightWall`, which is in view but has no pixel (`Never visible`), by making it visible or removing it.

SCORE: 6.6

## Iteration 33
**Did** Removed the never-visible `rightWall` plane (colliders stay). Offset the landing slab boxes at line 175 by 0.0002 from x=-3.00 (`XL`) so they no longer share a face with the ground slab. Not re-opened or looked at in this session.
**Saw** No tools run; the edits are one-line and untested.
**Next** 1) Open and `look` to check the `Never visible` and shared-face lines are clear. 2) Merge the `stairwell` boxes with `instances` (about 300 draws). 3) Route-following input to reach floors 2–4 by real play.
**Open** The draw count is unchanged. Floors 2–4 are unproven by real play. The slip is already tied to the L0F1 progress (>0.2) in code, but the judge saw f69; I did not check it.
