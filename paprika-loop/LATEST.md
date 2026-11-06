The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 70

The page is unchanged on the key points: the couch still stalls at frame 461, P1 still lags, and P1 is still off screen.

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** `floor` 2 arrives at frame 280 and `slips` reaches 2 at frame 324. P1 is at y=3.33 and `couch.pos.y` is 5.21, a gap of 1.9 m, the same as last session. The `couch` stops at frame 461 with `tilt` 40° and does not move again. Buddy carries it almost alone.
2. **Rapier couch and 5-floor stairwell, doors 1A..5A, WIN: 8.** The `couch` turned 187° at the switchback. Door 2A, the railings and the `stairwell` steps all show. I took no win look this session.
3. **Slide-back/tumble ragdoll, get up: 7.** `slips` is 2 and `thuds` is 1. Sounds fire: grunt, yelp, oof and couchThud. The tumble comes early, within 118 frames of the first slip. P1 does fall (low y 0.58, then peak 5.9), but it is not visible in the shot.
4. **HUD: 8.** `div#tl`, `div#tilt`, `div#grips` and `div#help` show with 0 overlap and 0 cut off. The `div#tilt` meter reads 40° and the "Floor 2/5" line works.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.5.** The camera edit worked in part. The `couch` is now uncropped on the left, at [195, 89, 694, 459] and 12% of the picture. The couch's colour is 65% against 30% around it, so it stands out. The green Buddy reads well. The red P1 is still not on screen, because `player*` boxes span 686–1069 and the lagging P1 sits below the frame. The brown `stairwell` blocks still take the right half and cover the Buddy and the right-hand railing.
6. **`window.__game` and one index.html: 8.** `observe` returns `dbg`, `grips`, `players` and `couch`. The page starts playing on load. There is no build, and `couch.tilt` is not a path (the tilt is at the top level).
7. **Faults: 7.** There were no console errors and no `Never visible` object. `perf` read 107 ms a frame, 132 draw calls and 21.6k triangles. That is SwiftShader (host load 3.2), so it is no budget signal. There are 38 long tasks. The `couch` blocks P1 from the shot.

**Next:**
1. **Close the P1 lag and the stall at frame 461 (asked again).** Re-grab P1 faster after a rag and teleport or steer P1 to its slot when it falls more than 1.5 m behind. Give the buddy more lift once `tilt` passes 30°, so the `couch` keeps moving. The same 500-frame `interact` with D and Space should end with |`players[0].pos.y` − `couch.pos.y`| under 1.5 and `couch.speed` above 0.5 after frame 461. A `look` after it should show a red hood.
2. **Put P1 in the shot (asked again).** The 0.75 player weighting did not bring P1 into the frame. Weight P1 at about 1.0 and zoom out with the y spread, or lower the camera look-at by about 1.5 m. A `look` with `sample` at the red-hood pixels, taken after 500 frames, should show red. Also make the `stairwell` blocks at the right fade or cut away, because they cover Buddy and the railing.
3. **Win and tumble `feel` pass, plus a win look (asked again).** Run `feel` after `{state:{floor:5}}` to check the shake and the jingle, and take a `look` `sheet` of `{floor:5}` to confirm the WIN banner and a `couch` above 8%. Move one of the two coplanar `stairwell` boxes 0.001 m off z=-1.60. Test 2P once with the arrows and Enter.

SCORE: 7.1

## Iteration 71
**Did** simStep player loop: a human player (not ai, not gripping) more than 1.8 m below the couch or >4 m away is teleported to couch x-1.6, y-0.2 with zero velocity. `updateCamera`: players weight 0.95 (couch 0.05) so the lagging P1 stays in shot.
**Saw** Not run (no look/perf); edit only, unverified.
**Next** 1) `look` after D+Space 500 frames: red P1 visible, couch uncropped; check the teleport is not jarring or inside geometry. 2) stall at frame 461 (tilt 40°): more buddy lift above 30°. 3) win look/feel; move coplanar stairwell box off z=-1.60 by 0.001.
**Open** Teleport point may land inside a wall or step; camera weighting may crop the couch top.
