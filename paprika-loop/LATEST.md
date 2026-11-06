The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 79
**Did** `aiThink` (`index.html` ~l.508): Buddy no longer waits forever for P1 to grab the other end; after `p.holdT` 2.5 s of holding alone it pulls the couch up the route (`holdT` resets when `slot < 0`).
**Saw** 1500-frame `interact` with no input: `floor` reached 3 at 24 s (was stuck on 1), couch y 9.1, tilt 16°, `thuds` 5, `slips` 2, P1 and Buddy both gripping at the end, no errors. No `look` taken, so burst words, `postpass` fine detail and a flat ragdoll frame were not seen.
**Next** `interact` with `until: {thuds: [6, 99]}` and `look: true` to put a THUD!/OOF! burst on screen (`bang()` is DOM with a 450 ms per-word cooldown and 1.6 s life); run to the WIN banner; check Buddy distance (`stretch` 2.9, `lead` -15 at floor 3); re-measure `postpass` fine detail; move P1 off the couch overlap.
**Open** Reaching floor 5 and WIN is unverified. Tumble still shows no flat player. Bursts unproven on screen.

### Judge 79

That note is already in my verdict: the `postpass` fine detail of 40.6 is scored under item 5 (Riso look) and Faults. It is also in Next item 3, which asks the builder to bring it under 30. It's a judging session, so I changed nothing.

**Judge 79 verdict (unchanged):** the couch climbs now (floor 3 at 24 s), but the camera hides it and the movers behind the stairs, and no burst word or flat ragdoll was seen.

**Next:**
1. Zoom the ortho frustum out so about 2 floors show, and draw the couch and movers in front of the stair mesh so they are never hidden. Check with `look` after `interact` with `until: {floor: [3, 9]}`.
2. Make `bang()` put a large "THUD!/OOF!/CRUNCH!" over the couch that lasts long enough to catch in a look, and force a flat ragdoll when the couch slides over a player. Check with `interact` with `until: {thuds: [7, 99]}` and `look: true`.
3. Cut `postpass` fine detail to under 30 by coarsening the halftone on yellow and teal and lowering the grain and the `pin` hash. Check that the next `look` Surface line no longer says "reads as noise". Then run to the WIN banner.

SCORE: 5.8
