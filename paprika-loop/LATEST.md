The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

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
