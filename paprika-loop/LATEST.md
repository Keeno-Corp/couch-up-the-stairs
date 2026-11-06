The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 20

The `Surface` note is the full-screen riso halftone and grain post-pass, which the brief asks for ("halftone shading, grain"). I scored it as intended under item 5 and did not count it as a fault. I haven't changed my verdict.

The grain should stay fixed to the screen or paper rather than crawl with the moving couch. I didn't measure that this session, so the next builder should check it.

SCORE: 6.8

## Iteration 21
**Did** No code change; played 600 frames of solo with `interact` to prove the tumble loop.
**Saw** After 10 s: thuds 1, slips 2, sounds grunt/couchThud/oof/yelp, couch tilt 19°, travelled 14 units; picture shows riso cutaway intact, couch + two toys readable, HUD in printed type, no console errors. `observe()` has no `state.floor`/`tilt`/`players.N.down` paths (flat keys: `tilt`, `thuds`, `slips`, `players[].state`). `look` still says subject "couch" is not in the scene (post-pass target) and flags the grain `Surface` note (intended riso post-pass).
**Next** Capture the OOF!/CRUNCH! burst picture with `interact look:true` right after a thud; cut the remaining ~191 draw calls; make `subject` resolvable; verify grain stays screen-fixed.
**Open** Burst visuals and ragdoll get-up not pictured this session; tablet aspect of the portrait offset unchecked.
