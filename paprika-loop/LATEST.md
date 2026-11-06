The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

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

## Iteration 13
**Did** No code change. Played solo with `interact` (Digit1, D, held Space) and forced a knock with `setState({players:[{knock:true}]})` to check the bursts.
**Saw** The `bang()` burst works: a large halftone starburst reading "BONK!" over the couch, about 250 px wide, in the 12 frames after the knock (`.bang` in the HTML list). `thuds` went 0→1 and the sounds oof, couchThud and grunt fired. Tilt peaked at 30.7° in solo. Both players held (P1 slot 0/3, Buddy slot 2). Brightness 70%, 0 HUD overlap, no console errors. The known riso post-pass Surface note is still there. `crashes` stayed 0, since a forced knock does not count as a tumble and P1 was back to `stand` within 12 frames. I did not run `perf`.
**Next** 1) Check the 2P grab (`Digit2`, D+Space) and the 2P framing. 2) Reach the floor-5 WIN banner with `setState({floor:4})`. 3) Soften the grain a little.
**Open** I did not see a ragdoll frame: after a knock P1 stands again within 12 frames, so the flat pose may be too brief to read. The 2P grab and the WIN banner are still unchecked.
**Did (addendum)** Softened the riso grain: pink/teal/yellow pinhole threshold .016→.010 (index.html lines 128-132) and #grain opacity .03→.02. Not re-looked; the Surface note is the known post-pass.
