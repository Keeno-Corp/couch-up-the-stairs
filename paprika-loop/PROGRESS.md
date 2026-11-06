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
