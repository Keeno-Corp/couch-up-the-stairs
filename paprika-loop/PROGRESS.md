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

### Judge 8

The `Surface:` note is the full-screen post-pass quad that draws the riso halftone and grain. The brief asks for both, so I didn't count it as a fault. The score stands at 7.8 and the Next list is unchanged. The grain is the one thing to keep an eye on: if it keeps shimmering in motion, lighten it.

SCORE: 7.8

## Iteration 9
**Did** Short verification pass; no code changes. Re-read the `__game.subject` note: `couch` Group is named 'couch' (index.html:337) and added to `scene`, so the "not in the scene" note comes from `look` seeing only the full-screen post-pass quad as the rendered mesh; left as is.
**Saw** `open` clean. `look` at frame 0: brightness 69%, 0% blown out, 0 HUD overlaps/off-screen; riso halftone and stairwell read well; the only Surface note is the post-pass quad's grain (opacity .07, 45.9 detail). Did not run `perf` (SwiftShader).
**Next** 1) Smooth grip heading and reduce slips above 30° tilt; test 2P (`2`) with `interact`. 2) If the grain shimmers in motion, lower `#grain` opacity / halftone detail. 3) Instance stairs/dots/railings only if a real GPU shows a problem.
**Did (late)** `#grain` CSS overlay opacity .07→.05 to answer the shimmer note (halftone and post-pass grain kept: LOOK.md asks for them).
**Open** Grip-heading smoothing, 2P playtest and instancing still not done; the subject note is a false positive I could not clear.

### Judge 9

The `Surface: "BufferGeometry"` note is not a fault. It is the full-screen post-pass quad that draws the riso halftone and grain, and LOOK.md and the brief ask for both. I did not count it against the score. Its detail value (37.8 of 255 in the last `look`, 45.9 in earlier ones) is already lower after the `#grain` overlay was dropped from .07 to .05. The scores and Next list stand as written above.

SCORE: 6.3

## Iteration 10
**Did** No code changes: re-opened the page and `look`ed to confirm it still runs clean after the `#grain` change.
**Saw** `open` clean, no console errors. `look` frame 0: brightness 70%, 0% blown out, 0% near black, 4 HUD boxes, 0 overlap/off-screen. Post-pass quad detail 45.97 (halftone and grain, which LOOK.md asks for). The `subject "couch" not in the scene` note is still the known false positive. `perf` not run (SwiftShader).
**Next** 1) Smooth grip heading and cut slips above 30° tilt (`slipT`, `headLag` in the player object, around index.html:394 and 557). 2) Playtest 2P (`2`) with `interact`. 3) Instance stairs/dots/railings only if a real GPU shows a problem.
**Open** Grip-heading smoothing, the 2P playtest and instancing are still undone.
**Did (late)** Softened grain: post-shader per-pixel hash grain .15→.08 (index.html:121), `#grain` overlay .05→.03. The `look` Surface line is unchanged; its detail comes from the riso halftone dots, which LOOK.md asks for, so I kept them.

### Judge 10

**Judge 10**

Scores for the Must have list:

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** The page starts playing on load. In the sheet, solo play ran from `FLOOR 1/5` at 0:00.0 to `FLOOR 5/5 · HOME!` and the WIN banner at 0:48.5, with the buddy helping ("HOLDING" chips for both players). I did not run `interact` on 1/2/R, and the 2P path has still never been played.
2. **Rapier couch and 5-floor stairwell: 7.** The switchbacks, railings, doors 1A, 2A and so on, and landings are all visible. WIN appeared only once the couch was on floor 5, so the floor-4 WIN bug looks fixed.
3. **Tumble, ragdoll and burst: 6.** The WIN card says "4 crashes", so tumbles happen within one solo run. I did not catch a burst on screen in the three sampled moments, and the slip frequency is untuned.
4. **HUD: 8.** The printed type is clear: `FLOOR n/5`, the timer, the `TILT 0°` meter, the WIN banner with time and crashes, and a "Press R to haul it again" line.
5. **Riso style: 7.** The look has five inks, halftone, a mustard/teal/pink palette and navy outlines, and it is close to LOOK-board. The post-pass quad shows a high detail value, which is expected for the halftone. The misregistration is subtle.
6. **Orthographic camera: 7.** It is side-on and follows floor by floor, and the stairs and couch stay in view. On floor 5 the couch sits low behind the WIN card, partly crowded by the HUD.
7. **Toy characters and couch: 6.** The pink couch and the green hoodie characters read, but they are still small against the cutaway. The brief asked for chunkier toys.
8. **Comic bursts and a lamp glow per floor: 6.** The lamps with halos are on every floor. I did not see THUD! or OOF! in the sampled frames.
9. **`window.__game`, no build: 8.** `describe` returned the name, units and keys, and the project is a single `index.html` with vendor files.

**Faults: 7.** There were no console errors. `perf` read 112 ms a frame on SwiftShader on a busy host (load 7.1), so it is noise, not a fault. It shows 246 draw calls and 42.8k triangles, and instancing is only worth doing if a real GPU struggles.

Nothing on screen needs a library asset search: the brief fixes the asset style as code-built toy shapes, and library models were rejected.

**Next:**
1. Make the movers and couch about 1.4× larger in frame, as the brief asks, and keep the whole cutaway visible. Scale the player and couch meshes and trim the camera frustum a little. Check it with `look` zoomed on the floor-1 start: the couch should span roughly 20% of the frame width.
2. Smooth the grip heading and cut slips above 30° tilt (`slipT` and `headLag` in the player object, around index.html:394 and 557). That was Next in the last iteration and is still undone (asked again). Then play 2P with `interact` (`{key:"Digit2"}`, P1 WASD and Space, P2 arrows and Enter). It should show both players moving and holding. Add a `trace` of `tilt`.
3. Make the comic bursts and juice unmissable. Use `feel` on a forced tumble and check that THUD!, OOF! or CRUNCH! shows large for at least 0.5 s with an ink shake and halftone dust puffs. Use `look` with `sheet` on the frames right after the impact, which should show the burst text at roughly 15% of the screen width.

SCORE: 6.9

## Iteration 11
**Did** Zoomed the camera so the movers and couch read about 1.2× larger: `VH` 3.5→2.9 and the aspect floor in `updateCamera` 4.0/a→3.4/a (index.html:79, ~672). Comic `.bang` stamps scaled up (`el.style.scale` size*.8→size*1.15 in `bang()`).
**Saw** `open` clean, no console errors. `look` frame 0: brightness 69%, 0% blown out, 0% near black, 4 HUD boxes, 0 overlap/off-screen. Couch spans about 20% of frame width; stairs, door 1A and both characters in view. Surface warning (halftone detail 49.99) and the `subject "couch"` note are the known ones. `perf` not run; I did not run `interact` or `feel`.
**Next** 1) Smooth grip heading and cut slips above 30° tilt (`slipT`, `headLag`, index.html:394 and ~649); the slip is scripted around line 582-589, so tune its probability there. 2) Play 2P (`Digit2`) with `interact`; it has never been played. 3) Use `feel` on a forced tumble to check THUD!/OOF! shows large for 0.5 s or more. Check that the higher floors are still framed at the new zoom.
**Open** Characters and couch meshes are not scaled themselves, only the camera zoom. Grip smoothing, the 2P playtest and the bang check are undone. Higher floors and the 2-player spread framing were not re-checked at the new zoom.

### Judge 11

The `Surface` note refers to the full-screen riso halftone and grain post-pass. The brief asks for that look, and LOOK.md and the last builder's Open already record it as intended. I read it as a known item, not a fault, and it did not lower any score.

SCORE: 6.7

## Iteration 12
**Did** Cut the scripted buddy slip when `tiltDeg` > 30° (after the first slip, index.html before the slip block); softened `headLag` (gain .01→.006, rate 8→5) so grip heading is steadier.
**Saw** `open` and `look` frame 0 after the edit: no console errors, brightness 69%, 0% blown out, 4 HUD boxes, 0 overlap. Same known Surface warning (riso halftone). I did not run `interact` or `feel`.
**Next** 1) Play 2P (`Digit2`) with `interact`. 2) `feel` a forced tumble to check THUD!/OOF! size. 3) Check higher floors and the 2P spread framing at the 1.2× zoom.
**Open** The slip and head-lag change was only checked at load, not in play, and the 2P playtest and bang check are still undone.

### Judge 12

The `Surface` note is the full-screen riso halftone and grain post-pass. The brief asks for that look, and LOOK.md records it as intended. I counted it as a known item, so no score dropped for it. The grain is still a bit dense, so the builder could soften it slightly.

Judge 12 verdict, unchanged:

- **1. Plays as DESIGN.md says: 7.** `Digit1`/`Digit2`/`KeyR` work. Solo reached floor 3 in 14.5 s. In 2P the D+Space grab left `grips` at slot -1.
- **2. Rapier couch and stairwell: 8.** Floors 1A..3A, railings and landings are visible. I did not reach floor 5.
- **3. Tumble and flattening: 6.** `slips` 2 and `thuds` 2 fired in solo, and `crashes` reached 2 in 2P, with oof and couchThud sounds. I did not see a ragdoll frame.
- **4. HUD: 8.** `#tl`, `#tilt` and `#grips` have no overlap. I did not see the WIN banner.
- **5. Riso look: 8.** The look matches LOOK-board.png, and the `Surface` note is the known post-pass.
- **6. Orthographic camera: 8.** It follows floor by floor, but the couch is partly hidden at floor 3.
- **7. Characters and couch: 7.** They match the sheets but are small at higher floors.
- **8. Bursts and lamp glow: 6.** Lamps are on every floor. I saw no THUD!/OOF! bursts in the stills.
- **9. window.__game and no build: 9.**
- **Faults: 7.** There were no console errors. `perf` read 125 ms a frame on a software renderer, so it is not a budget signal.

**Next:**
1. Show the bursts. Use `feel` or an `interact` with `look: true` to catch a forced tumble (`setState` the couch above floor 1 with tilt over 40°). THUD!/OOF!/CRUNCH! should be large halftone starbursts over the impact. Add them if they are missing.
2. Check that a tumble flattens a player. Run `look` on the frame after `crashes` increments. A player should lie flat in ragdoll and then stand up. If not, make the ragdoll pose and the get-up clearer.
3. Run the rest of the game to the floor-5 landing with `setState` to floor 4, then check the WIN banner and the printed win screen. Also make the grip work for 2P: it should grab when a player stands within about 1 m of a couch corner.

SCORE: 7.3

## Iteration 13
**Did** No code change. Played solo with `interact` (Digit1, D, held Space) and forced a knock with `setState({players:[{knock:true}]})` to check the bursts.
**Saw** The `bang()` burst works: a large halftone starburst reading "BONK!" over the couch, about 250 px wide, in the 12 frames after the knock (`.bang` in the HTML list). `thuds` went 0→1 and the sounds oof, couchThud and grunt fired. Tilt peaked at 30.7° in solo. Both players held (P1 slot 0/3, Buddy slot 2). Brightness 70%, 0 HUD overlap, no console errors. The known riso post-pass Surface note is still there. `crashes` stayed 0, since a forced knock does not count as a tumble and P1 was back to `stand` within 12 frames. I did not run `perf`.
**Next** 1) Check the 2P grab (`Digit2`, D+Space) and the 2P framing. 2) Reach the floor-5 WIN banner with `setState({floor:4})`. 3) Soften the grain a little.
**Open** I did not see a ragdoll frame: after a knock P1 stands again within 12 frames, so the flat pose may be too brief to read. The 2P grab and the WIN banner are still unchecked.
**Did (addendum)** Softened the riso grain: pink/teal/yellow pinhole threshold .016→.010 (index.html lines 128-132) and #grain opacity .03→.02. Not re-looked; the Surface note is the known post-pass.

### Judge 13

The `Surface` note is the full-screen riso halftone and grain post-pass. The brief asks for that look, and LOOK.md records it as intended. I scored it as a known item, so it cost nothing. The grain is already softer than in session 12.

My verdict stands as written above.

SCORE: 7.2

## Iteration 14
**Did** No code change. Checked the 2P path with `interact` (Digit2, D+Space for P1, ArrowRight+Enter for P2, 90 frames) and `setState({floor:4})`.
**Saw** 2P works: `mode` local2p, `grips` P1 slot 0 and P2 slot 2, both `gripping`, couch tilted about 4° and climbing at speed 2.1. The framing shows both hoods and the couch with the HUD clear. With `floor:4` the camera follows to floor 4/5 and the couch sits on the landing (a `thuds` count of 1 and the couchThud sound came with the jump). Brightness 70%, 0 HUD overlap, no console errors. The only Surface note is the known riso post-pass. I did not run `perf`.
**Next** 1) Reach the floor-5 WIN banner (`setState({floor:5})` or push the couch to the top) and check it reads. 2) Look for a ragdoll frame after a real tumble. 3) Run `perf`.
**Open** The WIN banner and the ragdoll frame are still unchecked.

## Iteration 15
**Did** No code change. Checked the WIN banner with `look` sheet `setState({floor:5})`, 90 frames, and ran `perf`.
**Saw** The WIN banner reads: big yellow/pink "WIN!" with "0:00.0 · 0 crashes" and "Press R to haul it again" chips, HUD "FLOOR 5/5 · HOME!" clear, couch and both characters on the landing. Brightness 68%, 0% near black, 0% blown out. No fault lines. `perf`: 127.6 ms median frame on SwiftShader (no GPU, not a budget signal), 234 draw calls, 42k triangles, 16.8 MB textures; scene 85 ms, riso post-pass 37 ms.
**Next** 1) Look for a ragdoll frame after a real tumble. 2) Count the draw calls (234): instancing the repeated stair/prop meshes may help a real GPU. 3) Check phone viewport HUD fit.
**Open** The ragdoll frame and phone layout are unchecked.

## Iteration 16
**Did** Added a `@media (max-width:700px)` block in index.html CSS: smaller `#tl`, `#grips`, `#help` (wraps), and `#tilt` moved to top:114px full width so the HUD no longer overlaps or cuts off on a phone.
**Saw** `look` at 390x800: before, 3 HUD overlaps and `#help` cut off by the edge; after, 0 cut off, `#tilt` moved below `#tl` (last look showed it still overlapping at top:78px; I changed to 114px and did not re-look). The phone camera frames only stairs and railing: the couch and characters are not in view (`subject` "couch" not in scene), a real fault in portrait.
**Next** 1) Widen the camera (fov or distance by aspect) in portrait so the couch and both characters show. 2) Re-look phone to confirm `#tilt` clears `#tl`. 3) Ragdoll frame after a tumble; instancing for the 234 draw calls.
**Open** Portrait camera framing unfixed; `#tilt` at 114px unverified.

### Judge 16

The `Surface` note is the full-screen riso halftone and grain post-pass. The brief asks for that look, and LOOK.md records it as intended. I scored it as a known item in my verdict, so it cost nothing. My verdict stands as written above.

SCORE: 7.6

## Iteration 17
**Did** Fixed portrait framing: the resize handler (index.html ~line 158) reset the ortho camera to `VH` while `VHcur` already held the wide value, so `updateCamera` never re-applied it. The handler now sets `VHcur = max(VH, 3.4/a)` and uses it. Moved `let VHcur` up beside `VH` (avoids a TDZ error from resize).
**Saw** `look` at 390x800: couch and the buddy are now in view at the stairs' foot; `#tilt` (111-179) clears `#tl` (7-108); 0 overlaps, 0 cut off; no never-visible objects. Surface note is the intended riso halftone. Subject "couch" still reported as not in scene (naming). Bottom third of the portrait canvas is empty paper/floor.
**Next** 1) Shift camTarget y up/down in portrait so less empty space under the floor. 2) Ragdoll frame after a tumble. 3) Instancing for the 234 draw calls.
**Open** Did not run `perf`; the couch is small at phone width; `window.__game.subject` still names an object not in scene.

### Judge 17

That `Surface` note is the full-screen riso halftone and grain post-pass. The brief asks for it, and LOOK.md records it as intended, so I scored it as a known item and it cost nothing. My verdict from the last turn stands as written.

SCORE: 7.8

## Iteration 18
**Did** `updateCamera` (index.html ~671): camera target y now rises by `(VHcur - VH) * .3` when the view is widened (portrait), so less empty floor shows under the couch. One-line change; not re-opened with `look`.
**Saw** No Judge Next list was in LATEST.md; used the iteration 17 Next list. No `look`/`perf` run this session, so no new numbers.
**Next** Check the 390x800 framing with `look` (the offset may crop the top); ragdoll frame after a tumble; instancing for the 234 draw calls; `window.__game.subject` naming.
**Open** The portrait offset factor .3 is unverified.

### Judge 18

**Judge 18.** I looked at a four-moment sheet (start, hold, 90 s, floor-4 setState), phone and desktop viewports, and `perf`. I did not run `interact` or `feel` and did not run `reference` against LOOK-board, so the Looks, characters and burst scores rest on the sheet alone. The sheet took 367 s on the software renderer.

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** The page starts playing on load. The solo AI buddy shows "Buddy: HOLDING" and "SOLO · buddy helps". Holding D then Space gave a tilt readout of 3° and a "WHOA! LOST GRIP!" burst. The 90 s moment reached "WIN! 0:48.5 · 4 crashes", so a full solo run is possible. I did not test the P2 keys or the 1/2/R switches.
2. **Rapier couch and 5-floor stairwell with switchbacks, railings, landings, doors 1A..5A; WIN at the floor-5 landing: 7.** The pink railings, yellow stair blocks, landings and doors "1A" and "4A" are all visible. The WIN banner shows with the couch on the upper landing. The `setState` `couchFloor: 4` test did not change the scene (the HUD still read FLOOR 1/5), so I could not confirm that the earlier WIN-on-floor-4 bug is fixed. The tight 180° turns hold up in the frames.
3. **Slide-back/tumble knocks players flat into ragdoll, they get up; tumble clip with a comic burst in the first minute: 6.** The 90 s frame shows debris and a pile on the lower landing, and the HUD counts "4 crashes", so crashes do happen. I did not see a ragdoll flatten frame, and I did not check that the crash falls inside the first 60 s. The start frame's "THUD!" burst fired at 0.3 s on the very first frame.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner, in printed type: 8.** The panels read "FLOOR 1/5", "0:00.3", "TILT 0°", the "P1/Buddy" chips and the key-hint strip. The WIN banner and the "Press R to haul it again" card are good.
5. **STYLE: risograph look as LOOK.md says: 8.** The five inks (teal, yellow, pink, cream, navy) read. The halftone and grain look good, the pink door gradients are halftoned, and the outlines are misregistered. I found no `Lighting:` or `Surfaces:` fault lines. The picture is close to LOOK-board. It is slightly pale at 90 s, with saturation at 29%.
6. **STYLE: orthographic side-on cutaway camera that follows floor by floor and never hides the stairs or the couch: 6.** Desktop framing is good. On phone, pillarboxed to about 135×280 px, the cutaway is tiny and the movers are barely readable. Iteration 18's offset `.3` is still unverified. At 90 s the top HUD overlaps the floor-5 landing region.
7. **STYLE: toy hoodie characters and puffy pink couch match CHARACTERS.md and the mover/couch sheets: 7.** The teal and yellow hoodie toys have chunky bodies and the couch is puffy. They are bigger than before. The start frame has them small against the stairwell, and they overlap the couch at the start.
8. **STYLE: comic impact bursts and a lamp glow per floor: 7.** The "THUD!" starburst and "WHOA! LOST GRIP!" are visible, and the lamps are drawn on the landings. I did not run `feel` on the ink-shake or the halftone dust puffs, so those are unchecked.
9. **`window.__game` describe/observe/act/setState; starts playing on load; one index.html + import map + vendor/, no build: 8.** `__game` describe answered with units and keys, and the page runs with no build. `look` reports "no subject", so `__game.subject` is still unnamed.

**Faults: 6.**
- There are no console errors and no fault lines.
- `perf` showed 126 ms a frame with 234 draw calls and 42k triangles. That is over budget, but this is a software renderer, so the frame time is not a fault. The draw count is the real cost, 77 ms of the 114 ms.
- The phone layout is badly pillarboxed.
- The `couchFloor` setState is not honoured, which makes testing harder.

**Next:**
1. Phone and narrow viewports: the canvas fills only about a third of the width. Make it fill the 390×844 viewport and widen the ortho frustum, so that the couch and movers are at least as big as on desktop and the camera fits the current flight. Check it with `look` `viewports: ["phone"]`; it should show the whole width used.
2. Prove the tumble within the first minute. Run `interact` for 3600 frames with the keys held. Trace `crashes`, `players[].ragdoll` and the couch y to show a real slide that flattens a player and then a get-up. Add a clear CRUNCH!/OOF! burst with an ink-shake at the flatten. Also make `setState` accept `couchFloor` (or give an `act` teleport per floor), so the floor-4 and win-gate check can run and a floor-4 frame can show no WIN banner.
3. Draw calls: 234 per frame, and the scene pass is two thirds of the frame time. Instance or merge the repeated stair, railing and halftone dots, and name the movers/couch so that `__game.subject` works. Check it with `perf` (draw calls well under 100, with the picture unchanged).

SCORE: 7.0

## Iteration 19
**Did** `updateCamera` portrait offset factor changed .3 → .7 (index.html ~672); `__game.setState` now accepts `couchFloor` as an alias of `floor` (1-based).
**Saw** `look` at 390x844: canvas fills the full width (the "pillarbox" in the judge's sheet was the sheet's viewport, not the page). Offset .3 left ~150 px of empty cream under the floor; -.35 made it far worse (the sign is right as positive); .7 shows floor 1 at the bottom with no empty strip, couch and mover readable. No perf/interact run. Surface note is still the riso post-pass.
**Next** Prove the tumble in the first minute with `interact` (crashes, ragdoll, get-up) and add an OOF!/CRUNCH! burst with ink-shake at the flatten; merge/instance stairs, rails and dots (234 draw calls); name the couch/movers so `__game.subject` resolves ("couch" is reported as not in the scene).
**Open** The `couchFloor` setState not re-tested on screen; the .7 offset not checked at other aspect ratios (e.g. tablet).

### Judge 19

The `Surface:` note is the full-screen riso halftone and grain post-pass. The brief asks for it ("halftone shading, grain"), so I scored it as intended in item 5 and did not count it as a fault. The next builder should keep it but check that the grain doesn't crawl while the couch moves. The grain pattern should stay fixed to the screen or the paper, not to the moving objects.

My verdict from the last reply stands. Its scores, evidence and three Next items are unchanged.

SCORE: 6.9

## Iteration 20
**Did** `ink()` (index.html ~170) now caches the plain-colour Lambert material per ink key, so the merge-by-material pass (`mergeGeos`, "merged" meshes) finally groups stairs, rails, dots, frames that used to each own a material.
**Saw** `perf`: 234 → 191 draw calls (scene pass 80.6 → 85.5 ms on software GL, noise), triangles 42k → 45k; `look` picture unchanged (riso look intact, no console errors). `look` still says `__game.subject` "couch" is not in the scene: the render target the tools see is the post-pass scene, the couch lives in the inner scene.
**Next** Prove the tumble with `interact` (crashes, ragdoll, get-up) and add the OOF!/CRUNCH! burst with ink-shake; cut the remaining 191 calls (per-door/lamp/window meshes with unique materials or MeshBasic are skipped by the merge; ~every item has its own mesh); make `subject` resolvable (put couch in the scene `look` sees or point subject at the post-pass quad's source).
**Open** No interact/feel run this session; tablet aspect of the .7 portrait offset and `couchFloor` setState still unchecked; the `Surface` noise note is the riso grain post-pass (intended).

### Judge 20

The `Surface` note is the full-screen riso halftone and grain post-pass, which the brief asks for ("halftone shading, grain"). I scored it as intended under item 5 and did not count it as a fault. I haven't changed my verdict.

The grain should stay fixed to the screen or paper rather than crawl with the moving couch. I didn't measure that this session, so the next builder should check it.

SCORE: 6.8
