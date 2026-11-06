The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 55
**Did** `backWall` colour set to 0xa89478 (warmer plaster). At the slip, a standing P1 holding a slot is now `knock`ed into `rag` with a beige `sparks` puff at P1. WIN now calls `spawnConfetti()` (90 red/green/yellow/blue rotating `PlaneGeometry` quads, 3 s, updated by `updConfetti`) and `sparks` count cut to 60.
**Saw** Space+D 240 frames: trace shows players.0.state `rag` frames 117–193 and Buddy `rag` 117–166, both back to stand. Look: saturation 42%, couch stands out 71% vs 42%, no console error, `Never visible` none, HUD 0 overlaps. WIN sheet at {floor:5}, 60 frames: coloured confetti visible over the couch. The translucent `mRailNear` rails (opacity .18) still read as a glass band across the landing; not touched.
**Next** 1) Make `mRailNear` thinner/more transparent or hide it when it crosses the couch (grey glass band). 2) Check floor-boundary pop-out of `merged` chunks. 3) Brick patch/wall scribbles look pasted on; blend or reduce them.
**Open** Confetti uses MeshBasicMaterial per quad (90 materials for 3 s); fine but could share. perf not run.

### Judge 55

**Judge 55 verdict.** I played solo Space+D for 240 frames, took the f3 and WIN sheet looks, and ran `perf` once. I did not play 2P, and I did not check the floor-boundary pop-out of `merged`.

1. **Plays as DESIGN.md's Core loop and Controls say: 8.** The `grips` are P1 slot 1 and Buddy slot 0. Both stay on the couch, `slips` is 1 at frame 117, and `tilt` peaks at 36.8°. The sounds fire (grunt, yelp, oof).
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 7.** Door 1A, the 2A and 4A doors, the rails and the landing all show. The translucent `mRailNear` rails still read as a grey glass band across the landing and over the couch and P1. In the f3 and WIN looks the stairs are cropped at the right edge.
3. **Slide-back/tumble ragdoll, get up: 8.** At frame 117 `players.0.state` goes to `rag` until frame 198, and Buddy goes `rag` until frame 166. Both then return to `stand`. I did not check whether the puff at the slip is visible.
4. **HUD: 8.** `div#tl`, `div#tilt`, `div#grips` and `div#help` show 0 overlaps and 0 cut off. The WIN banner shows "WIN!", "0 crashes" and "Press R to haul it again". `div#tl` reads 0:00.0 in the WIN sheet, but that is a `setState` jump.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 7.** The couch stands out on colour, 71% against 37%, but brightness is only 52% against 51%. The red P1 and green Buddy read clearly. `backWall` is warmer now, with saturation at 40%. The brick patch and the wall scribble shapes still look pasted on. The glass rails make the picture muddy.
6. **`window.__game` and one index.html: 8.** The page starts playing on load, and `setState` with `{floor:N}` worked in both sheet moments.
7. **Faults: 7.** There are no console errors and `Never visible` is none. `perf` gives 97 ms, 125 draw calls and 21.7k triangles on SwiftShader (host load 3.3), so the frame time is no signal. The confetti shows as coloured quads in the WIN sheet.

**Next:**
1. **Fix the `mRailNear` glass band.** Make the near rails opaque but thin, or fade them out only where they cover the couch or players. Check: the Space+D `look` shows no grey translucent band across the couch and P1, with `sample` at the pixels over the couch's lower edge matching the couch's orange.
2. **Blend the pasted-on wall decor.** Reduce the brick patch and scribble decals, and give them a plaster-coloured edge or a darker multiply tint. Check: the f3 sheet look shows the brick patch sitting in the wall without a hard outline.
3. **Raise the couch's brightness contrast and fix the right-edge crop.** Make the couch lighter than the wall, or add a subtle rim light on it. Shift the camera x toward the stairs on f3–5 so the flight isn't cropped. Check: the `look` line "Stands out" shows brightness at least 10 points apart, and the f3 sheet shows the full flight.

SCORE: 7.6
