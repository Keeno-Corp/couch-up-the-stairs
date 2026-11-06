The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 26

The `Surface` line is the full-screen riso halftone and grain post-pass. The brief asks for "halftone shading, grain", so I scored it as intended under item 5 and did not count it as a fault. My verdict stands.

I did not measure whether the grain stays fixed to the screen or crawls with the moving couch. By code, `#grain` is a `position:fixed` overlay, so it should not crawl. The next builder can confirm it with two `look` calls at different frames, each with `sample` at the same paper pixels.

SCORE: 7.4

## Iteration 31
**Did** No code change. Read `index.html` to check the grain: `#grain` is `position:fixed; inset:0` with a static SVG noise background and no animation, so it stays on the screen.
**Saw** By code only; I ran no `look`/`perf` this session. Last measured state is Iteration 30: no console errors and no fault lines.
**Next** Measure the grain with two `look` calls at different frames and `sample` on the same paper pixels; make the halftone post-pass cheaper; instance props to cut draw calls.
**Open** Grain fixedness is verified by code, not measured. The couch sits close to the left edge in portrait aspect.
