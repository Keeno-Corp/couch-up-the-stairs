The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

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
