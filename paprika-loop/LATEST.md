The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 9

**Judge 9**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** Solo is the default and starts on load. In the 900-frame `interact` with `Space` and `D` held, P1 gripped slot 0 and Buddy gripped slot 2. `couch.pos.y` reached 5.14 (floor 2), with `players.0` at y=3.57 and `players.1` at y=4.71. The gap between carriers and `couch` is now about 1.5 m, where it was 8 m last session, so the Iteration 9 assist fix works. Buddy is still ahead of the `couch` (`lead -2`) and P1 trails it. The `couch` also reached floor 2 with only a single `slips` event. I did not test 2P or R.
2. **Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN: 7.** The `stairwell` is dressed: door 1A, brick, railings, plant, flight steps. I did not reach the WIN banner. Iteration 9 says the win is not re-verified after the tighter assist.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 6.** `slips` went 0 → 1 at frame 70 and `tilt` peaked at 58.85 at frame 248, with a yelp. `players.1.pos.y` fell to a low of 0.28 at frame 165 and then climbed to 4.21, so there was a fall and a recovery. The slip is triggered by P1's grip, not by Buddy at the first turn. I did not capture a readable ragdoll frame.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** Floor, timer, the `tilt` bar and the grips line are all present. They are tiny at the top corners and hard to read in the sheet. I did not see the WIN banner.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.** The palette is warm (orange `couch`, red and green hoods, brick `backWall`). The `couch` is only 5.4–6.7% of the frame in all three moments. It is a small orange shape between the two hooded players and a plant. A dark navy slab on the `leftWall` side is still at the frame's left edge. The LOOK Subject check is not met.
6. **`window.__game` describe/observe/act/setState, one index.html: 8.** `describe` and `observe` return rich state (`dbg`, `grips`, `players`, `couch.quat`). The page loads in 0.1 s and `interact` raised no console errors.
7. **Faults: 6.** `perf` read 130 ms a frame and 413 draw calls over 24k triangles. The host is a software renderer and busy (load 6.2), so the frame time is noise, but 413 draw calls is high. The `sheet` showed the same framing at f400 and f900, so the camera and floor tracking were not shown. The tool did not report a Surfaces line this session.

**Next:**
1. Frame the `couch` bigger (asked again). Move the camera closer and keep it from sitting behind the stairs and railings. Recolour or crop the dark navy slab at the left edge. Shown by `look` with `sheet` at frames 30 and 900 of the held Space+D play, where the `Subject:` line reads 10% or more for the `couch`.
2. Make the tumble clip readable (asked again). Force Buddy to slip at the first turn, and add dust, shake and a hold-frame or slow-motion on the player knocked over. Shown by a `look` `sheet` at the slip frame (around 70) with a ragdolled player in view, and by `feel` reporting camera shake and a particle count.
3. Re-run the full win after the tighter assist, then make the WIN banner big with confetti. Cut the 413 draw calls by merging static `stairwell` boxes into instanced or merged meshes. Shown by an `interact` that ends with `won: true`, and a `perf` that reports fewer draw calls.

SCORE: 6.6

## Iteration 10
**Did** Camera only: `camOff` (0.8, 2.6, 6.2) → (0.8, 5.4, 6.2) (about 41° down, as LOOK.md says), `camera.fov` 38 → 22, `camTarget.x` clamp .3..4.8. Tried camOff (.6,1.9,4.3): worse, the near flight-1 steps fill the lens and hide `couch`.
**Saw** Held Space+D 400 frames, `look`: `couch` 1.3% of the picture (fov 30; the fov 22 setting was not re-looked), 91 stairwell parts, `leftWall` now seen at the edge (0.04%), the dark left slab is gone from the shot. `couch` at y 5.0 and carriers at y 2.7: the couch is stuck 2+ m above the players at the turn (slips 1, stop at frame 373). z-fight pairs: unnamed `stairwell` boxes at z=0.10 and z=-0.04 (rail posts, 0.06 m) and x=-3.00 off-view. Not run: perf, win, ragdoll look.
**Next** 1) Look again at fov 22; check the camera really shows `couch` ≥10% (the `Subject:` line), and that the framing includes the carriers. 2) Couch ends 2 m above the carriers at the switchback: find why it stops at frame 373 (assist `far` speed 0 vs grip stretch) and re-run the full win. 3) Readable tumble clip and WIN banner/confetti; merge static `stairwell` boxes to cut draw calls.
**Open** fov 22 was not viewed after the edit; if the page looks cropped, set it back to 30. Win not re-verified.
