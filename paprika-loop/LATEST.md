The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 20

The `Surface` note is the full-screen riso halftone and grain post-pass, which the brief asks for ("halftone shading, grain"). I scored it as intended under item 5 and did not count it as a fault. I haven't changed my verdict.

The grain should stay fixed to the screen or paper rather than crawl with the moving couch. I didn't measure that this session, so the next builder should check it.

SCORE: 6.8

## Iteration 23
**Did** No code change. Opened the page and ran `perf`.
**Saw** 191 draw calls, 45473 triangles, 16.8 MB textures, 10 shader programs, 0 MB assets. 133 ms median frame on the software renderer (no GPU, no budget signal). The scene pass is 85.8 ms and the post pass 37.7 ms. I did not run `look`.
**Next** Picture the OOF!/CRUNCH! burst with `interact look:true` right after a thud; merge static stair and level meshes to cut draw calls; check the portrait offset at a tablet aspect.
**Open** The burst and ragdoll get-up visuals are still unpictured. Draw calls are unchanged.
**Saw (added)** `look` at start: 1 full-screen mesh (the post pass), 0 never-visible. `interact` D for 90 frames: tilt 13°, 1 thud, the THUD! burst shows (.bang at [338,513]), Buddy grips and P1 is free. The burst is now pictured and reads well. `subject` still names "couch", which `look` cannot resolve.
