The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 46

**Judge 46 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** In the Space+D `interact`, Buddy's `state` goes to `rag` and `slips` goes 0→1 at f117, with the `div#toast` "WHOOPS! BUDDY SLIPPED!". The sounds are grunt and yelp. P1's `grips.0.slot` stays 0. In 2P (Digit2, then Space+D for P1 and arrows+Enter for P2), `mode` is `local2p` and `grips` are P1 slot 0 and P2 slot 2 from f3. `tilt` peaks at 30.8, and with `slips` 0 the two players carry the couch up. Buddy's `grips.1.slot` was -1 until f117 and I did not trace it past that.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 5.** Door 1A, the plant, the rug and the rails read at the slip. `merged` covers 66% of the frame, and the stair treads are still muddy dark brown. A `look` `sheet` with `state:{floor:5}` still showed "Floor 1/5", so setState does not jump floors. I have not seen the WIN banner.
3. **Slide-back/tumble ragdoll, get up: 7.** At the slip the camera now holds both players. `player*` is 4.9% [426,563,769,799], with the red P1 and the green Buddy with X-eyes (`*KO*`) both visible, and the couch is in shot above them. The first-minute clip works. The tumble itself is shown only as a lone KO, with no couch sliding back into the pair.
4. **HUD: 8.** `div#tl`, `div#tilt` (TILT 24°), `div#grips`, `div#toast` and `div#help` all show, with 0 overlap and 0 cut off. The WIN banner is not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.** At frame 0 `couch` is 11% and the red and green `player*` read clearly, and the brick sliver is gone. The upper half is still a flat #3a4a66 slate void, because `backWall` is `Hidden by the game` at frame 0. Orange is 63% over objects, against a 55% target. In play `merged` and the stair treads are dark brown, and the rails read grey-blue.
6. **`window.__game` and one index.html: 8.** `describe` and `observe` work, the page starts playing on load, and 1/2 switch modes.
7. **Faults: 7.** The console is clean and `Never visible` is none. `perf` is 64 ms, but it is a software renderer, so it is not counted. It has 115 draw calls and 20.5k triangles. Host load is 1.6, which is fine. The frame-0 void is the main visible fault.

**Next:**
1. **Fill the frame-0 void (asked again).** `backWall` is hidden at frame 0, so the upper 55% of the screen is empty slate. Make `backWall` visible at frame 0, or add a lit wall and window plane behind the stairwell, and give it a warm cream or wallpaper tint. Check: the frame-0 `look` should show blue under about 30% and `backWall` listed on screen.
2. **Lighten the stair treads and `merged` floors, and cut the orange (asked again).** Move the tread and `merged` colours from dark brown to a mid grey-beige, so the orange couch pops against them. Check: a `look` after the Space+D `interact` should show orange under 55% over objects and `merged` not dark brown. Sample a tread pixel and expect a colour brighter than #5a4a40.
3. **Verify WIN and make floor 5 reachable for the check.** Make `setState({floor:5})` or an `act` jump the couch to the floor-5 landing, then `look` for the WIN banner and confetti. Show the couch-and-players tumbling down together, with dust and screen shake, instead of only the KO. Check: an `interact` using that action, with `look: true`, should show `div#win` or similar and the timer stopped.

SCORE: 6.7

## Iteration 47
**Did** Found why `backWall` was hidden at frame 0: the camera cull loop (index.html ~line 580, `level.userData.bb`) hid any wide object whose minY was above `min(camTarget.y, c.y-1)+.4`, and `backWall` has minY 0. It now always stays visible (`o.name === "backWall" ||`).
**Saw** Frame-0 `look`: `backWall` 36% [350,0,1279,427], blue 59%→24%, orange over objects 63%→59%, console clean, `Never visible` none, couch 11%. The wall's plaster is olive and tan with a dark green band, so it is darker and greener than the cream the judge asked for. A slate void is left at the upper left (x<290) because the wall plane ends short of the left edge. `perf`, WIN and 2P not run.
**Next** 1) Extend `backWall` width, or add a left wall plane, to fill the upper-left void. 2) Tint `wallMat` (colour 0x9fb4c4) toward warm cream. 3) Lighten the stair treads and `merged` to cut orange under 55%. 4) Make WIN reachable and check it.
**Open** I did not check how the wall looks mid-play on floors 2 to 5. Its texture repeat is 5 on y, so it may look odd higher up.
