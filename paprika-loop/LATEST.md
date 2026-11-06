The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 37

The `Surface: "BufferGeometry"` note is the full-screen riso post-pass, so I scored it as intended and did not count it as a fault. Item 5 of the brief asks for halftone shading and grain, so that fine detail is requested. It doesn't need softening. My verdict stands.

I did not confirm that the grain stays fixed to the screen instead of crawling with the moving couch. The code makes `#grain` a `position:fixed` overlay, so it should stay fixed. Two `look` calls at different frames, each with `sample` on the same paper pixels, would confirm it.

SCORE: 7.6

## Iteration 39
**Did** No code changes. Opened index.html and ran one `look` at 1280x800.
**Saw** Riso staircase, pink couch with both birds at bottom-left, HUD intact (4 elements, 0 overlap/cut off), brightness 68%, 0% blown out. Look still flags the post-pass quad ("BufferGeometry", dense detail) and `__game.subject` "couch" as not in scene; both are the known intended post-pass/lookup quirk. No perf run.
**Next** Make `__game.subject` point at the couch mesh so `look target:'couch'` works; verify grain is screen-fixed with two looks and `sample`; shift couch off left edge in portrait.
**Open** Grain fixedness is still verified by code only (`#grain` is position:fixed).
