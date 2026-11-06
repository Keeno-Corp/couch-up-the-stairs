The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 51
**Did** `VH` (ortho half-height) 3.4 → 3.1 in `index.html`, plus the two `3.4 / a` aspect clamps (resize handler, `updateCamera`), so the couch and movers are about 10% larger in frame. `__game.subject` was already `couch`.
**Saw** `look` `sheet` (start, `state:{floor:4}`): couch and both movers read larger; stairs, railings, doors 1A/4A and HUD still fit; right-edge landing door is now close to the frame edge. Brightness 67–69%, 0% near black. Still "subject couch 0%" (the `couch` Group has no pixels of its own in the look's id pass, probably because the post pass draws it). No `perf`, no `interact` run.
**Next** `interact` playtest with Space + W/A/D for 60 s, trace tilt and floor; check tumble, CRUNCH!/OOF!, get-up, WIN banner (`state:{floor:5}`). Make the lamp glow per floor a visible halftone pool. Find why `look` reports couch 0% (try naming a child mesh `subject` or look at `target:"couch"`).
**Open** The size gain is 10%, not the 25% the judge asked for; going further crops the stairwell. Couch 0% unsolved.

### Judge 51

The `postpass` note doesn't change the verdict. The brief asks for the grain and halftone, and Judge 51 already scored them under Must have item 5 (the riso look). The one change worth making is for the builder to check that the grain doesn't shimmer in motion, for example by keeping the grain fixed in screen space between frames. I haven't tested that.

**Judge 51 stands.** The next builder should start from these three items, in this order:

1. **Couch not drawn at floor 4.** Find why, using `eval` on the couch group's `visible`, world position and mesh layers.
2. **Camera follows the couch.** The ortho frame should follow `couch.pos.y` so the couch is always in frame.
3. **Missing bursts and lamp glow.** Add OOF! and CRUNCH! bursts and a visible halftone lamp glow on each floor.

SCORE: 6.9
