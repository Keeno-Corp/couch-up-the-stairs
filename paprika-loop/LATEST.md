The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 33

**Judge 33 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** Holding Space+D moved the `couch` through all 5 floors to `won: true` at frame 2648, with `thuds` at 3 and Buddy in `grips` as "HOLDING". The route works, but the `couch` climbed 17 units while Buddy trailed at `lead` -78 and `stretch` 12.28. The 1/2/R keys and P2 were not played.
2. **Rapier couch, 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 8.** `floor` went 1→2 at f314 and reached 5, "Floor 5/5 · HOME!". Door "4A" and the brick patch show. The `couch` slides up along the railing.
3. **Slide-back/tumble ragdoll, get up; clip in first minute: 6.** `slips` goes 0→1 at f69 and the Sound line lists grunt and yelp, with `couchThud` now present. The slip still fires at f69, before the first turn, and a ragdoll get-up was not seen. The WIN banner says "0 crashes" despite the slip.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 9.** `div#tl` reads "Floor 5/5 · HOME! 0:43.8". `div#tilt` and `div#grips` show, and the `div#win` "WIN! 0:43.8 · 0 crashes" renders cleanly. There are 0 overlaps and 0 cut off.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The start frame shows an orange `couch` with a green Buddy and a red P1.
   - The `couch` is 13% of the picture, brightness 53% against 38%, edge contrast 0.219.
   - 87% of the picture is orange, and the flat brown `stairwell` is 52–63% of it.
   - The WIN frame is dark: brightness 23%, with the `couch` at 9% cut by the frame edge.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work and the console is clean. I did not run `act`.
7. **Faults: 6.**
   - `perf` gave 115 ms a frame at host load 2.0. That is SwiftShader, so it is noise.
   - 286 draw calls is real and unchanged.
   - Two `stairwell` boxes share a face at x=-3.00 (needs 0.00022) and at z=-1.60 (needs 0.000041).
   - `rightWall` is gone and `Never visible` is none, so that part is fixed.

**Next:**
1. **Tie the slip to the first switchback turn (asked again).** The slip should fire when the `couch` reaches the first 180° turn, not at f69. It should also count toward the WIN banner's crashes. One call shows it done: `interact` with the same Space+D hold and `trace: ["slips"]`. It should then show the first change at the turn frame (about f250–300) instead of f69, and the WIN text should show "1 crashes" or more.
2. **Cut draw calls and fix the shared faces (asked again).**
   - Merge the 59 `stairwell` boxes with `instances`, or merge their geometries per material.
   - Move a landing slab at least 0.00022 off x=-3.00 and a box at least 0.000041 off z=-1.60. The offset applied last session was 0.0002, which is under the 0.00022 needed.
   - `perf` should report under 150 draw calls, and the `look` surfaces lines should disappear.
3. **Keep the couch and both players in frame, and make Buddy keep up.**
   - The `couch` is cut by the frame edge in both looks. Frame the midpoint of P1, Buddy and the `couch`, and lighten the dark upper floors.
   - A 78-index `lead` gap means Buddy is not carrying. Make Buddy pace the `couch` so the clip reads as two people hauling it.
   - One call shows it done: a `look` at the f2000 state should show the `couch` fully inside the frame, with Buddy's `lead` under 10.

SCORE: 7.1

## Iteration 34
**Did** Slip threshold for L0F1 raised from progress 0.2 to 0.5 (nearer the first turn); WIN banner crashes now `tumbles + slipsDone`; landing slab offset in `XL + .0004` (above the 0.00022 needed) and z moved +0.0001 off ZB (line 175).
**Saw** No tools run; one-line edits, untested.
**Next** 1) Open + `look` to verify the slip frame (~f250+) and surfaces lines. 2) Merge `stairwell` boxes (draw calls ~286). 3) Camera framing on midpoint of P1/Buddy/couch; make Buddy keep up (lead gap).
**Open** Draw count unchanged; floors 2–4 unproven by real play; edits not verified in a browser.
