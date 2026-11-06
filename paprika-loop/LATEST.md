The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 40

Item 5 of the brief asks for halftone shading and grain, so the detail that note flags is requested. The `Surface: "BufferGeometry"` mesh is the full-screen riso post-pass, so I'm not softening it, and it doesn't count as a fault. My verdict stands.

**Judge 40**

1. **Plays as DESIGN.md says: 7.** I ran 1800 frames of solo play with `interact`. `timer` reached 29.07 s, `grips` held P1 and Buddy, and the run logged `thuds:1` and `slips:3`. The sounds were grunt, oof, yelp and couchThud. I did not test local 2P.
2. **Rapier couch and 5-floor stairwell: 8.** The switchbacks, pink railings, landings and doors 1A and 2A render. I did not reach the floor-5 WIN landing.
3. **Slide-back, tumble and ragdoll with a comic burst: 6.** The THUD! burst appeared in the `sheet` frame at 0:00.3. I saw no player flat in ragdoll and no CRUNCH! in a picture.
4. **HUD: 8.** `div#tl` shows "FLOOR 1/5" and the timer, `div#tilt` shows "TILT 3°", and `div#grips` and `div#help` are present. None overlap or cut off. I did not see the WIN banner. The floor-4 `sheet` frame showed no WIN, so that fix looks to hold.
5. **Riso look as LOOK.md says: 8.** The five inks, halftone dots, grain and navy outlines all show. I did not confirm that the grain stays fixed on screen.
6. **Orthographic cutaway camera: 6.** The start frame is well framed. In the `interact` frame the couch is mostly off-screen, a pink sliver at the bottom edge. The floor-4 `sheet` frame zoomed out to about 3 floors with a tiny couch.
7. **Toy hoodie characters and puffy couch: 7.** The teal and yellow hoodies read chunky, and the couch is tufted pink, but it is cut off in play.
8. **Comic bursts and a lamp glow per floor: 7.** THUD! is in the riso style and lamps are on each floor. I saw no OOF! or CRUNCH! burst in a picture.
9. **`window.__game` and one `index.html` with vendor: 7.** describe, observe and act work, and the game starts on load. `look target:'couch'` fails with "no object named couch in the main scene", so the Iteration 40 `subject` change did not work.

**Faults: 6.** There are no console errors. The `subject` failure is a real fault. `perf` read 131.6 ms a frame, but on a SwiftShader software renderer, so that is not a fault.

**Next:**
1. **Camera framing.** Make the camera follow `couch.pos.y` and keep the couch in the central 60% of the view. Clamp the zoom so it never shows 3 floors. Check with an `interact` of 1800 frames with `look: true`; the couch should be fully visible with both players.
2. **`subject` resolution.** Set `couch.name='couch'` on the Group and keep `__game.subject` pointing at it. If `look target:'couch'` still fails, name a mesh `couch` and point `subject` at that.
3. **A forced tumble with a ragdoll and a CRUNCH! burst.** Use `act` to drop the grips at the top of flight 1, then run a `look` sheet of 3 frames over 120 frames. It should show a player flat in ragdoll under the sliding couch with CRUNCH! visible. Add an OOF! burst on the flattening.

SCORE: 7.0

## Iteration 41
**Did** In `updateCamera` (index.html): `want.y` clamped to couch.y ± `VHcur*.3`, and spread-driven zoom capped (`Math.min(spread, 3)`) so the view never widens to ~3 floors. `couch.name='couch'` and `__game.subject=couch` were already in place.
**Saw** 1800-frame solo play with `interact look:true`: reached floor 5, `won:true`, timer 29.1, couch + both hoodies fully visible in the middle of the frame, WIN banner and "3 crashes" card show, no overlap in HUD, no console errors. `look` says "Subject: couch drew no pixel" (probably it reads the Group, not a mesh, or couch is hidden on win). Not run: `perf`, `look target:'couch'`, portrait.
**Next** Name a child mesh `couch` / check why look sees the subject as 0 px; forced-tumble sheet (drop grips at top of flight 1) to show ragdoll + CRUNCH!/OOF! bursts; verify grain is screen-fixed; portrait framing.
**Open** Subject still unresolved by look; clamp not tested during a mid-flight tumble.
