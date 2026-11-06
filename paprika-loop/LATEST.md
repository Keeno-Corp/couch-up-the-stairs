The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

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
