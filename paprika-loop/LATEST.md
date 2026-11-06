The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 78

**Judge 78.** The couch and both movers now read clearly, but the run stalls on floor 1 and no burst word was on screen. I took one 900-frame `interact` with a look, and one `perf`. I did not play 2P or R, reach the WIN banner, run `sheet` or `reference`, or re-measure the `postpass` fine-detail number.

1. **Plays as DESIGN.md says: 5.** Solo starts on load and `started` is true. In 14 s the couch drifted 0.98 units, and `floor` stayed 1 throughout. The couch "stopped at frame 870 and did not move again". `grips` shows P1 free and Buddy `gripping:true`, and "HOLD SPACE!" is prompted. `thuds` is 4 and `slips` is 2, but no progress up the stairs.
2. **Rapier couch and 5-floor stairwell: 6.** The pink `railing`, the yellow stairs, the 1A door and the landing above all read. I did not reach floors 2 to 5 or the WIN trigger.
3. **Tumble and ragdoll: 5.** Tilt peaked at 30.7° at frame 211, and the sounds include couchThud, oof and yelp. Both players end in `state:"stand"`, and I saw no flat ragdoll frame. The flight moves are not shown as a clear tumble down the stairs.
4. **HUD: 8.** `div#tl` reads "FLOOR 1/5 0:14.3", `div#tilt` is a printed bar, and `div#grips` shows the chips. There is no overlap or cut-off. The WIN banner was not seen.
5. **Riso look per LOOK.md: 7.** Halftone dots on pink, teal and yellow, misregistered navy outlines and paper grain all show. The Buddy is now cream and separate from the yellow stairs. The look is still busy: the teal wash and yellow halftone are heavy.
6. **Orthographic follow cutaway: 7.** The side-on view shows the whole flight, the door 1A, the lamp and the floor above. The couch is in frame at the left, beside the movers. The `look` Subject line still says "couch drew no pixel", but that is the `postpass` detector, not the picture.
7. **Toy characters and puffy couch: 7.** The `couch` is a puffy pink sofa with a cushion, and the teal P1 and cream Buddy are chunky hoodie blobs. The couch sits lower-left and is partly overlapped by P1. The characters lack the detail of mover.png.
8. **Comic bursts and lamp glow per floor: 4.** No THUD!, OOF! or CRUNCH! text is in the 900-frame look, even though `thuds` is 4 and sounds fired. The lamp shows as a shade on a stand, with a glow that is faint.
9. **`window.__game`: 8.** The state, `observe` and `describe` work, and there are no console errors.
10. **Faults: 6.** There are no errors and no `Never visible` objects. `perf` is 134 ms on SwiftShader, which is not a budget signal, with 190 draw calls and 45k triangles. The couch stalling on floor 1 is a gameplay fault.

**Next:**
1. Make the couch actually climb, and make a real tumble happen. In 14 s of solo play there were 4 thuds and no progress, and the couch stopped. Make the Buddy AI push the couch up the first flight when P1 is idle, with a clear slide-back that flattens a player. Check with `interact` for 1500 frames with `trace` on `floor` and `tilt`: `floor` should reach 2 and some player `state` should be flat at least once.
2. Make the burst words readable (asked again). When `thuds` or `slips` rises, spawn a big navy-and-pink "THUD!/OOF!/CRUNCH!" sprite above the couch with a short ink shake. Use `interact` with `until: {thuds: [5, 99]}` and `look: true`. It is done when the word is on screen over the couch.
3. Re-measure `postpass` fine detail and tidy the picture. If it is still above 30, soften `dots()` on pink, teal and yellow and the `pin` hash. Move the couch away from P1's overlap, for example by placing P1 on the opposite end. Confirm with a `look` that shows the couch cushions and both players distinct.

SCORE: 6.3

## Iteration 79
**Did** `aiThink` (`index.html` ~l.508): Buddy no longer waits forever for P1 to grab the other end; after `p.holdT` 2.5 s of holding alone it pulls the couch up the route (`holdT` resets when `slot < 0`).
**Saw** 1500-frame `interact` with no input: `floor` reached 3 at 24 s (was stuck on 1), couch y 9.1, tilt 16°, `thuds` 5, `slips` 2, P1 and Buddy both gripping at the end, no errors. No `look` taken, so burst words, `postpass` fine detail and a flat ragdoll frame were not seen.
**Next** `interact` with `until: {thuds: [6, 99]}` and `look: true` to put a THUD!/OOF! burst on screen (`bang()` is DOM with a 450 ms per-word cooldown and 1.6 s life); run to the WIN banner; check Buddy distance (`stretch` 2.9, `lead` -15 at floor 3); re-measure `postpass` fine detail; move P1 off the couch overlap.
**Open** Reaching floor 5 and WIN is unverified. Tumble still shows no flat player. Bursts unproven on screen.
