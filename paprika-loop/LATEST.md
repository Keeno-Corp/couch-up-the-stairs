The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

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

## Iteration 20
**Did** Tilt reference in the step function (index.html ~line 460) is now low-passed: `window.__refS` lerps toward `groundAt` normal at dt*5, ignoring normals with y<0.5 (stair risers).
**Saw** Same Space+D+A play: `tilt` peak 37.18° at f279 (was 58°), never over 45°. `floor` 1 for the first 600 frames, 2 by f900 (couch.pos.y 4.71). slips 1, sound grunt/yelp/grunt, console clean. Camera stutter note unchanged (21% still frames at 100 Hz).
**Next** 1) floor 2 not reached before f600 (couch stalls near y 2.98 at f265, then drifts back) — trace why it stalls on flight 1; 2) camera pull-back/framing of the floor-5 landing, scripted first-turn slip with slow-mo; 3) merge `stairwell` boxes via `instances` (301 draw calls), fix shared face at x=-3.00.
**Open** Full climb to floors 3-5 by hand unverified; `__refS` is not reset on restart (R); camera interpolation for 100 Hz.
