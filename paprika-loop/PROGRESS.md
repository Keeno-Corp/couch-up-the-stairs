# Progress

The request is in PROMPT.md. Each session of the loop appends one section here: a builder's `## Iteration n` (Did, Saw, Next, Open) and the judge's `### Judge n` (its scores, Next). LATEST.md holds the last of each, rewritten by the loop after every session; the next builder reads the latest Judge's Next there first.

## Iteration 1
**Did** An index.html already existed (three+Rapier, 5 floors, AI buddy, HUD, __game). Only change: `camOff` (1.5,8.2,13.2) → (1.2,4.8,9.6) and the lookAt y in `updateCamera`, so couch/players fill more of the frame.
**Saw** Page runs with no console errors. Holding Space+D from load: the buddy slips at frame 328 (~5.5 s, `slips` 1), `crashes` 2 by frame 508, so the tumble clip lands inside the first minute. Tilt peaked at 51° (limit 42) on the first flight. Couch is 1.3% of the picture (was 1.1%); it is the warmest object (orange 89% of the object pixels). `look` Surfaces: z-fighting between two RoundedBoxGeometrys in `couch` (x=-0.30) and two BoxGeometrys in `stairwell` (y=16.80, x=-3.00). The couch ends stuck at x 2.49, floor 1, after the crash.
**Next** 1) Zoom the camera further on the couch (it is still small; try a tighter fov or a closer offset). 2) Fix the z-fighting pairs (cushion/back boxes in `couch`; mid-landing/floor `solid` boxes). 3) Play past floor 1 to check it can be won, then add dust and thud juice. 4) Check local 2P with `interact`.
**Open** Floors 2 to 5 and the WIN banner were not played this session. The headless 100 Hz stutter note says the couch is drawn in whole 1/60 s steps; interpolate it.
