The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 63

**Judge 63**

I played one 600-frame `interact` with D and Space held from the start, then used `setState {floor:5}` to see the win. I ran `perf` once. I did not play 2P, and I did not play f3–f4 with a grip.

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** With D and Space held, `floor` went 1→2 at frame 369. P1 went `rag` at frame 118, `stand` at 199, `rag` again at 407 and `stand` at 505. `slips` was 2 and `thuds` was 2. The sounds were grunt, yelp, oof and couchThud. At frame 600 P1 had walked to x=3.92, away from the couch, with `P1: free` and `HOLD SPACE!` showing. The couch was at tilt 26° and speed 0.2. Progress is slow, and the earlier solo stall is only partly fixed. I did not check whether `autoGrip` helps when P1 is out of range.
2. **Rapier couch and 5-floor stairwell, doors 1A..5A, WIN: 7.** `setState {floor:5}` put the couch at y=17.08, `won` was true, and the 4A door showed. The couch is 4.7% of the picture, so it is in frame. The f1 camera is dominated by the brown stair-block wall, and the couch is only 5.1% of that picture.
3. **Slide-back/tumble ragdoll, get up: 8.** P1 tumbles twice in 600 frames and gets up each time. The first rag is at frame 118, about 2 s in, with yelp, oof and grunt sounds.
4. **HUD: 8.** `div#tl`, `div#tilt`, `div#grips`, `div#holdp` and `div#help` show with 0 overlap and 0 cut off. `div#win` shows "WIN! 0:09.5 · 2 crashes" with the confetti. The win text covers the whole screen and the tilt bar behind it.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 7.** The red and green hoods and the orange couch are clear in the f5 win picture, and the confetti and `sparks` look good. At f1 the couch is 5.1% of the picture, but it stands out well (colour 54% against 27%). The bright, saturated stair-block face fills the view. The couch is also smaller in the f1 and f2 pictures than in the f5 one, and there the camera is high above it.
6. **`window.__game` and one index.html: 8.** The state is clean, `setState` works for `floor` and `won`, the page starts on load, and there is no build.
7. **Faults: 7.** There were no console errors, no `Never visible` objects and no `Lighting:` lines. The `Surfaces:` fault is that two `stairwell` boxes share a face at z=-1.60, which is the same fault last session reported. `perf` read 103 ms a frame with 139 draw calls and 22.1k triangles. That is on SwiftShader, so it does not count against the page. Host load was 1.7 on 8 cores.

**Next:**
1. **Keep P1 near the couch during a solo run (asked again).** P1 walked to x=3.92, y=2.68 while the couch sat at x=0.09, so the regrab range of 1.7 cannot reach. Either have the buddy slow or wait, or have `autoGrip` walk P1 back toward the couch corner when it is idle. A 600-frame `interact` with D held and no Space should then show `floor` 1→2. A trace of P1's `pos.x` should stay within about 2 m of `couch.pos.x`.
2. **Show the couch bigger and clearer at f1–f2.** The stair-block wall hides most of the f1 and f2 view. Lower the camera or pull it back, or fade the nearest stair block, so `couch` is above 8% and the buddy is in frame. A `look` of the same 600-frame play should list `couch` above 8% with the red hood visible.
3. **Fix the z=-1.60 shared face in `stairwell` (asked again).** Move one box 0.001 units off the plane, or drop the hidden face. A plain `look` should then show no `Surfaces:` line. After that, make the WIN banner a smaller, solid card that does not hide the scene or the tilt bar.

SCORE: 7.4

## Iteration 64
**Did** `simStep` autoGrip now also drives P1 (`in.x`/`in.z`) toward the couch when P1 is >1.2 m away and not gripping. `camOff` pulled to (.3,3.2,6.0). `#win` banner shrunk (44px, no full-screen gradient, pointer-events none).
**Saw** 500-frame D-held solo run: no console errors; couch 2.4% of picture at the end (buddy in front of it), P1 reached x=3.77 then came back to x=1.1 but at y=4.32 (it walked up the stairs to floor 2 alone, couch stayed on floor 1, floor never changed). Couch stopped at frame 453. Not verified: win banner look.
**Next** 1) Make autoGrip walk-back ignore y (P1 climbs past the couch): clamp P1 to couch's floor or teleport back when |dy|>2. 2) Couch is still small at f1; fade the nearest stair block / zoom in. 3) z=-1.60 shared-face `Surfaces:` fault in `stairwell` (not touched).
**Open** Solo D-held still stalls on floor 1. Perf not run.
