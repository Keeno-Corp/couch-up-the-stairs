The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 10

**Judge 10**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** Solo starts on load. With `Space` and `D` held, P1 and Buddy carry the `couch`, and the HUD reads Floor 1/5 at f30 and Floor 2/5 at f600. I did not test 2P or R. At f200 the `couch` and the P1 hood are near the bottom of the frame and Buddy is out of it. The framing loses the carriers.
2. **Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN: 7.** The `stairwell` has door 1A, railings, brick `backWall`, a plant and flight steps. Floor 2 is reached. I did not reach WIN, and Iteration 10 also did not verify it.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 5.** No ragdoll shows in any of the three moments. At f30 the P1 hood and Buddy are both gripping the `couch`. The clip is still not forced or readable.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 6.** The timer (0:03.3), "Floor 1/5", the tilt bar and the grip line are present but small. The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** The fov 22 camera is now a steep top-down view. The `Subject:` line gives `couch` 14% at f30, which meets the 10% check. It falls to 6.5% at f200 and 4.2% at f600. At f200 a large dark `stairwell` flight and wall slab covers about the top-right half of the frame, and at f600 a dark slab covers the right side. Saturation is 75–80% and nothing is blown out. The red and green hoods and the orange `couch` read well.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` returns the name, stack, units and key map. The page loads in 0.1 s with no console errors.
7. **Faults: 6.** `perf` gave 130 ms a frame on a busy host (load 6.4) with a software renderer, so the time is noise. It also counted 388 draw calls and 21.9k triangles; the draw calls are still high. The camera is occluded by `stairwell` geometry at f200 and f600. Floor tracking at f200 puts the carriers at the frame edge.

**Next:**
1. **Camera occlusion and carrier framing (asked again).** Fade or hide `stairwell` flights, walls and slabs that sit between the camera and the `couch` and carriers. Another option is to aim `camTarget` at the midpoint of `couch` and both players, with a pull-back that depends on the turn. Shown by `look` `sheet` at frames 30, 200 and 600 of the held Space+D play. Success is `couch` at 10% or more in all three, no dark slab over the frame, and both hoods in view.
2. **Readable tumble clip (asked again).** Force Buddy to slip at the first turn, around f70–250. Add dust, camera `shake` and a brief slow-motion or hold on the knocked-over player, with the camera framed on that player. Shown by a `look` `sheet` at the slip frame with a ragdolled hood visible, and by `feel` reporting shake and particle count.
3. **Full win run, then a big WIN banner with confetti.** Run an `interact` that ends with `won: true`, and check that the couch no longer sticks 2 m above the carriers at the switchback (the Iteration 10 stop at frame 373). Merge the static `stairwell` boxes into merged or instanced meshes. Shown by `perf` reporting fewer than 388 draw calls, and by a `look` of the banner.

SCORE: 6.4

## Iteration 11
**Did** `updateCamera`: `camTarget` now aims at the mean of `couch` and the non-ragdolled players (x clamp .3..4.8, y +.5); `camOff` pulls back by .5/.6 × the player-to-couch height spread (max 3). `level` (`stairwell`) children are hidden when their bbox min y > camTarget.y + .4 and wider than .3 (bboxes cached in `level.userData.bb`).
**Saw** Held Space+D `look` sheet: `couch` 13% at f30, 11% at f200 (was 6%), 2.2% at f600. At f30 and f200 both hoods are in view and there is no dark slab. At f600 the couch is at the far top, the hoods are in the top right, and a dark flight still covers the left. Not run: perf, win, tumble clip.
**Next** 1) At f600 the couch is 2.2%: the couch is still stuck above the carriers at the switchback (the stop at about frame 373), so find why and re-run the win. 2) Readable tumble clip (forced slip, dust, shake, slow-motion). 3) WIN banner and confetti, and merging static `stairwell` boxes to cut draw calls.
**Open** The hide threshold may pop floor geometry visibly on the stairs. Win not verified.
