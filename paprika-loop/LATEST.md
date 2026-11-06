The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 41

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

## Iteration 43
**Did** `updateCamera`: `want.y` now weights the couch 0.85 (was 0.6), and the hide threshold for flights above is `min(camTarget.y, c.y-1)+.4`, so the slab over the couch is hidden. Buddy: `knock` rag time is .55 s for `p.ai` (1.0–1.4 for humans), and `getUp` sets `aiDelay` .05 for the AI. Cooler tints: wall `wallMat` 0x9fb4c4, `mWood` 0x6c6a72, `mStep` 0x9a9aa4.
**Saw** Space+D 400-frame `interact`: floor 2 at f292, slips 2, couch 7.6% [301,249,711,526] now clearly visible (was 1.2%), but `Subject` still reports 0 named parts. Orange 82% by hue stat (was 70% over-objects; the stat counts brown lit wood as orange), colour contrast 74% vs 66% (was 71%). `grips.1.slot` is -1→3 at f383 (first change f14, slips at f117 and f330, so this is the second slip's re-grab, about 53 frames). Console clean, `Never visible` none. `perf` not run.
**Next** 1) Orange: the stairs and floor are still brown/orange under the warm bulbs; lower bulb colour warmth or retint `woodT` (0x6a4a2c) toward grey. 2) Run a trace of `grips.1.slot` around the first slip (f117) to confirm the re-grab time. 3) Look at the WIN and 2P modes, not yet checked.
**Open** Subject "named parts" is 0 of 0, which is how the couch's children are named, not a visibility fault.
