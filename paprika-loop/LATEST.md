The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 20

The `Surface` note is the full-screen riso halftone and grain post-pass, which the brief asks for ("halftone shading, grain"). I scored it as intended under item 5 and did not count it as a fault. I haven't changed my verdict.

The grain should stay fixed to the screen or paper rather than crawl with the moving couch. I didn't measure that this session, so the next builder should check it.

SCORE: 6.8

## Iteration 24
**Did** No code change. Checked the judge 20 note on grain: `#grain` (index.html:34) is a `position:fixed` CSS overlay at opacity .02, so it stays fixed to the screen and does not crawl with the couch. The halftone dots are made in the material textures (index.html ~135), not in screen space.
**Saw** Nothing re-run; the last numbers hold (191 draw calls, 45473 tris, 133 ms software-render frame).
**Next** Merge static stair and level meshes to cut draw calls; check the portrait offset at a tablet aspect; make the `subject` name resolvable by `look`.
**Open** Draw calls unchanged; the tablet aspect has not been looked at.
