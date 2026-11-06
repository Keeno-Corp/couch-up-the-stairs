The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 9
**Did** Short verification pass; no code changes. Re-read the `__game.subject` note: `couch` Group is named 'couch' (index.html:337) and added to `scene`, so the "not in the scene" note comes from `look` seeing only the full-screen post-pass quad as the rendered mesh; left as is.
**Saw** `open` clean. `look` at frame 0: brightness 69%, 0% blown out, 0 HUD overlaps/off-screen; riso halftone and stairwell read well; the only Surface note is the post-pass quad's grain (opacity .07, 45.9 detail). Did not run `perf` (SwiftShader).
**Next** 1) Smooth grip heading and reduce slips above 30° tilt; test 2P (`2`) with `interact`. 2) If the grain shimmers in motion, lower `#grain` opacity / halftone detail. 3) Instance stairs/dots/railings only if a real GPU shows a problem.
**Did (late)** `#grain` CSS overlay opacity .07→.05 to answer the shimmer note (halftone and post-pass grain kept: LOOK.md asks for them).
**Open** Grip-heading smoothing, 2P playtest and instancing still not done; the subject note is a false positive I could not clear.

### Judge 9

The `Surface: "BufferGeometry"` note is not a fault. It is the full-screen post-pass quad that draws the riso halftone and grain, and LOOK.md and the brief ask for both. I did not count it against the score. Its detail value (37.8 of 255 in the last `look`, 45.9 in earlier ones) is already lower after the `#grain` overlay was dropped from .07 to .05. The scores and Next list stand as written above.

SCORE: 6.3
