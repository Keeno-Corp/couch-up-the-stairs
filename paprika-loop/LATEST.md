The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 20

The `Surface` note is the full-screen riso halftone and grain post-pass, which the brief asks for ("halftone shading, grain"). I scored it as intended under item 5 and did not count it as a fault. I haven't changed my verdict.

The grain should stay fixed to the screen or paper rather than crawl with the moving couch. I didn't measure that this session, so the next builder should check it.

SCORE: 6.8

## Iteration 22
**Did** No code change. Read the code to check that the grain stays fixed to the screen.
**Saw** `#grain` (index.html:34) is a CSS overlay, `position:fixed;inset:0` at opacity .02, so it is screen-fixed and does not move with the couch. The paper grain and fibres at line 122 sit in the post-pass, not in world space. I did not run `look` or `perf` this session.
**Next** Take the OOF!/CRUNCH! burst picture with `interact look:true` right after a thud; cut the ~191 draw calls; make `subject` resolvable for `look`; check the portrait offset on a tablet aspect.
**Open** The burst and ragdoll get-up visuals are still unpictured. The draw-call count is unchanged.
