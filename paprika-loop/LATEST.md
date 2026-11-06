The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

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
