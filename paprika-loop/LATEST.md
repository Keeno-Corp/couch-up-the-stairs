The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 64
**Did** `simStep` autoGrip now also drives P1 (`in.x`/`in.z`) toward the couch when P1 is >1.2 m away and not gripping. `camOff` pulled to (.3,3.2,6.0). `#win` banner shrunk (44px, no full-screen gradient, pointer-events none).
**Saw** 500-frame D-held solo run: no console errors; couch 2.4% of picture at the end (buddy in front of it), P1 reached x=3.77 then came back to x=1.1 but at y=4.32 (it walked up the stairs to floor 2 alone, couch stayed on floor 1, floor never changed). Couch stopped at frame 453. Not verified: win banner look.
**Next** 1) Make autoGrip walk-back ignore y (P1 climbs past the couch): clamp P1 to couch's floor or teleport back when |dy|>2. 2) Couch is still small at f1; fade the nearest stair block / zoom in. 3) z=-1.60 shared-face `Surfaces:` fault in `stairwell` (not touched).
**Open** Solo D-held still stalls on floor 1. Perf not run.

### Judge 64

**Judge 64**

I played one 500-frame `interact` with D and Space held, and the `look` after it. I ran `perf` once. I did not play 2P, and I did not look at the WIN banner.

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** `floor` went 1→2 at frame 369, but P1 ended as `rag` at x=3.56, y=2.44, well away from the couch at x=0.28, y=4.52. `slips` was 2 and `thuds` was 2. P1 is `*KO*` and the buddy alone holds the couch. P1's `pos.y` peaked at 3.13, so P1 climbed past the couch. The solo stall is still there, and the walk-back made P1 wander. The sounds were grunt, yelp, oof and couchThud.
2. **Rapier couch and 5-floor stairwell, doors 1A..5A, WIN: 7.** The doors 1A show, along with the railings and the stair blocks. The couch tumbled in a 190° turn and the floor changed. I did not re-check the win this session.
3. **Slide-back/tumble ragdoll, get up: 7.** P1 is in `rag` at the end, and the tumbles come early in the run. I did not see a get-up in this run.
4. **HUD: 8.** `div#tl`, `div#tilt`, `div#grips` and `div#help` show with 0 overlap and 0 cut off. I did not check the win banner.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** The couch stands out (colour 56% against 27%), but it is 4.5% of the picture and the buddy is mostly off to the side. The stair-block wall is a big, flat brown mass that fills the centre. The red hood and the green hood are not clear at once.
6. **`window.__game` and one index.html: 8.** `observe` works, the page starts on load, and there is no build.
7. **Faults: 7.** There were no console errors and no `Never visible` objects. `perf` read 103 ms a frame with 139 draw calls and 22.1k triangles on SwiftShader, so it does not count against the page. Host load was 2.5 on 8 cores. The z=-1.60 shared-face `Surfaces:` fault was not reported in this look. The builder did not touch it, so I could not check it.

**Next:**
1. **Stop P1 climbing past the couch (asked again).** The autoGrip walk-back ignores y, so P1 reached y=3.13 while the couch was at y=4.52 and the floors differed. Clamp the walk-back to the couch's floor, or put P1 back at the couch corner when |dy| is above 2. A 500-frame `interact` with D and Space held, with a trace of `players.0.pos.y` and `couch.pos.y`, should keep them within about 1.5 m of each other, and `players.0.state` should not end as `rag`.
2. **Show the couch bigger at f1–f2 (asked again).** The couch is 4.5% of the picture and the stair-block wall fills the centre. Fade or hide the nearest stair block, or zoom the camera on the couch and the buddy. A plain `look` should list `couch` above 8%.
3. **Fix the z=-1.60 shared face in `stairwell` (asked again).** Move one box 0.001 units off the plane. A plain `look` should show no `Surfaces:` line. After that, check the shrunk `#win` banner with `setState {floor:5}`.

SCORE: 7.0
