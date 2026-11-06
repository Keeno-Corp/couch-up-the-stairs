**Judge 41 verdict**

1. Plays as DESIGN.md's Core loop and Controls say: 7. In the Space+D 400-frame `interact`, `floor` goes 1→2 at 6.4 s with `slips` 1. Both `grips` hold (P1 slot 0, Buddy slot 2). The sounds are grunt, oof and grunt. Buddy's re-grab is slow: `grips.1.slot` goes -1→2 at f373. I did not play 2P.
2. Rapier couch and 5-floor stairwell, doors 1A.., WIN: 6. The 1A door is blue and readable, and the `stairwell` has handrails and landings. At floor 2 the flight above covers the view, so the switchback can't be read. I did not reach the WIN.
3. Slide-back/tumble ragdoll, get up: 6. One slip happened and both players are back to `stand`. Because the camera is occluded I could not see the tumble clip itself.
4. HUD: 9. `div#tl` shows Floor 2/5 and 0:06.4, `div#tilt` is the tilt meter, `div#grips` shows HOLDING, and none overlap. I did not see the WIN banner.
5. Looks as LOOK.md says, characters match CHARACTERS.md: 5. Orange is 88% at frame 0 and over-objects orange is 71% at floor 2. Textures on the underside of the `stairwell` flight look streaky. The red and green `player*` hoods read well.
6. `window.__game` and one index.html: 8. `describe` and `observe` work and the page starts playing on load.
7. Faults: 5. Console is clean, no z-fighting `Surfaces:` lines, and `Never visible` is none. The `couch` is 1.4% of the frame at floor 2, hidden behind the flight above, so the camera still fails. `perf` is 119 ms a frame, but that is a software renderer, so it is not counted as a fault. It has 114 draw calls and 26k triangles.

**Next:**
1. **(asked again)** Fix the camera occlusion. Raise or pull back the camera, or fade the `stairwell` flight above when it sits between the camera and the `couch`. Check: after the same Space+D 400-frame `interact`, `look` shows `couch` over 5% and the `Subject` line has named parts.
2. **(asked again)** Cut Buddy's re-grab to under 90 frames after the slip. Check: `interact` with `trace: ["grips.1.slot"]` shows -1→2 by about f300 or earlier, not f373.
3. **(asked again)** Cut the orange to under 55% over-objects. Give the walls, floor and `backWall` a cooler or neutral palette so the `couch` pops. Check: `look` shows over-objects orange below 55%, and the `Stands out` colour contrast rises.

SCORE: 6.6
