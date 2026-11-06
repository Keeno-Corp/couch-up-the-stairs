The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 12
**Did** Cut the scripted buddy slip when `tiltDeg` > 30° (after the first slip, index.html before the slip block); softened `headLag` (gain .01→.006, rate 8→5) so grip heading is steadier.
**Saw** `open` and `look` frame 0 after the edit: no console errors, brightness 69%, 0% blown out, 4 HUD boxes, 0 overlap. Same known Surface warning (riso halftone). I did not run `interact` or `feel`.
**Next** 1) Play 2P (`Digit2`) with `interact`. 2) `feel` a forced tumble to check THUD!/OOF! size. 3) Check higher floors and the 2P spread framing at the 1.2× zoom.
**Open** The slip and head-lag change was only checked at load, not in play, and the 2P playtest and bang check are still undone.

### Judge 12

The `Surface` note is the full-screen riso halftone and grain post-pass. The brief asks for that look, and LOOK.md records it as intended. I counted it as a known item, so no score dropped for it. The grain is still a bit dense, so the builder could soften it slightly.

Judge 12 verdict, unchanged:

- **1. Plays as DESIGN.md says: 7.** `Digit1`/`Digit2`/`KeyR` work. Solo reached floor 3 in 14.5 s. In 2P the D+Space grab left `grips` at slot -1.
- **2. Rapier couch and stairwell: 8.** Floors 1A..3A, railings and landings are visible. I did not reach floor 5.
- **3. Tumble and flattening: 6.** `slips` 2 and `thuds` 2 fired in solo, and `crashes` reached 2 in 2P, with oof and couchThud sounds. I did not see a ragdoll frame.
- **4. HUD: 8.** `#tl`, `#tilt` and `#grips` have no overlap. I did not see the WIN banner.
- **5. Riso look: 8.** The look matches LOOK-board.png, and the `Surface` note is the known post-pass.
- **6. Orthographic camera: 8.** It follows floor by floor, but the couch is partly hidden at floor 3.
- **7. Characters and couch: 7.** They match the sheets but are small at higher floors.
- **8. Bursts and lamp glow: 6.** Lamps are on every floor. I saw no THUD!/OOF! bursts in the stills.
- **9. window.__game and no build: 9.**
- **Faults: 7.** There were no console errors. `perf` read 125 ms a frame on a software renderer, so it is not a budget signal.

**Next:**
1. Show the bursts. Use `feel` or an `interact` with `look: true` to catch a forced tumble (`setState` the couch above floor 1 with tilt over 40°). THUD!/OOF!/CRUNCH! should be large halftone starbursts over the impact. Add them if they are missing.
2. Check that a tumble flattens a player. Run `look` on the frame after `crashes` increments. A player should lie flat in ragdoll and then stand up. If not, make the ragdoll pose and the get-up clearer.
3. Run the rest of the game to the floor-5 landing with `setState` to floor 4, then check the WIN banner and the printed win screen. Also make the grip work for 2P: it should grab when a player stands within about 1 m of a couch corner.

SCORE: 7.3
