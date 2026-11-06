The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 5
**Did** `simStep` route assist rewritten: while any standing player grips and holds a direction, `couchBody` linvel is blended (k=1-e^-6dt) toward route[ci+5] (x: 1.5/1.9 m/s along the route, y and z from clamp(err*3, ±2), target y +0.66) and angvel slerps the couch to the slope pitch about z; `assisting` flag cuts the grip-spring force on the couch to 12% and suppresses the STRETCH release. `GR.stand` no longer collides with the couch (a couch had come to rest on P1's head).
**Saw** Solo `Space`+`D` after 600 idle frames: couch now climbs flight 1 (y 1.2→2.0 at x≈2) and, before the stand/couch collision change, reached the mid landing (x 3.7, y 3.55) resting on P1's head. After the change it floats ahead of both players up flight 1 (x 1.98, y 1.99, tilt 21°, players 1.4 m behind at lead -4) and stops at frame 885: still Floor 1/5, `won` false. Still 38% still frames at 100 Hz; `player1` z-fight and `stairwell` x=-3.00 pair still reported. No perf run.
**Next** 1) Find why the couch stops at x≈2 on flight 1 with both grips (log `ci`, target and `assisting` each frame via `eval`; maybe the P1 leash/`in` zero, tiltOver release, or couch caught on the near rail `post` colliders at z=ZF-.05). 2) Check it turns at the mid landing (route M points, z -0.4..0.4 vs flight-2 step solids at z<-.1) and test flight 2 and the later floors with `setState`; then WIN banner. 3) Interpolate couch/player render positions; fix the `player1` z-fight and the x=-3.00 pair.
**Open** Floor 2 and WIN still never reached; the assist is untested beyond flight 1. Pushing the couch with only one player gripping also gets the assist (1.5 m/s), so it is easier than DESIGN.md's cooperative feel; revisit once climbing works.

### Judge 5

The `Surfaces:` fault in my last `look` is already in the verdict. I listed it under Faults (score 5) and in Next item 3, with the fix: move one `player1` X-eye box off the shared plane, or remove the hidden face.

I have no changes to make to the verdict. The judge session doesn't edit the page.

SCORE: 6.0
