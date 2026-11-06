**Judge 60**

I ran one 500-frame `interact` with D held and no Space, one `perf`, and a `look` `sheet` of f3 and f5. I did not play 2P or play through to f5 with a grip.

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** With D held and no Space, P1 stayed `stand` and `gripping:false` for all 501 frames. The buddy held the couch alone and `floor` stayed at 1. The couch stopped at frame 369 with `tilt` at 10° and `started` true, so the timer ran to 8.15 s. A viewer who never presses Space gets no tumble. Sound lines `yelp` and `grunt` fired, but `players.1.state` never reached `rag`.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 7.** Door 1A, the rails and the stairs read well on f1. The f3 and f5 sheet shows the couch in frame (4.9–5%), with the WIN banner and `sparks` on f5. The right-edge rail is still cropped on both. The f3 landing is still dark.
3. **Slide-back/tumble ragdoll, get up: 6.** The ragdoll only happens when P1 grips. With no grip there was no clip in 8 s (the Core loop item). Judge 59 saw `rag` at frame 117 with Space held. The page does not show the first-minute tumble to a passive viewer.
4. **HUD: 8.** `div#tl` (Floor 1/5 and the timer), `div#tilt`, `div#grips` and `div#help` show with 0 overlap and 0 cut off. The WIN banner and "0 crashes" show on f5. On the f3 and f5 sheet the help line at the bottom is hard to read against the stairs.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 7.** On f1 the couch stands out: 55% brightness against 46% around it, colour 69% against 31%. The red and green hoods match CHARACTERS.md. Wall decals are soft smudges. The f3 and f5 views are cluttered, and the stairs fill the right side behind the cropped rail.
6. **`window.__game` and one index.html: 8.** The state is clean, the page starts on load, and there is no build.
7. **Faults: 7.** There are no console errors and no `Lighting:` or `Surfaces:` lines. `perf` read 97 ms a frame, but it was on SwiftShader and does not count against the page. It had 125 draw calls and 21.7k triangles, which is fine. Open faults are the rail crop and the missing no-input tumble.

**Next:**
1. **Make the solo no-grip tumble fire (asked again).** The slip needs `started`, which is only set on a grip (~line 391), and `started` is already true here without a grip. Fire the buddy slip at timer > 4.5 s regardless of P1's grip. The slip should knock P1 into `rag`, and a prompt to hold Space should show. Check: `interact` with D held for 500 frames and no Space, `trace` on `players.1.state`, shows `rag`.
2. **Fix the right-edge rail crop on f3–f5 (asked again).** Move the camera `lookAt` in `updateCamera` (~line 584) so the rail and stairs fit, or shift `camOff.x` the other way. Check: `look` `sheet` of `{floor:3}` and `{floor:5}` shows the rail ending inside the frame, with `sample` at x≈1010–1020.
3. **Show the dust and shake in a picture, and add a f5 win detail.** `look` with `sheet` `steps` holding Space and D for 117 frames, to check that tan puffs are on screen. Make the puffs last at least 0.5 s. Then add confetti or a couch-settle on the f5 landing.

SCORE: 7.1
