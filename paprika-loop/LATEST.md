The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 39
**Did** In `index.html`: `updateCamera` `want.y` bias +.85 (was +.5) and lookAt `camTarget.y - .15` (was -.35), so the airborne `couch` stays in frame; `tryGrab` lets AI players (`p.ai`) grab at any `couchSpeed` (was <4 only); door label `${L+1}A` (was B).
**Saw** `interact` Space+D x400: `grips.1.slot` -1 at f209 → 2 at f372 (Buddy re-grabs, ~160 frames after get-up); `players.1.state` stand→rag f117→stand f209. `look`: `couch` [198,55,648,466] fully in frame, 9.5%, brightness 64% vs 50%; both hoods visible; door reads "1A"; 88% orange over objects; console clean. No `perf` run; 91 objects on screen.
**Next** 1) Merge `stairwell` boxes by material (285 draw calls, unchanged many sessions). 2) Add green/blue accent to break the orange (a rug exists in green by the door; add a plant or blue door). 3) Slip feedback: dust `burst` + small `shake` at slip.
**Open** Re-grab takes ~160 frames; could be quicker. Floors 3–5 and WIN not replayed this session.

### Judge 39

**Judge 39 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.**
   - Holding Space+D for 400 frames reached `floor` 2 at `timer` 6.42, with `grips.0` P1 on slot 0.
   - `grips.1.slot` went -1 → 2 at f372, so Buddy does re-grab, but about 160 frames after the get-up at f209.
   - 1/2/R and P2 were not played this session.
2. **Rapier couch, 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.**
   - `stairwell` ×39, the brick gap and the landing read well, and the door now reads "1A".
   - Floors 3–5 and the WIN landing were not reached.
3. **Slide-back/tumble ragdoll, get up; clip in first minute: 7.**
   - `slips` went 0→1 at f117, and `players.1.state` went stand → rag → stand at f209.
   - Sound gave grunt, yelp, grunt.
   - No dust or shake was checked, and nobody is bowled over.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 9.**
   - `div#tl` "Floor 2/5 0:06.4", `div#tilt` "TILT 0°" and `div#grips` "P1: HOLDING Buddy: HOLDING" show, with 0 overlaps and 0 cut off.
   - The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The Subject `couch` is fully in frame at [201, 55, 648, 466]. It takes 9.5% of the picture, with brightness 65% against 51% and edge contrast 0.161.
   - The red and green hoods are clear, and there is a lamp and a green rug.
   - The picture is still 88% orange over the objects, so it reads monochrome warm.
   - The `couch` is washed out and semi-transparent against the railings, and its parts are not listed.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.**
   - `describe` and `observe` work and the console is clean.
   - `act` and `setState` were not run.
7. **Faults: 6.**
   - `perf` gave 116 ms a frame at host load 2.0 on SwiftShader, so it is noise.
   - Draw calls are 291 with 19,786 triangles, unchanged for eight sessions. This is the third time it is asked, and it was not done.
   - `Never visible` is none, and the console is clean.

**Next:**
1. **(asked again) Merge the `stairwell` boxes (draw calls).**
   - Merge the ×39 `stairwell` meshes by material with `geo.js` merge or `instances` from `fx.js`.
   - `perf` should show under 150 draw calls, down from 291.
2. **(asked again) Break the orange and add slip feedback.**
   - Add a blue or green accent: a blue door on another floor, a plant, or a cool-tinted wall on floors 2–5.
   - `look` should show over-objects orange below 80%.
   - At the slip (f117), fire a dust `burst` and a small `shake`.
   - `feel` with Space+D steps should list particles and shake at f117.
3. **Make the `couch` read solid and Buddy re-grab faster.**
   - The `couch` looks washed out against the railings. Check its material for opacity or emissive, and darken it so it has more edge contrast.
   - Cut Buddy's re-grab from ~160 frames to under 90.
   - `interact` with `trace: ["grips.1.slot"]` should show 2 by about f300.

SCORE: 7.1
