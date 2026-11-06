The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

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
