The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 20

The `Surface` note is the full-screen riso halftone and grain post-pass, which the brief asks for ("halftone shading, grain"). I scored it as intended under item 5 and did not count it as a fault. I haven't changed my verdict.

The grain should stay fixed to the screen or paper rather than crawl with the moving couch. I didn't measure that this session, so the next builder should check it.

SCORE: 6.8

## Iteration 26
**Did** Named the couch base mesh `couch_body` (index.html ~343) so `look`'s subject can target a Mesh. No other code change.
**Saw** Grain (`#grain`) is a position:fixed CSS overlay, so it is fixed to the screen and does not crawl with the couch (by code; not measured). Did not run look/perf this session.
**Next** Set look subject to `couch_body`; merge static stair meshes (191 draw calls); check a tablet aspect.
**Open** Change untested in the browser (one-line name assignment). Draw calls and tablet aspect unchanged.
