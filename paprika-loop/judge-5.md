**Judge 5: scores by Must have item**

1. **Plays as DESIGN.md says: 7.** `interact` with KeyD then Space ran 391 frames. `tilt` peaked at 37° at frame 111, and `thuds` reached 3 and `slips` 2. The Sound line has grunt, couchThud, oof and yelp. At the end both `players` were in state `rag` and `floor` was still 1 after about 6 s. Grip heading smoothing is not done and 2P was not run.
2. **Rapier couch and 5-floor stairwell: 8.** The sheet shows pink railings, doors 1A and 2A, landings, and the `FLOOR 5/5 · HOME!` banner at the floor-5 state. The floor-3 state shows no WIN banner, so the floor-4 WIN fault is fixed.
3. **Tumble, ragdoll, burst within the first minute: 7.** A real slip happened (`slips` 2, both `players` in `rag`). The look shows the couch jammed on the rail with the teal player squashed under it. There is no flat limp pose and no stars or dust puff yet.
4. **HUD in printed type: 8.** `div#tl` shows FLOOR 1/5 and a 0:06.0 timer, `div#tilt` shows TILT 16° on a bar, and `div#grips` shows KO tags. The WIN card is correct. The `div#tl` text at the top-left overlaps the "2A" door and lamp.
5. **Riso look per LOOK.md: 8.** Halftone, grain, navy outlines and misregistration are visible, and the look matches the LOOK-board. The `look` Surface note for "BufferGeometry" at 100% coverage is the full-screen post-pass quad that draws the riso halftone and grain. The request asks for that detail, so I did not score it as a fault. `div#grain` stays up for the whole run.
6. **Orthographic follow cutaway camera: 7.** The camera follows the floors and the stairs and couch stay visible. The top is cropped, with the "2A" door cut by the HUD, and the right 20% of the canvas is empty cream paper.
7. **Toy hoodies and puffy couch match the sheets: 7.** The couch is pink and cushioned, and the hoodies are teal and yellow with faces. They are readable but the couch is still fairly flat.
8. **Comic bursts and a lamp glow per floor: 7.** `div.bang` shows a big yellow "WHOOPS!" star with navy outline over the couch. THUD! and CRUNCH! were not seen. Lamps with halos are on every floor.
9. **`window.__game` and single `index.html`: 9.** `observe` works and the page starts on load, with no console errors. `Subject` names "couch", which is not in the scene, so the look tools can't target it.

**Faults: 7.** `perf` gave 116 ms a frame on SwiftShader at a host load of 3.1, which is not a signal on a software renderer. The scene pass is 259 draw calls and 42.7k triangles. The post pass alone takes 36.7 ms. There are no `Never visible` objects and no console errors.

**Next:**
1. (asked again) Add a flat ragdoll pose and a `*`/star burst. On `slips`, lay the player flat for about 1 s with orbiting stars and a halftone dust puff. It is done when `look` right after the slip shows the player lying flat, with stars above them.
2. Make a solo run reach floor 2 or more without input. Reduce slipping at tilt above about 30° and smooth the grip heading. It is done when `interact` with `until: {floor: 2}` and `max: 1800` reaches floor 2 with keys released.
3. Cut draw calls by instancing the repeated stairs, dots and railings (259 in the scene pass). Also reduce the empty paper on the right and move the HUD off the door tops. Check with `perf` `costs: true`, and then with `look` for the HUD no longer touching the door at the top-left.

SCORE: 7.5
