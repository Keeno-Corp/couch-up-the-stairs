**Judge 38 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.**
   - Holding Space+D for 300 frames took `couch` to Floor 2 at 0:04.8, with `grips.0` P1 on slot 0.
   - `players.1.state` went "stand" → "rag" at f117 → "stand" at f209, so the faster get-up works.
   - `grips.1.slot` stays -1 after the get-up, and `dbg.lead` is -4 with `stretch` 2.06. Buddy never rejoins.
   - 1/2/R and P2 were not played this session.
2. **Rapier couch, 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.**
   - The `stairwell` railings, brick gap, treads, and the door labelled "1B" all read well.
   - The door label still says 1B, not 1A as the brief asks.
   - Floors 3–5 and the WIN landing were not reached.
3. **Slide-back/tumble ragdoll, get up; clip in first minute: 7.**
   - `slips` went 0→1 at f117. The sound line reports a grunt and a yelp, and the Buddy ragdoll lasts about 1.5 s.
   - No dust or shake marks the slip, and nobody is bowled over (P1 stayed "stand").
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 9.**
   - `div#tl` "Floor 2/5 0:04.8", `div#tilt` "TILT 1°" and `div#grips` "P1: HOLDING Buddy: free" show, with 0 overlaps and 0 cut off.
   - The WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.**
   - The Subject `couch` is cut by the top edge at [539, 0, 958, 328]. It takes 8% of the picture, and its parts are not listed.
   - It does stand out: brightness 63% against 45%, edge contrast 0.146.
   - The picture is 91% orange, so the scene is still monochrome warm.
   - Both hoods are now fully in frame: the red hood is clear on the landing, and the green one sits at the bottom-left.
   - The camera lookAt change in Iteration 38 pushed the couch off the top of the frame.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.**
   - `describe` and `observe` work and the console is clean.
   - `act` and `setState` were not run.
7. **Faults: 6.**
   - `perf` gave 118 ms a frame at host load 1.5 on SwiftShader, so it is noise.
   - Draw calls are 285 with 19,698 triangles, unchanged for seven sessions. The `stairwell` is ×52 objects.
   - `Never visible` is none, and the console is clean.
   - Buddy never re-grabs after getting up.

**Next:**
1. **Fix the camera so the couch is never cut off (caused by Iteration 38).**
   - `look` shows `couch` clipped at y=0 while it is high on Floor 2.
   - Raise the `camTarget.y` bias so the couch stays inside the frame when it is airborne, or pull the camera back a little as couch height or tilt grows. Keep the hoods fully visible.
   - `look` with `sample` at [700, 8] should show the couch's bounding box starting at y > 0.
2. **Make Buddy re-grab after his get-up.**
   - `grips.1.slot` stays -1 from f209 to f300, with `lead` -4 and `stretch` 2.06.
   - Check `tryGrab` and the AI slot choice. After `getUp`, walk Buddy to the nearest free slot and grab it, and clear the `stretch` limit that blocks the grab.
   - `interact` Space+D x400 with `trace: ["grips.1.slot"]` should show 2 again within about 120 frames of f209.
3. **Cut the 285 draw calls and break the 91% orange.**
   - Merge the 52 `stairwell` boxes by material, or use `instances` from `fx.js`. `perf` should then show under 150 draw calls.
   - Add a green or blue accent (a rug, a plant, a coloured door) so the picture is less than 85% orange.
   - Add slip feedback while you are in there: `shake` and a dust `burst` at f117.
   - Rename door "1B" to "1A".

SCORE: 7.0
