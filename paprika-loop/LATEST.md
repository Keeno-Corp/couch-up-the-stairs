The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 59

Ragdolls happen at frame 117 when playing with grip. Good enough.

**Judge 59**

I took one 500-frame `interact` with D held and no Space, one 900-frame `interact` with Space and D held, and a `sheet` of f3 and f5. I did not run `perf` or play 2P. Judge 57's evidence is the only evidence for 2P.

1. **Plays as DESIGN.md's Core loop and Controls say: 8.** With Space and D held, `floor` went 1 to 2 at frame 370. Both `players.*.state` values showed `rag` at frames 117 to 198 and again at 408 to 506, then `stand`. `slips` reached 2 and `thuds` 3. Without Space, P1 stays at `gripping:false`, and the buddy holds the couch alone. The couch stops at frame 369 with tilt around 10°, and nothing tumbles.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 7.** Door 2A, the rails and `stairwell` read. The f5 WIN banner shows, but the couch is not in frame (subject 0%). The f5 landing is a dark slab, and door 3A sits under it. The f3 and f5 rails are still cut off at the right edge.
3. **Slide-back/tumble ragdoll, get up: 8.** Both players went `rag` at frame 117, which is inside the first 2 seconds. Each got back to `stand` (the buddy at 166, P1 at 198), and they went down again at 408. The sounds `oof` and `yelp` fired. It only happens when P1 grips. The dust puffs were not seen in a picture this session.
4. **HUD: 8.** `div#tl` (Floor 1/5 and the timer), `div#tilt`, `div#grips` and `div#help` show with 0 overlap and 0 cut off. The WIN banner shows on f5.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 7.** The couch stands out: 8.8% of the frame, brightness 54% against 38% around it, colour 69% against 27%. The red and green hooded players match CHARACTERS.md. The f3 wall decals are now soft smudges, with no hard orange shapes. The f3 and f5 framing is dark, and the f5 landing slab is heavy and flat.
6. **`window.__game` and one index.html: 8.** The state is clean, the page starts on load, and there is no build.
7. **Faults: 7.** There are no console errors and no `Lighting:` or `Surfaces:` lines. The f3 and f5 right-edge crop is still open. I did not run `perf`, and earlier readings on SwiftShader are not usable.

**Next:**
1. **Fix the f3–f5 camera framing (asked again).** The rail is cut at the right edge, the f5 couch is out of frame, and the landing slab is dark. Move the per-floor camera position and `lookAt` (~line 584) so the stairs and rail fit. Lighten the landing slab material. Check: `look` `sheet` of `{floor:3}` and `{floor:5}` shows the full rail and the couch in frame on f5.
2. **Make the solo no-input case show a tumble.** With no Space held, nothing happens for 500 frames, so a viewer who does not grab sees no clip. Have the buddy slip at the first turn (timer above 4.5 s) even when P1 is not gripping, or show a prompt to hold Space. Check: `interact` with D held for 500 frames and no Space, with `trace` on `players.1.state`, shows `rag`.
3. **Show the dust and shake in a picture.** `look` right after the frame-117 knock, using `sheet` with `steps` that hold Space and D for 117 frames, then check that tan puffs are on screen. Make the puffs and shake last for at least 0.5 s. Then add a landing slab detail for the f5 win, such as confetti or the couch settling in the frame.

SCORE: 7.6

## Iteration 60
**Did** `mWood` tint 0x6c6a72 -> 0xb8a890 (landing slabs lighter, line 103); `camOff.x` .8 -> .3 and camera x clamp 6.2 -> 5.4 in `updateCamera`.
**Saw** `look` sheet {floor:3},{floor:5}: slab brightness f3 57->59%, f5 37->40%; slab visibly lighter. Rail at the right edge is still cut. The sheet's teleport puts the couch out of frame, so "couch in frame on f5" is unchecked. No Lighting/Surfaces lines. No `perf`, no dust or slip play this session.
**Next** 1) Play to f5 for real and check the couch/rail framing, since the sheet state shows no couch. 2) Check that the solo no-grip slip fires: the slip needs `started` (set only on a grip, line 391), so make it fire at timer > 4.5 even when not started. 3) `look` right after the frame-117 knock to check the dust puffs.
**Open** Rail crop and the no-input tumble are unfixed. Slab is still flat, with no confetti/detail.
