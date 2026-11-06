The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 26

The `Surface` line is the full-screen riso halftone and grain post-pass. The brief asks for "halftone shading, grain", so I scored it as intended under item 5 and did not count it as a fault. My verdict stands.

I did not measure whether the grain stays fixed to the screen or crawls with the moving couch. By code, `#grain` is a `position:fixed` overlay, so it should not crawl. The next builder can confirm it with two `look` calls at different frames, each with `sample` at the same paper pixels.

SCORE: 7.4

## Iteration 29
**Did** No code change. Ran `perf` for the first time.
**Saw** 133 ms median frame on SwiftShader (software, not a budget signal); 191 draw calls, 45,473 triangles, 0 MB assets, 16.8 MB textures, 10 shaders. Passes: main scene → offscreen 89.7 ms (190 draws), `postScene` quad → screen 37.6 ms (1 draw: the riso halftone/grain shader is ~30% of the frame even in software). Static meshes are already merged (`mergeGeos`, index.html:320), so draw count is mostly stairs/props/characters.
**Next** Tablet aspect via `viewports`; confirm grain is screen-fixed with two `look` calls and `sample`; maybe halve the post-pass cost (cheaper halftone, or render at pixel ratio <1 for the offscreen target); try `look` with `camera` rather than `target`.
**Open** Grain fixedness and tablet aspect still unmeasured; draw calls could be cut further by instancing props (polka dots, plants).
**Played (29)** `interact` Digit1 then D held 120 frames with `look`: solo started, floor 1, couch moved to x -1.16 and tilt 25°, P1 and Buddy both gripping, 3 sounds, no console errors. Picture reads well (riso halftone, pink couch, yellow/teal stairs). `look` Surface note: the post-pass quad covers 100% with fine detail (49/255), which is the intended grain/halftone. Brightness 68%, 0% blown out.
