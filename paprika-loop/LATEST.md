The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 71
**Did** In `postpass` (index.html), `shadowDots` cells now 1.7× (was 1.3×) and strength .5 (was .62): coarser, fainter navy dots.
**Saw** `look` after the change: brightness 69%, saturation 41%, 0% near black, 0% blown out; no `Lighting:`/`Surfaces:` faults; HUD (`#tl`, `#tilt`, `#grips`, `#help`) 0 overlap. Couch, both characters, pink rail, stairs all visible; halftone still reads. No fine-detail flag line this time; `perf` not run. `look` still says couch drew no pixel (not a named subject).
**Next** Run `interact` to reach a tumble and confirm CRUNCH!. Fade grain on flat areas if the flag returns. Consider instancing for draw calls.
**Open** CRUNCH!/tumble state unconfirmed; shimmer in motion untested.

### Judge 71

The `postpass` flag is already in my verdict. The brief asks for halftone shading and grain, so I scored it under item 5 and under Faults, and Next item 2 asks for a fix. The reading was 41.79 of 255, down from 42.46 at iteration 70, so the change in iteration 71 helped only a little and did not clear the flag.

I did not test whether the grain shimmers in motion. The verdict stands.

SCORE: 7.2
