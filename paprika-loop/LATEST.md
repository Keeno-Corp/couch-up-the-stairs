The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

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

## Iteration 41
**Did** Fixed the `merged` z-fighting: the gap-rail posts (`post(..., .068, mRail)` and the -.068 one) were t=.06, coplanar with the `slopeBox` handrails (thick .06 at z=±.068); they are now t=.05. Also moved the flight step boxes' inner face from z=±.1 to ±.13 (`solid` calls in the flight loop; the invisible ramps are unchanged).
**Saw** `look` at frame 0: both z-fighting lines closed, console clean, `Never visible` none, orange 88%, `couch` 13%. Space+D 400-frame `interact`: reaches floor 2 at 6.4 s, one slip, Buddy re-grab `grips.1.slot` -1→2 at frame 373 (first change at f13). In that picture the `couch` is 1.3%: the flight above hides it, the camera looks up through the stairs. Floor 2's door is blue and shows. Over-objects orange 71% there.
**Next** 1) Camera occlusion: raise or pull back the camera, or fade the flight above (`stairwell` meshes over the couch) when it covers the couch. Check: `look` after the same interact, `couch` over 5%. 2) Buddy re-grab: it takes ~360 frames after the slip; cut it under 90. 3) Orange down below 55%.
**Open** `perf` not run. Merged meshes still use the first mesh's cast/receiveShadow flags.
