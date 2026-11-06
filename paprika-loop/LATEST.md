The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 35

**Judge 35 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.**
   - Holding Space+D for 330 frames took the `couch` to `floor` 2 with P1 gripping alone (`grips` P1 slot 0).
   - Buddy's slot went to 2 at f14, then back to -1 at f104, and he reads "free" with `dbg.assisting` true. His `dbg` shows `myI` 4 against `cI` 7, `lead` -3 and `stretch` 2.05.
   - Buddy sits at x -0.73, y 0.58, far below the `couch`.
   - The 1/2/R keys and P2 were not played.
2. **Rapier couch, 5-floor stairwell, railings, landings, doors 1A..5A; WIN: 7.**
   - Door "1B", the `stairwell` railing posts and the brick wall gap all read.
   - Floors 3–5 and the WIN were not played this session.
3. **Slide-back/tumble ragdoll, get up; clip in first minute: 5.**
   - `slips` goes 0→1 at f104 and the grunt and yelp play.
   - That is at the start of the climb, not at the first turn, and no tumble or get-up was seen.
   - `players` states read "stand" throughout.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 9.**
   - `div#tl` "Floor 2/5 0:05.3", `div#tilt` and `div#grips` show, with 0 overlaps and 0 cut off.
   - The WIN banner was not seen this session.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.**
   - The Subject `couch` is 8.6% of the picture at [577, 39, 994, 437], with no step block over it, so the camera fix worked.
   - Brightness is 42%, saturation 72% and hues are 92% orange, so the picture is still warm and flat.
   - The `couch` is bright orange against a brown `stairwell`, and the red P1 and green Buddy hoods read.
   - The players are small and crowded into the bottom corners, and Buddy is cut by the frame edge.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.**
   - `describe` and `observe` work and the console is clean.
   - `act` was not run.
7. **Faults: 6.**
   - `perf` gave 116.7 ms a frame at host load 2.5. That is SwiftShader, so it is noise.
   - 286 draw calls is real and has not changed in four sessions.
   - `Never visible` is none, and the `look` reply shows no `Lighting:` or `Surfaces:` lines.

**Next:**
1. **Make Buddy carry (asked again).**
   - Buddy's slot drops from 2 to -1 at f104, the same frame as the slip, and he then stays at `myI` 4 against `couch` index 7.
   - Make him re-path to the lower corner slot ahead of the `couch` after the slip and re-grab it. Cap `stretch` so he is not left 2 m below.
   - One call shows it done: `interact` Space+D held 330 frames with `trace: ["grips.1.slot", "players.1.dbg.lead"]`. `grips.1.slot` should end at 0 or above, and `lead` should stay under 10 through f300.
2. **Tie the slip to the first switchback turn (asked again).**
   - It still fires at f104.
   - Fire it when the `couch` reaches the turn at about f250–300. The tumble should then bowl a player into ragdoll, and the player should get up.
   - One call shows it done: the same `interact` with `trace: ["slips", "players.0.state"]`. `slips` should first change at f250 or later, and `players.0.state` should show a ragdoll state and then "stand".
3. **Cut draw calls and widen the frame (asked again).**
   - Merge the 56 `stairwell` boxes by material or with `instances`. `perf` should report under 150 draw calls.
   - Pull the camera back so both players stay inside the frame. Buddy is cut at the bottom left. A `look` at the same frame should then show both hoods fully, with the Subject above 8%.

SCORE: 6.7

## Iteration 36
**Did** In the slip check (`index.html`, Buddy slip block) the `L0F1` threshold went from prog>.5 to prog>.92, so the slip waits for the first turn instead of f104.
**Saw** `interact` Space+D x330 with trace: `slips` stayed 0 for all 330 frames; `grips.1.slot` 2 from f14 to the end (Buddy no longer drops his grip early); `players.1.dbg.lead` fell to -13 at f302 (-9 at f320), `stretch` 2.38, so Buddy still trails ~3 m below. `couchIdx` 25 at f330, floor 2, no console errors. No `look` or `perf` run.
**Next** 1) Buddy lags: raise his speed or re-path in `aiThink` when lead < -6. 2) Check the slip fires after f330 (`slips`, `players.0.state` ragdoll then "stand"). 3) Merge `stairwell` boxes (draw calls ~286) and widen the camera so both hoods fit.
**Open** The slip may now never fire if `couchIdx` stalls before prog .92 of `L0F1`; draw calls and framing untouched.
