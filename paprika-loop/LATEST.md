The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 62

**Judge 62**

I played one 400-frame `interact` with D held and no Space, took a `look` `sheet` of f3 and f5, and ran `perf` once. I did not play 2P, and I did not play through to f3–f5 with a grip.

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** With D held, `players.0.state` went `stand`, then `rag` at frame 285, then `stand` at frame 366. `slips` was 1 and `thuds` was 1. `div#holdp` "HOLD SPACE!" now shows after the tumble while `P1: free`, so last session's prompt item is done. The couch stopped at frame 391 and `floor` stayed at 1. Solo play still stalls with no grip, and nothing played was checked past f1.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 6.** The sheet shows the 2A and 3A doors and the WIN banner. On both f3 and f5 `couch` is at or near 0% (0.00029% on f3), so the f3–f5 camera change still has no couch in frame. The f5 view is dominated by the stone slab. The `floor` key in the sheet's `state` does not teleport the couch or players, so the sheet cannot show the real f3–f5 gameplay framing.
3. **Slide-back/tumble ragdoll, get up: 8.** P1 goes `rag` and then `stand` at about 4.7 s, with yelp, oof and grunt sounds playing. The first-minute clip fires.
4. **HUD: 8.** `div#tl`, `div#tilt`, `div#grips`, `div#holdp` and `div#help` show with 0 overlap and 0 cut off. The help line now reads clearly on its dark backing. The WIN banner shows "0:00.0 · 0 crashes" because of the sheet's fake state.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 7.** In the f1 look the couch takes 8.6% of the picture. Its colour is 70% against 39% around it, but brightness is 53% against 57%, which is only a modest standout. The red and green hoods read well. On f3 and f5 the scene is washed out and smudgy, and the slab hides the scene.
6. **`window.__game` and one index.html: 8.** The state is clean, the page starts on load, and there is no build.
7. **Faults: 7.** There are no console errors, no `Lighting:` or `Surfaces:` lines and no `Never visible` objects. `perf` read 95 ms a frame, but on SwiftShader (software renderer), so it does not count against the page. It had 125 draw calls and 21.7k triangles. The f3–f5 framing is still unverified, and the f1 couch is 8.6% of the picture.

**Next:**
1. **Verify and fix the f3–f5 framing by playing there (asked again).** Use `interact` with `{action:...}` or `eval` to move the couch and players to floor 3 and floor 5. A `state` key that only changes the floor number does not do it. Then `look` and confirm `couch` is above 3% with the rail inside the frame. If the sheet cannot teleport, add a `setState` path for `{floor:n}` that places the couch and players on that landing. That path also lets the next judge see f3–f5. One `look` `sheet` of `{floor:3}` and `{floor:5}` shows it done when it lists `couch` above 3%.
2. **Make solo play without a grip recover.** The couch stalls at frame 391 with P1 `free` and the buddy gripping. Auto-regrab P1 if Space was released within about 1 s, or have the buddy pull the couch to the next landing. A 600-frame `interact` with D held should then show `floor` 1→2.
3. **Add the f5 win juice and trim the slab.** Add confetti, a couch-settle bounce and a camera pull-back when `floor` reaches 5, and lower or cut the stone slab so the 3A door and couch show. A `look` of the win moment should list `couch` above 3% with coloured particles.

SCORE: 7.3

## Iteration 63
**Did** Checked f3 by `interact` `{state:{floor:3}}` + 30 frames (the setState `floor` key does teleport couch and players; only the sheet's `state` did not show it). Added solo auto-regrab in `simStep` before the grab loop: P1 (mode 1) standing, not gripping, `started`, idle 1.5 s gets `autoGrip` (forces `in.grab`) until a real Space press or a tumble.
**Saw** f3 look: couch 3.7% of the picture, rail inside the frame, 2A door visible, no HUD overlap, no console errors; "Surfaces" note: two stairwell boxes share a face at z=-1.60 (hidden side). A 700-frame D-held run: P1 grabbed at frame 104, tumbled at 222, then walked away to x=2.88,y=2.5 alone (too far to regrab, range 1.7), couch stalled at frame 444 on floor 1, yawed 77°.
**Next** 1) Regrab only works near the couch: make the buddy/couch wait, or have P1's walk-away blocked while `autoGrip`. 2) f5 win juice (confetti, couch-settle bounce) and trim the stone slab. 3) Fix the z=-1.60 shared face in `stairwell`.
**Open** Auto-regrab is unverified in a close-range case; solo D-held still stalls on floor 1. Perf not run.
