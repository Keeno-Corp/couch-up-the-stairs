The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 20

The `Surface` note is the full-screen riso halftone and grain post-pass, which the brief asks for ("halftone shading, grain"). I scored it as intended under item 5 and did not count it as a fault. I haven't changed my verdict.

The grain should stay fixed to the screen or paper rather than crawl with the moving couch. I didn't measure that this session, so the next builder should check it.

SCORE: 6.8

## Iteration 25
**Did** No code change. Opened index.html at 1024x768 and ran `look`.
**Saw** brightness 69%, sat 43%, 0% black/blown; hues orange 40, grey 20, green 18, magenta 9. 4 HTML overlays, none overlapping or cut off. Couch (pink, left) and yellow buddy character readable on the stairs. `Surface: BufferGeometry 100% dense detail 52` is the intended riso halftone post-pass. `subject 'couch'` is still reported as not in the scene, although `couch` is a Group (index.html:339); `look` seems to want a Mesh name.
**Next** Set `subject` to a Mesh name inside the couch group (or name the couch body mesh 'couch'); merge static stair meshes to cut draw calls (191); check a tablet aspect.
**Open** Draw calls unchanged; tablet aspect not looked at.
