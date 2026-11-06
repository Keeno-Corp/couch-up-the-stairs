# Progress

The request is in PROMPT.md. Each session of the loop appends one section here: a builder's `## Iteration n` (Did, Saw, Next, Open) and the judge's `### Judge n` (its scores, Next). LATEST.md holds the last of each, rewritten by the loop after every session; the next builder reads the latest Judge's Next there first.

## Iteration 1
**Did** Found an existing riso build (index.html, rapier, `printMat` post pass), so changed it instead of rewriting. `VH` 5.2 → 4.4 and `updateCamera` spread factor .25 → .3 (min half-width 5.0/aspect) so `couch` and the hoodie characters fill more of the frame; the shaft still fits with paper margins.
**Saw** Solo unattended 60 s: floor 4 reached, slips 3, thuds 8, crashes 3, first slip ~frame 284 (tumble + WHOOPS!/CRUNCH! bursts fire). Opening look and `{floor:5}` WIN look read as five-ink riso, no console errors, no Never visible. WIN only fires at couch y>16.9 (floor-5 landing); not seen while on floor 4. With P1 idle (no input) the couch stalls on the floor-4→5 flight at ~14.6 m (buddy alone cannot finish) and P1 trails ~1.3–3 m below, partly cropped at the bottom. At zoom 4.4 the start frame crops the stairs top slightly. Not run: perf, 2P.
**Next** 1) Camera: keep P1 in shot when it lags (weight P1 more, widen via spread). 2) Buddy lift when P1 idle so the couch finishes the last flight. 3) Compare with `reference` vs refs/sheets/LOOK-board.png; make couch/characters bigger (scale models ~1.2) if still small. 4) Test 2P with arrows+Enter, `feel` on tumble shake.
**Open** Idle-P1 stall near floor 4/5; 2P untested this session.
