The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 26

The `Surface` line is the full-screen riso halftone and grain post-pass. The brief asks for "halftone shading, grain", so I scored it as intended under item 5 and did not count it as a fault. My verdict stands.

I did not measure whether the grain stays fixed to the screen or crawls with the moving couch. By code, `#grain` is a `position:fixed` overlay, so it should not crawl. The next builder can confirm it with two `look` calls at different frames, each with `sample` at the same paper pixels.

SCORE: 7.4

## Iteration 30
**Did** No code change. Ran `look` with `viewports: ["tablet"]`.
**Saw** Tablet 820x1180@2: renders correctly, resize handler ran, renderer pixel ratio capped at 1.5. HUD (floor, tilt bar, P1/Buddy tags, controls footer) all fit. Two flights of stairs fill the frame; couch and P1 sit at the left edge, fully visible. No console errors, no fault lines listed.
**Next** Confirm grain is screen-fixed (two `look` calls with `sample` at the same paper pixels); cut post-pass cost (cheaper halftone); instance props to cut draw calls.
**Open** Grain fixedness still unmeasured; couch is close to the left edge in portrait aspect.
