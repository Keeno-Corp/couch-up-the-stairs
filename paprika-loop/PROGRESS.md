# Progress

The request is in PROMPT.md. Each session of the loop appends one section here: a builder's `## Iteration n` (Did, Saw, Next, Open) and the judge's `### Judge n` (its scores, Next). LATEST.md holds the last of each, rewritten by the loop after every session; the next builder reads the latest Judge's Next there first.

## Iteration 1
**Did** An index.html already existed (three+Rapier, 5 floors, AI buddy, HUD, __game). Only change: `camOff` (1.5,8.2,13.2) → (1.2,4.8,9.6) and the lookAt y in `updateCamera`, so couch/players fill more of the frame.
**Saw** Page runs with no console errors. Holding Space+D from load: the buddy slips at frame 328 (~5.5 s, `slips` 1), `crashes` 2 by frame 508, so the tumble clip lands inside the first minute. Tilt peaked at 51° (limit 42) on the first flight. Couch is 1.3% of the picture (was 1.1%); it is the warmest object (orange 89% of the object pixels). `look` Surfaces: z-fighting between two RoundedBoxGeometrys in `couch` (x=-0.30) and two BoxGeometrys in `stairwell` (y=16.80, x=-3.00). The couch ends stuck at x 2.49, floor 1, after the crash.
**Next** 1) Zoom the camera further on the couch (it is still small; try a tighter fov or a closer offset). 2) Fix the z-fighting pairs (cushion/back boxes in `couch`; mid-landing/floor `solid` boxes). 3) Play past floor 1 to check it can be won, then add dust and thud juice. 4) Check local 2P with `interact`.
**Open** Floors 2 to 5 and the WIN banner were not played this session. The headless 100 Hz stutter note says the couch is drawn in whole 1/60 s steps; interpolate it.

### Judge 1

**Session 1 verdict: the page runs and the couch climbs, but the camera, the 2.4% couch and the tumble clip hold the score down.**

Scores:
- **1. Plays as DESIGN.md's Core loop and Controls say: 6.** In solo, `Space`+`D` has the `Buddy` grip (`grips` slot 2), and `thuds` rises to 1 with six grunt, yelp and couchThud sounds. The couch then stopped at x -1.87 after 343 frames. `slips` and `crashes` stayed 0 over 402 frames, so no AI-buddy slip came in 6.7 s. Last session's 5.5 s slip does not reproduce (solo physics may not be seeded). In local 2P, `Digit2` plus `D`, `ArrowRight`, `Space` and `Enter` moved the couch 6.3 units up to y 2.94 in 300 frames. `P1` and `P2` both read HOLDING. In solo, `P1` sat at (5.82, 2.68), far from the couch, so the solo start is odd.
- **2. Rapier couch and 5-floor stairwell: 7.** The `stairwell` shows switchbacks, railings, landings and doors "1A" and "1B". I did not play to floor 5 or WIN. The HUD still read Floor 1/5 with the couch at y 2.94.
- **3. Slide-back/tumble knocks players into ragdoll: 4.** There was no tumble in either run, and no player left the `stand` state. The clip is not reliable within the first minute.
- **4. HUD (timer, Floor n/5, tilt meter, WIN banner): 7.** `div#tl` shows the floor and timer, and `div#tilt` shows "TILT 13°" with a bar. `div#grips` shows who is holding. None of the four HUD divs overlap or are cut off. The WIN banner was not seen.
- **5. Looks as LOOK.md says, characters per CHARACTERS.md: 6.**
  - **Check 1 (warmest object):** the couch holds, with orange 92% of the object pixels.
  - **Check 2 (visible, un-occluded):** this fails in the opening look. The couch is only 2.4% of the picture ([425, 397, 661, 556]). A foreground railing crosses it, and in solo the `player*` is largely hidden behind that railing.
  - **Check 3 (HUD):** the HUD is readable.
  - **Camera:** a large dark void takes the left of the solo frame and the right of the 2P frame. In 2P, the timer text sits over door "1B".
- **6. window.__game, starts on load, one index.html: 8.** `observe` and `act` work and the page starts on load. The page has no console errors.
- **Faults: 5.**
  - **Surfaces:** the z-fighting between two `RoundedBoxGeometry` in `couch` (x = -0.30) is still reported, so it is not fixed. The `stairwell` BoxGeometry pair (x = -3.00) is reported as turned away from the camera.
  - **Never visible:** `rightWall` in the solo look.
  - **Motion at 100 Hz:** the couch stands still on 38% of frames, so the stutter is not interpolated.
  - **perf:** 86.9 ms median frame on a software renderer, which is not a budget signal. It has 461 draw calls, which is high for 24.7k triangles.

Next:
1. **(asked again)** Raise Check 2 and the couch size. The couch is still 2.4% of the picture with a railing in front of it, and the void takes a third of the frame.
   - Move the camera so it follows the couch's x and y, and drop it lower and nearer.
   - Hide or fade the near railing segment in front of the couch.
   - Show it done with `look` `sample` at the couch pixels (about [540, 470]); the sample should read orange, not railing brown, and the couch box should be at least 5% of the picture.
2. Make the tumble clip reliable, since item 3 scores 4. The AI buddy should slip at the first turn at a seeded time, which shows in the `slips` and `crashes` trace (they are 0 now). Check the player state in a `sheet` of moments.
   - The ragdoll should be seen: the couch slides back down, a player flips to `ragdoll`, then recovers.
   - Check the solo `P1` start. It sits at (5.82, 2.68), far from the couch.
3. Play the couch to floor 5 and show the WIN banner. Use an `interact` with `until: {"floor": 5}` to confirm it can be won.
   - Then add juice: dust bursts, camera `shake` on a thud, and interpolation of couch and player positions between physics steps.
   - Fix the `couch` z-fighting with `polygonOffset` or by moving the cushion and back boxes off the plane (x = -0.30). Fix the `stairwell` pair at x = -3.00 as well.

SCORE: 6.1

## Iteration 2
**Did** (1) `camOff` (.8, 2.6, 6.2): the couch is 7.9% of the opening picture (was 2.4%), orange 91% of the object pixels. (2) Added `mRailNear` (opacity .18, depthWrite false) and used it on every near-edge railing bar/post/slopeBox at z = ZF-.05, so no railing hides the couch. (3) Moved the `couch` seat cushions (.76 wide, x ±.385) and back cushions (.74 wide) off the shared x = -0.30 plane; the Surfaces warning for `couch` is gone from the latest looks. (4) Lowered the buddy-slip trigger on tag L0F1 from prog .42 to .2.
**Saw** Page runs, no console errors. The opening `look` shows the couch, the red P1 and the 1A door, with no railing in front. The only Surfaces line left is the `stairwell` BoxGeometry pair at x = -3.00, turned away from the camera. `rightWall` is still never visible. In solo, `Space` held from load, then `D`: the single grip is capped at 32 (`fmax` when `gripCount` < 2), so the couch only moves once the buddy also grips; with `D` held, P1 outruns the couch, loses grip ("WHOA! Lost grip!"; STRETCH 1.6) and walks to (5.82, 2.68), which is the solo P1 oddity the judge saw. `slips` and `crashes` stayed 0 in every 600-frame run, because they never reached the stairs, so the slip change is untested. Couch drifts back to x -1.8 with only the buddy gripping.
**Next** 1) Make solo playable by a plain hold: have the buddy grab the nearest free slot immediately (`aiDelay` 3.0 is long) and let P1's `D` only walk while the stretch is under ~1.2 so P1 does not run off; check with `interact` `until: {"floor": 2}`. 2) Then confirm the L0F1 slip shows `slips` 1 and a `rag` state, and play on to floor 5 and WIN. 3) Interpolate couch/player positions between physics steps (38% still frames at 100 Hz); dust and shake on thuds; fix the `stairwell` x = -3.00 pair.
**Open** No play past floor 1 yet; solo P1 grab/stretch flow above is the blocker. Tumble clip not reproduced this session.

### Judge 2

**Judge 2 verdict: the camera item is fixed and the picture is much better. Solo still can't be played past floor 1, so no tumble or WIN has been seen.**

Scores:
1. **Plays as DESIGN.md's Core loop and Controls say: 5.**
   - Solo: `Space`+`D` leaves the couch at x -1.92 (`couch.pos`) with `speed` 0.03, and `thuds` 1.
   - Solo: `P1` is stuck at (5.82, 2.68), `grips[0].slot` -1. Only `Buddy` grips (slot 2). This is the same blocker as last session.
   - Local 2P: `Digit2` with `D`, `ArrowRight`, `Space` and `Enter` carries the couch to (4.62, 2.98) with both `HOLDING`. The floor stays 1 after 1500 frames, `tilt` is 17.9, and the couch stalls at the turn.
2. **Rapier couch and 5-floor stairwell: 6.**
   - The `stairwell` shows switchbacks, railings, and doors "1A" and "1B".
   - Floors 2 to 5 and the WIN landing have not been reached in any run.
3. **Slide-back/tumble knocks players into ragdoll: 3.** `slips` and `crashes` stayed 0 in both runs, and no player left `stand`. The slip trigger at tag L0F1 is still untested.
4. **HUD (timer, Floor n/5, tilt meter, WIN banner): 7.** `div#tl`, `div#tilt` and `div#grips` read clearly with no overlap. The WIN banner has not been seen.
5. **Looks as LOOK.md says, characters per CHARACTERS.md: 7.**
   - Check 2: the couch is 7.9% of the solo picture and 7.1% in 2P, orange at 91%, with no railing over it.
   - Subject brightness is 50% against 28% around it.
   - The red and blue hooded players read clearly.
   - A dark void still takes the left or right edge, about 15% of the frame.
6. **window.__game, starts on load, one index.html: 8.** `observe` and `act` work, there are no console errors, and the page starts on load.
7. **Faults: 6.**
   - The `couch` z-fighting line still shows in the opening look (x = -0.30, 0.71 × 0.07). It is gone in the 2P look.
   - The `stairwell` pair at x = -3.00 is out of view.
   - `rightWall` is never visible in the solo look.
   - Motion at 100 Hz: the couch stands still on 38% of frames.
   - `perf`: 211 ms median on a software renderer with host load 1.2, which is not a budget signal. 413 draw calls is high.

Next:
1. **Make solo playable by a plain hold** (asked again). `P1` is stuck at (5.82, 2.68) in solo.
   - Spawn `P1` beside the couch.
   - Have the buddy grab at once and drop `aiDelay`.
   - Stop `D` from running `P1` away from the couch (lose grip at STRETCH 1.6).
   - One tool call shows it done: `interact` with `Space` and `D` held, `until: {"floor": 2}`. When done, the floor reaches 2 and `P1` has `grips` slot ≥ 0.
2. **Get the couch past the first turn and show the tumble clip.**
   - In 2P the couch stalls at (4.6, 2.98) with `tilt` 17.9.
   - Make the buddy slip at that turn on a seeded timer, so `slips` goes to 1.
   - Use a `sheet` of moments, with the couch sliding back and a player in `ragdoll`, then up again.
   - One `interact` trace of `slips` and `players.0.state` over 900 frames shows it done.
3. **Play to floor 5 and show the WIN banner.**
   - Use `interact` with `until: {"floor": 5}`.
   - Then add juice: `shake` on a thud, `burst` dust, and interpolation of couch and player positions to remove the 38% still frames.
   - Also fix the `couch` x = -0.30 z-fight in the solo opening look and the `stairwell` x = -3.00 pair.

SCORE: 6.0

## Iteration 3
**Did** `spawn()`: P1 now starts at (-2.4, .9, LANE_N+.5) and buddy at (-.1, .9, LANE_N+.5), beside the couch; `aiDelay` 3.0 → 0.2 so the buddy grabs at once. In `simStep` player control, a gripping non-AI P1 has the input component pointing away from the couch removed once hand-to-anchor stretch > 1.0, so `D` no longer outruns the couch.
**Saw** Solo `Space`+`D` held 1500 frames: couch moves from x -1.3 to a peak 2.27 (was stuck near -1.9), `slips` 1 (L0F1 slip fires, buddy knocked), `thuds` 2, `crashes` 2, floor still 1. P1 still ends at (5.82, 2.68) with slot -1: after the slip/tumble P1 loses grip and keeps walking up the stairs alone. Couch stopped at frame 910 at x 1.43. 38% still frames at 100 Hz remain. No perf run.
**Next** 1) When P1 has no grip and the couch is far, don't let P1 run ahead (or have P1 auto-regrip/wait); a `rag` state for P1 was never seen. 2) Get past floor 1: couch stalls at x≈1.4–2.3 after the tumble; check `interact until floor 2`. 3) Interpolate couch/player positions; WIN banner; fix `stairwell` x=-3.00 pair.
**Open** Floor 2 and WIN still never reached; P1 solo run-away after grip loss is only partly fixed.

### Judge 3

The `player1` z-fight is already in my verdict under Faults, and in Next item 3 as a fix to make. I'm leaving the verdict as written. The score is 5.6 as the mean of 4, 6, 4, 7, 5, 8 and 5.

SCORE: 5.6

## Iteration 4
**Did** `simStep` player control: a non-AI P1 with no grip is leashed to 2.2 m from the couch (the outward input component is removed). New route-assist before the roll stabiliser: with ≥2 grips and any input held, the couch gets a small impulse toward `route[ci+5]`.
**Saw** Solo `Space`+`D` held 1800 frames: still floor 1. Couch stops at x≈1.46, y .26 (wedged at the base of flight 1 behind the steps, in the look it sits under the first flight). P1 (4.59, 2.68) is still up on the landing, 3 m from the couch with slot -1, so the leash only stops further drift: P1 had already run ahead before the grip loss. 38% still frames at 100 Hz. `look` reports the `player1` z-fight (0.1×0.13 face at (-0.89, 0, 0.45)) and the `stairwell` x=-3.00 pairs. No perf run.
**Next** 1) Find why the couch wedges at x≈1.46 under the first flight (collider shape vs the step solids; maybe lift/round the couch's front edge or add an invisible ramp collider for the couch). 2) Stop P1 getting ahead before the first slip: leash while gripping is only applied once stretch > 1.0, so also check the slip's knock sends P1 up the stairs. 3) Interpolate couch/player positions; fix the `player1` z-fight (polygonOffset); WIN banner untested.
**Open** Floor 2 and WIN are still never reached; the route assist is untested beyond this run.

### Judge 4

Couch still stuck on floor 1; the picture is good, but the game isn't winnable solo.

Judged on session 4 of the Couch Up The Stairs loop. I ran one 900-frame solo play and one `perf`. I did not run `sheet`, a 2P `interact` or a WIN test, so the WIN-banner and 2P scores are inferred from the code and from earlier sessions.

1. **Plays as DESIGN.md's Core loop and Controls say: 4.** After 600 idle frames I held `Space`+`D` for 900 frames. The couch ended at x -1.23 and never went up: `couch.pos` y 0.28, `Floor 1/5`, `crashes` 5, `slips` 1. `P1` ran up the stairs to (2.35, 2.19) with `gripping` false, while `Buddy` at slot 3 held the couch alone. The `Motion` line says the couch stopped at frame 1409 and never moved again.
2. **Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A; WIN at floor 5: 6.** The couch, the stairs, the railing and the `1A` door all read well. The walls have brick patches. The couch is never seen past floor 1, so the switchbacks, the other doors and WIN are unseen. The `rightWall` object is "Never visible".
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 6.** The play gave 5 `crashes`, 4 `thuds` and a `slips` count of 1. The sound list has yelp, oof and `couchThud`. I did not look at a ragdoll frame. Players come back to `state: stand`.
4. **HUD (timer, Floor n/5, tilt meter, WIN banner): 7.** `div#tl` shows "Floor 1/5 0:24.8", `div#tilt` shows "TILT 0°", and `div#grips` shows "P1: free Buddy: HOLDING". Nothing overlaps or is cut off. The WIN banner has never been seen on screen.
5. **Looks as LOOK.md says; characters match CHARACTERS.md: 7.** The warm orange couch fills the picture (orange 86%), and the subject stands out at 51% against 29% around it. The red and green hoods match. The couch takes only 7.2% of the frame, and the camera is partly blocked by a dark left foreground slab. The `Surfaces:` line still reports the `stairwell` x=-3.00 shared-face pair, but it is on faces turned away from this camera.
6. **`window.__game` and starts on load; one index.html, no build: 8.** `observe` returns the full state, and the game starts on load (`started: true`). It is one `index.html`.
7. **Faults: 5.** `perf` read 124 ms a frame, but that is a software renderer and not a budget signal. The couch stands still on 38% of frames at 100 Hz, so there is no interpolation. The `player1` z-fight from earlier sessions did not show in this look. The x=-3.00 pair is still there. The `Open` part says floor 2 and WIN are never reached. Solo play can't be won.

Everything here is made in code, as the brief asks, so there is no asset-search item.

**Next:**
1. **Make solo winnable.** Trace this with `interact` and `trace` on `couch.pos.x`, `couch.pos.y` and `grips.0.slot`. P1 lets go and runs ahead, and the couch then sits at the foot of flight 1 and never climbs. Three changes:
   - Keep P1 gripping through a slip: re-grab automatically if Space is held and P1 is within 1.5 m.
   - Make the AI buddy wait for P1 instead of carrying alone.
   - Give the couch a smooth ramp collider or a rounded front edge so it climbs the steps. Done when the same `Space`+`D` play for 1800 frames shows `Floor 2/5` or more in the `interact` state.
2. **Interpolate the couch and player render positions** (prev + (cur − prev) × acc/STEP). Done when the `Motion at 100 Hz` line no longer reports 38% still frames.
3. **Test the WIN banner and the upper floors.** Use `setState` to place the couch at the floor-5 landing, then `look` at the banner and the floor-3 and floor-5 camera. Also fix the x=-3.00 shared face, and reduce the dark left slab so the couch fills more of the frame, aiming for at least 12% instead of 7.2%.

SCORE: 6.1

## Iteration 5
**Did** `simStep` route assist rewritten: while any standing player grips and holds a direction, `couchBody` linvel is blended (k=1-e^-6dt) toward route[ci+5] (x: 1.5/1.9 m/s along the route, y and z from clamp(err*3, ±2), target y +0.66) and angvel slerps the couch to the slope pitch about z; `assisting` flag cuts the grip-spring force on the couch to 12% and suppresses the STRETCH release. `GR.stand` no longer collides with the couch (a couch had come to rest on P1's head).
**Saw** Solo `Space`+`D` after 600 idle frames: couch now climbs flight 1 (y 1.2→2.0 at x≈2) and, before the stand/couch collision change, reached the mid landing (x 3.7, y 3.55) resting on P1's head. After the change it floats ahead of both players up flight 1 (x 1.98, y 1.99, tilt 21°, players 1.4 m behind at lead -4) and stops at frame 885: still Floor 1/5, `won` false. Still 38% still frames at 100 Hz; `player1` z-fight and `stairwell` x=-3.00 pair still reported. No perf run.
**Next** 1) Find why the couch stops at x≈2 on flight 1 with both grips (log `ci`, target and `assisting` each frame via `eval`; maybe the P1 leash/`in` zero, tiltOver release, or couch caught on the near rail `post` colliders at z=ZF-.05). 2) Check it turns at the mid landing (route M points, z -0.4..0.4 vs flight-2 step solids at z<-.1) and test flight 2 and the later floors with `setState`; then WIN banner. 3) Interpolate couch/player render positions; fix the `player1` z-fight and the x=-3.00 pair.
**Open** Floor 2 and WIN still never reached; the assist is untested beyond flight 1. Pushing the couch with only one player gripping also gets the assist (1.5 m/s), so it is easier than DESIGN.md's cooperative feel; revisit once climbing works.

### Judge 5

The `Surfaces:` fault in my last `look` is already in the verdict. I listed it under Faults (score 5) and in Next item 3, with the fix: move one `player1` X-eye box off the shared plane, or remove the hidden face.

I have no changes to make to the verdict. The judge session doesn't edit the page.

SCORE: 6.0
