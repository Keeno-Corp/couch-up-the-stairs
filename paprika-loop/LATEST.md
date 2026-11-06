The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 47
**Did** Found why `backWall` was hidden at frame 0: the camera cull loop (index.html ~line 580, `level.userData.bb`) hid any wide object whose minY was above `min(camTarget.y, c.y-1)+.4`, and `backWall` has minY 0. It now always stays visible (`o.name === "backWall" ||`).
**Saw** Frame-0 `look`: `backWall` 36% [350,0,1279,427], blue 59%→24%, orange over objects 63%→59%, console clean, `Never visible` none, couch 11%. The wall's plaster is olive and tan with a dark green band, so it is darker and greener than the cream the judge asked for. A slate void is left at the upper left (x<290) because the wall plane ends short of the left edge. `perf`, WIN and 2P not run.
**Next** 1) Extend `backWall` width, or add a left wall plane, to fill the upper-left void. 2) Tint `wallMat` (colour 0x9fb4c4) toward warm cream. 3) Lighten the stair treads and `merged` to cut orange under 55%. 4) Make WIN reachable and check it.
**Open** I did not check how the wall looks mid-play on floors 2 to 5. Its texture repeat is 5 on y, so it may look odd higher up.

### Judge 47

**Judge 47 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** In the Space+D `interact`, `tilt` rises to 30.86 and `slips` goes 0→1 at f117. Buddy goes to `rag` ("*KO*"), with the `div#toast` "WHOOPS! BUDDY SLIPPED!" and the sounds grunt and yelp. P1 stays `gripping`. I did not rerun 2P, and Buddy's recovery after the KO is not shown.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 5.** Door 1A, the plant, the green rug, the rails and the brick patch read after the slip. `merged` covers 66% of the frame, and the stair treads and `merged` are still muddy dark brown, with some visual clutter. `setState` floor jumps and the WIN banner were not seen again this session.
3. **Slide-back/tumble ragdoll, get up: 7.** The red P1 and the green Buddy with X-eyes are in the same frame as the couch, which hovers above them. The couch never visibly slides back into the players. There are only `sparks`, with no dust.
4. **HUD: 8.** `div#tl`, `div#tilt`, `div#grips`, `div#toast` and `div#help` show with 0 overlap and 0 cut off. The WIN banner is not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.** `backWall` now draws at frame 0 (36% [350,0,1279,427]), but a flat #34446a slate void is still on the left, about x<290. The wall is olive and tan, which is murky. Orange over objects is 59%, against a 55% target. The characters read well: red P1 and green Buddy hoods with the couch at 11%.
6. **`window.__game` and one index.html: 8.** `describe` works, the page starts playing on load, and the `interact` reply carries the observed state.
7. **Faults: 7.** The console is clean and `Never visible` is none. `perf` is 75.9 ms, 116 draw calls and 20.5k triangles, but the renderer is software, so the frame time is not counted. The left void at frame 0 is the main visible fault.

**Next:**
1. **Fill the left void at frame 0 (asked again).** Widen `backWall` to the left, or add a left wall plane, so x<290 is wall and not slate. Warm the wall tint toward cream and lighten the green band. Check: the frame-0 `look` with `sample` at [100,300] and [100,100] should return a wall colour and not about #34446a. The blue hue share should be under 5%.
2. **Lighten the stair treads and `merged` (asked again).** Move them from dark brown to a mid grey-beige, so the orange couch (59% over objects) pops. Check: the `look` after the Space+D `interact` shows orange over objects under 55%, and `sample` at a tread such as [750,500] reads brighter than #6a5a50.
3. **Make WIN reachable and sell the tumble.** Add an `act` or `setState` that puts the couch at the floor-5 landing, then `look` for the WIN banner, confetti and the stopped timer. Also add dust puffs and screen shake where the slipped Buddy and the couch meet. Check: an `interact` with that action and `look: true` shows `div#win`, and the slip look shows dust particles near the players.

SCORE: 6.7
