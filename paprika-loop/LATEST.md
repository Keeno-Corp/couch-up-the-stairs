The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 40
**Did** In `index.html`: added `mergeGeos` and a post-build pass that merges the static `stairwell` meshes by material into `merged` meshes (the plain level meshes: steps, rails, posts, doors, plants, scraps). Door bodies on floors 2 and 4 are now blue (`mDoorBlue`) and teal (`mDoorTeal`) to break the orange. Slip dust `burst` and `shake` were already in the code (`slipFlag` branch), so I changed nothing there.
**Saw** `perf`: 114 draw calls (was 291), 26,110 triangles, 119 ms a frame on SwiftShader (noise). `look` at frame 0: console clean, `Never visible` none, picture still 88% orange, `couch` 13% and brightness 54% vs 37% around it. `look` flags z-fighting on `merged` at z=0.10 and z=0.04: the back-wall skirting/bricks planes overlap. Not checked: whether the new door colours show on floors 2 and 4, play after the merge, Buddy re-grab speed, couch opacity.
**Next** 1) Fix the `merged` z-fighting (offset the back-wall bricks/skirting or use polygonOffset). 2) Replay Space+D with `interact` to confirm collisions and the slip still work, and look at floors 2–4 for the blue and teal doors. 3) Darken the `couch` for edge contrast and cut Buddy's re-grab from ~160 frames.
**Open** The merged meshes lose per-mesh `castShadow` variety: the first mesh's flags are used for the whole group. Orange share is not measured past frame 0.
**Update** Nudged flight rail/post z .07→.068 (and -.07→-.068); `look` still reports the same two z-fighting lines on `merged` at z=0.10 and z=0.04, so the culprit is another pair (probably step/landing faces at z=.1 or the back-wall skirting). Still open.

### Judge 40

The z-fighting fault is already in my verdict: it's in the Faults line and in Next item 1. The `look` reported two overlapping `merged` faces, at z=0.10 and z=0.04. They are 14 × 3.1 units, probably the back-wall skirting or bricks against `backWall`. The fix is to move one face off the plane, set `polygonOffset` on its material, or remove the hidden face. I changed nothing, as a judge session requires.

**Judge 40 verdict (unchanged)**

1. Plays as the Core loop and Controls say: 7.
2. Rapier couch, stairwell, doors, WIN: 6.
3. Slide-back/tumble ragdoll, get up: 7.
4. HUD: 9.
5. Looks as LOOK.md says, characters match CHARACTERS.md: 5.
6. `window.__game` and one index.html: 8.
7. Faults: 5.

**Next:**
1. **(asked again)** Fix the camera occlusion and the `merged` z-fighting. The check is `look` after the same Space+D 400-frame `interact`. The `couch` should be over 5% of the picture, and the "Surfaces" z-fighting lines should be gone.
2. Make Buddy re-grab in under 90 frames after the get-up. `interact` with `trace: ["grips.1.slot"]` should show 2 by about f300.
3. Cut the orange further and clean the textures. `look` should show over-objects orange below 55%.

SCORE: 6.7
