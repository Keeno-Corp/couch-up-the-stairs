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

## Iteration 6

Lifting the couch 0.5 m lets it move, so it's snagging on stair geometry at that height. I'm raising the assist's target height.

### Judge 6

The `Surfaces:` line from my last `look` is already in the verdict. I listed it under Faults (score 5) and in Next item 3. The fix is to offset or remove the hidden face of the `couch` RoundedBoxGeometry pair at x = -0.40, or give the top one `polygonOffset` with a factor of -1.

The verdict stands as written. The judge session doesn't edit the page.

SCORE: 6.6

## Iteration 7
**Did** Fixed the `couch` z-fight: base mesh now 1.96×.93 and back 1.97 wide (they shared the local x=±1.0 plane with the arm boxes); seat cushions .74 wide, back cushions .70 wide at y .43, z -.19.
**Saw** `look`: the couch `Surfaces:` fault is gone. Only the `stairwell` x=-3.00 pair remains, on faces turned away from the camera. Couch 7% of the frame; orange 84%. No play or perf run this session.
**Next** 1) Find why the couch stops on flight 1 and never reaches floor 2 (log `ci`, target, `assisting` per frame). 2) Test the WIN banner and the upper floors with `setState`. 3) Interpolate couch/player render positions (38% still frames at 100 Hz); move the couch up in the frame (7% → 12%).
**Open** Floor 2 and WIN are still never reached. The stairwell x=-3.00 pair is unfixed.

### Judge 7

That `Surfaces:` line is already in my verdict. I listed it under Faults and in Next item 3. The fix is to move one of the two `player0` boxes at x=-0.76 about 0.0001 off the shared plane. A judge session doesn't edit the page, so I've left it alone.

The verdict stands as written.

SCORE: 5.6

## Iteration 8
**Did** Added render interpolation: `snapPrev()` runs before each `simStep`; `updateVisuals` lerps `couch` position, slerps its quaternion and lerps each `player.ch.g` position by `acc/STEP` (`acc` hoisted above `snap0`).
**Saw** `interact` solo `Space`+`D` after a restart reaches `Floor 5/5` and `won: true` at about 2400 frames (35 s, 0 crashes); the WIN banner shows on screen with "HOME SWEET HOME" sign. The `Motion at 100 Hz` 38% still-frame note is gone. `look`: couch 5.8% of the frame, orange 86%, only the `stairwell` x=-3.00 `Surfaces:` pair remains, `rightWall` Never visible. No perf run.
**Next** 1) The assist drags the couch up while P1 and Buddy are left far behind (stretch 10 m, P1 on floor 1 while the couch is on floor 3); cap the couch's lead over the grippers (stop assist when a gripper is > STRETCH away, or make the players follow it). 2) Frame the couch bigger (5.8% → 12%) and cut the dark left slab. 3) Fix the `stairwell` x=-3.00 pair; look at a ragdoll frame and floors 2-4.
**Open** Win is reachable but cheap: the couch floats ahead of its carriers. The first `interact` after `open` sometimes reports a different couch.y than a restarted run (state not fully reset by `restart`?).

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

### Judge 11

**Judge 11**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** Solo starts on load. Holding `Space`+`D`, P1 and Buddy carry the `couch`. The HUD reads Floor 1/5 at f30 and f200 and Floor 2/5 at f400 and f600, and the timer runs. I did not test 2P or R. At f400 and f600 the `couch` is off screen and only the hoods show, so the carry is not readable.
2. **Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN: 7.** Door 1A shows at f30 and f200 and door 1B at f400 and f600. The railings, brick `backWall`, `leftWall` and `rightWall` are there. The climb to floor 2 works. I did not reach WIN, and Iteration 11 did not verify it either.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 4.** No ragdoll or knocked-over player shows in any of the four moments. At f200 Buddy reads "free" for a moment but stays upright. The clip is still neither forced nor readable.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 6.** The timer, "Floor n/5", the TILT bar and the P1/Buddy grip lines are all present. They are tiny, and the WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** The `Subject:` line gives `couch` 13% at f30 and 11% at f200, which meet the 10% check, but 1.5% at f400 and 2.1% at f600. Saturation is 72–74%, nothing is blown out, and the red and green hoods against the orange `couch` read well. At f400 and f600 a dark `stairwell` flight slab still covers the left half and the `couch` is hidden. The hide threshold has not fixed that slab.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` returns the name, stack, units and key map. The page loads in 0.1 s with no console errors.
7. **Faults: 6.** `perf` gave 128.6 ms a frame on a software renderer at host load 6.6, so the time is noise. It counted 301 draw calls (down from 388) and 21k triangles. The camera is still occluded by `stairwell` geometry after the first turn, and the `couch` is lost from view there.

**Next:**
1. **The `couch` is lost after the first switchback (asked again).** At f400 and f600 it is under 3%, with the hoods at the frame edge and a dark flight covering the left. Call `observe` at f400 to find where `couch` sits relative to the players. If it is stuck above them (the frame-373 stop), fix the physics or grip so it stays between them. Also hide the whole flight above the carriers (hide by flight index, not by bbox), and make `camTarget` follow `couch.position` directly during turns. The check is `look` `sheet` at f400 and f600 of the held Space+D play: `couch` 10% or more and no dark slab.
2. **Readable tumble clip (asked again, still undone).** Force Buddy to slip at the first turn around f70–250, then ragdoll that player. Add dust `burst`, `shake`, a brief slow-motion hold and a "WHOOPS" HUD pop. The check is a `look` `sheet` at the slip frame showing a ragdolled hood, and `feel` on the slip showing shake.
3. **Full win run, then a big WIN banner with confetti.** Run an `interact` with `until: {won: true}` and report the result. Add a large centred WIN banner and a confetti `burst`. Enlarge the HUD text, and merge the static `stairwell` boxes with `instances` so `perf` draw calls fall well under 301.

SCORE: 6.3

## Iteration 12
**Did** Diagnosis only; no change to `index.html` (a y-rescue/teleport of `couchBody` to the carriers' mean was tried and reverted: it did not help).
**Saw** Held Space+D: the stop at frame 373 is expected. P1 reaches x 4.81 on the mid landing and pushes into the wall, while the route assist keeps carrying `couch` onto the F2 flight (`couchIdx` 20, couch y 5.03 against players y 2.7, Buddy `cI` 20 vs `myI` 10). So the "stuck above the carriers" is a test-input artefact plus an assist with no leash in y. Playing D for 230 frames, then A: floor 2 at f314, `couch` y 4.6 while P1 is at y 2.72 and low 0.56 at f382 (P1 drops off the flight: `players.0.pos.y` goes 2.96 → 0.56). Buddy gripping at x 4.67, y 3.53; `crashes` 0. Perf, win and tumble not run.
**Next** 1) Leash the assist in `simStep` (the "route assist" block): cap tg.y at the mean carrier y + .9 and slow the couch to 0 when any gripper is more than 1.5 from it in y; test with D until x≈4.5, then A, not held D. 2) Find why P1 falls from y 2.96 to 0.56 at about f382 on the F2 flight (railing or gap?). 3) Then the tumble clip, WIN banner and confetti, and merging `stairwell` boxes.
**Open** Win not verified. Held-D in a playtest is not a valid climb; use D then A. Tumble clip and enlarged HUD still undone.

## Iteration 13
**Did** Leashed the route assist in `simStep` (the "route assist" block): `tg.y` is capped at mean carrier y + .9, and the couch speed is scaled to 0 once `couch` is 1.5–2.3 m off the carriers' mean y (`dyMax`). Nothing else changed.
**Saw** Played Space held, D 230 frames, then A 300 frames: P1 y peaks 1.82 at f223, `crashes` 1 at f379, floor stays 1, couch ends at y 2.38 beside Buddy (y 2.08), and `look` gives `couch` 14% with a lit frame and no dark slab. The couch now stays between the carriers instead of riding above them. This was not a climb to floor 2, and the 2P, win, perf and tumble checks were not run. `look` also flagged two `stairwell` boxes sharing a face at x=-3.00 (hidden side).
**Next** 1) Climb test: D until x≈4.5, then A, up to floor 2 and 3, to confirm the leash does not stall the carry. 2) Find why P1 drops from y 2.96 to 0.56 on the F2 flight. 3) Forced Buddy slip with ragdoll, dust, shake, slow-mo and a "WHOOPS" pop. 4) A big WIN banner with confetti, a larger HUD, and merging the static `stairwell` boxes into `instances`.
**Open** Win not verified. The tumble clip and the larger HUD are still undone. The leash thresholds are untested on the climb.

### Judge 13

**Judge 13**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** I held Space, then D for 230 frames, then A for 400. `floor` stayed at 1 for all 600 frames, and the `couch` stopped at frame 614 at y 2.38, so the carry is stalled, not climbing. P1 ends at y 1.06 with "P1: free" and Buddy holding. `crashes` went 0→1 at f379. I did not test 2P or R.
2. **Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN: 6.** Door "A", the railings and the `stairwell` flights are there. I never got past floor 1, and WIN is still unverified (`won` false).
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 4.** `slips` is 1 and `thuds` 1, with sounds (yelp, couchThud), but at the end both players are in state "stand". No ragdolled hood was visible, so the clip is still not forced or readable.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 6.** `div#tl` (Floor 1/5 and the timer), `div#tilt` and `div#grips` are present, with no overlap or cut-off. The text is small and no WIN banner was seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 7.** `Subject:` gives `couch` 14% (above the 10% check), saturation 74%, 0% blown out, 0% near black. The orange `couch` against the red and green hoods reads well, and the framing is lit with no dark slab. `Stands out` shows only 0.21 edge contrast, and `look` reports two `stairwell` boxes sharing a face at x=-3.00.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` returns the name, stack, units and keys. The page loads in 0.2 s with no console errors.
7. **Faults: 6.** `perf` gave 115.9 ms a frame on a software renderer at host load 2.4, which says nothing about a GPU. It counted 301 draw calls and 21k triangles. `look` says `leftWall` and `rightWall` are "Never visible" although they are in view. The carry stalls on the first flight.

**Next:**
1. **The carry stalls on the F1 flight (new, from the leash).** In the play above the couch stops at y 2.38, x 3.75 with `speed` 0.13 and `floor` never reaches 2. The leash scales speed to 0 once the couch is 1.5–2.3 m off the carriers' mean y, and P1 (y 1.06) has dropped while Buddy is at y 1.94. Run `interact` with `trace` on `couch.pos.y`, `players.0.pos.y` and `players.1.pos.y`, and loosen `dyMax` or make P1 follow the stairs. The check is a held Space+A play that reaches `floor` 2 within 900 frames.
2. **Readable tumble clip (asked again).** Force Buddy to slip at the first turn, then ragdoll that player. Add a dust `burst`, `shake`, slow-motion and a "WHOOPS" pop. The check is `look` `sheet` at the slip frame showing a ragdolled hood.
3. **Full win run, then a big WIN banner with confetti, a larger HUD, and static `stairwell` boxes merged with `instances`.** Run `interact` with `until: {won: true}` and report the result. The check is `perf` showing draw calls well under 301.

SCORE: 6.1

## Iteration 14
**Did** Loosened the route-assist leash in `simStep`: speed factor now `clamp(1-(dyMax-2.6)/1.2, .25, 1)` (never fully 0, so the carry cannot stall), and `tg.y` cap is mean carrier y + 1.1. Nothing else changed.
**Saw** Played Space held, D 230 frames, then A 670: `floor` reaches 2 at the end (couch y 4.95, P1 y 3.32, Buddy y 4.5), `slips` 1, tilt 40° at the end, couch x 0.06. Trace: couch y peaks 3.42 at f284; P1 y drops 3.3 → 0.56 at f386 (the F1→F2 flight drop is still there); Buddy y low 0.28 at f153. No console errors. `look`, `perf`, 2P and win were not run.
**Next** 1) Why P1 falls 3.3 → 0.56 on the flight; 2) forced Buddy slip with ragdoll, dust, shake, slow-mo, "WHOOPS" pop; 3) win run (`until {won:true}`), big WIN banner with confetti, larger HUD, merge static `stairwell` boxes with `instances`.
**Open** Win not verified; tilt 40° at the end of the climb is high; tumble clip and bigger HUD undone.

### Judge 14

Reached floor 2 in 15 s. The picture is readable, but the stair rails clip through the couch.

**Judge 14**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** Space held, then D for 230 frames and A for 670. `floor` reaches 2 at the end (`couch` y 4.96, tilt 40°). `floor` read 1 throughout the first 600 frames. P1 falls from y 3.33 at f247 to y 0.56 at f381, so the F1→F2 flight still drops P1. I did not run 2P or R.
2. **Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN: 6.** The F2 landing, the `stairwell` flights, the door, the plant and the railings are there. `won` is false throughout. I never got past floor 2, so WIN is unverified.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 4.** `slips` goes 0→1 at f74 (yelp). At the end both players are in state "stand", and no ragdoll or dust was visible. The clip is still not forced or readable.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 6.** `div#tl` (Floor 2/5, 0:15.0), `div#tilt` (TILT 40°) and `div#grips` have no overlap or cut-off. The text is small, and I saw no WIN banner.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** `couch` takes 10%, with 74% saturation, 0% blown out and 0% near black. The orange `couch` against the green hood reads, but edge contrast is only 0.187. The `stairwell` railings cross in front of the `couch` and clutter the subject. `look` reports two `stairwell` boxes sharing a face at x=-3.00.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work, and the page loads in 0.2 s with no console errors.
7. **Faults: 6.** `perf` gave 118 ms a frame on SwiftShader at host load 1.9, which says nothing about a GPU. It counted 301 draw calls and 21k triangles. `look` lists `rightWall` as "Never visible" although it is in view. The tilt of 40° at the end is high.

**Next:**
1. **Readable tumble clip (asked again).** Force Buddy to slip at the first turn, then ragdoll that player, with a dust `burst`, `shake`, brief slow-motion and a "WHOOPS" pop. The check is `look` `sheet` at the slip frame (f74 plus a few frames), which should show a ragdolled hood and dust.
2. **P1 drops from y 3.3 to 0.56 on the F1→F2 flight (asked again).** Run `interact` with `trace` on `players.0.pos.y` and `couch.pos.y`. Find why P1 slides or falls off the flight, for example a missing stair collider or a push from the couch, and keep P1 on the stairs. The check is that `players.0.pos.y` never falls more than 1 m while `floor` rises. Also bring the tilt down so it is not 40° at the top of the climb.
3. **Full win run, then a big WIN banner with confetti and a larger HUD.** Run `interact` with `until: {won: true}` and `max` 3000, and report the result. Move the near railings out of the camera's line to the `couch`, or fade them, so the subject is not cut. Merge the static `stairwell` boxes with `instances`. The check is `perf` showing draw calls well under 301.

SCORE: 6.0

## Iteration 15
**Did** Buddy slip in `simStep` now also emits a 40-spark dust `burst` at Buddy, a stronger `shk.kick(.8)` and toast "WHOOPS! BUDDY SLIPPED!"; win `sparks` confetti count 160→380. Not played or looked at this session.
**Saw** Only `open`+`look` at frame 0: loads, no console errors, couch 13% of picture, edge contrast 0.216, 0 HUD overlaps. Slip not played.
**Next** 1) `look` at slip frame (~f74) to confirm ragdoll+dust; 2) trace why P1 y drops 3.3→0.56 on F1→F2; 3) full win run, merge `stairwell` boxes, move railings off camera line.
**Open** Slow-mo not added; win unverified; tilt 40° at the top; slip effect unplayed.

### Judge 15

**Judge 15 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** I held Space, then D for 200 frames and A for 700. `floor` reached 2 (`couch` y 4.88) by about 40 s, and `won` stayed false after another 1500 frames. In the first 600 frames `tilt` peaked at 58° at f268. `players.0.pos.y` went 2.32 (f202) → 0.56 (f380) → 0.72 (f591), so P1 still falls back on the F1→F2 flight. I did not run 2P or R.
2. **Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN: 6.** Door 1A, the plant, the railings and the `stairwell` flights show. `rightWall` is listed "Never visible" although it is in view. The WIN landing is unverified because floor 3 was never reached.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 7.** Held Space with no steering, `slips` went 0→1 at f142. The Buddy ragdoll (`state` "rag", X-eyes, "*KO*") appeared with the `sparks` dust and a "WHOOPS! BUDDY SLIPPED!" toast, and the sounds were grunt, grunt, yelp. It reads in the look. The slip comes at f142, not at the first turn, so it still depends on the input. There is no slow-motion, and I did not see the get-up.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl` (Floor 1/5, 0:02.4), `div#tilt` (TILT 7° bar), `div#grips` and `div#toast` have 0 overlap and nothing cut off. The text in `div#tl` and `div#help` is small. The WIN banner is unseen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 7.** `couch` takes 12% of the picture, 74% saturation, 0% blown out, 0% near black. Edge contrast is 0.202 and subject brightness is 59% against 37% around it. The orange couch against the green Buddy and red P1 reads well. The tilted camera and railing clutter reduce clarity. `look` reports two `stairwell` boxes sharing a face at x=-3.00.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work, the page loads in 0.1 s and the console is clean. `observe` lacks a `couch.tilt` path, only a top-level `tilt`.
7. **Faults: 6.** `perf` gave 121 ms a frame on SwiftShader at host load 1.9, which is noise. It counted 301 draw calls and 21k triangles, and the many `stairwell` boxes are not merged. P1's fall on the F1→F2 flight and the 58° tilt peak are real gameplay faults.

**Next:**
1. **P1 falls on the F1→F2 flight, and tilt hits 58° (asked again).** Run `interact` with `trace` on `players.0.pos.y`, `couch.pos.y` and `tilt` over the climb. Find why P1's y drops from 2.3 to 0.56, for example a missing collider at the first landing or the couch shoving P1, and fix it. Also add a tilt limiter or auto-level assist. It is done when `players.0.pos.y` never drops more than 1 m while `floor` rises and `tilt` stays under 45°.
2. **Verify a full win and make the climb completable.** Floor 2 took 40 s and floor 3 was not reached. Make the AI buddy carry its share from `grips` slot 2 onward. Then run `interact` with `until: {won: true}`, `max` 3000. It is done when `won` is true and the WIN banner with the `sparks` confetti shows in `look`. Report that look.
3. **Add slow-motion and a forced slip at the first turn.** Add 0.3 s of slow-motion at the slip with a camera nudge. Trigger Buddy's slip at the first switchback so it does not depend on input. Then merge the static `stairwell` boxes with `instances` and move the near railings out of the camera line to the couch. It is done when `look` at the slip frame shows the ragdoll without railing clutter and `perf` shows draw calls well under 301.

SCORE: 6.7

## Iteration 16
**Did** Traced F1→F2 with `interact` (Space held, D 200f, A 500f). Tried an extra full-axis leveling torque on `couchBody` in `simStep` when `tiltDeg` > 25; it made things worse, so I reverted it with `git checkout -- index.html`. No code change this session.
**Saw** Baseline run: `players.0.pos.y` 0.9 → low 0.58 (f34) → peak 3.38 (f553); `couch.pos.y` reached 4.45, `floor` 2 at f587; `tilt` peaked 59.7 at f312, which is right after the slip and crash (`slips` 1, `crashes` 1). With the torque: tilt still peaked at 61.5, the grips dropped, `floor` stayed at 1 and the sound log spammed grunt/yelp ~700 times (re-grab/release loop). The earlier "P1 falls to 0.56" is not a fall in this run; P1 climbed to 3.3.
**Next** 1) Find what makes tilt spike at f312 (the Buddy slip `release(ai)` + `tumbleKick`, probably an impulse on `couchBody`); cap that impulse or hold `assisting` through the slip; 2) rate-limit the grunt/yelp sounds (a release/re-grab loop spams them); 3) run `until: {won: true}`, merge the `stairwell` boxes, add slow-mo at the slip.
**Open** Tilt peak ~60° after the slip; win unverified; slip look unplayed.

## Iteration 17
**Did** Rate-limited `play()` to one sound per name per 350 ms (stops the grunt/yelp spam); softened `tumbleKick` torque from -4..-6 to -1.2..-1.8.
**Saw** Same run (Space, D 200f, A 700f): `slips` 1 at f74, `tilt` still peaks 58.6 at f266 (so the kick was not the cause), `couch.pos.y` peak 2.98 then back to 2.8, `floor` 1 throughout; `players.0.pos.y` 0.9 → 2.31 (f202) → 0.56 (f383). Sound log now 2 entries (grunt, yelp). The couch stopped at f319 and did not move again.
**Next** 1) Trace `tilt` vs `couch` quat around f200–270 to find what drives the spike (stair-edge collision while P1 steers, not the slip); 2) a tilt limiter on `couchBody` angular velocity; 3) `until: {won: true}`, merge `stairwell` boxes, slow-mo at the slip.
**Open** Tilt 58° peak, couch stuck at f319, win unverified, no slow-mo.

### Judge 17

**Judge 17 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 5.** I held Space, then D for 200 frames and A for 700. `floor` stayed at 1 for all 600 traced frames and `won` stayed false. `tilt` peaked at 58.6° at f266. `couch` stopped at f319 and did not move again, at `couch.pos.y` 2.8 with `speed` 0.07. `players.0.pos.y` went 0.9 → 2.31 (f202) → 0.56 (f383), so P1 still falls back. This is the same as iteration 17's run, so the builder's two changes did not help the loop. I did not run 2P or R.
2. **Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN: 6.** Door "1A", the `stairwell` flights and the railings show. `leftWall` and `rightWall` are "Never visible" even though they are in view. Floors 2 to 5 and the WIN landing were not reached, so they are unverified.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 6.** `slips` went 0→1 at f74 and the sound log has grunt and yelp, so the spam is fixed. The slip still depends on the input, because it is not tied to the first turn. I saw no slow-motion, and both players are back to `state` "stand".
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl` (Floor 1/5, 0:15.0), `div#tilt` (TILT 28°), `div#grips` and `div#help` have 0 overlap and nothing cut off. The `div#help` text is small. The WIN banner is unseen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** The `couch` takes only 7.5% of the picture and is cut by the frame edge at the top right. Subject brightness is 57% against 27% around it, but edge contrast is 0.123, which is lower than before. The camera sits too close to the stairs, so P1 and Buddy are hidden behind railings and steps. The orange, red and green palette is good.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work, the page loads in 0.1 s and the console is clean.
7. **Faults: 5.** `perf` gave 120 ms a frame, 301 draw calls and 21k triangles. That is a software renderer, so it is noise, but the unmerged `stairwell` ×42 boxes are real. Two `stairwell` boxes share a face at x=-3.00. The couch gets stuck at f319 and the 58° tilt peak persists, and both have now survived three sessions.

**Next:**
1. **Couch gets stuck and tilt spikes to 58° (asked again).** Iteration 17's Next was to trace the spike, and it was not done. Run `interact` with the same Space+D+A input and `trace` on `couch.up.y`, `tilt`, `couch.pos.y` and `dbg.lv.y`, then read f200–330. Find what pins the couch at `couch.pos.y` 2.8 (probably a stair-nosing collider or the grip joint) and add an angular-velocity clamp and a nudge-free path up. It is done when `floor` reaches 2 or higher inside 600 frames and `tilt` peaks under 45°.
2. **Verify a full win.** Run `interact` with `until: {won: true}`, `max` 3000, using held Space and steering. It is done when `won` is true and `look` shows the WIN banner with confetti. Report that look. If it cannot be done, use `setState` to put the couch near the floor-5 landing, and check the win trigger and banner at least.
3. **Pull the camera back and make the first-turn slip scripted.** Frame the couch plus both players without railing or step occlusion. The couch should cover about 12% of the picture and stay inside the frame. Trigger Buddy's slip at the first switchback, with 0.3 s of slow-motion. Then merge the `stairwell` boxes with `instances` to cut the draw calls below 301. It is done when `look` at the slip frame shows the ragdoll unobstructed and `perf` shows fewer draw calls.

SCORE: 6.1

## Iteration 18
**Did** Added an angular-velocity clamp (2.2 rad/s) on `couchBody` in the roll-stabiliser block of the step function, just before `graceT` decays.
**Saw** Same run (Space held, D 200f, A 700f): `floor` reached 2 by f930 (`couch.pos.y` 4.72, `tilt` 40°, `slips` 1 at f74). In the first 600 frames `floor` stayed 1 and `tilt` still peaked at 58.4 at f283 with `couch.pos.y` 2.98 at f277. The couch no longer stays stuck. 3 sounds (grunt, yelp, grunt). No `look` this session, so the camera and couch size are unchanged (couch about 7.5% of the picture).
**Next** 1) Find what causes the 58° spike at f270–283 (it is not angular speed; check stair-edge colliders with `__dbgContacts` at f277); 2) `until: {won: true}` run and a WIN-banner `look`; 3) pull the camera back for 12% couch coverage, script the first-turn slip with slow-mo, merge the `stairwell` boxes with `instances`.
**Open** 58° tilt peak persists, win unverified, camera, slow-mo and draw-call items not done.

### Judge 18

**Judge 18 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 5.** I held Space, then D for 200 frames and A for 700. `floor` was 1 for all 600 traced frames and reached 2 only by f900 (`couch.pos.y` 4.72). `tilt` peaked at 58.39° at f283, with `couch.pos.y` 2.98 at f277. The couch no longer sticks, because the angular-velocity clamp stopped that. The 58° spike is unchanged. I did not run 2P or R.
2. **Rapier couch + 5-floor stairwell, railings, landings, doors 1A..5A, WIN: 6.** The `stairwell` flights, railings and doors show, and floor 2 is reached. `rightWall` is "Never visible" although it is in view. Floors 3 to 5 and the WIN landing are unverified.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 6.** `slips` went 0→1 at f74, and the sound log has grunt, yelp, grunt. The slip is still not scripted to the first turn. I saw no slow-motion, and both players are back to `state` "stand".
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl` (Floor 2/5), `div#tilt` (TILT 40°), `div#grips` and `div#help` have 0 overlap and nothing cut off. The `div#help` text is small. The WIN banner is unseen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** The `couch` takes 9.8% of the picture. Subject brightness is 63% against 41% around it, and edge contrast is 0.203, so it stands out better than last session. The `player*` parts take only 0.15% and are tiny and hidden by the stair steps and railings. A railing post cuts across the `couch`. The orange palette is good.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work, the page loads in 0.2 s and the console is clean.
7. **Faults: 5.** `perf` gave 146 ms a frame, 301 draw calls and 21k triangles. That is a software renderer, so the frame time is noise, but 301 draw calls is real. Two `stairwell` boxes share a face at x=-3.00. The 58° tilt spike has now lasted four sessions. The camera stutter note says the camera stands still on 21% of frames at 100 Hz.

**Next:**
1. **58° tilt spike at f270–283 (asked again).** Run the same Space+D+A `interact` with `trace` on `tilt`, `couch.pos.y`, `couch.up.y` and `dbg.lv.y`. At f277 call `eval` to read the contacts, for example `__dbgContacts`, and see which collider the couch end is resting on. Probably the tilt target is computed from a grip height that jumps at a flight transition, so clamp or low-pass the grip-height difference, or cap `tilt` while a player is within the stair-entry zone. It is done when `trace` shows `tilt` peaking under 45° in the first 600 frames and `floor` reaching 2 before f600.
2. **Verify a full win (asked again).** Run `interact` with `{until: {won: true}, max: 3000}`. If the couch does not get there, use `setState` to put it next to the floor-5 landing. Then run `look`. It is done when `won` is true and the WIN banner and confetti are visible. Report that look.
3. **Camera and first-turn slip.** Pull the camera back and aim it so the `player*` ragdolls are not hidden by the steps and railings, with the couch at about 12% of the picture. Trigger Buddy's slip at the first switchback with 0.3 s of slow-motion. Merge the `stairwell` boxes with `instances` so `perf` shows fewer than 301 draw calls. It is done when a `look` at the slip frame shows the ragdoll unobstructed.

SCORE: 6.1

## Iteration 19
**Did** No code changes. Verified the win path: `setState` couch pos {x -1.8, y 17.3, z 0.2}, then 90 frames of `interact`.
**Saw** `won` true, `floor` 5, powerup sound plus a couchThud, `sparks` emitted, `div#win` ("WIN! 0:00.0 · 0 crashes · Press R to haul it again") covers the canvas with a 0.45 dark overlay and reads well. The couch drew no pixel in that look (the camera had not framed the floor-5 landing, `look` said "couch drew no pixel"), so the confetti and the couch on the landing are not seen together. The `stairwell` boxes sharing a face at x=-3.00 are still there. Timer shows 0:00.0 because `started` was false in this run.
**Next** 1) 58° tilt spike at f270–283 (asked 5 times): trace `tilt`, `couch.up.y` and read `__dbgContacts` at f277, then low-pass the tilt reference `gh.n` in the step function (index.html ~line 460), since `groundAt` probably flips normal at a stair nosing; 2) check the camera follows the couch to floor 5 (win look had the couch out of frame); 3) pull the camera back for 12% couch coverage, script the first-turn slip with 0.3 s slow-mo, merge `stairwell` boxes with `instances` (301 draw calls).
**Open** Tilt spike, camera framing at the top, draw calls, slow-mo and the full climb by hand to floors 3-5 still unverified.

## Iteration 20
**Did** Tilt reference in the step function (index.html ~line 460) is now low-passed: `window.__refS` lerps toward `groundAt` normal at dt*5, ignoring normals with y<0.5 (stair risers).
**Saw** Same Space+D+A play: `tilt` peak 37.18° at f279 (was 58°), never over 45°. `floor` 1 for the first 600 frames, 2 by f900 (couch.pos.y 4.71). slips 1, sound grunt/yelp/grunt, console clean. Camera stutter note unchanged (21% still frames at 100 Hz).
**Next** 1) floor 2 not reached before f600 (couch stalls near y 2.98 at f265, then drifts back) — trace why it stalls on flight 1; 2) camera pull-back/framing of the floor-5 landing, scripted first-turn slip with slow-mo; 3) merge `stairwell` boxes via `instances` (301 draw calls), fix shared face at x=-3.00.
**Open** Full climb to floors 3-5 by hand unverified; `__refS` is not reset on restart (R); camera interpolation for 100 Hz.

### Judge 20

**Judge 20 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 5.** I held Space, then D for 200 frames and A for 700. `tilt` now peaks at 37.2° at f279, so the 58° spike is fixed. `floor` is still 1 for all 600 traced frames. `couch.pos.y` peaks at 2.98 at f265 and sags back to 2.83 by f406. The final state is floor 2 with `couch.pos.y` 4.71, reached only after f900. `dbg.lv` is about 0. I did not run 2P or R.
2. **Rapier couch + 5-floor stairwell, railings, landings, doors 1A..5A, WIN: 6.** I used `setState` to put the `couch` at y 16.5, which gave `floor` 4. After 900 frames `won` was still false, and the `couch` froze at f50 (speed 0.07). Door "2B" shows on floor 4, where the brief says doors 1A..5A. The `couch` is not in the picture because the stair mass hides it. WIN is still unverified.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 6.** `slips` went 0→1 at f74, and the sound log has grunt, yelp, grunt. Both players are back to `state` "stand". The slip is still not scripted to the first switchback, and I saw no slow-motion.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl`, `div#tilt`, `div#grips` and `div#help` have 0 overlap and nothing cut off, and the tilt bar changes colour. The `div#help` text is tiny. The WIN banner is unseen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** The `couch` takes 9.8% of the picture, with subject brightness 63% against 41% around it and edge contrast 0.204. The `player*` parts take 0.1% and are almost invisible. A railing post cuts through the `couch`. In the floor-4 look the `couch` drew no pixel at all. The orange palette and warm lamp read well.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work, the page loads in 0.2 s and the console is clean. `setState` on `couch.pos` works.
7. **Faults: 5.** `perf` gave 120 ms a frame on a software renderer, which is noise, but 301 draw calls is real. Two `stairwell` boxes share a face at x=-3.00. `rightWall` was "Never visible" in the first look. The camera stands still on 21% of frames at 100 Hz (Motion line). The camera is also not reliably framing the `couch` and players.

**Next:**
1. **Couch stalls on flight 1 (asked again).** The tilt fix is done. Now run Space+D+A with `trace` on `couch.pos.y`, `floor`, `dbg.lv.y` and `dbg.couchIdx`. Find what the `couch` rests on at f265, which is likely a riser or step collider ahead of the lead end. Also check whether `dbg.assisting` and Buddy's `stretch` are pulling it back. Give the AI buddy a steady uphill push, or add a small stair-lip assist (a lift impulse when the couch is blocked by a riser). It is done when `floor` is 2 before f600 in the same `interact`, and again when you pass `max: 2400` with `until {floor: 5}`.
2. **Verify WIN (asked again).** Use `setState` to put the `couch` at the floor-5 landing, then `interact` with `{until: {won: true}, max: 900}` and `look`. In this session the `couch` froze at f50 on floor 4 and `won` stayed false. Check that `setState` also teleports the players and `__refS`, and that the win trigger fires. It is done when `won` is true and the `look` shows the WIN banner and confetti. Also reset `__refS` on R.
3. **Camera and clutter.** Interpolate the camera on `acc` to fix the 21% still frames. Frame the `couch` and players so the stair mass does not hide them, with the `couch` at about 12% of the picture and the `player*` parts clearly bigger. Slow the camera lead so a `look` at floor 4 shows the `couch`. Merge the `stairwell` boxes with `instances` so `perf` shows fewer than 301 draw calls. Move one of the two boxes at x=-3.00 off the shared face. It is done when `perf` drops under 150 draw calls and a `look` at the f74 slip shows a clear ragdoll. Also rename door "2B" to "2A" so it matches the brief.

SCORE: 6.1

## Iteration 21
**Did** Route assist (index.html ~line 446): the speed throttle now uses the *nearest* gripping player (distance `far`, height `my`) instead of the farthest/average, so one player walking away no longer stalls the couch. Renamed no door (no "2B" string found in index.html; judge's 2B likely comes from generated names — check `describe`/door label code).
**Saw** Space+D 900 frames from fresh open: `couch.pos.y` peaks 3.83 at f314 (was 2.98), tilt peak 31°, `floor` still 1 (needs y>~4.2). The old Space+D+A script stalls partly because A walks P1 away from the couch (P1 at x1.5,y0.56 while couch y2.8); after the first flight the route turns back toward -x, so holding D only keeps pushing the wrong way (couch stops at x2.44, f374). Slips 1, console clean. 100 Hz camera still-frame note unchanged (39% this run).
**Next** 1) Test with the right inputs: D for the first flight, then A for the turn, `until {floor:2}`; if still short, check the assist target `tg.y` clamp (`my+1.1`) vs. landing height; 2) WIN verify via setState at floor-5 landing (also teleport players, reset `window.__refS` on R); 3) camera interpolation on `acc`, frame couch bigger, merge stairwell boxes with `instances` (301 draw calls).
**Open** Floor 2 not reached by hand in this session; WIN still unverified; door "2B" label not located; AI buddy dropped its grip and went back to y0.56 (lead -2) in the second run — buddy re-grab logic when the human is far deserves a look.

### Judge 21

**Judge 21 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** This is the first run that reaches floor 2. I held Space, then D for 400 frames, then A for 300. `floor` went 1→2 at f497 and `couch.pos.y` reached 5.19. `tilt` peaked at 40° at f598 and ended at 15°. The nearest-grip assist change from iteration 21 works. Buddy ended with `gripping` false at y 0.56 (`dbg.lead` -2, `stretch` 1.73) while P1 carried alone. Floors 3 to 5 are untested, and I did not run 2P or R.
2. **Rapier couch + 5-floor stairwell, railings, landings, doors 1A..5A, WIN: 6.** Railings, landings, doors and plants read well. WIN is still unverified. My `sheet` with `state: {couch: {pos: [0,19.5,0]}}` showed Floor 1/5 at 0:04.8 and the `couch` back at the start, so `setState` on `couch.pos` does not hold across a sheet reload.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 6.** `slips` went 0→1 at f72, and the sound log has a grunt and a yelp. Both players returned to `state` "stand". The slip is still not tied to the first switchback, and I saw no slow-motion or dust.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl`, `div#tilt`, `div#grips` and `div#help` have 0 overlap and nothing cut off. `div#tl` shows "Floor 2/5 0:11.7" and `div#tilt` shows "TILT 15°". The tilt bar is green. `div#help` is tiny. The WIN banner is unseen. The timer also looks wrong. It reads 0:11.7 after about 700 frames, which is only plausible if it counts something other than frames. Check it.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** At the start the `couch` takes 11% of the picture. The orange palette, hooded characters and plants read well. The floor-2 look is poor. The `couch` is cut by the top edge, takes 7.2% (subject brightness 55% against 40% around it, edge contrast 0.134), and the camera looks straight down at a dark `leftWall`/landing. Buddy's green hood is clear in the lower left.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work and the console is clean. `setState` of `couch.pos` does not survive a sheet reload.
7. **Faults: 5.** `perf` gave 120 ms a frame on SwiftShader, which is noise on a host load of 4.4, but 301 draw calls is real. The camera stands still on 21% of frames at 100 Hz (Motion line). Two `stairwell` boxes share the face at x=-3.00. `rightWall` is "Never visible".

**Next:**
1. **Verify WIN and floors 3–5 (asked again).** Run `interact` with `{state: {...}}` as a step. Put the `couch` and both players at the floor-5 landing, using the same teleport that `setState` does for `couch`. Then use `{until: {won: true}, max: 900}` with `look: true`. It is done when `won` is true and the `look` shows the WIN banner and confetti. Also make `setState` move the players and `__refS`, and reset `__refS` on R. As a second check, run `until {floor: 5}` with `max: 2400` using scripted D and A phases per flight.
2. **Camera framing and the 100 Hz stutter (asked again).** Interpolate the camera on `acc`. At floor 2 the `couch` is cut by the top edge and takes only 7%. Frame the `couch` and the carrying players at about 12% of the picture. Tilt the camera down less steeply so the stair mass does not fill the view. It is done when a `look` after `{until: {floor: 2}}` has the `couch` fully inside the frame, and the Motion line no longer reports still frames.
3. **Buddy re-grab and a scripted first-turn slip.** Buddy has `gripping` false and sits at y 0.56 with `dbg.lead` -2 while P1 carries alone. Make Buddy walk up to the lead end and re-grab (state `gripping` true). Script the slip at the first switchback and add dust and a slow-motion beat. Then merge the `stairwell` boxes with `instances` so `perf` shows fewer than 150 draw calls. Move the box at x=-3.00 off the shared face.

SCORE: 6.3

## Iteration 22
**Did** `setState` now accepts arrays (`[x,y,z]`) for `couch.pos` and `players[i].pos` (the `xyz` helper); it also resets `window.__refS`, and `restart()` resets it too. This was why the judge's `couch.pos:[0,19.5,0]` did nothing: spreading an array gave keys 0/1/2.
**Saw** WIN verified. `setState` couch [-1.3,17.4,0] plus both players at y 17.2, then 30 frames: `won` true, `floor` 5, `#win` banner and sparks show. The timer reads 0:00.0 because `started` was false at the teleport, which is expected. The `look` has `couch` at 7.8% and cut by the top edge. This is the same framing fault as before. `rightWall` is still "Never visible". The two `stairwell` boxes still share the face at x=-3.00. The console is clean. I did not run `perf`.
**Next** 1) Camera framing: interpolate on `acc`, show the couch and players at about 12% with a gentler downward tilt (`camOff`, `updateCamera`). 2) Buddy re-grab when he has dropped the grip, then a scripted first-turn slip with dust. 3) Merge the stairwell boxes with `instances` (301 draw calls) and move one box off the x=-3.00 face. Also check why the timer showed 0:11.7 after about 700 frames; it may be correct if `started` was set late.
**Open** Floors 3–5 by hand with D/A phases are untested. Camera, Buddy and draw-call items were not done this session.

### Judge 22

**Judge 22 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** I held Space and D for 400 frames. `tilt` peaked at 31° at f241 and ended at 12°. `slips` went 0→1 at f72, and the sound log has grunt and yelp calls. The couch reached `couch.pos.y` 2.57 on the first landing, but `floor` stayed 1 and `until floor 2` was not met in 300 more frames. This run did not repeat last session's floor 2. `Buddy` has `gripping` false at y 0.56 (`dbg.lead` -2, `stretch` 1.73), so P1 still carries alone. I did not play 2P, R or floors 3–5.
2. **Rapier couch + 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.** The railings, landings, plants and stairs read well. Last session confirmed WIN with `setState`: `won` true and the `#win` banner showed. I did not re-run it. No one has reached WIN by playing.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 6.** The slip at f72 and the grunt and yelp sounds are there, and both players return to `state` "stand". The slip is not tied to the first switchback, and there is no dust or slow-motion beat.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl`, `div#tilt`, `div#grips` and `div#help` have 0 overlap and nothing cut off. `div#tilt` shows a green bar. `div#help` is tiny. The timer read 0:12.7 after about 700 frames, so it is probably real-time based. That is not confirmed.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** The orange palette, `couch` cushions, the red hooded P1 and the green hooded Buddy read well. The framing fails: `couch` is cut by the top edge at 7.8% of the picture, and the camera looks down steeply at a dark landing. The Subject check fails: the couch is not fully in frame, and edge contrast is 0.134.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work and the console is clean. `setState` now takes arrays.
7. **Faults: 5.** `perf` gave 117 ms a frame on SwiftShader, which is noise. 301 draw calls is real. The camera stands still on 39% of frames at 100 Hz, so it is not interpolated on `acc`. Two `stairwell` boxes share the face at x=-3.00. `leftWall` is "Never visible".

**Next:**
1. **Camera framing and the 100 Hz stutter (asked again).** In `updateCamera`, interpolate the camera position with `acc`. Pull the camera back and tilt it down less steeply. Aim at the couch plus both players, which is about 12% of the picture. It is done when `look` after `{until: {floor: 2}}` has the `couch` fully inside the frame. The Motion line must also stop reporting still frames.
2. **Buddy re-grab and a scripted first-turn slip (asked again).** Make Buddy walk up to the lead end and grab again when `gripping` is false and `dbg.lead` is negative. Trigger the slip at the first switchback. Add dust and a short slow-motion beat. It is done when `interact` with Space+D shows Buddy `gripping` true and `slips` going to 1 near the first turn.
3. **Merge the `stairwell` boxes and cut draw calls (asked again).** Use `instances` for the steps and railings. Move one of the x=-3.00 boxes off the shared face. Then `perf` should report under 150 draw calls. Also make `leftWall` visible or remove it, and play floors 2–5 with scripted D and A phases.

SCORE: 6.4

## Iteration 23
**Did** Camera framing: `camOff` now (.8, 4.2, 8) (was 5.4, 6.2), spread terms 0.4/0.7, `camTarget` y is the average of the couch and the group, `lookAt` y+.2 (gentler downward tilt). Buddy's far-from-couch approach in `aiThink` runs at full input (was 0.9).
**Saw** `look` after 240 frames of Space+D: the couch is fully inside the frame (7.3% of the picture, was cut by the top edge); with 360 frames the couch is at 6.1% [445,39,810,388], not cut. `rightWall` now visible; `leftWall` is still "Never visible". The console is clean. `slips` goes 0→1 at f72. `floor` is still 1. Buddy is still not gripping: he is at y 0.56 with `dbg` myI 2 vs cI 4 and `lead` -2, so he stays at the bottom of the first flight and does not climb after the slip. `perf` was not run. The two `stairwell` boxes at x=-3.00 still share a face.
**Next** 1) Buddy never re-grabs: in `aiThink`, the `slot < 0` branch returns early (it walks `route[myI+3]` only when `cI0 > myI`); find why `myI` stays 2 (probably `routeIdx` snaps to the wrong sample after his ragdoll, or the step blocks him) and log his `body.translation()` over frames. 2) Scripted first-turn slip with dust. 3) Merge the stairwell boxes with `instances` (301 draw calls) and move one box off x=-3.00.
**Open** Floors 2–5 by hand are untested. The 100 Hz camera stutter was not changed (the camera already uses `dt` smoothing; I did not interpolate on `acc`).

### Judge 23

**Judge 23 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** I held Space and D for 600 frames. The couch reached `couch.pos.y` 3.8 and P1 reached y 2.68 on the landing, still `gripping`. `tilt` peaked at 31° at f241. `slips` went 0→1 at f72, and the sound log has grunt and yelp calls. `floor` stayed 1 and the HUD still read "Floor 1/5". The couch stopped at f374 and never moved again. Buddy is still `gripping` false at y 0.56 (`dbg.lead` -2, `myI` 2, `cI` 4). So P1 carries alone, and Buddy's grab slot is -1 for the whole run. I did not play 2P, R or floors 2–5.
2. **Rapier couch + 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.** The switchback, railings, landing and door "1B" render well. The `until floor 2` goal was not met. WIN was only confirmed by `setState` last session. Nobody has reached it by playing.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 6.** The slip at f72 is not tied to the first turn. The Motion line says the couch's direction of travel turned 184° and it stopped at f374, so the carry stalls. Both players are in `state` "stand" at the end. There is no dust or slow-motion beat.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl`, `div#tilt`, `div#grips` and `div#help` have 0 overlap and nothing cut off. The `div#tilt` bar reads "TILT 0°". `div#help` is tiny. The WIN banner was not seen this session.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 7.** The `couch` is fully in frame at 6% of the picture [416,39,788,387]. The couch, the red hooded P1, the green Buddy, the brick patches and the `backWall` are all readable. The Subject check is weak: edge contrast is 0.102 and the couch is small against a busy orange scene. The picture is 93% orange. Buddy is half hidden behind a railing in the corner.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work and the console is clean. Nothing was run on `act`.
7. **Faults: 5.** `perf` gave 114 ms a frame on SwiftShader with host load 1.8, so the frame time is noise. 302 draw calls is real. `leftWall` is "Never visible". Two `stairwell` boxes share the face at x=-3.00. Buddy never re-grabs.

**Next:**
1. **Buddy never re-grabs (asked again).** `grips` shows Buddy at slot -1, `gripping` false and `myI` 2 against `cI` 4 for the full 600 frames. In `aiThink`, log his `body.translation()` and `routeIdx` every 10 frames after the slip at f72. Fix the `routeIdx` snap or the blocked step so he climbs to the couch and grabs the lower or upper corner. It is done when `interact` with Space and D held and `trace` on `grips.1.slot` shows it going from -1 to 0 or 1 within 400 frames, and `look` shows Buddy `gripping` true.
2. **Couch stalls at f374, so floor 2 is unreachable.** After the first landing the couch stops with `tilt` 0 and P1 at y 2.68. Find why holding D then A or W does not turn the couch around the second flight. A scripted `interact` with D, then A for the second flight, should get `floor` 2. It is done when `{until: {floor: 2}, max: 1200}` succeeds. Then play floors 3–5 to WIN.
3. **Scripted first-turn slip with dust and slow-motion.** Tie the first slip to the first switchback instead of f72, with `burst` dust and a 0.3× beat. In the same pass, merge the `stairwell` boxes with `instances` for steps and railings to get `perf` under 150 draw calls. Move one x=-3.00 box off the shared face and remove `leftWall`.

SCORE: 6.6

## Iteration 24
**Did** Found why Buddy never re-grabbed: after his ragdoll he stood at z≈-0.18 (the far lane) and walked into the `post` rail colliders along z=.07 under flight 1; `players.1.dbg` was stale (only updated when gripping), so `myI` 2 was misleading. In `aiThink` far-from-couch branch, when his route sample is `L*start`/`L*F1` and he has x>-.5, z<.3, he now steers to a detour waypoint (-1.0, lane N start) first.
**Saw** `interact` Space+D 500 frames: Buddy `grips.1.slot` -1→2 at f385, gripping true; `floor` 1→2 at f481; couch ends at y 4.73; Motion turned 177°; console clean; slip count 1. `look` and `perf` not run this session.
**Next** 1) Play floors 2–5 to WIN with Buddy (scripted `until floor 3..5, won`). 2) Scripted first-turn slip with dust + 0.3× beat instead of f72. 3) Merge `stairwell` boxes with `instances` (~300 draw calls), move one x=-3.00 box off the shared face, remove `leftWall`.
**Open** Floors 3–5 by hand untested; the detour regex assumes level index is one digit; `dbg` on a non-gripping AI is stale; 100 Hz camera stutter unchanged.

### Judge 24

**Judge 24 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** I held Space and D for 1500 frames with `until won`. The `won` goal was not met.
   - `floor` went 1→2 at f481, so Buddy's re-grab fix works. `grips` shows P1 slot 0 and Buddy slot 2, both `gripping` true, and Buddy's `myI` 41 against `cI` 40.
   - The couch ended at y 6.66 and "stopped at frame 856 and did not move again", with a `tilt` peak of 40°. Floor 3 was never reached with this input.
   - I did not play 2P or R.
2. **Rapier couch + 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.** The switchback, railings, landing and door "1B" render. The couch stalls on floor 2, so floors 3–5 and WIN have never been reached by playing.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 6.** `slips` is still 0→1 at f72, which is not tied to the first turn. `thuds` is 1, and the sound log has grunt, yelp and `couchThud`. The shot shows the red P1 below the couch while the couch is mid-air over the landing. There is still no dust or slow-motion beat.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl` reads "Floor 2/5 0:25.0", `div#tilt` "TILT 5°" and `div#grips` "P1: HOLDING Buddy: HOLDING". There is 0 overlap and nothing is cut off. `div#help` is tiny. The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 7.** The `couch` takes 10% of the picture and is clearly orange and readable. Subject brightness is 52% against 39% around it, and edge contrast is 0.187, which is better than 0.102 last time.
   - The picture is 78% orange.
   - Buddy sits at the bottom edge, mostly under the landing slab.
   - The `stairwell` is a dark, murky brown with transparent-looking railing and slab streaks.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work and the console is clean. I did not run `act`.
7. **Faults: 5.** `perf` gave 112 ms a frame on SwiftShader (host load 1.5), so the frame time is noise. 302 draw calls is real. `leftWall` is "Never visible". Two `stairwell` boxes share the face at x=-3.00. The couch stalls on floor 2.

**Next:**
1. **Couch stalls on floor 2, so WIN is unreachable (asked again).** After f576 `tilt` hits 40° and the couch ends at y 6.66, stopped from f856 on.
   - At f576 and f856, log `couch.pos`, `tilt`, each `grips` slot and each player's state. Find why the second landing or the floor-2→3 flight blocks the carry. Candidates are a tilt auto-drop, Buddy lagging at the second turn, or a rail collider.
   - It is done when `interact` with Space+D held and `{until: {floor: 3}, max: 1500}` succeeds. Then run it to `won` (a `floor` 5 step also works) and `look` shows the WIN banner.
2. **Scripted first-turn slip with dust and a 0.3× beat.** Move the f72 slip to the first switchback and give it a `burst` dust and a short slow-motion. The clip shows when `trace` on `slips` first changes at the turn frame, and the `sheet` moment shows dust beside the knocked player.
3. **Cut draw calls and clear the faults, then lighten the stairwell.** Merge the `stairwell` boxes with `instances` to get `perf` under about 150 draw calls. Move one x=-3.00 box off the shared face and remove `leftWall`. Brighten the dark brown steps and slab, and stop the railing and slab streaks reading as transparent, so the couch and Buddy stand out. `look` with `sample` on the slab then shows a lighter tone.

SCORE: 6.6

## Iteration 25
**Did** Found the floor-2 stall: in the route assist (`simStep`, `tg.y = Math.min(tg.y + .8, my + 1.1)`) the couch's target height is capped to the nearest gripping player's y + 1.1. With D held, P1 is dragged along the low route, far below the couch (P1 y 5.4 vs couch 6.66 at the first mid landing), so the target sat under the flight-2 steps (tops ≈6.9) and the couch jammed against `L1F2` boxes at x≈3.3. Cap raised to `my + 1.9`.
**Saw** `interact` Space+D held, `until floor 3`: met at f1039 (was never met), console clean, thuds 2, slips 1. Continuing to `won` failed: the couch stalled on floor 3 (x .54, y 8.68, tilt 31°) because P1 (held D only) is at y 2.68, ~6 m below it, and Buddy dropped his grip (slot -1, stretch 2.9). `look` and `perf` not run.
**Next** 1) Play floors 3–5 with a scripted climbing route (steer P1 along the `route` samples, not just D) and check the WIN banner; consider capping how far the assist lifts the couch above any gripping player (drop the grip or slow it so players are not left 6 m below). 2) Scripted first-turn slip with dust + 0.3× beat. 3) Merge `stairwell` boxes with `instances`, remove `leftWall`, lighten the stairwell.
**Open** Held-D is not a real player: players get dragged on the grip spring instead of climbing, so WIN by that input is unproven; the tilt peaks at 40° around f576-600 (a tumble). Draw calls (~300) and the `leftWall` fault are untouched.

### Judge 25

**Judge 25 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** I held Space and D with `until floor 3`, and it was met at f1039 (it never was before).
   - `floor` went 1→2 at f304, and the final state has P1 "gripping" true and Buddy slot 2.
   - Held D is not real play. P1 is at y 6.94 and Buddy at y 5.42 (`stretch` 2.77, `lead` -16, `cI` 51 against `myI` 35), so Buddy lags well behind the couch.
   - `tilt` still peaks at 40° at f600. I did not reach floors 4–5 or WIN, and I did not play 2P or R.
2. **Rapier couch + 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.** Doors 2A and 2B, the railings, the switchback and a plant all render, and the couch now reaches floor 3. Floors 4–5 and WIN have still not been reached by playing.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 6.** `slips` is 0→1 at f69, which is still not tied to the first turn. There are 2 `thuds`, and the sound log has grunt, yelp and `couchThud`. There is no dust beat and no slow-motion. The `sparks` object is tiny.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl` reads "Floor 3/5 0:17.3", `div#tilt` "TILT 19°" and `div#grips` "P1: HOLDING Buddy: HOLDING". There is 0 overlap and nothing is cut off. `div#help` is small. The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** The picture is 96% orange.
   - The `couch` takes only 5.9% of the picture, brightness is 57% against 39% around it, and edge contrast is 0.118.
   - The couch sits against a brick patch and orange railings, so it blends in.
   - The player is a small red blob and Buddy is not visible in the frame.
   - The `stairwell` stays a dark, murky brown with transparent-looking railing and slab streaks.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work and the console is clean. I did not run `act`.
7. **Faults: 5.** `perf` gave 112.8 ms a frame on SwiftShader, which is noise. 302 draw calls is real. `leftWall` is "Never visible". Two `stairwell` boxes share the face at x=-3.00. The floor 3 stall and the 6 m lag between the couch and the players are open.

**Next:**
1. **Floors 3–5 and WIN are unproven, and the assist hauls the couch away from the players (asked again).** Replace held D with a route-following input that steers P1 along the `route` samples (or use `act`/`setState` to place the players on floors 4 and 5). Cap how far the assist lifts the couch above any gripping player, or drop the grip, so nobody is left 6 m below. It is done when `interact` with `{until: {won: true}, max: 3000}` succeeds and `look` shows the WIN banner.
2. **Scripted first-turn slip with dust and a 0.3× beat (asked again).** Move the f69 slip to the first switchback and give it a `burst` dust and a short slow-motion. `trace` on `slips` should first change at the turn frame, and a `sheet` moment should show dust beside the knocked player.
3. **Make the couch and players stand out, then cut draw calls.**
   - Darken the brick patch behind the couch and make the railings less orange. Make the red P1 and the green Buddy larger or outlined, and give the camera a closer framing so the `couch` takes about 10% or more. `look` with `sample` should show edge contrast above 0.2.
   - Merge the `stairwell` boxes with `instances` to get under about 150 draw calls. Remove `leftWall` and move one x=-3.00 box off the shared face.

SCORE: 6.4

## Iteration 26
**Did** Tried pulling gripping players up toward the couch inside the `simStep` route assist whenever the couch is more than 1.6 m above them (sets their linvel up and toward the couch). Reverted with `git checkout -- index.html`, so the page is unchanged from iteration 25.
**Saw** Baseline (Space+D held): floor 3 at f1039, the couch stalls at x .54, y 8.68, tilt 31°, P1 y 3.5 vs couch 8.7, Buddy has dropped his grip. With the pull: worse. The couch stalled on floor 2 (x 3.32, y 7.03), P1 lost its grip, `crashes` 1, no WIN at 3000 frames. `look` and `perf` not run.
**Next** 1) The Judge's Next 1 is still open. Don't hold D: script P1's input along the `route` samples with `interact` steps, or use `setState` to put the players on floors 4–5 and check WIN. 2) Slow the assist (not the players) when the gripper falls more than 3 m behind, instead of pulling the players. 3) Items 2 and 3 of the judge's list (first-turn slip with dust, couch contrast and draw calls) are untouched.
**Open** WIN is unproven; the player-pull idea destabilises the grip and is not worth retrying as written.

## Iteration 27
**Did** No code change. Proved the WIN path with `setState({couch:{pos:[-1.8,17.8,0]},started:true})` followed by 30 frames of `interact`.
**Saw** `won` true, `floor` 5, and `div#win` ("WIN! … Press R to haul it again") shows over the canvas. The `powerup` sound plays and the console is clean. `look`: 93% orange, 403 draw calls, `leftWall` is still on screen, and the `stairwell` boxes at x=-3.00 still share a face. The camera did not frame the couch after the teleport (couch drew 0 pixels), so the camera's follow of a teleported couch is untested. The timer reads 0:00.0 because I teleported. Not run: `perf`, and any play-through of floors 3→5 by input.
**Next** 1) Script P1 along the `route` samples with `interact` to reach floors 4–5 by real play. 2) First-turn slip with dust and a slow-motion beat (the f69 slip is not tied to the turn). 3) Couch contrast (darker brick behind it, outlined players, closer camera) and merge the `stairwell` boxes with `instances` to cut draw calls from about 400.
**Open** WIN is only proven by teleport. The assist still hauls the couch away from the players. After a teleport the camera does not follow the couch.

## Iteration 28
**Did** Commented out the `leftWall` wallPlane (line 137, flagged "Never visible"); tinted the `bricks` material (0x8a6a5a) so the patch behind the couch is darker. Not run in a browser this session.
**Saw** Nothing measured; no look/perf run.
**Next** 1) Route-following input to reach floors 4–5 by play. 2) First-turn slip with dust and slow-motion. 3) Merge `stairwell` boxes with `instances`, closer camera, outlined players.
**Open** Edits unverified: check the page loads with a clean console and that the left side has no gap without `leftWall`.

### Judge 28

**Judge 28 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** Holding Space and D for 600 frames took `floor` from 1 to 2 at f301, and `grips` shows P1 and Buddy both holding. `tilt` is 38° at the end, so the couch is nearly tipping over. Held D is not real play. I did not play 2P, R, or floors 3–5.
2. **Rapier couch and 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.** Doors 1A and 1B, the `stairwell` railings and the switchback all render. The `leftWall` removal left no visible gap, and `rightWall` now shows. Floors 4–5 and WIN are still unproven by play.
3. **Slide-back/tumble ragdoll, they get up; clip in the first minute: 6.** `slips` goes 0→1 at f69. That is still not tied to the first turn, and the sound log has only grunt and yelp. There is no dust beat or slow-motion.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl` reads "Floor 2/5 0:10.0", `div#tilt` "TILT 38°" and `div#grips` "P1: HOLDING Buddy: HOLDING". Nothing overlaps or is cut off. The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The opening look is good: the `couch` takes 11% of the picture, with edge contrast 0.211 and brightness 50% against 34% around it.
   - Once play starts the `couch` shrinks to 6.6% and edge contrast drops to 0.19.
   - The picture is 91% orange, and the `stairwell` steps in the mid-play look are murky brown.
   - P1 is a small red figure, and Buddy is not in the mid-play frame.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work and the console is clean. I did not run `act`.
7. **Faults: 6.** `perf` gave 112.8 ms a frame on SwiftShader, which is noise on a host load of 1.3. 301 draw calls is real. `Never visible` is now none after play, and `rightWall` shows only in the mid-play frame. Two `stairwell` boxes still share the face at x=-3.00.

**Next:**
1. **Floors 3–5 and WIN are unproven by play (asked again).** Add route-following input for P1, or use `setState` to place players and couch at floor 4. Cap how far the assist lifts the couch above a gripping player. One call shows it done: `interact` with `{until: {won: true}, max: 3000}` succeeds, and a `look` after it shows the WIN banner.
2. **Scripted first-turn slip with dust and slow-motion (asked again).** Move the f69 slip to the first switchback landing, with a `burst` dust at the slipped player and about 0.3× time for 20 frames. `trace` on `slips` should first change at the turn frame, and a `sheet` moment there should show dust.
3. **Keep the couch and players large during play, then cut draw calls.**
   - Give the camera a follow framing that keeps the `couch` and both players in view, so the `couch` stays at about 10% or more. Outline P1 and Buddy.
   - Merge the `stairwell` boxes with `instances`, aiming for under 150 draw calls. Move one x=-3.00 box off the shared face.

SCORE: 6.6

## Iteration 29
**Did** Added `slowT` in index.html: the buddy slip (`slipFlag` block) now sets `slowT = .35`, and `loop` runs the sim at 0.3× while it counts down. Dust `burst` on the slip was already there.
**Saw** Page loads, console clean. Holding Space+D 500 frames: slips 0→1 at f69, floor 1→2 at f317, tilt 19°, 0 off-screen HUD. The couch is 2.1% of the picture (small, high up-left); the stairwell wall block dominates the frame. Floors 3–5 and WIN were not played this session. Two `stairwell` boxes still share x=-3.00.
**Next** 1) Camera framing that keeps the couch and both players large. 2) Route-following input to prove floors 4–5 and WIN. 3) Merge the `stairwell` boxes (draw calls ~300).
**Open** The slip fires at f69, not tied to the first switchback landing. The slow-motion was not checked frame by frame.

### Judge 29

**Judge 29 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** Holding Space+D for 400 frames took `floor` from 1 to 2 at f317, and `grips` shows P1 holding. `tilt` peaked at 31° at f249 and fell to 0.03°. The couch `speed` is 0.09, so it stalled after f345. A held key is not real play. I did not run 2P, R or floors 3–5.
2. **Rapier couch and 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.** Door "1B", the railings, the switchback and the landing all render. Floors 3–5 and WIN are still unproven by play.
3. **Slide-back/tumble ragdoll, they get up; clip in the first minute: 6.** `slips` goes 0→1 at f69. That frame is not tied to the first switchback turn. The sound log has only grunt and yelp. The builder's slow-motion was not confirmed.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl` reads "Floor 2/5 0:06.4", `div#tilt` "TILT 0°" and `div#grips` "P1: HOLDING Buddy: free". There are 0 overlaps and 0 cut off. The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.**
   - The `couch` is 2.1% of the picture [675,112,799,381], with edge contrast 0.144, and it is mostly tucked behind the stairs wall.
   - The `stairwell` wall block (58% of the picture) dominates and is flat brown.
   - 92% of the picture is orange.
   - The `player*` figures (red P1, green Buddy) are big, readable and match the hoods.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work, and the console is clean. I did not run `act`.
7. **Faults: 6.** `perf` gave 111.7 ms a frame on SwiftShader, which is noise. 301 draw calls is real. Two `stairwell` boxes still share the face at x=-3.00. `Never visible` is none.

**Next:**
1. **Camera framing keeps the `couch` large (asked again).** The `couch` is 2.1% of the picture and the `stairwell` wall hides it. Aim the follow camera at the midpoint of the `couch` and both players, and pull it out from behind the wall block, for example by hiding or fading the near `stairwell` boxes. One call shows it done: `look` after the same 400-frame hold reports `Subject` of 8% or more, with `couch` visible.
2. **Prove floors 4–5 and WIN (asked again).** Add route-following input for P1, or use `setState` to place the couch at floor 4. The call that shows it done is `interact` with `{until:{won:true}, max:3000}`, and a `look` then shows the WIN banner.
3. **Tie the slip to the first switchback landing, and cut draw calls.**
   - Fire `slips` when the couch reaches the first turn. `trace slips` should then first change at the turn frame instead of f69, and a `sheet` moment there should show the dust `burst`.
   - Merge the 59 `stairwell` boxes with `instances` to get under 150 draw calls. Move one of the x=-3.00 boxes off the shared face.

SCORE: 6.4

## Iteration 30
**Did** `updateCamera` in index.html: camera target y is now `c.y*.6 + my*.4 + .1` (was the plain average of couch and group), and the y follow rate is 6 (was 3.5), so the couch stays in frame. A trial with 0.7 weight and +.6 put stair boxes in front of the couch (2.3%); I reverted it.
**Saw** After a 300-frame Space+D hold the couch is 6.8% [607,31,975,382] and fully in frame (was cut by the top edge). Console clean, 0 HUD overlaps. 92% of the picture is orange. The stairwell is 57 boxes. The x=-3.00 shared face is still there. I ran no perf and played no floors 3–5 or WIN.
**Next** 1) Route-following input or setState to prove floors 4–5 and WIN. 2) Merge the stairwell boxes with `instances` and move one x=-3.00 box. 3) Tie the slip to the first switchback.
**Open** The couch is still only 6.8% of the picture, below the 8% asked for. The slip timing and slow-motion are unchecked.

### Judge 30

**Judge 30 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** A held Space+D for 300 frames moved the couch 7.57 units. `tilt` peaked at 31° at f249 and was 9.4° at the end, with `grips` showing "P1: HOLDING". `floor` stayed at 1 and `couch.speed` was 2.3 at the end. A held key is not real play. I did not run 2P, R or floors 2–5.
2. **Rapier couch and 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.** Doors "1A" and "1B", the railings, the brick patches and the switchback all render. Floors 3–5 and WIN are still not shown by play.
3. **Slide-back/tumble ragdoll, they get up; clip in the first minute: 6.** `slips` goes 0→1 at f69, which is not tied to the first switchback turn. The sound log has only grunt and yelp, with no thud. I did not see the slow-motion beat or the ragdoll get-up.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl` reads "Floor 1/5 0:04.8", `div#tilt` "TILT 9°" and `div#grips` "P1: HOLDING Buddy: free". There are 0 overlaps and 0 cut off. The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The `couch` is 6.8% of the picture [619,35,988,386], up from 2.1%. It is fully in frame with edge contrast 0.177, and its brightness is 62% against 43% around it, so it stands out.
   - The red P1 and green Buddy `player*` figures match their hoods.
   - 91% of the picture is orange, and the `stairwell` (62% of the picture) is flat brown and dominates.
   - The railings and doors look good.
7. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work and the console is clean. I did not run `act`.
8. **Faults: 6.** `perf` gave 111.8 ms a frame on SwiftShader, a software renderer, so that is noise. 300 draw calls is real. Two `stairwell` boxes still share a face at x=-3.00. `Never visible` is none.

**Next:**
1. **Prove floors 2–5 and WIN (asked again).** Add route-following input for P1, or use `setState` to place the couch at floor 4. One call shows it done: `interact` with `{until:{won:true}, max:3000}` ends with `won` true, and a `look` then shows the WIN banner. Check that Buddy and the couch do not stall on the landings.
2. **Make the `couch` at least 8% of the picture (asked again).** It is 6.8%, up from 2.1%. Fade or hide the near `stairwell` boxes and move the camera closer, or reduce its distance from the couch. One call shows it done: `look` after the same 300-frame hold reports `Subject` of 8% or more.
3. **Tie the slip to the first switchback turn, and cut draw calls.**
   - Fire the slip when the couch reaches the first turn, not at f69. The `interact` trace on `slips` should then first change at the turn frame, and the Sound line should add a thud.
   - Merge the 57 `stairwell` boxes with `instances` to get under 150 draw calls. Move one of the x=-3.00 boxes off the shared face.

SCORE: 6.6

## Iteration 31
**Did** `camOff` is now (.8, 3.6, 6.6) in `updateCamera` (was 4.2, 8), with the spread terms rebased to the same values. Camera target y offset raised from +.1 to +.5 so the closer couch is not cut by the top edge (the +.5 is untested).
**Saw** After the 300-frame Space+D hold (before the +.5 change): the couch is 8.9% [622,0,1047,387], so the 8% ask is met, but it was cut by the top edge. Console clean, 0 HUD overlaps, 92% orange. `slips` still 0→1 at f69. The x=-3.00 shared face is still reported. I ran no perf.
**Next** 1) Re-look to confirm the couch is not cut after the +.5 change. 2) Route-following input or setState to prove floors 4–5 and WIN. 3) Tie the slip to the first switchback and merge the stairwell boxes with `instances`.
**Open** Floors 3–5 and WIN are unproven by play. The draw count is still about 300.

### Judge 31

**Judge 31 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** A held Space+D for 300 frames moved the `couch` 7.63 units with `tilt` peaking at 31° at f246. `grips` shows "P1: HOLDING". `floor` stayed at 1 and `won` stayed false. The brief's 1/2/R keys and P2 were not played.
2. **Rapier couch and 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.** Doors "1A" and "1B", the railings, the brick patches and the switchback all render. Floors 2–5 and WIN are still not shown by play.
3. **Slide-back/tumble ragdoll, they get up; clip in the first minute: 6.** `slips` goes 0→1 at f69, which is not tied to the first turn. The sound log has grunt and yelp, no thud. The ragdoll get-up was not seen.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl` reads "Floor 1/5 0:04.7", `div#tilt` "TILT 9°" and `div#grips` "P1: HOLDING". There are 0 overlaps and 0 cut off. The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The `couch` is 8.7% of the picture [605,51,1022,448]. It is fully in frame after the +.5 camera change, brightness 64% against 44%, edge contrast 0.185.
   - The red P1 and green Buddy `player*` figures match their hoods.
   - 92% of the picture is orange, and the flat brown `stairwell` (60%) dominates.
   - The railings and doors look good.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work and the console is clean. I did not run `act`.
7. **Faults: 6.**
   - `perf` gave 119.7 ms a frame at host load 1.4. That is SwiftShader, a software renderer, so it is noise.
   - 287 draw calls is real.
   - Two `stairwell` boxes share a face at x=-3.00.
   - `Never visible`: `rightWall`, 21 units and in view.

**Next:**
1. **Prove floors 2–5 and WIN (asked again).** Give P1 route-following input, or use `setState` to put the `couch` and players at floor 4. One call shows it done: `interact` with `{until:{won:true}, max:3000}` ends with `won` true, and a `look` then shows the WIN banner. Check that Buddy and the couch do not stall on the landings.
2. **Tie the slip to the first switchback turn, and add a thud (asked again).** Fire it when the couch reaches the first turn, not at f69. The `interact` trace on `slips` should then first change at the turn frame, and the Sound line should list a thud.
3. **Cut draw calls and fix the wall faults (asked again).**
   - Merge the 55 `stairwell` boxes with `instances` to get under 150 draw calls. `perf` should report under 150.
   - Move one of the x=-3.00 boxes at least 0.000075 units off the shared face.
   - Fix `rightWall`, which is in view but has no pixel (`Never visible`), by making it visible or removing it.

SCORE: 6.6

## Iteration 32
**Did** No code change. I proved the WIN path by `interact` with `state: {couch:{pos:[-1.8,17.3,0]}, started:true}` plus 30 frames.
**Saw** `won` true and `floor` 5. The `div#win` banner shows "WIN! … Press R to haul it again", and HUD "Floor 5/5 · HOME!". The sound log has powerup and couchThud. The door "4A" and the sparks render, console clean, 0 HUD overlaps. After `setState` the timer shows 0:00.0, so it is the teleport, not a real run. `look` still reports the x=-3.00 shared `stairwell` face and `rightWall` never visible. I ran no perf. The 8% couch with the +.5 camera was not re-looked.
**Next** 1) Route-following input to reach floors 2–4 by real play, with Buddy and the couch checked for stalls on the landings. 2) Tie the slip to the first switchback and add a thud. 3) Merge the `stairwell` boxes with `instances` (about 300 draws), offset one x=-3.00 box, and fix or remove `rightWall`.
**Open** Floors 2–4 are still unproven by real play. The draw count is unchanged. The slip is still at f69. The `setState` jump to WIN skips the real-play route.

## Iteration 33
**Did** Removed the never-visible `rightWall` plane (colliders stay). Offset the landing slab boxes at line 175 by 0.0002 from x=-3.00 (`XL`) so they no longer share a face with the ground slab. Not re-opened or looked at in this session.
**Saw** No tools run; the edits are one-line and untested.
**Next** 1) Open and `look` to check the `Never visible` and shared-face lines are clear. 2) Merge the `stairwell` boxes with `instances` (about 300 draws). 3) Route-following input to reach floors 2–4 by real play.
**Open** The draw count is unchanged. Floors 2–4 are unproven by real play. The slip is already tied to the L0F1 progress (>0.2) in code, but the judge saw f69; I did not check it.

### Judge 33

**Judge 33 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** Holding Space+D moved the `couch` through all 5 floors to `won: true` at frame 2648, with `thuds` at 3 and Buddy in `grips` as "HOLDING". The route works, but the `couch` climbed 17 units while Buddy trailed at `lead` -78 and `stretch` 12.28. The 1/2/R keys and P2 were not played.
2. **Rapier couch, 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 8.** `floor` went 1→2 at f314 and reached 5, "Floor 5/5 · HOME!". Door "4A" and the brick patch show. The `couch` slides up along the railing.
3. **Slide-back/tumble ragdoll, get up; clip in first minute: 6.** `slips` goes 0→1 at f69 and the Sound line lists grunt and yelp, with `couchThud` now present. The slip still fires at f69, before the first turn, and a ragdoll get-up was not seen. The WIN banner says "0 crashes" despite the slip.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 9.** `div#tl` reads "Floor 5/5 · HOME! 0:43.8". `div#tilt` and `div#grips` show, and the `div#win` "WIN! 0:43.8 · 0 crashes" renders cleanly. There are 0 overlaps and 0 cut off.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The start frame shows an orange `couch` with a green Buddy and a red P1.
   - The `couch` is 13% of the picture, brightness 53% against 38%, edge contrast 0.219.
   - 87% of the picture is orange, and the flat brown `stairwell` is 52–63% of it.
   - The WIN frame is dark: brightness 23%, with the `couch` at 9% cut by the frame edge.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work and the console is clean. I did not run `act`.
7. **Faults: 6.**
   - `perf` gave 115 ms a frame at host load 2.0. That is SwiftShader, so it is noise.
   - 286 draw calls is real and unchanged.
   - Two `stairwell` boxes share a face at x=-3.00 (needs 0.00022) and at z=-1.60 (needs 0.000041).
   - `rightWall` is gone and `Never visible` is none, so that part is fixed.

**Next:**
1. **Tie the slip to the first switchback turn (asked again).** The slip should fire when the `couch` reaches the first 180° turn, not at f69. It should also count toward the WIN banner's crashes. One call shows it done: `interact` with the same Space+D hold and `trace: ["slips"]`. It should then show the first change at the turn frame (about f250–300) instead of f69, and the WIN text should show "1 crashes" or more.
2. **Cut draw calls and fix the shared faces (asked again).**
   - Merge the 59 `stairwell` boxes with `instances`, or merge their geometries per material.
   - Move a landing slab at least 0.00022 off x=-3.00 and a box at least 0.000041 off z=-1.60. The offset applied last session was 0.0002, which is under the 0.00022 needed.
   - `perf` should report under 150 draw calls, and the `look` surfaces lines should disappear.
3. **Keep the couch and both players in frame, and make Buddy keep up.**
   - The `couch` is cut by the frame edge in both looks. Frame the midpoint of P1, Buddy and the `couch`, and lighten the dark upper floors.
   - A 78-index `lead` gap means Buddy is not carrying. Make Buddy pace the `couch` so the clip reads as two people hauling it.
   - One call shows it done: a `look` at the f2000 state should show the `couch` fully inside the frame, with Buddy's `lead` under 10.

SCORE: 7.1

## Iteration 34
**Did** Slip threshold for L0F1 raised from progress 0.2 to 0.5 (nearer the first turn); WIN banner crashes now `tumbles + slipsDone`; landing slab offset in `XL + .0004` (above the 0.00022 needed) and z moved +0.0001 off ZB (line 175).
**Saw** No tools run; one-line edits, untested.
**Next** 1) Open + `look` to verify the slip frame (~f250+) and surfaces lines. 2) Merge `stairwell` boxes (draw calls ~286). 3) Camera framing on midpoint of P1/Buddy/couch; make Buddy keep up (lead gap).
**Open** Draw count unchanged; floors 2–4 unproven by real play; edits not verified in a browser.

### Judge 34

**Judge 34 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** Holding Space+D moved the `couch` to `floor` 2 at f305, but the `couch` reached floor 2 with P1 gripping alone. `grips` shows Buddy as "free" and `dbg.assisting` is true. Buddy sits at `myI` 4 against `couch` index 7, far from the couch, at x -0.73, y 0.58. The 1/2/R keys and P2 were not played.
2. **Rapier couch, 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.** Door "1B" shows, and the `stairwell` and railing posts read. I did not play to floor 5 this session. The last judge reached WIN.
3. **Slide-back/tumble ragdoll, get up; clip in first minute: 5.**
   - `slips` goes 0→1 at f104, still well before the first turn. The builder raised the threshold to 0.5, which only moved it from f69 to f104.
   - The grunt and yelp play.
   - No get-up was seen, and the `players` states read "stand".
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 9.** `div#tl` reads "Floor 2/5 0:05.3", and `div#tilt` and `div#grips` show. There are 0 overlaps and 0 cut off. The WIN banner was not seen this session, and its crash count changed without being verified.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.**
   - The `couch` is 2.1% of the picture at [625, 39, 994, 437].
   - A big brown `stairwell` step block covers the middle of the frame (the `stairwell` is 67% of it) and hides the `couch`.
   - Hues are 94% orange and brightness is 35%, so the picture is flat.
   - The red P1 and green Buddy hoods read well, but Buddy is cut by the frame edge at the bottom left.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work, the console is clean, and `couch.progress` is not in `observe()`. I did not run `act`.
7. **Faults: 6.**
   - `perf` gave 118 ms a frame at host load 2.3. That is SwiftShader, so it is noise.
   - 286 draw calls is real and has not changed in three sessions.
   - The `look` reply shows no `Surfaces:` lines, so the shared-face fix is confirmed.
   - `Never visible` is none.

**Next:**
1. **Fix the camera so the `couch` and both players are framed (asked again).**
   - The camera sits behind a `stairwell` step block, which hides the `couch` at 2.1% of the picture.
   - Frame the midpoint of P1, Buddy and the `couch`. Pull the camera out and up and away from the step wall, or hide or fade `stairwell` boxes that sit between the camera and the `couch`.
   - One call shows it done: `look` at the same frame (Space+D held, 330 frames). The `Subject:` line should read `couch` above 8% of the picture, with no step block over it.
2. **Make Buddy actually carry (asked again).**
   - Buddy reads "free" at `myI` 4 against `couch` index 7, with `stretch` 2.05.
   - Make Buddy path to the lower corner slot ahead of the `couch` and take hold. Then `grips` should read "Buddy: HOLDING" and `lead` should stay under 10.
   - One call shows it done: the same `interact` with `trace: ["grips.1.slot", "players.1.dbg.lead"]`. The slot should be 0 or above, and `lead` under 10 through f300.
3. **Tie the slip to the first switchback turn, and cut draw calls (asked again).**
   - Fire the slip when the `couch` reaches the turn at f250–300. The `slips` trace should first change there, not at f104, and the WIN text should count it.
   - Merge the `stairwell` boxes (about 62) by material or with `instances`. `perf` should report under 150 draw calls.

SCORE: 6.6

## Iteration 35
**Did** In `updateCamera` the near-lane `mStep` boxes (z>.5, within 5 m of the couch's y) are now hidden while the `couch` is in the far lane (z<0); colliders are unchanged.
**Saw** `look` after Space+D x330: Subject `couch` 8.6% (was 2.1%), no step block over it, brightness 42%, `stairwell` boxes 56 on screen, Never visible none. Slip still fires at f104 (`slips` 0→1), Buddy still "free" (`myI` 4 vs `couch` index 7, lead -3). Perf not run.
**Next** 1) Make Buddy take a lower-corner slot ahead of the couch (`grips.1.slot` >= 0, `lead` < 10 through f300). 2) Tie the slip to the first switchback turn (f250-300), not f104. 3) Merge `stairwell` boxes by material to cut draw calls (~286).
**Open** Buddy carry and slip timing untouched; floors 3-5 unplayed this session.

### Judge 35

**Judge 35 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.**
   - Holding Space+D for 330 frames took the `couch` to `floor` 2 with P1 gripping alone (`grips` P1 slot 0).
   - Buddy's slot went to 2 at f14, then back to -1 at f104, and he reads "free" with `dbg.assisting` true. His `dbg` shows `myI` 4 against `cI` 7, `lead` -3 and `stretch` 2.05.
   - Buddy sits at x -0.73, y 0.58, far below the `couch`.
   - The 1/2/R keys and P2 were not played.
2. **Rapier couch, 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.**
   - Door "1B", the `stairwell` railing posts and the brick wall gap all read.
   - Floors 3–5 and the WIN were not played this session.
3. **Slide-back/tumble ragdoll, get up; clip in first minute: 5.**
   - `slips` goes 0→1 at f104 and the grunt and yelp play.
   - That is at the start of the climb, not at the first turn, and no tumble or get-up was seen.
   - `players` states read "stand" throughout.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 9.**
   - `div#tl` "Floor 2/5 0:05.3", `div#tilt` and `div#grips` show, with 0 overlaps and 0 cut off.
   - The WIN banner was not seen this session.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The Subject `couch` is 8.6% of the picture at [577, 39, 994, 437], with no step block over it, so the camera fix worked.
   - Brightness is 42%, saturation 72% and hues are 92% orange, so the picture is still warm and flat.
   - The `couch` is bright orange against a brown `stairwell`, and the red P1 and green Buddy hoods read.
   - The players are small and crowded into the bottom corners, and Buddy is cut by the frame edge.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.**
   - `describe` and `observe` work and the console is clean.
   - `act` was not run.
7. **Faults: 6.**
   - `perf` gave 116.7 ms a frame at host load 2.5. That is SwiftShader, so it is noise.
   - 286 draw calls is real and has not changed in four sessions.
   - `Never visible` is none, and the `look` reply shows no `Lighting:` or `Surfaces:` lines.

**Next:**
1. **Make Buddy carry (asked again).**
   - Buddy's slot drops from 2 to -1 at f104, the same frame as the slip, and he then stays at `myI` 4 against `couch` index 7.
   - Make him re-path to the lower corner slot ahead of the `couch` after the slip and re-grab it. Cap `stretch` so he is not left 2 m below.
   - One call shows it done: `interact` Space+D held 330 frames with `trace: ["grips.1.slot", "players.1.dbg.lead"]`. `grips.1.slot` should end at 0 or above, and `lead` should stay under 10 through f300.
2. **Tie the slip to the first switchback turn (asked again).**
   - It still fires at f104.
   - Fire it when the `couch` reaches the turn at about f250–300. The tumble should then bowl a player into ragdoll, and the player should get up.
   - One call shows it done: the same `interact` with `trace: ["slips", "players.0.state"]`. `slips` should first change at f250 or later, and `players.0.state` should show a ragdoll state and then "stand".
3. **Cut draw calls and widen the frame (asked again).**
   - Merge the 56 `stairwell` boxes by material or with `instances`. `perf` should report under 150 draw calls.
   - Pull the camera back so both players stay inside the frame. Buddy is cut at the bottom left. A `look` at the same frame should then show both hoods fully, with the Subject above 8%.

SCORE: 6.7

## Iteration 36
**Did** In the slip check (`index.html`, Buddy slip block) the `L0F1` threshold went from prog>.5 to prog>.92, so the slip waits for the first turn instead of f104.
**Saw** `interact` Space+D x330 with trace: `slips` stayed 0 for all 330 frames; `grips.1.slot` 2 from f14 to the end (Buddy no longer drops his grip early); `players.1.dbg.lead` fell to -13 at f302 (-9 at f320), `stretch` 2.38, so Buddy still trails ~3 m below. `couchIdx` 25 at f330, floor 2, no console errors. No `look` or `perf` run.
**Next** 1) Buddy lags: raise his speed or re-path in `aiThink` when lead < -6. 2) Check the slip fires after f330 (`slips`, `players.0.state` ragdoll then "stand"). 3) Merge `stairwell` boxes (draw calls ~286) and widen the camera so both hoods fit.
**Open** The slip may now never fire if `couchIdx` stalls before prog .92 of `L0F1`; draw calls and framing untouched.

### Judge 36

**Judge 36 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.**
   - Holding Space+D for 500 frames took the `couch` to `floor` 2 at f249 (`couch` y 6.19), with P1 and Buddy both on `grips` (slots 0 and 2).
   - Buddy now holds his grip: `grips.1.slot` goes to 2 at f14 and stays there.
   - He still lags. `players.1.dbg.lead` has a low of -13 at f302 and is back at -3 at f499, with `stretch` 1.93.
   - 1/2/R and P2 were not played.
2. **Rapier couch, 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.**
   - Door "2A", the `stairwell` railing posts, the brick gap, the plant and the papers all read.
   - Floors 3–5 and the WIN were not reached.
3. **Slide-back/tumble ragdoll, get up; clip in first minute: 3.**
   - `slips` stayed 0 for all 500 frames, and `players.0.state` stayed "stand".
   - The builder's own Open predicted this. Raising the L0F1 threshold to .92 left the tumble unseen at the first turn.
   - The tumble clip is the brief's key beat and was not seen.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 9.**
   - `div#tl` "Floor 2/5 0:08.3", `div#tilt` and `div#grips` show, with 0 overlaps and 0 cut off.
   - The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The Subject `couch` is 13% of the picture at [408, 194, 901, 648] and is brighter than its surround (50% against 35%).
   - Edge contrast is only 0.161, and the picture is 92% orange and brown.
   - The players are tiny: `player*` is 0.46% of the picture and sits cut off at the bottom edge. The green hood is only just visible and the red one is off-frame.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.**
   - `describe` and `observe` work and the console is clean.
   - `act` was not run, and `couchIdx` is not in `observe()` as a top-level path.
7. **Faults: 6.**
   - `perf` gave 115 ms a frame at host load 1.6. That is SwiftShader, so it is noise.
   - 286 draw calls has not changed in five sessions.
   - `Never visible` is none, and there are no `Lighting:` or `Surfaces:` fault lines.

**Next:**
1. **Make the tumble happen, and make it reliable (asked again).**
   - `slips` is 0 after 500 frames of Space+D, so the slip never fires. The prog>.92 gate on L0F1 is too strict.
   - Fire it on a timer or position instead. For example, trigger when the `couch` first crosses the turn landing, or at the latest by about f300 if it has not fired.
   - Check that the slip bowls a player into ragdoll and that they get up.
   - One call shows it done: `interact` Space+D x500 with `trace: ["slips", "players.0.state", "players.1.state"]`. `slips` should change between f250 and f450, and a state other than "stand" should appear and then return to "stand".
2. **Make Buddy keep pace (asked again).**
   - `lead` still drops to -13 at f302, and `stretch` stays above 1.9.
   - In `aiThink`, when `lead` < -6, raise his speed or re-path him to the lower corner slot.
   - One call shows it done: the same `interact` with `trace: ["players.1.dbg.lead"]`. The low should stay at -6 or above.
3. **Widen the camera and cut draw calls (asked again).**
   - Pull the camera back or lower it so both players' hoods sit fully in the frame. In a `look` after the same `interact`, `player*` should be above 1.5% and not clipped at the bottom edge.
   - Merge the 58 `stairwell` boxes by material, or use `instances`. `perf` should report under 150 draw calls.

SCORE: 6.4

## Iteration 37
**Did** In `index.html` slip block, added a fallback: if `slipsDone===0`, `started`, `timer>4.5` and Buddy grips, `slipFlag` is set (the L0F1 prog gate is back to .6). In `aiThink`, Buddy runs at full input (`f=1`) when `lead < -4`.
**Saw** `interact` Space+D x500: `slips` 0→1 at f117; `players.1.state` "stand" → "rag" f117..273 → "stand" (tumble and get-up work). `players.1.dbg.lead` still -9 at f491, `stretch` 1.26. Couch floor 2, no errors. No `look`/`perf` run.
**Next** 1) Buddy still lags (lead -9): check why he is slow after get-up (re-grab, `aiDelay`, slot path). 2) Widen the camera so both hoods fit; `player*` was 0.46%. 3) Merge `stairwell` boxes (286 draw calls).
**Open** Slip now fires at f117 (timer ~2 s into play per frame count), earlier than timer 4.5 suggests only via the prog>.6 gate; not looked at visually. Camera and draw calls untouched.

### Judge 37

**Judge 37 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.**
   - Holding Space+D for 200 frames put `couch` at x 3.11, y 2.97 on Floor 1/5 at 0:03.1, with `grips.0` P1 on slot 0.
   - Buddy's `grips.1.slot` fell to -1 after his slip, so he is off the couch.
   - 1/2/R and P2 were not played, and `act` was not run.
2. **Rapier couch, 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.**
   - Door "1B" (the label in the look; the brief says 1A), the `stairwell` railing posts, the brick gap and the stair treads all read.
   - Floors 2–5 and the WIN landing were not reached this session.
3. **Slide-back/tumble ragdoll, get up; clip in first minute: 7.**
   - `slips` went 0→1 at f117 (about 2 s of play). `players.1.state` changed "stand"→"rag" and `div#toast` showed "WHOOPS! BUDDY SLIPPED!".
   - The sound line reports a grunt and a yelp.
   - The look at f202 shows only the green hood, partly cut off at the bottom-left. The `couch` is the clear subject, but the tumble itself is hard to read.
   - Buddy's get-up was not re-checked. The last session saw "rag" until f273, so Buddy is out for about 2.6 s.
   - Nobody is bowled over: P1 stayed "stand".
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 9.**
   - `div#tl` "Floor 1/5 0:03.1", `div#tilt` "TILT 31°", `div#grips` "P1: HOLDING Buddy: *KO*" and `div#toast` show. There are 0 overlaps, 0 off-screen and 0 cut off.
   - The toast text is low-contrast orange on the orange wall.
   - The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The Subject `couch` is 16% of the picture at [554, 324, 1114, 694]. It is brighter than its surround (57% against 34%), with edge contrast 0.19.
   - `player*` is now 5.3%, up from 0.46%, but the box [231, 586, 815, 799] still reaches the bottom edge. The red hood is half cut off and the green one is mostly hidden behind the railing.
   - The picture is 85% orange and 11% red, so the scene is still monochrome warm.
   - The `couch` model, its cushions and the paper read well.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.**
   - `describe` and `observe` work (`dbg.couchIdx` 10, `lv`, `inp`), and the console is clean.
   - `act` and `setState` were not run.
7. **Faults: 6.**
   - `perf` gave 116.8 ms a frame at host load 1.4 on SwiftShader, so it is noise.
   - Draw calls are still 286 (unchanged for six sessions), with 19,700 triangles.
   - `Never visible` is none, and there are no `Lighting:` or `Surfaces:` fault lines.
   - Buddy's `dbg.lead` was -4 and `stretch` 2.06 at f117.

**Next:**
1. **Frame the players and make the tumble readable.**
   - The red hood is clipped at the bottom, so lift the camera target or move it back by about 1 unit so both hoods sit fully in frame.
   - On the slip, add a short shake, dust `burst` and a quick camera nudge toward Buddy.
   - `look` with `sample` at the bottom pixels (about y 760) should show no hood cut at the edge, and `player*` should not reach y 799.
2. **Make Buddy's get-up and rejoin fast.**
   - The last session saw "rag" until f273, about 2.6 s. Return him to "stand" sooner and re-grab slot 2 within about 1 s.
   - Last session `lead` was -9 at f491 after the slip.
   - `interact` Space+D x500 with `trace: ["players.1.state", "players.1.dbg.lead", "grips.1.slot"]` should show `state` back to "stand" by about f200 and `grips.1.slot` returning to 2.
3. **Cut 286 draw calls.**
   - Merge the 42 `stairwell` boxes by material, or use `instances` from `fx.js`.
   - `perf` should report under 150 draw calls.
   - Also add a green or blue accent (for example a rug, a plant or a coloured door) to break the 85% orange.

SCORE: 7.0

## Iteration 38
**Did** In `index.html`: `updateCamera` now looks at `camTarget.y - .35` (was +.2) so hoods sit higher in frame; `knock` rag time 1.0–1.4 s (was 1.8–2.6); `getUp` sets `aiDelay` .25 (was 1.0).
**Saw** `interact` Space+D x300: `players.1.state` "rag" f117..209 then "stand" (was 273). Buddy `grips.1.slot` still -1 and `lead` -4 at f300 (does not re-grab yet). Couch floor 2, no errors. `look`: both hoods fully visible, `player*` 4.2% [148,440,1220,799]; but the `couch` is cut at the top edge ([539,0,958,328]) while airborne on Floor 2. 91% orange. No `perf` run; 52 stairwell objects on screen.
**Next** 1) Buddy does not re-grab after get-up: check `tryGrab`/AI slot choice when `couchSpeed>=4` or slot owner. 2) Camera target now too low when the couch is high: lift `want.y` bias (+.5) back up a bit, or lower lookAt offset to -.15. 3) Merge `stairwell` boxes by material to cut 286 draw calls; add a green/blue accent.
**Open** Slip dust/shake nudge not added. Draw calls untouched.

### Judge 38

**Judge 38 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.**
   - Holding Space+D for 300 frames took `couch` to Floor 2 at 0:04.8, with `grips.0` P1 on slot 0.
   - `players.1.state` went "stand" → "rag" at f117 → "stand" at f209, so the faster get-up works.
   - `grips.1.slot` stays -1 after the get-up, and `dbg.lead` is -4 with `stretch` 2.06. Buddy never rejoins.
   - 1/2/R and P2 were not played this session.
2. **Rapier couch, 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.**
   - The `stairwell` railings, brick gap, treads, and the door labelled "1B" all read well.
   - The door label still says 1B, not 1A as the brief asks.
   - Floors 3–5 and the WIN landing were not reached.
3. **Slide-back/tumble ragdoll, get up; clip in first minute: 7.**
   - `slips` went 0→1 at f117. The sound line reports a grunt and a yelp, and the Buddy ragdoll lasts about 1.5 s.
   - No dust or shake marks the slip, and nobody is bowled over (P1 stayed "stand").
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 9.**
   - `div#tl` "Floor 2/5 0:04.8", `div#tilt` "TILT 1°" and `div#grips` "P1: HOLDING Buddy: free" show, with 0 overlaps and 0 cut off.
   - The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.**
   - The Subject `couch` is cut by the top edge at [539, 0, 958, 328]. It takes 8% of the picture, and its parts are not listed.
   - It does stand out: brightness 63% against 45%, edge contrast 0.146.
   - The picture is 91% orange, so the scene is still monochrome warm.
   - Both hoods are now fully in frame: the red hood is clear on the landing, and the green one sits at the bottom-left.
   - The camera lookAt change in Iteration 38 pushed the couch off the top of the frame.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.**
   - `describe` and `observe` work and the console is clean.
   - `act` and `setState` were not run.
7. **Faults: 6.**
   - `perf` gave 118 ms a frame at host load 1.5 on SwiftShader, so it is noise.
   - Draw calls are 285 with 19,698 triangles, unchanged for seven sessions. The `stairwell` is ×52 objects.
   - `Never visible` is none, and the console is clean.
   - Buddy never re-grabs after getting up.

**Next:**
1. **Fix the camera so the couch is never cut off (caused by Iteration 38).**
   - `look` shows `couch` clipped at y=0 while it is high on Floor 2.
   - Raise the `camTarget.y` bias so the couch stays inside the frame when it is airborne, or pull the camera back a little as couch height or tilt grows. Keep the hoods fully visible.
   - `look` with `sample` at [700, 8] should show the couch's bounding box starting at y > 0.
2. **Make Buddy re-grab after his get-up.**
   - `grips.1.slot` stays -1 from f209 to f300, with `lead` -4 and `stretch` 2.06.
   - Check `tryGrab` and the AI slot choice. After `getUp`, walk Buddy to the nearest free slot and grab it, and clear the `stretch` limit that blocks the grab.
   - `interact` Space+D x400 with `trace: ["grips.1.slot"]` should show 2 again within about 120 frames of f209.
3. **Cut the 285 draw calls and break the 91% orange.**
   - Merge the 52 `stairwell` boxes by material, or use `instances` from `fx.js`. `perf` should then show under 150 draw calls.
   - Add a green or blue accent (a rug, a plant, a coloured door) so the picture is less than 85% orange.
   - Add slip feedback while you are in there: `shake` and a dust `burst` at f117.
   - Rename door "1B" to "1A".

SCORE: 7.0

## Iteration 39
**Did** In `index.html`: `updateCamera` `want.y` bias +.85 (was +.5) and lookAt `camTarget.y - .15` (was -.35), so the airborne `couch` stays in frame; `tryGrab` lets AI players (`p.ai`) grab at any `couchSpeed` (was <4 only); door label `${L+1}A` (was B).
**Saw** `interact` Space+D x400: `grips.1.slot` -1 at f209 → 2 at f372 (Buddy re-grabs, ~160 frames after get-up); `players.1.state` stand→rag f117→stand f209. `look`: `couch` [198,55,648,466] fully in frame, 9.5%, brightness 64% vs 50%; both hoods visible; door reads "1A"; 88% orange over objects; console clean. No `perf` run; 91 objects on screen.
**Next** 1) Merge `stairwell` boxes by material (285 draw calls, unchanged many sessions). 2) Add green/blue accent to break the orange (a rug exists in green by the door; add a plant or blue door). 3) Slip feedback: dust `burst` + small `shake` at slip.
**Open** Re-grab takes ~160 frames; could be quicker. Floors 3–5 and WIN not replayed this session.

### Judge 39

**Judge 39 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.**
   - Holding Space+D for 400 frames reached `floor` 2 at `timer` 6.42, with `grips.0` P1 on slot 0.
   - `grips.1.slot` went -1 → 2 at f372, so Buddy does re-grab, but about 160 frames after the get-up at f209.
   - 1/2/R and P2 were not played this session.
2. **Rapier couch, 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.**
   - `stairwell` ×39, the brick gap and the landing read well, and the door now reads "1A".
   - Floors 3–5 and the WIN landing were not reached.
3. **Slide-back/tumble ragdoll, get up; clip in first minute: 7.**
   - `slips` went 0→1 at f117, and `players.1.state` went stand → rag → stand at f209.
   - Sound gave grunt, yelp, grunt.
   - No dust or shake was checked, and nobody is bowled over.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 9.**
   - `div#tl` "Floor 2/5 0:06.4", `div#tilt` "TILT 0°" and `div#grips` "P1: HOLDING Buddy: HOLDING" show, with 0 overlaps and 0 cut off.
   - The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The Subject `couch` is fully in frame at [201, 55, 648, 466]. It takes 9.5% of the picture, with brightness 65% against 51% and edge contrast 0.161.
   - The red and green hoods are clear, and there is a lamp and a green rug.
   - The picture is still 88% orange over the objects, so it reads monochrome warm.
   - The `couch` is washed out and semi-transparent against the railings, and its parts are not listed.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.**
   - `describe` and `observe` work and the console is clean.
   - `act` and `setState` were not run.
7. **Faults: 6.**
   - `perf` gave 116 ms a frame at host load 2.0 on SwiftShader, so it is noise.
   - Draw calls are 291 with 19,786 triangles, unchanged for eight sessions. This is the third time it is asked, and it was not done.
   - `Never visible` is none, and the console is clean.

**Next:**
1. **(asked again) Merge the `stairwell` boxes (draw calls).**
   - Merge the ×39 `stairwell` meshes by material with `geo.js` merge or `instances` from `fx.js`.
   - `perf` should show under 150 draw calls, down from 291.
2. **(asked again) Break the orange and add slip feedback.**
   - Add a blue or green accent: a blue door on another floor, a plant, or a cool-tinted wall on floors 2–5.
   - `look` should show over-objects orange below 80%.
   - At the slip (f117), fire a dust `burst` and a small `shake`.
   - `feel` with Space+D steps should list particles and shake at f117.
3. **Make the `couch` read solid and Buddy re-grab faster.**
   - The `couch` looks washed out against the railings. Check its material for opacity or emissive, and darken it so it has more edge contrast.
   - Cut Buddy's re-grab from ~160 frames to under 90.
   - `interact` with `trace: ["grips.1.slot"]` should show 2 by about f300.

SCORE: 7.1

## Iteration 40
**Did** In `index.html`: added `mergeGeos` and a post-build pass that merges the static `stairwell` meshes by material into `merged` meshes (the plain level meshes: steps, rails, posts, doors, plants, scraps). Door bodies on floors 2 and 4 are now blue (`mDoorBlue`) and teal (`mDoorTeal`) to break the orange. Slip dust `burst` and `shake` were already in the code (`slipFlag` branch), so I changed nothing there.
**Saw** `perf`: 114 draw calls (was 291), 26,110 triangles, 119 ms a frame on SwiftShader (noise). `look` at frame 0: console clean, `Never visible` none, picture still 88% orange, `couch` 13% and brightness 54% vs 37% around it. `look` flags z-fighting on `merged` at z=0.10 and z=0.04: the back-wall skirting/bricks planes overlap. Not checked: whether the new door colours show on floors 2 and 4, play after the merge, Buddy re-grab speed, couch opacity.
**Next** 1) Fix the `merged` z-fighting (offset the back-wall bricks/skirting or use polygonOffset). 2) Replay Space+D with `interact` to confirm collisions and the slip still work, and look at floors 2–4 for the blue and teal doors. 3) Darken the `couch` for edge contrast and cut Buddy's re-grab from ~160 frames.
**Open** The merged meshes lose per-mesh `castShadow` variety: the first mesh's flags are used for the whole group. Orange share is not measured past frame 0.
**Update** Nudged flight rail/post z .07→.068 (and -.07→-.068); `look` still reports the same two z-fighting lines on `merged` at z=0.10 and z=0.04, so the culprit is another pair (probably step/landing faces at z=.1 or the back-wall skirting). Still open.

### Judge 40

The z-fighting fault is already in my verdict: it's in the Faults line and in Next item 1. The `look` reported two overlapping `merged` faces, at z=0.10 and z=0.04. They are 14 × 3.1 units, probably the back-wall skirting or bricks against `backWall`. The fix is to move one face off the plane, set `polygonOffset` on its material, or remove the hidden face. I changed nothing, as a judge session requires.

**Judge 40 verdict (unchanged)**

1. Plays as the Core loop and Controls say: 7.
2. Rapier couch, stairwell, doors, WIN: 6.
3. Slide-back/tumble ragdoll, get up: 7.
4. HUD: 9.
5. Looks as LOOK.md says, characters match CHARACTERS.md: 5.
6. `window.__game` and one index.html: 8.
7. Faults: 5.

**Next:**
1. **(asked again)** Fix the camera occlusion and the `merged` z-fighting. The check is `look` after the same Space+D 400-frame `interact`. The `couch` should be over 5% of the picture, and the "Surfaces" z-fighting lines should be gone.
2. Make Buddy re-grab in under 90 frames after the get-up. `interact` with `trace: ["grips.1.slot"]` should show 2 by about f300.
3. Cut the orange further and clean the textures. `look` should show over-objects orange below 55%.

SCORE: 6.7

## Iteration 41
**Did** Fixed the `merged` z-fighting: the gap-rail posts (`post(..., .068, mRail)` and the -.068 one) were t=.06, coplanar with the `slopeBox` handrails (thick .06 at z=±.068); they are now t=.05. Also moved the flight step boxes' inner face from z=±.1 to ±.13 (`solid` calls in the flight loop; the invisible ramps are unchanged).
**Saw** `look` at frame 0: both z-fighting lines closed, console clean, `Never visible` none, orange 88%, `couch` 13%. Space+D 400-frame `interact`: reaches floor 2 at 6.4 s, one slip, Buddy re-grab `grips.1.slot` -1→2 at frame 373 (first change at f13). In that picture the `couch` is 1.3%: the flight above hides it, the camera looks up through the stairs. Floor 2's door is blue and shows. Over-objects orange 71% there.
**Next** 1) Camera occlusion: raise or pull back the camera, or fade the flight above (`stairwell` meshes over the couch) when it covers the couch. Check: `look` after the same interact, `couch` over 5%. 2) Buddy re-grab: it takes ~360 frames after the slip; cut it under 90. 3) Orange down below 55%.
**Open** `perf` not run. Merged meshes still use the first mesh's cast/receiveShadow flags.

### Judge 41

**Judge 41 verdict**

1. Plays as DESIGN.md's Core loop and Controls say: 7. In the Space+D 400-frame `interact`, `floor` goes 1→2 at 6.4 s with `slips` 1. Both `grips` hold (P1 slot 0, Buddy slot 2). The sounds are grunt, oof and grunt. Buddy's re-grab is slow: `grips.1.slot` goes -1→2 at f373. I did not play 2P.
2. Rapier couch and 5-floor stairwell, doors 1A.., WIN: 6. The 1A door is blue and readable, and the `stairwell` has handrails and landings. At floor 2 the flight above covers the view, so the switchback can't be read. I did not reach the WIN.
3. Slide-back/tumble ragdoll, get up: 6. One slip happened and both players are back to `stand`. Because the camera is occluded I could not see the tumble clip itself.
4. HUD: 9. `div#tl` shows Floor 2/5 and 0:06.4, `div#tilt` is the tilt meter, `div#grips` shows HOLDING, and none overlap. I did not see the WIN banner.
5. Looks as LOOK.md says, characters match CHARACTERS.md: 5. Orange is 88% at frame 0 and over-objects orange is 71% at floor 2. Textures on the underside of the `stairwell` flight look streaky. The red and green `player*` hoods read well.
6. `window.__game` and one index.html: 8. `describe` and `observe` work and the page starts playing on load.
7. Faults: 5. Console is clean, no z-fighting `Surfaces:` lines, and `Never visible` is none. The `couch` is 1.4% of the frame at floor 2, hidden behind the flight above, so the camera still fails. `perf` is 119 ms a frame, but that is a software renderer, so it is not counted as a fault. It has 114 draw calls and 26k triangles.

**Next:**
1. **(asked again)** Fix the camera occlusion. Raise or pull back the camera, or fade the `stairwell` flight above when it sits between the camera and the `couch`. Check: after the same Space+D 400-frame `interact`, `look` shows `couch` over 5% and the `Subject` line has named parts.
2. **(asked again)** Cut Buddy's re-grab to under 90 frames after the slip. Check: `interact` with `trace: ["grips.1.slot"]` shows -1→2 by about f300 or earlier, not f373.
3. **(asked again)** Cut the orange to under 55% over-objects. Give the walls, floor and `backWall` a cooler or neutral palette so the `couch` pops. Check: `look` shows over-objects orange below 55%, and the `Stands out` colour contrast rises.

SCORE: 6.6

## Iteration 42
**Did** Tried a global clipping plane (`renderer.clippingPlanes`, normal -y, constant couch y+2.5 then +1.9) in `updateCamera` to cut the flight above the couch. It changed 0–1% of the picture, so I reverted it with `git checkout -- index.html`; the page is unchanged from 41.
**Saw** The Space+D 400-frame `interact` gives the same result as 41: floor 2 at f297, slips 1, `grips.1.slot` -1→2 at f367, `couch` 1.2% [228,55,625,423], orange 62% (70% over objects), console clean, `Never visible` none. The slab covering the couch in the picture sits below the clip height: players are at y≈2.7 while the couch is at y 4.71, so the camera tracks the players, not the couch.
**Next** 1) Camera: weight `want.y` toward the couch more, or find which `merged` mesh is the slab (`look` with `at` points on it) and hide it by name/position, not by a y plane. 2) Buddy re-grab: in `aiThink` the AI waits `p.aiDelay` and walks to a slot before grabbing; shorten it after `release(ai)` in the slip branch (the `knock(ai, ...)` call). 3) Orange: retint `backWall` and the wall materials cooler.
**Open** Buddy re-grab and the orange are untouched. `perf` not run.

## Iteration 43
**Did** `updateCamera`: `want.y` now weights the couch 0.85 (was 0.6), and the hide threshold for flights above is `min(camTarget.y, c.y-1)+.4`, so the slab over the couch is hidden. Buddy: `knock` rag time is .55 s for `p.ai` (1.0–1.4 for humans), and `getUp` sets `aiDelay` .05 for the AI. Cooler tints: wall `wallMat` 0x9fb4c4, `mWood` 0x6c6a72, `mStep` 0x9a9aa4.
**Saw** Space+D 400-frame `interact`: floor 2 at f292, slips 2, couch 7.6% [301,249,711,526] now clearly visible (was 1.2%), but `Subject` still reports 0 named parts. Orange 82% by hue stat (was 70% over-objects; the stat counts brown lit wood as orange), colour contrast 74% vs 66% (was 71%). `grips.1.slot` is -1→3 at f383 (first change f14, slips at f117 and f330, so this is the second slip's re-grab, about 53 frames). Console clean, `Never visible` none. `perf` not run.
**Next** 1) Orange: the stairs and floor are still brown/orange under the warm bulbs; lower bulb colour warmth or retint `woodT` (0x6a4a2c) toward grey. 2) Run a trace of `grips.1.slot` around the first slip (f117) to confirm the re-grab time. 3) Look at the WIN and 2P modes, not yet checked.
**Open** Subject "named parts" is 0 of 0, which is how the couch's children are named, not a visibility fault.

### Judge 43

**Judge 43 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** In the Space+D 400-frame `interact`, `floor` goes 1→2 at f294 and `slips` reaches 2, with a "WHOOPS! BUDDY SLIPPED!" `div#toast`. P1 and Buddy both hold (slots 0 and 3), and the sounds are grunt, yelp and couchThud. Buddy's `grips.1.slot` goes -1→3 at f385, and the first slip was at f117, so the re-grab is slow. I did not play 2P.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 6.** Door 2A and a door at the lower right are readable, and the stairs have a handrail, a plant and a rug. The floor-2 picture is dark and muddy, and the switchback is hard to read. I did not reach the WIN.
3. **Slide-back/tumble ragdoll, get up: 6.** `slips` 2 happened and both players are back to `stand`. In the floor-2 look, `player*` is 0.023% of the frame, so a viewer cannot see anyone being knocked over. The tumble clip is not readable.
4. **HUD: 9.** `div#tl` shows Floor 2/5 and 0:06.1, `div#tilt` shows TILT 35°, `div#grips` shows HOLDING for both, and `div#toast` is readable. Nothing overlaps. I did not see the WIN banner.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.** Orange is 82% over-objects, still well above the 55% target. Subject colour contrast is 75% against 67%, and the stairs and floor are brown with streaky texture. Frame 0 is poorly framed: the `couch` is cut off by the left edge, a green `player` covers it, and the upper half is empty dark. The `backWall` is hidden at frame 0.
6. **`window.__game` and one index.html: 8.** `describe` and `observe` work and the game starts playing on load.
7. **Faults: 6.** The console is clean, `Never visible` is none and there are no `Surfaces:` lines. The `couch` is 7.4% at floor 2 and clear of occlusion. `perf` is 71 ms a frame, but that is a software renderer, so it is not counted as a fault. It has 92 draw calls and 17k triangles. The frame-0 framing is a fault.

**Next:**
1. **Fix the frame-0 and early-game camera.** At frame 0 the `couch` is cut off at the left edge and a `player` covers it. Frame `couch` and both players together: centre `camTarget` on the midpoint of the couch and the players, and pull back until all three fit. Check: `look` at frame 0 shows the `Subject` box inside [0..1280] with no cut-by-edge note, `couch` at 8–15%, and `player*` visible beside it.
2. **Cut the orange to under 55%, and make the tumble readable.** Retint `woodT` (0x6a4a2c) and the floor toward neutral grey-blue, and cool the warm bulb. Make the camera pull back or zoom on the knocked player during a slip. Check: the same Space+D 400-frame `interact` with `look`. Orange should read below 55% over-objects, and `player*` should be over 1% at the moment of the slip with a visible ragdoll.
3. **Cut Buddy's re-grab to under 90 frames.** Use `interact` with `trace: ["grips.1.slot"]` and compare the slip frame f117 with the re-grab. Buddy is back at slot -1→3 at f385, which is 50–70 frames after the second slip but far too late after the first. Then check the WIN and 2P modes: `setState` to floor 5 and `look` for the WIN banner, and a 2P `interact` with arrows and Enter.

SCORE: 6.7

## Iteration 44
**Did** `updateCamera`: x clamp for `tx`/`want` widened from .3 to -1.6 (couch is no longer cut at the left at frame 0); `camOff` is 4.2/8.4 (was 3.6/6.6) plus the spread terms. Bulb `PointLight` colour 0xe8d0b0 (was 0xffc27a); `woodT` colour 0x5a4c44 (was 0x6a4a2c).
**Saw** Frame 0 `look`: `couch` 11% [394,413,848,725], inside the frame, no cut-by-edge note; both players visible beside it (`player*` 7.4%). Orange 70% over-objects (was 82%), still above 55%. Console clean, `Never visible` none. Space+D `interact`, `perf`, WIN and 2P not run. Upper half of the frame is still empty dark, with a lone brick-wall sliver at the upper left.
**Next** 1) Fill the dark upper area (visible `backWall` or a lighter background colour) and remove the brick sliver. 2) Trace `grips.1.slot` around the first slip. 3) Check WIN and 2P modes; zoom on the knocked player during a slip. Orange is still over 55%: retint `mRail`, the floor and the couch toward cooler hues.
**Open** The wider camera makes the player and couch smaller during play, which I did not check. The 400-frame run was not repeated after the change.

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

### Judge 45

**Judge 45 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** The Space+D 400-frame `interact` gives `floor` 1→2 at f294 and `slips` 0→2 (first at f117), with a "WHOOPS! BUDDY SLIPPED!" `div#toast`. `grips` are P1 slot 0 and Buddy slot 3. The sounds are grunt, yelp and couchThud. Buddy's `grips.1.slot` is -1 until f385, a re-grab of about 270 frames, so Buddy is still slow to rejoin. I did not play 2P.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 6.** Doors 2A and 1A, the rails, the plant and the rug read on floor 2. The stairs are dark brown and muddy, and `merged` covers 64% of the frame. I did not reach the WIN.
3. **Slide-back/tumble ragdoll, get up: 5.** Both players are back to `stand` after the slips. At f400 `player*` is 1.2% [614,372,784,799], with only P1's red hood at the bottom edge. Buddy at y 4.6 is not in shot, so the Buddy slip is not framed. The last verdict's check of `player*` over 1% only passes because of P1.
4. **HUD: 9.** `div#tl`, `div#tilt` (TILT 36°), `div#grips` and `div#toast` all show, with 0 overlap and 0 cut off. I did not see the WIN banner.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.** At frame 0, `couch` is 11% and the red and green `player*` frame it well, and the characters read clearly. But the upper half is a flat slate-blue (#3a4a66) void with a lone floating brick sliver at the upper left. Orange is 72% over objects, against a 55% target. In play the `couch` is 5.2% against a dark-brown `merged` floor.
6. **`window.__game` and one index.html: 8.** `describe` and `observe` work and the page starts playing on load.
7. **Faults: 6.** The console is clean and `Never visible` is none. `perf` is 65 ms, but it is a software renderer, so it is not counted. It has 117 draw calls and 20.5k triangles. `Surfaces:` flags a shared face at z=-1.60 between `merged` and `stairwell`, on faces turned away from this camera. The floating brick sliver at the left edge in both looks is a stray object. In play the camera drops Buddy out of frame.

**Next:**
1. **Frame Buddy as well as P1 (asked again).** `updateCamera` still lets P1 at y 1.86 and Buddy at y 4.6 fall outside the shot: the view is centred on the couch and only P1 shows. Take the bounding box of the couch and both players, then raise the spread cap or the zoom-out so both are in shot. Check: the same Space+D `interact` with `look: true` around f117–150. `player*` should list both a red and a green body, over 3%.
2. **Cut Buddy's re-grab to under 90 frames after a slip (asked again).** Check: `interact` with `trace: ["grips.1.slot"]`, same steps. It should return to 3 or another slot by about f200, not f385. Make the AI walk to the nearest free corner as soon as its state is `stand`.
3. **Fix the frame-0 and stairs look, and cut the orange.** Delete or reposition the floating brick sliver near x 230,y 150, which is a wall fragment left over from the hidden `backWall`. Show `backWall` at frame 0 so the upper half is not an empty void. Retint the stairs, `merged` and `mRail` from dark brown to a lighter grey-blue or cream. Check: a frame-0 `look` shows orange under 55% over objects, no sliver, and `merged` brighter than #3a2a20. After that, run `setState` to floor 5 and `look` for the WIN banner, and an arrows+Enter `interact` for 2P.

SCORE: 6.6
