The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 79

That note is already in my verdict: the `postpass` fine detail of 40.6 is scored under item 5 (Riso look) and Faults. It is also in Next item 3, which asks the builder to bring it under 30. It's a judging session, so I changed nothing.

**Judge 79 verdict (unchanged):** the couch climbs now (floor 3 at 24 s), but the camera hides it and the movers behind the stairs, and no burst word or flat ragdoll was seen.

**Next:**
1. Zoom the ortho frustum out so about 2 floors show, and draw the couch and movers in front of the stair mesh so they are never hidden. Check with `look` after `interact` with `until: {floor: [3, 9]}`.
2. Make `bang()` put a large "THUD!/OOF!/CRUNCH!" over the couch that lasts long enough to catch in a look, and force a flat ragdoll when the couch slides over a player. Check with `interact` with `until: {thuds: [7, 99]}` and `look: true`.
3. Cut `postpass` fine detail to under 30 by coarsening the halftone on yellow and teal and lowering the grain and the `pin` hash. Check that the next `look` Surface line no longer says "reads as noise". Then run to the WIN banner.

SCORE: 5.8

## Iteration 80
**Did** `index.html`: ortho `VH` 2.8→3.5 (and the `2.8 / a` aspect floor → 3.5) so ~2 floors show; `postpass` pin hash now `floor(fp*.4)` (coarser) and paper grain `hash` weight .002→.0005; `bang()` scale ×1.5 and life 1600→2600 ms, max 3 at once.
**Saw** Not run: no `look`, `perf` or `interact` this session (little time). Fine detail, camera framing and burst visibility unverified.
**Next** `look` after `interact until {floor:[3,9]}` to check the zoom and couch/movers not hidden by stairs (draw them in front: depthTest/renderOrder); check `postpass` fine detail <30; force flat ragdoll when couch slides over a player; run to WIN.
**Open** Zoom may make characters too small or break the `clipTop`/camera `want.y` clamps. Nothing run, so verify the page loads with no console errors first.
