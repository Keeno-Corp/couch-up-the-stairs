**Judge 10**

Scores for the Must have list:

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** The page starts playing on load. In the sheet, solo play ran from `FLOOR 1/5` at 0:00.0 to `FLOOR 5/5 · HOME!` and the WIN banner at 0:48.5, with the buddy helping ("HOLDING" chips for both players). I did not run `interact` on 1/2/R, and the 2P path has still never been played.
2. **Rapier couch and 5-floor stairwell: 7.** The switchbacks, railings, doors 1A, 2A and so on, and landings are all visible. WIN appeared only once the couch was on floor 5, so the floor-4 WIN bug looks fixed.
3. **Tumble, ragdoll and burst: 6.** The WIN card says "4 crashes", so tumbles happen within one solo run. I did not catch a burst on screen in the three sampled moments, and the slip frequency is untuned.
4. **HUD: 8.** The printed type is clear: `FLOOR n/5`, the timer, the `TILT 0°` meter, the WIN banner with time and crashes, and a "Press R to haul it again" line.
5. **Riso style: 7.** The look has five inks, halftone, a mustard/teal/pink palette and navy outlines, and it is close to LOOK-board. The post-pass quad shows a high detail value, which is expected for the halftone. The misregistration is subtle.
6. **Orthographic camera: 7.** It is side-on and follows floor by floor, and the stairs and couch stay in view. On floor 5 the couch sits low behind the WIN card, partly crowded by the HUD.
7. **Toy characters and couch: 6.** The pink couch and the green hoodie characters read, but they are still small against the cutaway. The brief asked for chunkier toys.
8. **Comic bursts and a lamp glow per floor: 6.** The lamps with halos are on every floor. I did not see THUD! or OOF! in the sampled frames.
9. **`window.__game`, no build: 8.** `describe` returned the name, units and keys, and the project is a single `index.html` with vendor files.

**Faults: 7.** There were no console errors. `perf` read 112 ms a frame on SwiftShader on a busy host (load 7.1), so it is noise, not a fault. It shows 246 draw calls and 42.8k triangles, and instancing is only worth doing if a real GPU struggles.

Nothing on screen needs a library asset search: the brief fixes the asset style as code-built toy shapes, and library models were rejected.

**Next:**
1. Make the movers and couch about 1.4× larger in frame, as the brief asks, and keep the whole cutaway visible. Scale the player and couch meshes and trim the camera frustum a little. Check it with `look` zoomed on the floor-1 start: the couch should span roughly 20% of the frame width.
2. Smooth the grip heading and cut slips above 30° tilt (`slipT` and `headLag` in the player object, around index.html:394 and 557). That was Next in the last iteration and is still undone (asked again). Then play 2P with `interact` (`{key:"Digit2"}`, P1 WASD and Space, P2 arrows and Enter). It should show both players moving and holding. Add a `trace` of `tilt`.
3. Make the comic bursts and juice unmissable. Use `feel` on a forced tumble and check that THUD!, OOF! or CRUNCH! shows large for at least 0.5 s with an ink shake and halftone dust puffs. Use `look` with `sheet` on the frames right after the impact, which should show the burst text at roughly 15% of the screen width.

SCORE: 6.9
