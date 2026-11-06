Session 80 is judged from one solo run to floor 3, one `perf`, and two looks; the page loads with no console errors. I didn't run to WIN or test 2P, so the WIN and 2P parts of the Must have lines are scored from what was seen.

**Scores**

1. **Plays as DESIGN.md says, 6.** The solo run reached `floor` 3 at 23.9 s with `thuds` 5 and `slips` 2. P1 and Buddy were both `gripping`. The `interact` Sound line shows grunt, oof, yelp and couchThud firing. 1/2/R and 2P were not tried.
2. **Rapier couch, 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN at floor 5, 6.** The pink railings, the landings and the doors 1A and 2A read well in the looks. The couch's `quat` rolled to z -0.27 and it travelled 35.2 units for 8.97 net, so it is climbing and sliding back. WIN was not reached.
3. **Tumble, ragdoll, burst within the first minute, 4.** The run had 5 thuds, 2 slips and yelps, but no look caught a burst word or a flat ragdoll. In the f2 cell only the couch's edge shows behind the `stairs` mesh.
4. **HUD in printed type, 8.** The `div#tl` "FLOOR 3/5 0:23.9", the `div#tilt` meter and the grips tags are crisp and sit on the page without overlap. The "HOLD SPACE!" prompt appears. The WIN banner was not seen.
5. **Riso look, 7 at the start and 2 mid-run.**
   - The opening frame matches the LOOK-board style: teal, yellow, pink and cream inks, halftone dots, navy outlines and misregistration.
   - The look taken at floor 3 (`floor` 3, `cam.y` 8.56) is a blurry grey-blue mush with white specks, so the `postpass` shows no scene. That is a serious regression from the 80 changes, either the coarser pin hash or the camera or `VH` change.
6. **Ortho side-on camera that follows and never hides the stairs or couch, 4.**
   - The zoom now shows about 2 floors.
   - In f2 the couch is almost entirely hidden behind the stair mesh.
   - In t12 (frame 700) the couch and movers are visible again.
7. **Toy hoodie characters and puffy couch, 7.** At the start the teal and cream hoods and the pink couch with cushions are readable and chunky. The couch and movers are still somewhat small.
8. **Impact bursts and a lamp glow per floor, 4.** The lamps stand on each floor, but no THUD, OOF or CRUNCH word was seen in any look.
9. **`window.__game`, starts playing on load, no build, 6.** `observe` and `interact` work, and `act` and `setState` ran via the `until` steps.
10. **Faults, 3.**
    - The floor-3 look is unreadable.
    - `perf` is 119 ms a frame on a software renderer, so that is no signal (host load 2.2).
    - There are 195 draw calls and 45,513 triangles.
    - The couch is not visible to `look` ("couch drew no pixel").

**Next:**
1. Fix the grey mush at `floor` 3. Call `interact` with `until: {floor: [3, 9]}` and `look: true`, and the picture should show the stairs, couch and movers in the riso inks. Check the `postpass` pin hash (`floor(fp*.4)`) and the camera `want.y` and `clipTop` clamps, since `cam.y` is 8.56 there. Revert the pin hash or `VH` if one of them is the cause.
2. Draw the couch and the movers in front of the stair mesh (`depthTest` off or a high `renderOrder`, or a darker silhouette pass). Check with `look` after `interact` with `until: {floor: [2, 9]}`; the couch should be fully visible in the f2 cell.
3. Make `bang()` show a large "THUD!/OOF!/CRUNCH!" over the couch and force a flat ragdoll when the couch slides over a player. Check with `interact` with `until: {thuds: [7, 99]}` and `look: true`; a burst word and a flat mover should show. Then run on to the WIN banner at floor 5.

SCORE: 5.1
