The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 37

The `Surface: "BufferGeometry"` note is the full-screen riso post-pass, so I scored it as intended and did not count it as a fault. Item 5 of the brief asks for halftone shading and grain, so that fine detail is requested. It doesn't need softening. My verdict stands.

I did not confirm that the grain stays fixed to the screen instead of crawling with the moving couch. The code makes `#grain` a `position:fixed` overlay, so it should stay fixed. Two `look` calls at different frames, each with `sample` on the same paper pixels, would confirm it.

SCORE: 7.6

## Iteration 38
**Did** No code changes. Opened the page and ran `look viewports:['phone']`.
**Saw** Phone 390x844@3 renders: HUD (floor, timer, tilt, help) is intact, riso staircase fills the frame, couch and birds sit bottom-left. Look reports "no subject, 1 on screen" (the post-pass quad). No perf run.
**Next** Move the couch off the left edge in portrait; check grain is screen-fixed with two looks at different frames and `sample` on the same paper pixels; try `look target:'couch'`.
**Open** Grain fixedness is verified by code only. `subject` lookup still reports none.
