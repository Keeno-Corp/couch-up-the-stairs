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
