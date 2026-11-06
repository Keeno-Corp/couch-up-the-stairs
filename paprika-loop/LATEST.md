The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 71

**Judge 71**

The P1 teleport worked: after 500 frames of D and Space, P1 sits 0.18 m below the couch (y 5.42 against 5.24). The camera is now worse, though. The couch is cropped at the top left and the players are not in the shot.

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** `floor` 3 arrives at frame 492 and `slips` reaches 2. `couch.speed` is 2.21 at the end, so the couch no longer stalls. P1 and Buddy are both gripping (`players[0].pos.y` 5.42, `couch.pos.y` 9.18 in the final state). I did not test 2P with the arrows this session.
2. **Rapier couch and 5-floor stairwell, doors 1A..5A, WIN: 8.** Door 2A, the railings and the `stairwell` steps all show. In the `{floor:5}` look the WIN banner reads "WIN!" with confetti, and the `couch` takes 6% of the picture.
3. **Slide-back/tumble ragdoll, get up: 6.5.** `slips` is 2 and `thuds` is 3. The sounds are grunt, yelp, oof and couchThud. The tumble is not visible in the shot, because the camera is on the door and the stairs.
4. **HUD: 8.** `div#tl`, `div#tilt`, `div#grips` and `div#help` show with 0 overlap and 0 cut off. "Floor 3/5", the timer, `div#tilt` at 24° and the WIN banner all read.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.5.** The start and win looks are good: the orange `couch` and the red and green hoods read clearly. After 500 frames the `couch` takes 2.6% of the picture at [60, 0, 375, 174] and is cut by the top edge, and `player1` is 0.017% at [549, 410, 577, 424]. The camera now frames the empty 2A landing. That is a regression from the 0.95 player weighting while the party is far above the camera target. The brown `stairwell` blocks still take the left half of the picture.
6. **`window.__game` and one index.html: 8.** `observe` returns `dbg`, `grips`, `players` and `couch`. The page starts playing on load and has no build.
7. **Faults: 6.5.** There were no console errors and no `Never visible` object. `perf` read 109 ms a frame, 133 draw calls and 21.7k triangles. That is SwiftShader (host load 4.3), so it is no budget signal. The `Surfaces:` line still reports two `stairwell` boxes sharing a face plane at z=-1.60, over 0.28 × 3 units. The camera crops the action.

**Next:**
1. **Fix the camera so the couch and both players are in shot (new regression).** In `updateCamera`, the target is dragged to a stale point or the framing is wrong when the party climbs. Aim the look-at at the mean of the `couch` and both players, with a lag of about 0.15 s, and set the distance from their spread plus a margin. Then repeat the same 500-frame D+Space `interact` with `look`. `couch` should be above 8%, uncropped, with `player1` visible above 0.5% around the red hood.
2. **Hide the `stairwell` blocks that cover the action.** The brown step blocks fill the left half of the frame above the landing. Fade out or hide the `stairwell` boxes of the floor above the camera, or those between the camera and the couch, and raise the camera y. In the same look, the `stairwell ×15` coverage should fall from 21%, and the couch and players should be unobstructed.
3. **Move one of the two coplanar `stairwell` boxes off z=-1.60 (asked again).** Shift it by 0.001 m. A `look` should then drop the `Surfaces:` line. Also run `interact` once on 2P with the arrows and Enter, and a `feel` on the tumble and win shake.

SCORE: 7.1

## Iteration 72
**Did** `updateCamera`: spread now includes x offset (0.6·|dx|); camOff.y 3.4+0.7·spread, camOff.z 6.4+1.1·spread; my weights couch 0.3; lookAt now (camTarget.x, y+.35, z -0.3) instead of z .5. `observe` now returns `cam` (camTarget).
**Saw** After 500 frames D: camTarget (3.1, 4.47) with couch y 4.59, so the target is right. Before the fix the couch sat at the top edge (0.14%); now it is centred (0.78%, [336,185,734,386]) but the brown near-lane `stairwell` step blocks cover it, and P1 (y 2.68, x 5.75) is cut at the bottom-right. stairwell coverage 8.8% (from 17%). No console errors, no Never visible. Not run: perf, 2P.
**Next** 1) Hide the `stairwell` step blocks in front of the couch (z > c.z, near the couch y), not only when farLane; the farLane rule at `level.userData.bb` visibility apparently misses them. 2) P1 lags 2 m below the couch: pull the teleport threshold in to ~1.2 m. 3) Move one coplanar stairwell box off z=-1.60 by 0.001; test 2P.
**Open** Couch occluded by step blocks; P1 partly cropped.
