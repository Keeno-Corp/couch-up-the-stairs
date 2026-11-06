The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

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
