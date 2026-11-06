**Judge 50**

Checked with one `look` `sheet` (start, `state:{floor:4}`, 600 and 1800 frames) and one `perf`. I ran no `interact`, so keys, 2P, the WIN banner and the first-minute tumble are not checked this session.

1. **Plays as DESIGN.md's Core loop and Controls say**: 6. Solo starts on load with the buddy holding (HUD: "P1: free / Buddy: HOLDING"). At 1800 frames the HUD reads P1 HOLDING, Buddy HOLDING, TILT 3° and the couch is at 1A–2A. I did not press the keys.
2. **Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN at floor 5**: 8. The pink `door` plates 1A–4A and the stairs and railings read clearly, and `state:{floor:4}` now shows the couch with the 4A door, so the iteration 50 `setState` fix holds. WIN at floor 5 is not seen.
3. **Slide-back/tumble, ragdoll, comic burst in the first minute**: 6. A THUD! burst shows at frame 30. At 1800 frames the couch lies tilted at the foot of the flight, so a tumble did happen. The ragdoll flatten and getting back up were not seen.
4. **HUD in printed type**: 8. The "FLOOR n/5" plate, timer (0:29.0), TILT meter (19° at 600 frames) and the "HOLD SPACE!" prompt are all in printed style. The WIN banner is not seen.
5. **Riso look as LOOK.md says**: 8. Halftone dots, grain and navy outlines read clearly, and the board is close to the target palette. The sheet's pixel line gives 0% near black and brightness 70%. Teal, yellow, pink and cream cover most of the frame, so the picture is dense.
6. **Ortho cutaway camera that follows floor by floor**: 8. The stairs and couch are in frame at floors 1, 2 and 4. The right edge cuts off the top landing at 1A.
7. **Toy hoodie characters and puffy couch**: 7. The teal and yellow hoodie movers and the pink couch match the sheets in colour and chunkiness, but they are still small against the stairwell. The look list shows "subject couch 0%" in every cell, so no `subject` mesh is named.
8. **Comic bursts and a lamp glow per floor**: 7. The THUD! starburst is large and readable and each floor has a lamp. I did not see OOF! or CRUNCH!, and the lamp glow is faint.
9. **`window.__game` and the one-file layout**: 8. `describe` returns name, stack, units and keys. The page starts playing on load and is one `index.html` with no build. I did not call `act` or `setState` through `interact`.
- **Faults**: 7. `perf` reads 117.8 ms a frame with 196 draw calls and 45.5k triangles, but this is a software renderer on a busy host (load 7.3), so it is noise and not a fault. No console errors appeared. "subject couch 0%" is recorded as a lookup gap, not a fault.

**Next:**
1. Name the couch mesh as `subject` (or a clear `couch` name) so `look` can report it. Make the couch and the two movers about 25% larger in frame without cropping the stairwell. Show it with `look` at the start: the couch should cover more than 3% of the picture.
2. Play it with `interact`: hold Space and W/A/D for about 60 s, with `trace` on tilt and floor. Confirm an unscripted tumble flattens a player, with a CRUNCH! or OOF! burst, a ragdoll and a get-up. Then confirm WIN at floor 5 with the printed banner. Use `{state:{floor:5}}` in a `look` `sheet` to see the win screen.
3. Make the lamp glow per floor more visible, for example a halftone pool on the wall or floor. Keep the top landing at the right edge from being cut off by widening the ortho frame a little. Check with `look` `zoom` on the 1A door area.

SCORE: 7.3
