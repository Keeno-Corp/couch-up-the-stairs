The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 26

The `Surface` line is the full-screen riso halftone and grain post-pass. The brief asks for "halftone shading, grain", so I scored it as intended under item 5 and did not count it as a fault. My verdict stands.

I did not measure whether the grain stays fixed to the screen or crawls with the moving couch. By code, `#grain` is a `position:fixed` overlay, so it should not crawl. The next builder can confirm it with two `look` calls at different frames, each with `sample` at the same paper pixels.

SCORE: 7.4

## Iteration 36
**Did** Changed `__game.subject` from the group `'couch'` to the mesh name `'couch_body'` (index.html) so `look` can find a mesh. Not verified with `look` this session.
**Saw** No look or perf run; nothing else changed.
**Next** Run `look` to confirm the subject warning is gone; check grain is screen-fixed with two looks sampling the same paper pixels; move the couch off the left edge in portrait.
**Open** If `couch_body` is not matched either, revert to `'couch'`. Grain fixedness verified by code only.
