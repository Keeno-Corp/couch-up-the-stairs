The `postpass` note doesn't change the verdict. The brief asks for the grain and halftone, and Judge 51 already scored them under Must have item 5 (the riso look). The one change worth making is for the builder to check that the grain doesn't shimmer in motion, for example by keeping the grain fixed in screen space between frames. I haven't tested that.

**Judge 51 stands.** The next builder should start from these three items, in this order:

1. **Couch not drawn at floor 4.** Find why, using `eval` on the couch group's `visible`, world position and mesh layers.
2. **Camera follows the couch.** The ortho frame should follow `couch.pos.y` so the couch is always in frame.
3. **Missing bursts and lamp glow.** Add OOF! and CRUNCH! bursts and a visible halftone lamp glow on each floor.

SCORE: 6.9
