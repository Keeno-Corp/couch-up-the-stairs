The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 72
**Did** `updateCamera`: spread now includes x offset (0.6·|dx|); camOff.y 3.4+0.7·spread, camOff.z 6.4+1.1·spread; my weights couch 0.3; lookAt now (camTarget.x, y+.35, z -0.3) instead of z .5. `observe` now returns `cam` (camTarget).
**Saw** After 500 frames D: camTarget (3.1, 4.47) with couch y 4.59, so the target is right. Before the fix the couch sat at the top edge (0.14%); now it is centred (0.78%, [336,185,734,386]) but the brown near-lane `stairwell` step blocks cover it, and P1 (y 2.68, x 5.75) is cut at the bottom-right. stairwell coverage 8.8% (from 17%). No console errors, no Never visible. Not run: perf, 2P.
**Next** 1) Hide the `stairwell` step blocks in front of the couch (z > c.z, near the couch y), not only when farLane; the farLane rule at `level.userData.bb` visibility apparently misses them. 2) P1 lags 2 m below the couch: pull the teleport threshold in to ~1.2 m. 3) Move one coplanar stairwell box off z=-1.60 by 0.001; test 2P.
**Open** Couch occluded by step blocks; P1 partly cropped.

### Judge 72

**Judge 72**

The camera now centres the couch, but the near-lane `stairwell` step blocks hide it. After 500 frames of D and Space, the `couch` is 0.86% of the picture at [331, 185, 498, 328], and most of it sits behind a brown step block. `player1` is cropped at the bottom right. I did not test 2P, and I ran `perf` and the 500-frame look once each.

1. **Plays as DESIGN.md's Core loop and Controls say: 6.5.** `floor` is 2 at frame 500, with `slips` 1 and `thuds` 3. Both `players` are gripping and `couch.speed` is 2.46. `players[0].pos.y` is 2.68 against `couch.pos.y` 4.61, so P1 trails by about 2 m. The teleport threshold is not catching P1 and the player lags the couch. I did not test 2P with the arrows.
2. **Rapier couch and 5-floor stairwell, doors 1A..5A, WIN: 8.** Door 1A, the railings, the `stairwell` steps and the lamp all show. The WIN banner was not re-checked this session.
3. **Slide-back/tumble ragdoll, get up: 5.5.** The sounds fired: grunt, yelp, oof and couchThud. The tumble is not readable, because the `couch` is occluded and the camera shows no player taking the hit.
4. **HUD: 8.** `div#tl`, `div#tilt`, `div#grips` and `div#help` show with 0 overlap and 0 cut off. "Floor 2/5", the timer and "TILT 1°" read.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.** `stairwell ×10` covers 8.6% of the picture, and the large brown blocks dominate it. The orange `couch` shows as a small sliver, and the red-hood `player1` is cut off at the bottom right. The railings, door and lamp read well, but the subject does not stand out.
6. **`window.__game` and one index.html: 8.** `observe` returns `cam`, `dbg`, `grips`, `players` and `couch`. The page starts playing on load and has no build.
7. **Faults: 6.5.** There were no console errors and no `Never visible` object. `perf` read 95 ms a frame, 115 draw calls and 19.8k triangles. That is SwiftShader (host load 3.1), so it is no budget signal. `look` says the camera shows little of the subject. The coplanar `stairwell` boxes at z=-1.60 were not re-checked.

**Next:**
1. **Unblock the couch (asked again).** Hide or fade every `stairwell` step block with z > couch.z + 0.3 whose y is within about 3 m of the `couch`. This applies to every floor, not only the `farLane` case. Also nudge the camera x toward the open side. After the same 500-frame D+Space `interact` with `look: true`, `couch` should be above 3% and uncovered, and `stairwell` coverage should be under 4%.
2. **Keep P1 in frame and attached (asked again).** Lower the teleport threshold to about 1.2 m, and add `player1` and Buddy to the camera spread with a clamp. The look should show the red hood above 0.5% and uncropped. `observe` should show `players[0].pos.y` within 1.2 m of `couch.pos.y`.
3. **Make the tumble readable, and test 2P.** Run a `feel` on the slip so the camera pulls out and shakes a little, with the player and `couch` both in shot. Then run `interact` on the arrows and Enter in 2P. Move one coplanar `stairwell` box off z=-1.60 by 0.001, and the `Surfaces:` line should drop.

SCORE: 6.8
