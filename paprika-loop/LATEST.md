The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 66

**Judge 66**

I ran one 500-frame solo `interact` with D and Space held, then a `{state:{floor:5}}` jump with a `look`, then `perf` once. I did not play 2P or run `feel`.

1. **Plays as DESIGN.md's Core loop and Controls say: 5.** The session-66 teleport helped a little: `players.0.pos.y` now peaks at 5.65 against a `couch.pos.y` peak of 5.15, so P1 follows the couch up. But the run still ends with `players.0.state` "rag", `grips` P1 `slot:-1` (`*KO*`) and only the Buddy holding. The end gap is 1.26 m (P1 y=3.26, couch y=4.52). P1 first went rag around frame 117, and `floor` 2 only arrived at frame 369.
2. **Rapier couch and 5-floor stairwell, doors 1A..5A, WIN: 8.** The `stairwell` blocks, railings, door 1A and the landings show, and the couch turned 190°. With `floor:5` set, `won` is true, and the picture shows the landing, door "4A" and confetti.
3. **Slide-back/tumble ragdoll, get up: 7.** P1 goes stand → rag → stand → rag. The sounds grunt, yelp, oof and couchThud fire, `thuds` is 2 and `slips` is 2. Ragdolling is early and readable, but the run ends in rag.
4. **HUD: 7.** `div#tl`, `div#tilt`, `div#grips` and `div#help` show with 0 overlap and 0 cut off. The "WIN!" text sits on top of the "TILT 18°" bar, so the banner collides with the meter. The check didn't catch it because the banner isn't one of the listed `div` elements.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** Orange couch, red and green hoods and the 1A door look good. At f1–f2 the couch is only 5.1% of the picture, and a big flat brown stair-block wall covers the centre and the buddy. The red player is hidden behind the stairs in that look (`player*` 0.22%). On f5 the `player*` objects are 3.4% and read well. `Surfaces:` flags two `stairwell` boxes sharing the face plane z = -1.60.
6. **`window.__game` and one index.html: 8.** `observe` works, the page starts on load, and there is no build.
7. **Faults: 7.** There were no console errors and no `Never visible` object. `perf` read 102 ms a frame, 139 draw calls and 22.1k triangles on SwiftShader, which is not a budget signal. Host load was 1.8 on 8 cores. The z = -1.60 coplanar faces are minor.

**Next:**
1. **Stop P1 ending in rag (asked again).** After the teleport in `simStep`, set `p.state='stand'`, clear the rag timer and set `autoGrip` back on. Also make P1 re-grab a slot, so `grips` reads P1 `slot≥0`. Run the same `interact` of D and Space held for 500 frames. It should end with `players.0.state` "stand", P1 `slot:0` or greater, and |P1 y − couch y| under 1.5 m. Also find out why `floor` takes until frame 369 (the Buddy drags the couch alone).
2. **Show the couch bigger at f1–f2 (asked again).** Fade or lower the nearest stair-block column in front of the `couch`, and pull the camera in on the couch, P1 and the buddy. A plain `look` should list `couch` above 8% and `player*` above 2%, with the red player fully on screen.
3. **Fix the WIN banner position.** Move the `#win` text below or away from the `#tilt` bar, and hide `#tilt` when `won`. Check with `interact` `{state:{floor:5}}` and a `look`: the banner and the meter should not overlap. Then add a `shake` and a bigger confetti burst, and check it with `feel`.

SCORE: 6.9

## Iteration 67
**Did** In `simStep` solo block, the |couch.y − P1.y| > 2 teleport now also calls `getUp(p)` if rag, sets `autoGrip=true`, `idleT=0`. `#win` padding-top 16→70px; `#tilt` hidden (visibility) when `won`.
**Saw** 500-frame D+Space solo: P1 `state` stand at end (rag 117–174, 333–335), `grips` P1 slot 3 + Buddy slot 2, floor 2 at frame 296, P1 y 3.26 vs couch 5.21 (gap ~1.95, still big). No console errors on open. No look/perf run; win banner not re-checked visually.
**Next** 1) Couch bigger at f1–f2 (fade nearest stair block, zoom camera). 2) Look at `{state:{floor:5}}` to confirm banner no longer overlaps. 3) Why floor 2 takes ~296 frames; P1 still lags the couch by ~2 m at the end. Add win shake/confetti.
**Open** Win banner and camera framing unverified this session.
