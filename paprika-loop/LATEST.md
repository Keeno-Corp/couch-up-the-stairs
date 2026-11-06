The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

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
