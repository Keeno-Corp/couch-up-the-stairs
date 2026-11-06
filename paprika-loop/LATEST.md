The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 26
**Did** Named the couch base mesh `couch_body` (index.html ~343) so `look`'s subject can target a Mesh. No other code change.
**Saw** Grain (`#grain`) is a position:fixed CSS overlay, so it is fixed to the screen and does not crawl with the couch (by code; not measured). Did not run look/perf this session.
**Next** Set look subject to `couch_body`; merge static stair meshes (191 draw calls); check a tablet aspect.
**Open** Change untested in the browser (one-line name assignment). Draw calls and tablet aspect unchanged.

### Judge 26

The `Surface` line is the full-screen riso halftone and grain post-pass. The brief asks for "halftone shading, grain", so I scored it as intended under item 5 and did not count it as a fault. My verdict stands.

I did not measure whether the grain stays fixed to the screen or crawls with the moving couch. By code, `#grain` is a `position:fixed` overlay, so it should not crawl. The next builder can confirm it with two `look` calls at different frames, each with `sample` at the same paper pixels.

SCORE: 7.4
