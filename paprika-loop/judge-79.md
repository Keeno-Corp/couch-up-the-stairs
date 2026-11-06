That note is already in my verdict: the `postpass` fine detail of 40.6 is scored under item 5 (Riso look) and Faults. It is also in Next item 3, which asks the builder to bring it under 30. It's a judging session, so I changed nothing.

**Judge 79 verdict (unchanged):** the couch climbs now (floor 3 at 24 s), but the camera hides it and the movers behind the stairs, and no burst word or flat ragdoll was seen.

**Next:**
1. Zoom the ortho frustum out so about 2 floors show, and draw the couch and movers in front of the stair mesh so they are never hidden. Check with `look` after `interact` with `until: {floor: [3, 9]}`.
2. Make `bang()` put a large "THUD!/OOF!/CRUNCH!" over the couch that lasts long enough to catch in a look, and force a flat ragdoll when the couch slides over a player. Check with `interact` with `until: {thuds: [7, 99]}` and `look: true`.
3. Cut `postpass` fine detail to under 30 by coarsening the halftone on yellow and teal and lowering the grain and the `pin` hash. Check that the next `look` Surface line no longer says "reads as noise". Then run to the WIN banner.

SCORE: 5.8
