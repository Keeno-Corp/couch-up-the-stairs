**Judge 43 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** In the Space+D 400-frame `interact`, `floor` goes 1→2 at f294 and `slips` reaches 2, with a "WHOOPS! BUDDY SLIPPED!" `div#toast`. P1 and Buddy both hold (slots 0 and 3), and the sounds are grunt, yelp and couchThud. Buddy's `grips.1.slot` goes -1→3 at f385, and the first slip was at f117, so the re-grab is slow. I did not play 2P.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 6.** Door 2A and a door at the lower right are readable, and the stairs have a handrail, a plant and a rug. The floor-2 picture is dark and muddy, and the switchback is hard to read. I did not reach the WIN.
3. **Slide-back/tumble ragdoll, get up: 6.** `slips` 2 happened and both players are back to `stand`. In the floor-2 look, `player*` is 0.023% of the frame, so a viewer cannot see anyone being knocked over. The tumble clip is not readable.
4. **HUD: 9.** `div#tl` shows Floor 2/5 and 0:06.1, `div#tilt` shows TILT 35°, `div#grips` shows HOLDING for both, and `div#toast` is readable. Nothing overlaps. I did not see the WIN banner.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.** Orange is 82% over-objects, still well above the 55% target. Subject colour contrast is 75% against 67%, and the stairs and floor are brown with streaky texture. Frame 0 is poorly framed: the `couch` is cut off by the left edge, a green `player` covers it, and the upper half is empty dark. The `backWall` is hidden at frame 0.
6. **`window.__game` and one index.html: 8.** `describe` and `observe` work and the game starts playing on load.
7. **Faults: 6.** The console is clean, `Never visible` is none and there are no `Surfaces:` lines. The `couch` is 7.4% at floor 2 and clear of occlusion. `perf` is 71 ms a frame, but that is a software renderer, so it is not counted as a fault. It has 92 draw calls and 17k triangles. The frame-0 framing is a fault.

**Next:**
1. **Fix the frame-0 and early-game camera.** At frame 0 the `couch` is cut off at the left edge and a `player` covers it. Frame `couch` and both players together: centre `camTarget` on the midpoint of the couch and the players, and pull back until all three fit. Check: `look` at frame 0 shows the `Subject` box inside [0..1280] with no cut-by-edge note, `couch` at 8–15%, and `player*` visible beside it.
2. **Cut the orange to under 55%, and make the tumble readable.** Retint `woodT` (0x6a4a2c) and the floor toward neutral grey-blue, and cool the warm bulb. Make the camera pull back or zoom on the knocked player during a slip. Check: the same Space+D 400-frame `interact` with `look`. Orange should read below 55% over-objects, and `player*` should be over 1% at the moment of the slip with a visible ragdoll.
3. **Cut Buddy's re-grab to under 90 frames.** Use `interact` with `trace: ["grips.1.slot"]` and compare the slip frame f117 with the re-grab. Buddy is back at slot -1→3 at f385, which is 50–70 frames after the second slip but far too late after the first. Then check the WIN and 2P modes: `setState` to floor 5 and `look` for the WIN banner, and a 2P `interact` with arrows and Enter.

SCORE: 6.7
