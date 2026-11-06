The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 54
**Did** `merged` is now split per material per floor (`userData.fl` = floor(y/H)); each frame a chunk is `visible` only if `fl*H <= camTarget.y+.5`. `clipTop.constant` = 999 (no clip, so no slab edge).
**Saw** Space+D 240 frames look: the brown slab edge is gone, but with +1.2 the flight above (floor 1 at y 4.2, cam y~3) still showed (`merged` 48%); I changed the threshold to +.5 and did not re-look. No console error. Not done: dust puff, P1 knock-over, confetti quads, backWall colour.
**Next** 1) Re-look at the Space+D frame to check `merged` under 35% and no stair floating mid-air at floor changes. 2) Confetti quads for WIN. 3) P1 into `rag` from the sliding couch, dust at slip.
**Open** The +.5 threshold is unchecked: a flight the couch is climbing may pop out near a floor boundary.
**Update (end of 54)** Re-looked at the +.5 version: `merged` 34%, no slab edge, flight above hidden, HUD clean. Floor-boundary pop-out still unchecked.

### Judge 54

**Judge 54 verdict.** I played solo Space+D for 240 frames and took the f3, f4 and WIN sheet looks and one `perf` run. I did not play 2P this session, and I did not check the floor-boundary pop-out.

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** The `grips` are P1 slot 0 and Buddy slot 1, `timer` is 3.75 and the couch travelled 5.68. `slips` is 1 and `tilt` peaks at 31°. P1 is `stand` throughout, so only Buddy ever gets knocked over.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 7.** The `merged` slab edge is gone and the flight above the camera is hidden, so `merged` is down to 34%. Doors 1A to 4A, the rails and the landing all show. Translucent grey panels still sit over the landing and the `stairwell` treads. From above on f3–WIN the stairs are cropped to the right edge.
3. **Slide-back/tumble ragdoll, get up: 7.** Buddy goes `rag` for frames 117–166 and then stands up. There is no visible dust at the slip, and P1 is not involved.
4. **HUD: 8.** `div#tl`, `div#tilt`, `div#grips` and `div#help` show 0 overlaps and 0 cut off. The `WIN!` banner shows at the top of the sheet look.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** The couch stands out at brightness 57% against 46%, with colour 67% against 27% and edge contrast 0.17. The red P1 and green Buddy read clearly. `backWall` is still pale and washed out. The brick patch and the wall scribble shapes look pasted on, and the glass-like panels make the picture muddy.
6. **`window.__game` and one index.html: 8.** The page starts playing on load, is a single index.html with no build, and `setState` with `{floor:N}` worked in all three sheet moments.
7. **Faults: 6.** There are no console errors and `Never visible` is none. `perf` gives 96 ms, 125 draw calls and 21.7k triangles on SwiftShader (host load 3.9), so the frame time is no signal. The WIN `sparks` are still faint round blobs. The couch has `up` y 0.99, but P1 is never in `rag`.

**Next:**
1. **Knock P1 over too, and add dust at the slip (asked again, third time).** When the couch slides back past a player, set that player to `rag` with an impulse from the couch's velocity, and spawn a beige `burst` at the slip. Check: the Space+D `interact` with `trace:["players.0.state","players.1.state"]` shows `rag` on P1 as well as Buddy.
2. **Replace the round WIN `sparks` with coloured falling quads (asked again).** Use small rotating red, green and yellow quads for the confetti. Check: the `look` sheet with `{floor:5}, frames:60` shows coloured confetti against the wall.
3. **Fix `backWall` and the grey panels.** Give `backWall` a darker, more saturated plaster colour, and remove or make opaque the translucent grey panels over the landings. Check: the Space+D `look` shows `backWall` pixels with more saturation than 22%, and no glass-like band under the rail at the bottom.

SCORE: 7.0
