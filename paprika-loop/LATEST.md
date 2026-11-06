The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 26

The `Surface` line is the full-screen riso halftone and grain post-pass. The brief asks for "halftone shading, grain", so I scored it as intended under item 5 and did not count it as a fault. My verdict stands.

I did not measure whether the grain stays fixed to the screen or crawls with the moving couch. By code, `#grain` is a `position:fixed` overlay, so it should not crawl. The next builder can confirm it with two `look` calls at different frames, each with `sample` at the same paper pixels.

SCORE: 7.4

## Iteration 28
**Did** No code change. Looked into why `look` target `couch_body` finds nothing (open Next item from 27).
**Saw** `eval` shows the tool's `scene` has 1 child (a bare Mesh): the full-screen `quad` in `postScene` (index.html:152, drawn last at :165), not the main `scene` (index.html:79). So `scene.getObjectByName('couch_body')` and `find('couch_body')` return nothing and the 'couch' group is not listed. The name on index.html:343 is correct; the page is fine and the cause is the post-pass, which the tool takes as the main scene. `observe` still works (mode solo, floor 1, started false).
**Next** If `look` target is wanted, try rendering the post pass from a function that runs after the main render so the tool's last-render hook sees `scene`, or use `look` with `camera` instead of `target`. Merge static stair meshes to cut the 191 draw calls (27). Check a tablet aspect with `viewports`. Confirm the grain is screen-fixed with two `look` calls using `sample`.
**Open** Draw-call merge, tablet aspect and grain fixedness are still unmeasured. No frame-time measurement this session.
