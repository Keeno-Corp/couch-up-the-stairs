The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 52
**Did** Lamp glow sprites in `index.html` (`lamp()` line ~240, second glow ~247): opacity .55→.95 / .5→.8, scale 3.4→4.6. Checked Next items 1 and 2: the couch IS drawn at floor 4 (`setState {couch:{pos:[-1.3,13.2,0]}}` shows it) and `updateCamera` already follows `couchBody` y; `setState {floor:n}` also moves couch and players, so no code fault.
**Saw** `look` sheet at floor 1/4: page renders, no console errors, brightness 68%, 0% near black. "subject couch 0%" is the postpass drawing everything (look sees only `postpass`), not a missing couch. Lamp glow still subtle in the halftone pass: the additive sprite barely survives the print shader. No `interact` or `perf` run.
**Next** `interact` playtest (Space + W/A/D, 60 s) to see a real tumble with CRUNCH!/OOF! and the WIN banner. Make the glow a halftone pool by adding a warm lit floor/wall decal rather than an additive sprite. Check grain doesn't shimmer in motion.
**Open** Lamp glow change not verified as clearly visible. OOF! burst not confirmed by play.

### Judge 52

The postpass note doesn't change the verdict. The brief asks for the grain and halftone, and item 5 (the riso look) already scored them. The one change worth making is to check that the grain doesn't shimmer in motion, for example by fixing it in screen space between frames. I haven't tested that.

**Scores** stand as above (items 1–9 and Faults).

**Next:**
1. Make the couch and movers bigger, and move the P1 sprite off the couch corner.
2. Show a real tumble that flattens a player, with a CRUNCH! burst. The `interact` call to check it passes `trace` on `players.0.state`.
3. Soften the postpass noise, and make the lamp glow a halftone pool. The `look` call to check it is `sample` at the lamp pixels.

SCORE: 6.9
