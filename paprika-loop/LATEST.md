The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 77
**Did** In `postpass` (`index.html` l.124, l.138) cut paper grain to `.95+.012*g+.002*fib-.001` (was .07/.008) and `shadowDots` weight .25→.15.
**Saw** Floor-1 `look` renders fine: no console faults, postpass is the only on-screen object, paper still reads textured from the halftone dots. The postpass fine-detail number was not re-measured (it was 41.62 at judge 76). The couch drew no pixel in this default camera (subject warning).
**Next** If postpass is still >30, the noise is probably the ink halftone `dots()` on pink/teal/yellow and the `pin` hash; soften those next. Then railing depth order, the tumble path (`tiltOver > .45`), yellow mover vs yellow stairs, and a camera that frames the couch.
**Open** Paper grain may now look slightly flat; the effect on the metric is unverified. Tumble, railing order and yellow separation are still undone.

### Judge 77

**Judge 77.** The page reads as a riso cutaway, but the couch is hidden behind the two movers. I took one `interact` play of 600 frames with a look, and one `perf`. I did not measure the postpass fine-detail number, run `reference` or `sheet`, or play 2P, so those lines are scored from the one look.

1. **Plays as DESIGN.md says: 6.** Solo starts on load. `started` is true, `timer` is 9.28, and `grips` shows P1 free and Buddy holding. The Space grab prompt is on screen as "HOLD SPACE!". I did not exercise 2P or R.
2. **Rapier couch and 5-floor stairwell: 6.** The look shows floor 1 with the pink `railing`, door "1A" and a landing. I did not check the doors 1A..5A or the WIN trigger this session.
3. **Tumble and ragdoll: 6.** Within 600 frames `thuds` is 1 and `slips` is 2, and the sounds include couchThud, oof and yelp, so a slide-back happened unscripted. Both players are in `state:"stand"` at the end, and I did not see a flat ragdoll or a burst word in the look. A tilt of 19° at 9 s is mild.
4. **HUD: 8.** `div#tl` shows "FLOOR 1/5 0:09.3", `div#tilt` shows the "TILT 19°" bar, and there are grips chips. All sit in the printed type with no overlap or cut-off. I did not see the WIN banner.
5. **Riso look per LOOK.md: 7.** Halftone dots on pink and teal, misregistered outlines and five inks hold up well. Item 5 stays below 8 for two reasons:
   - The postpass fine-detail number was not re-measured after iteration 77 (it was 41.62 at judge 76).
   - Yellow stairs, yellow wall and the yellow Buddy blend together.
6. **Orthographic follow cutaway: 6.** The camera is side-on and shows the whole flight. But `look` says "couch drew no pixel in this default camera" and the couch is mostly covered by the two movers. The brief says the camera never hides the couch.
7. **Toy characters and puffy couch: 5.** The movers are chunky, as the focus asked, but they overlap into one blob. The couch is barely visible, so there is little to compare with couch.png.
8. **Comic bursts and lamp glow per floor: 5.** The `lamp` has a glow and a pot plant is present. No THUD!/OOF! burst text was visible in the look, even though the sounds fired.
9. **`window.__game`: 8.** `interact` ran the state, `observe`, and `describe` with the stack and keys, with no console errors.
10. **Faults: 7.** There are no console errors and no `Never visible` objects. The one `perf` run measured 127 ms, but the renderer is SwiftShader (software), so that is not a budget signal. There are 190 draw calls and 45k triangles.

**Next:**
1. Show the couch and the people. Frame the camera so the couch's world position stays in view, or put it at a visible depth in front of the movers, so the subject check says it drew pixels. Verify with `look`: it should no longer say "couch drew no pixel" and the "Subject" line should list the couch parts.
2. Separate the yellow Buddy from the yellow stairs. Give the Buddy hoodie an outline, or pick the pink or white ink for the stair sides and the Buddy. Check with `look` and `sample` at the stair side next to the Buddy: the two colours should differ clearly.
3. Make the comic burst words readable. When `thuds` or `slips` increments, spawn a big printed "THUD!/OOF!/CRUNCH!" sprite with an ink shake. Prove it with an `interact` that holds until `thuds` rises and `look: true`: the burst should be on screen. Also re-measure the postpass fine-detail number. If it is still above 30, soften `dots()` on pink, teal and yellow and the `pin` hash, as iteration 77's Open says. After that, fix the railing depth order and the tumble path (`tiltOver > .45`).

SCORE: 6.3
