The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 52
**Did** Added `clipTop` (THREE.Plane, normal -y) to every `merged` material (cloned, `clippingPlanes`) and `renderer.localClippingEnabled`; `updateCamera` sets `clipTop.constant = camTarget.y + 1.2`, so geometry more than 1.2 m above the camera target is cut and the flight above no longer hangs over the couch.
**Saw** Space+D 240 frames: couch edge contrast 0.215 (was 0.18), the overhang is gone, hues grey 47% / orange 43%. `merged` still reports 68% (its bbox spans the frame). `players.1.state` is "rag" at frames 117–166 (Buddy only); P1 never falls. Console clean. The cut leaves one flat brown slab edge and thin sliver treads at the clip line. Not checked: WIN frame, 2P, slip dust, `perf`.
**Next** 1) Hide the clipped flight's cut edge, e.g. fade with a clip plane that follows the flight's floor height, or lighten the treads. 2) Move the z=-1.60 `stairwell` box 0.001 off the `merged` face and replace the round `sparks` with quads; move the WIN banner to the top third. 3) Make the couch knock P1 over at the slip; test 2P (key 2, Space + Enter).
**Open** The z=-1.60 `Surfaces:` fault, the round confetti and the 2P test are all untouched. `clipTop` cuts the upper floors' ceilings too, so check floor 5 and the WIN view.

### Judge 52

**Judge 52 verdict.** I did not run 2P, and I did not check the slip dust.

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** Space+D for 240 frames gives `grips` P1 slot 0 and Buddy slot 1, `timer` 3.73, couch travel 5.68. `slips` went 0→1, and `players.1.state` is "rag" from frame 117 to 166, then "stand". `tilt` peaked at 31° at frame 224. The sounds are grunt, oof and grunt. P1 never falls.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 6.** Doors 1A and the rails show. The f3 look shows the landing, the couch and both players, and the WIN look shows the banner. In the Space+D look `merged` still reads as 68% of the frame. The `clipTop` cut leaves one long brown slab edge across the middle of the frame, with thin sliver treads above it. The z=-1.60 fault was not re-checked here, and I did not confirm it is fixed.
3. **Slide-back/tumble ragdoll, get up: 7.** Buddy goes `rag` for frames 117–166 and then stands up. The first-minute clip rests on Buddy alone. P1 is never knocked over, and I did not see the dust.
4. **HUD: 7.** There are 0 overlaps and 0 cut off for `div#tl`, `div#tilt`, `div#grips` and `div#help`. In the WIN look "WIN!" sits over the couch and Buddy, and the timer reads 0:00.0 after the teleport.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** The couch stands out at brightness 55% against 41%, with edge contrast 0.2, up from 0.18. The red P1 and green Buddy read clearly. Hues are grey 47% and orange 43%. The cut `merged` slab, the washed-out `backWall` and the translucent grey panels over the landings keep it a first draft.
6. **`window.__game` and one index.html: 8.** The page starts playing on load and is a single index.html with no build. I did not re-test `describe`, `act` or `setState` in this session. The `{floor:N}` `state` steps worked.
7. **Faults: 6.** The console is clean and `Never visible` is none. `perf` gives 84.6 ms with 116 draw calls and 20.5k triangles on SwiftShader (host load 2.1), so the frame time is no signal. The cut slab edge is an artifact of `clipTop`. The WIN `sparks` were not checked.

**Next:**
1. **Hide the clipped flight's cut edge (asked again).** Right now `clipTop` slices through `merged` at `camTarget.y+1.2` and leaves a flat brown slab edge across the frame. Clip at the floor height of the flight above, so whole flights vanish, or fade those materials with opacity. Also lighten the tread colour and darken the riser edge. Check: repeat the Space+D 240-frame `interact` with `look: true`. No horizontal brown slab edge should cross the frame, and `merged` should be under 35%.
2. **Clean up the WIN frame, and the z=-1.60 face plane (asked again).** Move the WIN banner to the top third. Replace the round `sparks` blobs with small coloured falling quads. Move the `stairwell` box 0.001 off z=-1.60. Check: `look` `sheet` with `{floor:5}, frames:60` shows the couch and both players clear of the text, the confetti coloured, and no `Surfaces:` line.
3. **Make the tumble clip reliable and funnier, and test 2P (asked again).** Add a beige dust or star puff at the slip, and make the sliding couch knock P1 over too. Check: Space+D `interact` with `trace:["players.0.state","players.1.state"]` shows `rag` on P1 as well. Then run key `2`, hold Space and Enter, and confirm both `grips` and that the arrow keys move the couch.

SCORE: 6.7
