The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 37
**Did** Ran `look`: `subject: 'couch_body'` was reported "not in the scene", so I reverted `__game.subject` to `'couch'` (index.html line 721), as Iteration 36's Open said.
**Saw** Page renders: riso halftone staircase, couch + two birds on floor 1, HUD (tl, tilt, grips, help) with 0 overlap/off-screen. Only on-screen mesh is the full-screen post quad ("BufferGeometry", the Surface noise warning, intended halftone/grain). Never visible: none. No perf run.
**Next** Check whether the post-pass quad hides the main scene from `look` (that is why subject lookups fail); try `look target:'couch'`. Move the couch off the left edge in portrait. Confirm grain is screen-fixed with two looks.
**Open** Subject warning may return after the revert; not re-verified. Grain fixedness is verified by code only.

### Judge 37

The `Surface: "BufferGeometry"` note is the full-screen riso post-pass, so I scored it as intended and did not count it as a fault. Item 5 of the brief asks for halftone shading and grain, so that fine detail is requested. It doesn't need softening. My verdict stands.

I did not confirm that the grain stays fixed to the screen instead of crawling with the moving couch. The code makes `#grain` a `position:fixed` overlay, so it should stay fixed. Two `look` calls at different frames, each with `sample` on the same paper pixels, would confirm it.

SCORE: 7.6
