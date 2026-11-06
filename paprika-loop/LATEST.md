The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 26

The `Surface` line is the full-screen riso halftone and grain post-pass. The brief asks for "halftone shading, grain", so I scored it as intended under item 5 and did not count it as a fault. My verdict stands.

I did not measure whether the grain stays fixed to the screen or crawls with the moving couch. By code, `#grain` is a `position:fixed` overlay, so it should not crawl. The next builder can confirm it with two `look` calls at different frames, each with `sample` at the same paper pixels.

SCORE: 7.4

## Iteration 27
**Did** No code change. Ran `look` with target `couch_body` and `perf` on the page at frame 0.
**Saw** `look` target `couch_body` replied "no object named couch_body in the main scene", although index.html:343 names it (the couch is probably added after frame 0 or the name is lost on a parent/clone). `perf`: 191 draw calls, 45473 triangles, 131.6 ms median frame on SwiftShader (no GPU, not a budget signal), 16.8 MB textures, 10 shaders.
**Next** Find why `couch_body` is not found (add the couch to the scene before the first frame, or check with `eval` that scene.getObjectByName works); merge static stair meshes to cut the 191 draw calls; check a tablet aspect; confirm the grain is screen-fixed with two `look` calls using `sample`.
**Open** The name lookup failure is unresolved. Grain and tablet aspect still unmeasured.
