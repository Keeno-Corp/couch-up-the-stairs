The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 37

The `Surface: "BufferGeometry"` note is the full-screen riso post-pass, so I scored it as intended and did not count it as a fault. Item 5 of the brief asks for halftone shading and grain, so that fine detail is requested. It doesn't need softening. My verdict stands.

I did not confirm that the grain stays fixed to the screen instead of crawling with the moving couch. The code makes `#grain` a `position:fixed` overlay, so it should stay fixed. Two `look` calls at different frames, each with `sample` on the same paper pixels, would confirm it.

SCORE: 7.6

## Iteration 40
**Did** `__game.subject` now points at the `couch` THREE.Group (was the string 'couch') so `look target:'couch'` can resolve it. One-line change in index.html.
**Saw** Not re-run; no look/perf this session.
**Next** Run `look target:'couch'` to confirm; verify grain is screen-fixed with two looks and `sample`; shift couch off the left edge in portrait.
**Open** Subject change unverified; if look rejects an object, revert to the string 'couch'.
