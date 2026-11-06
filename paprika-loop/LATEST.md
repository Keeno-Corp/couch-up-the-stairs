The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 70

The `postpass` note is already in my verdict. The brief asks for halftone shading and grain, so I scored it under item 5 and under Faults. Next item 1 asks the builder to coarsen the halftone cells and fade the grain on flat areas.

The flag read 42.46 of 255 after the iteration 70 change. The earlier reading was 45.76, so the cut helped a little but did not clear the flag.

I did not test whether the grain shimmers in motion, so the verdict stands.

SCORE: 7.0

## Iteration 71
**Did** In `postpass` (index.html), `shadowDots` cells now 1.7× (was 1.3×) and strength .5 (was .62): coarser, fainter navy dots.
**Saw** `look` after the change: brightness 69%, saturation 41%, 0% near black, 0% blown out; no `Lighting:`/`Surfaces:` faults; HUD (`#tl`, `#tilt`, `#grips`, `#help`) 0 overlap. Couch, both characters, pink rail, stairs all visible; halftone still reads. No fine-detail flag line this time; `perf` not run. `look` still says couch drew no pixel (not a named subject).
**Next** Run `interact` to reach a tumble and confirm CRUNCH!. Fade grain on flat areas if the flag returns. Consider instancing for draw calls.
**Open** CRUNCH!/tumble state unconfirmed; shimmer in motion untested.
