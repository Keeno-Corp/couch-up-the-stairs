**Judge 47**

1. **Plays as DESIGN.md says: 8.** In the `interact` run, `timer` reached 7.55 s with `started` true. P1 held D and Space, and Buddy's grip showed HOLDING. The state also logged `thuds` 3, `slips` 1 and `crashes` 1. I did not play 2P or the WIN.
2. **Rapier couch and 5-floor stairwell: 8.** The switchback stairs, pink railing, landings and door `1A` all render. The couch moved 7.72 units and turned 161°.
3. **Slide-back, tumble and ragdoll with a comic burst: 8.** Within about 7 s of solo play, P1's state went to `rag` ("P1: × KO") and `crashes` went to 1. The `OOF!` burst sits on the pile-up. Whether the player gets up again was not checked.
4. **HUD: 8.** `FLOOR 1/5`, the timer `0:07.5`, the `TILT 26°` bar and the grips chips show in printed type, with 0 overlap and 0 cut off.
5. **Riso look: 8.** The picture shows five inks, halftone dots, grain and navy outlines. The grain is heavy, and `look` reports "BufferGeometry" covering 100% at 47.7 fine detail. That is the intended post-pass, but it is still dense.
6. **Orthographic cutaway camera: 7.** The stairs, couch and both movers are in frame. The camera sits close and crops the upper floors, so the "whole cutaway composition" is not shown. `cam.y` was only 1.6.
7. **Toy hoodie characters and puffy couch: 7.** The couch is pink and puffy, the P1 hoodie is teal and Buddy's is yellow. In this pile-up the bodies overlap and are hard to read, and P1 is half hidden under the burst.
8. **Comic bursts and a lamp glow per floor: 8.** `OOF!` is large and clear. Lamps show on floor 1 and by the door, but I saw only floor 1.
9. **`window.__game` and one `index.html` with vendor: 7.** `__game` returned its state and the page has no console errors. `look` still reports "couch drew no pixel", though the couch is plainly on screen.

**Faults: 6.** `perf` gave a 130 ms median frame, but this is a SwiftShader software renderer, so that is not a fault. The `Subject: couch drew no pixel` line is an instrumentation fault. The post-pass quad is 100% of the screen, so the named subject never resolves. It was raised in Judge 44 and again in Builder 47, and it is still unfixed.

**Next:**
1. Make the subject resolve in `look` (asked again). Render the scene to a target and draw it through a mesh named after the subject, or name the post quad `postpass`. A plain `look` should then say the couch drew pixels and list it under "On screen".
2. Pull the camera back for the whole cutaway. The upper floors are cropped in the frame, and `cam.y` was 1.6. Use `sheet` with `__game.setState` at floors 1, 3 and 5 to show that the stairs and the couch stay in frame. Check the WIN banner and the printed win screen at floor 5, and play 2P with key `2` and the arrows.
3. Make the tumble readable. Hold the burst a little longer (about 1 s) and place it above the pile rather than on P1. Lower the grain contrast so the 100% Surface line drops. Then run `look` with `zoom` on the players to check that the hoodie colours and the couch silhouette are distinct against `refs/sheets/mover.png`.

SCORE: 7.5
