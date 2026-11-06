The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 8

Status: I've opened the page, looked at it, played solo with P1 holding Space and D, and run `perf`. I'm writing the verdict now.

**Judge 8**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** Solo is the default and the page starts playing on load. In the 1500-frame `interact`, `Buddy: HOLDING` moved the `couch` alone and it stopped at frame 126 against the left wall. Holding `Space` and `D` then took it to `Floor 3/5` at 0:39.8. `couch` y went 0.3 → 5.7 and `couch.pos.y` reached 9.23. P1 was at x=5.36, y=2.68 and Buddy at y=0.56, so Buddy had stayed on floor 1. The assist drags the `couch` ahead of its carriers, and Buddy stands idle with `lead -2` and `stretch 1.97`. I did not test 2P.
2. **Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN: 7.** The `stairwell` has doors 1A, 3A and 2B, railings, landings, potted plants and paper litter. I did not reach the WIN banner this session. The last builder saw `won: true` at about 2400 frames, so the win is reachable but cheap.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 6.** `slips` was 1 and `thuds` 2, with a yelp and `couchThud` sound. `tilt` peaked at 58.84 at frame 227 and recovered to 1.77. The slip came after P1 grabbed the `couch`, not from Buddy slipping at the first turn. I did not capture a ragdoll frame, and the clip is not clearly readable.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 8.** `div#tl` shows "Floor 3/5 0:39.8", `div#tilt` shows a coloured bar with "TILT 29°", and `div#grips` shows "P1: HOLDING". None of them overlap or are cut off.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.** The palette is warm, with an orange `couch`, red and green hoods, a brick `backWall` and a green wainscot. The `Subject:` line says the `couch` takes only 7% of the frame at the start and 3.6% on floor 3. There, `stairwell` takes 81% of the picture and the `couch` is partly hidden behind a railing and the stairs. The left edge has a dark navy slab, and the `Surfaces:` pair at `stairwell` x=-3.00 is still open.
6. **`window.__game` describe/observe/act/setState, one index.html: 7.** `observe` returns rich state (`dbg`, `grips`, `players`, `couch.quat`). The page loads in 0.2 s with no console errors.
7. **Faults: 6.** `perf` read 120 ms a frame, 413 draw calls and 24k triangles, but the host is a software renderer, so that is noise. 413 draw calls is high, though. The `Surfaces:` pair at x=-3.00 is still open, `rightWall` is Never visible, and `sparks` was Never visible on floor 3 ("behind stairwell").

**Next:**
1. Fix the assist and carry coupling (asked again). Stop the `couch` assist when any gripper is more than STRETCH away. Make Buddy's AI follow the `couch` up the stairs instead of idling at `lead -2`. Shown by an `interact` with `Space`+`D` for 900 frames, where `players.1.pos.y` is within about 3 m of `couch.pos.y` (it is 8.7 m below now).
2. Frame the `couch` and carriers bigger and clearer. The `couch` was 3.6% of the frame on floor 3, hidden behind the railing and stairs, so move the camera closer and keep it from sitting behind geometry. Crop or recolour the dark left slab. Shown by `look` on floor 3 with the `Subject:` line at 10% or more and `couch` unoccluded.
3. Make the tumble clip readable. Force Buddy's slip at the first turn, and add dust, shake and a hold-frame on the player knocked over. After that, fix the `stairwell` x=-3.00 pair by moving one box 0.0001 off the plane. Shown by `look` `sheet` at the slip moment, and a clean `Surfaces:` line.

SCORE: 6.4

## Iteration 9
**Did** Route assist in `simStep` now scales its speed to 0 when any gripper is 1.9–2.8 m (3D) from the `couch` (`far`). In `aiThink`, a Buddy with no slot and more than 3.2 m from the couch walks up the `route` toward it; a gripping Buddy with `lead < 0` no longer idles on `stretch > .8`.
**Saw** `interact` solo Space+D 900 frames: couch y 5.15, Buddy y 4.7 (grips slot 2, stretch 0.42), P1 y 3.6 (before: Buddy y 0.56, P1 2.7, couch 5.0). Not seen: `look`, perf, win run, 2P.
**Next** 1) Frame the couch bigger (3.6–5.8% → 10%) and fix the dark left slab. 2) Fix the `stairwell` x=-3.00 Surfaces pair and look at a ragdoll frame. 3) Re-run the full win and check the tighter assist doesn't strand the couch (P1 only needs A/D at switchbacks).
**Open** The couch still rises ahead of P1 by about 1.5 m on the first flight. Win not re-verified after this change.
