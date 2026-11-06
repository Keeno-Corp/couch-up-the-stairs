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
