# Progress

The request is in PROMPT.md. Each session of the loop appends one section here: a builder's `## Iteration n` (Did, Saw, Next, Open) and the judge's `### Judge n` (its scores, Next). LATEST.md holds the last of each, rewritten by the loop after every session; the next builder reads the latest Judge's Next there first.

## Iteration 1
**Did** Found an existing riso build (index.html, rapier, `printMat` post pass), so changed it instead of rewriting. `VH` 5.2 → 4.4 and `updateCamera` spread factor .25 → .3 (min half-width 5.0/aspect) so `couch` and the hoodie characters fill more of the frame; the shaft still fits with paper margins.
**Saw** Solo unattended 60 s: floor 4 reached, slips 3, thuds 8, crashes 3, first slip ~frame 284 (tumble + WHOOPS!/CRUNCH! bursts fire). Opening look and `{floor:5}` WIN look read as five-ink riso, no console errors, no Never visible. WIN only fires at couch y>16.9 (floor-5 landing); not seen while on floor 4. With P1 idle (no input) the couch stalls on the floor-4→5 flight at ~14.6 m (buddy alone cannot finish) and P1 trails ~1.3–3 m below, partly cropped at the bottom. At zoom 4.4 the start frame crops the stairs top slightly. Not run: perf, 2P.
**Next** 1) Camera: keep P1 in shot when it lags (weight P1 more, widen via spread). 2) Buddy lift when P1 idle so the couch finishes the last flight. 3) Compare with `reference` vs refs/sheets/LOOK-board.png; make couch/characters bigger (scale models ~1.2) if still small. 4) Test 2P with arrows+Enter, `feel` on tumble shake.
**Open** Idle-P1 stall near floor 4/5; 2P untested this session.

### Judge 1

That `Surface:` note was already in my verdict. I listed it under item 5 and under Faults. It comes from the full-screen post-pass mesh, whose halftone and grain the brief asks for, so I left the verdict unchanged.

The next builder can check whether the shimmer is a fault by looking at the fine detail while the camera moves. If it flickers between frames, they should fix it by fading the grain with distance or keeping the halftone cell fixed to the screen.

SCORE: 7.3

## Iteration 2
**Did** `updateCamera`: vertical spread zoom now `min(spread,6)*.42` (was `min(spread,3)*.3`), and camera `my` is clamped relative to the lowest character (`lo+1.4 .. lo+2.2+spread*.5`) so a lagging P1 stays in shot.
**Saw** Solo unattended 40 s: floor 3, slips 3, crashes 2, couch y 9.4; P1 (y 7.7) and buddy both visible, no console errors, no Never visible. Look note: the full-screen grain mesh still flagged as "shimmer" (brief asks for grain). Not run: perf, 2P, buddy-lift.
**Next** 1) Buddy lift so couch finishes last flight when P1 idle. 2) Couch/characters still small in frame (scale ~1.2 or zoom). 3) Fade grain/halftone shimmer under camera motion; test 2P and `feel` on tumble shake.
**Open** Idle-P1 stall on floor 4→5 not addressed; 2P untested.

**Addendum (iter 2)** Halftone/grain is already screen-fixed (`fp=vUv*res`, static hash), so no frame flicker; softened anyway: per-pixel hash weight .5→.3 in the paper grain, #grain opacity .22→.15. The look's Surface note on the post-pass mesh may persist since the brief asks for grain.

### Judge 2

That `Surface:` note was already in my verdict. I listed it under item 5 and under Faults. It comes from the full-screen post-pass mesh, whose halftone and grain the brief asks for, so I left the verdict unchanged.

The next builder can check whether the shimmer is a fault by looking at the fine detail while the camera moves. If it flickers between frames, they should fix it by fading the grain with distance or keeping the halftone cell fixed to the screen.

SCORE: 7.1

## Iteration 3
**Did** simStep player loop: a gripping P1 more than 2.4 m below the couch is teleported to its slot (`slotWorld`). `updateCamera`: lowest-character floor `lo+1.4`→`lo+.6`, look offset `my+1.9`→`my+1.2`, so couch sits mid-frame instead of the bottom edge.
**Saw** Solo unattended 60 s (3600 frames): floor 3 (before fix floor 4 with P1 3 m below couch, off-frame), crashes 2, slips 3, no console errors, no Never visible. Surface note on the post-pass mesh persists (brief asks for grain). Not run: perf, 2P, win.
**Next** 1) Couch/characters still small in frame (zoom or scale ~1.2). 2) Play unattended past 90 s to check the idle-P1 stall and the win; test 2P and `feel` on tumble shake. 3) Pace: unattended solo reaches only floor 3-4 in 60 s.
**Open** Teleport of P1 untested for visible pop; 2P untested.

### Judge 3

**Judge 3**

Scores by Must have item:

1. **Plays as DESIGN.md says: 7.** The `interact` steps (KeyD, Space) gave `grips` P1 slot 3 and Buddy slot 2, `players[0].gripping` true, `tilt` 0→29.19°, and Sound lines for grunt, couchThud and grunt. Solo start is automatic with `started: true`. The couch's travel direction turned 206° within 90 frames, which reads as jittery. 2P was not run.
2. **Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN at floor 5: 7.** The sheet shows pink railings, doors 1A to 4A, and landings. The unattended 20 s and 45 s moments were still on floor 2, so the climb is slow. The `floor: 5` state shows the WIN banner at floor 5, and the banner is no longer shown on floor 4.
3. **Tumble, ragdoll, burst within the first minute: 5.** `thuds` went to 1 and a couchThud sounded in 90 frames, and the previous judge saw 2 crashes in 60 s. In the sheet, the 20 s and 45 s frames show no flattened player or burst on screen. I did not catch one by eye.
4. **HUD in printed type: 8.** The page shows FLOOR 1/5, a timer, a TILT 23° meter, "P1: HOLDING" tags, and a WIN banner with "0:00.0 · 0 crashes · Press R to haul it again". The win timer reads 0:00.0 only because the state was set by hand.
5. **Riso look per LOOK.md: 7.**
   - Teal, yellow, pink and navy inks show halftone dots, grain, and navy outlines, and the picture matches the LOOK-board at a glance.
   - The `Surface:` note from the full-screen post-pass mesh persists.
   - The `div#grain` overlay stays up for the whole run.
   - In the `win` frame, confetti and debris are chaotic and muddy over the landing.
6. **Orthographic follow cutaway camera: 5.**
   - The camera does follow the floors.
   - The stairwell sits left of centre, with about half the canvas empty cream.
   - The top is cropped in every frame, so the HUD, the "2A" door and the lamp heads are cut off.
   - At 45 s the couch sits at the stair's right edge.
7. **Toy hoodies and puffy couch match the sheets: 6.** The teal and yellow hooded blobs and the pink couch read as toys. They are still small, about 60 px against a 340 px stairwell. The couch looks flat, not puffy.
8. **Comic bursts and a lamp glow per floor: 5.** The lamps are drawn on each floor, but no THUD!/OOF! burst text was on screen in any sheet frame. The effect was not confirmed visually.
9. **`window.__game` and single `index.html`: 9.** `observe`, `act` and `setState` all work, and the page starts playing on load. There were no console errors.

**Faults: 6.** `perf` gave 107 ms a frame on SwiftShader with a host load of 6.3 on 8 cores, so it is noise and not a fault. The scene pass is 265 draw calls and 43k triangles, which could be cut. The 20 s and 45 s sheet moments show the lower stairs repeating, and the AI buddy is slow. The unattended climb reaches only floor 2 in 45 s.

**Next:**
1. Fix the framing. Centre the stairwell in the canvas, zoom the ortho camera about 1.3× so the couch and movers are chunky, and keep the top HUD and lamp heads uncropped. Check with a `look` at 20 s whose frame has the couch about 100 px wide.
2. Make the tumble and burst visible within 60 s. Have the buddy let go or slip on a steep tilt (above 35°) around floor 1 to 2, so the couch slides back and flattens P1. Show a big halftone "CRUNCH!" or "THUD!" burst with ink shake. Check with `interact` using `trace` on `thuds` and a `look` with `sample` at the burst pixels.
3. Speed up the AI buddy and the climb to reach floor 3 or more by 45 s unattended. Smooth the grip so the couch's heading doesn't flip 206° in 1.5 s, and add a `feel` check on the impact shake.

SCORE: 6.7

## Iteration 4
**Did** Camera zoom only: `VH` 4.4→3.5, min half-height `5.0/a`→`4.0/a`, look offset `my+1.2`→`my+1.0` in `updateCamera`. Couch and movers are ~1.25× larger in frame; stairwell still centred (camTarget.x 1.55).
**Saw** `look` sheet at start and 20 s: no console errors, no Never visible; couch ~90 px wide in a 512 px cell, floor 2 at 19 s. Top HUD is no longer overlapped by lamp heads at start but the stairwell top is cropped by design. Not run: perf, 2P, `feel` on tumble shake, win, buddy-speed changes.
**Next** 1) Show a burst (THUD!/CRUNCH!) reliably within 60 s: check with `interact` trace on `thuds` and a look at the burst. 2) Speed the buddy so unattended reaches floor 3+ by 45 s, and smooth grip heading (206° flip). 3) Reduce draw calls (265) and the muddy confetti at win.
**Open** Session ran short on time; items 2-3 of the judge's list not touched. 2P untested.

### Judge 4

**Judge 4: scores by Must have item**

1. **Plays as DESIGN.md says: 7.** An `interact` with KeyD then Space gave `grips` P1 slot 3 and Buddy slot 2, `tilt` 0→30.9° at frame 163, and `thuds` 1 at frame 17. The Sound line shows grunt, couchThud, yelp and oof. The couch's `Motion` reads as turning 139° right, still jittery. The unattended climb is slow: floor 2 at 19 s and still floor 2 at 44 s (`buddy HOLDING`, `TILT 2°`). 2P was not run.
2. **Rapier couch and 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN at floor 5: 7.** The sheet shows pink railings, doors 1A to 4A, landings, and the `FLOOR 5/5 · HOME!` WIN banner. The banner is correct on floor 5 and not shown on floor 4. Progress is slow: floor 2 at 20 s and 45 s, which suggests the couch slid back.
3. **Tumble, ragdoll, burst within the first minute: 5.** `thuds` and `slips` are 1, and the sounds include yelp and oof, so a slip happens early. No sheet frame shows a player flat or any burst text on screen. The burst is not visible in a still look, so this is unconfirmed by eye.
4. **HUD in printed type: 8.** The page shows `FLOOR 2/5`, a `0:19.1` timer, a `TILT 29°` bar, `P1: HOLDING` tags, and a WIN card with "0:00.0 · 0 crashes · Press R to haul it again". The win timer reads 0:00.0 only because the state was set by hand.
5. **Riso look per LOOK.md: 7.** Teal, yellow, pink and navy inks show halftone, grain, and navy outlines, and it matches the LOOK-board. The `div#grain` overlay stays up for the whole run. In the `floor5` frame the confetti at top-left is a muddy cluster, and the WIN type is crisp.
6. **Orthographic follow cutaway camera: 6.** The stairwell is now centred and fills the canvas, and the camera follows floors. The top is still cropped, since the `FLOOR`/`TILT` HUD sits over the lamp and door tops and the "2A" door is cut. At the start the stairs and couch are visible. At 45 s the couch sits at the right edge, and the stair run above it is cut off.
7. **Toy hoodies and puffy couch match the sheets: 7.** The teal and yellow hood blobs are chunkier, about 90 px against a 340 px stairwell cell. The pink couch has a cushioned look but is still fairly flat.
8. **Comic bursts and a lamp glow per floor: 5.** Lamps are drawn on every floor, but no THUD!/OOF!/CRUNCH! text appears in any frame. Bursts are heard (couchThud, oof) but are not shown.
9. **`window.__game` and single `index.html`: 9.** `observe`, `act` and `setState` work, the page starts on load, and there were no console errors.

**Faults: 6.** `perf` gave 115 ms a frame on SwiftShader with a host load of 6.9 on 8 cores, so it is noise and not a fault. The scene pass is 262 draw calls and 42.7k triangles, which could be cut. No `Never visible` object and no console errors. The unattended climb is slow and the buddy is the likely cause. The win confetti is muddy.

**Next:**
1. (asked again) Make the burst visible. At every `thuds`/`slips` event, spawn a large halftone sticker "THUD!" or "CRUNCH!" (about 200 px, pink or yellow with a navy outline, 0.6 s, scale pop plus a few frames of ink shake) at the couch or player position. Show it with `interact` stepping `KeyD`, `Space` for 20 frames and `look: true`. It is done when that look shows burst text near x≈560, y≈200, and `feel` lists a scale pop and a shake.
2. (asked again) Speed up the buddy and the climb. Have the buddy lift and push on stairs. Cap the slip chance so the couch is not sliding back at 29° tilt, and smooth the grip heading to remove the 139° turn. Done when `interact` with `until: {floor: 3}` and `max: 2700` reaches floor 3 or more by 45 s unattended.
3. Make the first-minute flatten visible. On a slip, put the player into a flat ragdoll pose for about 1 s, with a `*` or star burst above them and a dust puff in halftone. Also cut the confetti at the win to about a third and make it tidy halftone dots, then cut draw calls (262) by instancing the repeated stairs and dots. Check with a `look` sheet moment right after a slip, and with `perf` `costs: true`.

SCORE: 6.8

## Iteration 5
**Did** Verified bursts already spawn (`bang()` DOM stamp): `look` right after the first buddy slip shows a big yellow "WHOOPS!" star over the couch (div.bang). Made it bigger-feeling: `@keyframes bang` pops to 1.35 with ink wobble, lasts 1.6 s (was 1.1; `setTimeout` remove 1600), THUD! threshold `dv.length()>2.2` (was 3). Confetti at win cut 220→70 meshes with shared `cfGeo`/`cfMats` (fewer draw calls, tidier).
**Saw** Unattended solo (keys released, `restart`): floor 3 at frame 1363 (~22 s), `thuds` 6, so the buddy climb is no longer slow (<45 s). First slip `slips`=1 at frame 118 (~2 s) with WHOOPS! at about (700,440) of 1280x800; no console errors, no Never visible. Not run: `perf`, 2P, `feel` on the pop/shake, flat-ragdoll pose, grip-heading smoothing.
**Next** 1) Flat ragdoll pose + `*` stars/dust puff after a slip. 2) `perf` `costs: true`, instance the stairs/dots (262 draw calls). 3) Smooth the grip heading; test 2P (`Digit2`).
**Open** Note `interact` key `down:true` stays held across calls: release before unattended tests. A look after a long `until` can show a stale canvas.

### Judge 5

**Judge 5: scores by Must have item**

1. **Plays as DESIGN.md says: 7.** `interact` with KeyD then Space ran 391 frames. `tilt` peaked at 37° at frame 111, and `thuds` reached 3 and `slips` 2. The Sound line has grunt, couchThud, oof and yelp. At the end both `players` were in state `rag` and `floor` was still 1 after about 6 s. Grip heading smoothing is not done and 2P was not run.
2. **Rapier couch and 5-floor stairwell: 8.** The sheet shows pink railings, doors 1A and 2A, landings, and the `FLOOR 5/5 · HOME!` banner at the floor-5 state. The floor-3 state shows no WIN banner, so the floor-4 WIN fault is fixed.
3. **Tumble, ragdoll, burst within the first minute: 7.** A real slip happened (`slips` 2, both `players` in `rag`). The look shows the couch jammed on the rail with the teal player squashed under it. There is no flat limp pose and no stars or dust puff yet.
4. **HUD in printed type: 8.** `div#tl` shows FLOOR 1/5 and a 0:06.0 timer, `div#tilt` shows TILT 16° on a bar, and `div#grips` shows KO tags. The WIN card is correct. The `div#tl` text at the top-left overlaps the "2A" door and lamp.
5. **Riso look per LOOK.md: 8.** Halftone, grain, navy outlines and misregistration are visible, and the look matches the LOOK-board. The `look` Surface note for "BufferGeometry" at 100% coverage is the full-screen post-pass quad that draws the riso halftone and grain. The request asks for that detail, so I did not score it as a fault. `div#grain` stays up for the whole run.
6. **Orthographic follow cutaway camera: 7.** The camera follows the floors and the stairs and couch stay visible. The top is cropped, with the "2A" door cut by the HUD, and the right 20% of the canvas is empty cream paper.
7. **Toy hoodies and puffy couch match the sheets: 7.** The couch is pink and cushioned, and the hoodies are teal and yellow with faces. They are readable but the couch is still fairly flat.
8. **Comic bursts and a lamp glow per floor: 7.** `div.bang` shows a big yellow "WHOOPS!" star with navy outline over the couch. THUD! and CRUNCH! were not seen. Lamps with halos are on every floor.
9. **`window.__game` and single `index.html`: 9.** `observe` works and the page starts on load, with no console errors. `Subject` names "couch", which is not in the scene, so the look tools can't target it.

**Faults: 7.** `perf` gave 116 ms a frame on SwiftShader at a host load of 3.1, which is not a signal on a software renderer. The scene pass is 259 draw calls and 42.7k triangles. The post pass alone takes 36.7 ms. There are no `Never visible` objects and no console errors.

**Next:**
1. (asked again) Add a flat ragdoll pose and a `*`/star burst. On `slips`, lay the player flat for about 1 s with orbiting stars and a halftone dust puff. It is done when `look` right after the slip shows the player lying flat, with stars above them.
2. Make a solo run reach floor 2 or more without input. Reduce slipping at tilt above about 30° and smooth the grip heading. It is done when `interact` with `until: {floor: 2}` and `max: 1800` reaches floor 2 with keys released.
3. Cut draw calls by instancing the repeated stairs, dots and railings (259 in the scene pass). Also reduce the empty paper on the right and move the HUD off the door tops. Check with `perf` `costs: true`, and then with `look` for the HUD no longer touching the door at the top-left.

SCORE: 7.5

## Iteration 6
**Did** Ragdoll (`animChar` rag branch): after `ragT`>.35 s the player's `ch.g` slerps to a flat on-back pose (yaw kept, dropped .25) and `p.stars` (4 yellow octahedra, in `scene`) orbit above the head while `rag`; hidden on stand.
**Saw** `interact` until `slips`=1 (frame 285) then `players.0.state`=rag (frame 95 after): look shows both hoodies sprawled on the stairs with yellow stars around the couch, WHOOPS! burst up; no console errors, Never visible none. Not run: `perf`, instancing, 2P, grip-heading smoothing, HUD move.
**Next** 1) Instance stairs/dots/railings (259 draw calls) and check `perf` `costs: true`. 2) Move `div#tl` off the 2A door and trim the empty right paper in the camera. 3) Smooth grip heading / fewer slips above 30° tilt; test 2P.
**Open** Stars are small and read as confetti at this zoom; the flat pose is only visible a moment because `stateT` is ~1 s.

### Judge 6

That `Surface:` note is the full-screen post-pass quad that draws the riso halftone and grain. The brief asks for halftone and grain, so I did not count it as a fault. The grain is dense, though. Next item 1 trims the grain with the other framing changes. The verdict above stands.

SCORE: 7.4

## Iteration 7
**Did** `#tl` (FLOOR/time/mode) is now a paper card with navy border and pink shadow, moved to 14/10 px, so it no longer fights the 2A door. Grain trimmed: `#grain` opacity .15→.07, post-pass paper grain `hash(floor(fp))` weight .3→.15.
**Saw** `look`: 0 HUD overlaps, no off-screen, Never visible none; the `Surface:` noise note remains (the post-pass quad, intended). `perf` 266 draw calls, 42.8k tris, 115 ms/frame on SwiftShader (no budget signal). Level meshes already merge by material/floor, so the remaining draw calls are named meshes and basic-material meshes.
**Next** 1) Instance the stairs/polka dots/railings only if a real GPU shows a problem. 2) Smooth grip heading and cut slips above 30° tilt; test 2P (`2`). 3) Make the ragdoll stars bigger and the flat pose longer.
**Open** Not done: instancing, 2P test, grip-heading smoothing. The `look` Subject line says `__game.subject` "couch" is not in the scene; I did not check it.

### Judge 7

That `Surface:` note is the full-screen post-pass quad that draws the riso halftone and grain. The brief asks for both, so I didn't count it as a fault. The score stands, and Next item 1 is unchanged. The grain is already lighter than last session, and the note stays open.

SCORE: 7.3

## Iteration 8
**Did** Ragdoll stars (`p.stars` octahedra) enlarged .11→.2 and orbit radius .5→.6; KO time in `knock` lengthened (player 1.3–1.7 s, AI .8 s) so the flat pose (`animChar` rag, flat ramp from .35 s) is held longer.
**Saw** `open` loads clean (no errors); did not run `look`/`perf` this session (short pass). Previous numbers: 266 draw calls, 0 HUD overlaps.
**Next** 1) Smooth grip heading and cut slips above 30° tilt; test 2P (`2`). 2) Instance stairs/polka dots/railings only if a real GPU shows a problem. 3) Check `__game.subject` "couch" not-in-scene note from `look`.
**Open** Longer KO may slow pacing; check the feel in `interact`. Instancing, 2P test, grip-heading smoothing not done.
