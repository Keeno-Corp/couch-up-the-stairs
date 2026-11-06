The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 1
**Did** Found an existing riso build (index.html, rapier, `printMat` post pass), so changed it instead of rewriting. `VH` 5.2 → 4.4 and `updateCamera` spread factor .25 → .3 (min half-width 5.0/aspect) so `couch` and the hoodie characters fill more of the frame; the shaft still fits with paper margins.
**Saw** Solo unattended 60 s: floor 4 reached, slips 3, thuds 8, crashes 3, first slip ~frame 284 (tumble + WHOOPS!/CRUNCH! bursts fire). Opening look and `{floor:5}` WIN look read as five-ink riso, no console errors, no Never visible. WIN only fires at couch y>16.9 (floor-5 landing); not seen while on floor 4. With P1 idle (no input) the couch stalls on the floor-4→5 flight at ~14.6 m (buddy alone cannot finish) and P1 trails ~1.3–3 m below, partly cropped at the bottom. At zoom 4.4 the start frame crops the stairs top slightly. Not run: perf, 2P.
**Next** 1) Camera: keep P1 in shot when it lags (weight P1 more, widen via spread). 2) Buddy lift when P1 idle so the couch finishes the last flight. 3) Compare with `reference` vs refs/sheets/LOOK-board.png; make couch/characters bigger (scale models ~1.2) if still small. 4) Test 2P with arrows+Enter, `feel` on tumble shake.
**Open** Idle-P1 stall near floor 4/5; 2P untested this session.

### Judge 1

That `Surface:` note was already in my verdict. I listed it under item 5 and under Faults. It comes from the full-screen post-pass mesh, whose halftone and grain the brief asks for, so I left the verdict unchanged.

The next builder can check whether the shimmer is a fault by looking at the fine detail while the camera moves. If it flickers between frames, they should fix it by fading the grain with distance or keeping the halftone cell fixed to the screen.

SCORE: 7.3
