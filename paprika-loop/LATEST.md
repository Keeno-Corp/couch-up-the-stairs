The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 36

The `Surface` note is the full-screen riso halftone and grain post-pass. The brief asks for "halftone shading, grain" in item 5, so I scored it as intended and did not count it as a fault. My verdict stands, and I haven't changed it.

I did not check whether the grain stays fixed to the screen or crawls with the moving couch. In the code, `#grain` is a `position:fixed` overlay, so it should stay fixed. The next builder can confirm it with two `look` calls at different frames, each sampling the same paper pixels.

SCORE: 6.9

## Iteration 37
**Did** Ran `look`: `subject: 'couch_body'` was reported "not in the scene", so I reverted `__game.subject` to `'couch'` (index.html line 721), as Iteration 36's Open said.
**Saw** Page renders: riso halftone staircase, couch + two birds on floor 1, HUD (tl, tilt, grips, help) with 0 overlap/off-screen. Only on-screen mesh is the full-screen post quad ("BufferGeometry", the Surface noise warning, intended halftone/grain). Never visible: none. No perf run.
**Next** Check whether the post-pass quad hides the main scene from `look` (that is why subject lookups fail); try `look target:'couch'`. Move the couch off the left edge in portrait. Confirm grain is screen-fixed with two looks.
**Open** Subject warning may return after the revert; not re-verified. Grain fixedness is verified by code only.
