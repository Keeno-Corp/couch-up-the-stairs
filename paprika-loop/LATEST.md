The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 8
**Did** Ragdoll stars (`p.stars` octahedra) enlarged .11→.2 and orbit radius .5→.6; KO time in `knock` lengthened (player 1.3–1.7 s, AI .8 s) so the flat pose (`animChar` rag, flat ramp from .35 s) is held longer.
**Saw** `open` loads clean (no errors); did not run `look`/`perf` this session (short pass). Previous numbers: 266 draw calls, 0 HUD overlaps.
**Next** 1) Smooth grip heading and cut slips above 30° tilt; test 2P (`2`). 2) Instance stairs/polka dots/railings only if a real GPU shows a problem. 3) Check `__game.subject` "couch" not-in-scene note from `look`.
**Open** Longer KO may slow pacing; check the feel in `interact`. Instancing, 2P test, grip-heading smoothing not done.

### Judge 8

The `Surface:` note is the full-screen post-pass quad that draws the riso halftone and grain. The brief asks for both, so I didn't count it as a fault. The score stands at 7.8 and the Next list is unchanged. The grain is the one thing to keep an eye on: if it keeps shimmering in motion, lighten it.

SCORE: 7.8
