**Judge 61**

I ran one 400-frame `interact` with D held and no Space, a `look` `sheet` of f3 and f5, and one `perf`. I did not play 2P or play through to f5 with a grip.

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** With D held and no Space, `slips` went 0→1 at frame 285. `players.0.state` was `rag` for frames 285–366 and then `stand`. The no-grip tumble now fires. P1 still shows `gripping:false` afterwards, with no prompt to hold Space. The couch stopped at frame 391 and `floor` stayed at 1.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 6.** The f3 and f5 sheet shows 2A and 3A doors and the WIN banner, but `couch` is 0% on both. The f5 view is dominated by a big stone slab, and the f3 landing is cluttered. The right-edge rail is still cropped on both.
3. **Slide-back/tumble ragdoll, get up: 8.** Both `players.0` and `players.1` went `rag` and then back to `stand` (frames 366 and 334). The first-minute clip fires for a passive viewer at about 4.7 s.
4. **HUD: 8.** `div#tl`, `div#tilt`, `div#grips` and `div#help` show with 0 overlap and 0 cut off. The WIN banner shows "0:00.0 · 0 crashes". On the sheet the help line is unreadable against the stairs.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 7.** The couch takes 8.6% of the picture with colour 70% against 39% around it. Brightness is 53% against 57%, so it is only a modest standout. The red and green hoods read clearly. The f1 picture is warm and clear. The decals are still smudgy, and f3 and f5 are cluttered.
6. **`window.__game` and one index.html: 8.** The state is clean, the page starts on load, and there is no build.
7. **Faults: 7.** There are no console errors, no `Lighting:` or `Surfaces:` lines and no `Never visible` objects. `perf` read 96 ms a frame on SwiftShader, which does not count against the page. It had 125 draw calls and 21.7k triangles, which is fine. Open faults are the cropped rail, the missing prompt after the tumble, and the f5 view with no couch in frame.

**Next:**
1. **Fix the camera on f3–f5 so the couch and rail are in frame (asked again).** In `updateCamera` (~line 584), shift `lookAt` or `camOff` toward the couch. The right-edge rail should end inside the frame. Check: `look` `sheet` of `{floor:3}` and `{floor:5}` lists `couch` above 3%, with `sample` at x≈1010–1020 showing the rail inside the frame.
2. **Show a "hold SPACE!" prompt after the no-grip tumble.** When `players.0.state` returns from `rag` and `gripping` is false, show a large pulsing prompt near `div#grips`. Check: `interact` D held for 400 frames, then `look`, shows the prompt at frame ~370.
3. **Make the help line readable and the f5 win more satisfying.** Give `div#help` a dark translucent backing. Add confetti and a couch-settle bounce on the f5 landing, and trim the stone slab so it does not hide the scene. Check: `look` `sheet` `{floor:5}` shows readable help text and coloured particles around `couch`.

SCORE: 7.3
