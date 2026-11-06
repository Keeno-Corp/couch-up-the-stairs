The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

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
