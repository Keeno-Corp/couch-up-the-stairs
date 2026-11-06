The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 44

**Judge 44 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** The Space+D 400-frame `interact` gives `floor` 1→2 at f294 and `slips` 0→2, with the first slip at f117 and a "WHOOPS! BUDDY SLIPPED!" `div#toast`. `grips` are P1 slot 0 and Buddy slot 3, and the sounds are grunt, yelp and couchThud. Buddy's `grips.1.slot` is still -1→3 at f385, so the re-grab is still slow. I did not play 2P.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 6.** Doors 2A and 1A, the rails, the plant and the rug are all readable on floor 2. The stairs are dark brown and muddy, and the switchback is hard to read. I did not reach the WIN. `Surfaces:` flags a shared face at z=-1.60 between `merged` and `stairwell`, but only on faces turned away from this camera.
3. **Slide-back/tumble ragdoll, get up: 5.** Both players are back to `stand` after the slips. In the mid-slip look, `player*` is only 0.29% of the frame and sits off the bottom edge. The wider camera pushed the players out of shot, so the tumble clip is not visible.
4. **HUD: 9.** `div#tl` Floor 2/5 0:06.2, `div#tilt` TILT 36°, `div#grips` HOLDING and `div#toast` all show, with no overlap and nothing cut off. I did not see the WIN banner.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.** At frame 0 the framing is good: `couch` is 11% [394,413,848,725], with the red and green `player*` beside it. But the upper half is empty dark, with a lone brick-wall sliver at the upper left, because `backWall` is hidden. Orange is 70% over-objects at frame 0 and 75% in play, against a 55% target. During play the `couch` is 5.4% against a floor of mostly brown `merged`.
6. **`window.__game` and one index.html: 8.** `describe` and `observe` work and the page starts playing on load.
7. **Faults: 6.** The console is clean and `Never visible` is none. `perf` is 63 ms a frame, but that is SwiftShader, so it is not counted. It has 117 draw calls and 20.5k triangles. The frame-0 empty dark upper area is a fault. During play `player*` is 0.29% of the frame.

**Next:**
1. **Keep the players in frame during play and slips.** `updateCamera`'s `camTarget` follows only the couch, so P1 is at y 1.86 while the couch is at y 5.07. Frame the bounding box of the couch and both players, and pull in a zoom or shake on the knocked player at each slip. Check: the same Space+D 400-frame `interact` with `look`. `player*` should be over 1% at the slip and the ragdoll visible.
2. **Fix the dark upper area at frame 0 and cut the orange.** Show `backWall` at frame 0, or set a lighter cool `scene.background`, and remove the brick sliver at the upper left. Retint `mRail` and the stairs toward grey-blue and make the floor cooler. Check: a frame-0 `look` shows no empty dark upper half and orange under 55% over-objects.
3. **Cut Buddy's re-grab to under 90 frames after a slip** (asked again). Run `interact` with `trace: ["grips.1.slot"]`. It should read -1 within 90 frames of the f117 slip, rather than the current f385. Then check WIN with `setState` to floor 5 and a `look` for the banner, and 2P with an arrows+Enter `interact`.

SCORE: 6.6

## Iteration 45
**Did** `updateCamera`: players in `rag` now count toward the framing average (were skipped); target y is `my*.6 + couch.y*.4 + .6` (was couch-weighted .85); spread cap 4 (camOff.y +.4/unit, camOff.z +.8/unit). `stage` background 0x3a4a66 (was 0x231c24), cooler and lighter.
**Saw** Space+D 150-frame `interact` look: `player*` 5.1% [462,530,788,799] (was 0.29%) with the KO'd green Buddy ragdoll visible beside the red P1; `couch` 8.6%; `backWall` now shows 12%; toast, HUD fine; console clean, `Never visible` none. Orange 75% over-objects (still over 55%). Brick sliver still at the left of the 1A door. Slip came at ~f117 again; Buddy `grips.1.slot` still -1 at f150. `perf`, WIN and 2P not run.
**Next** 1) Cut orange: retint `mRail`, stairs and `woodT` toward grey-blue. 2) Trace `grips.1.slot` through the slip, Buddy re-grab under 90 frames. 3) Check WIN via setState floor 5 and 2P with arrows+Enter.
**Open** The stairs still read dark and muddy. Frame-0 look not re-run after the background change.
