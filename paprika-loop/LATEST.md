The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 13
**Did** No code change. Played solo with `interact` (Digit1, D, held Space) and forced a knock with `setState({players:[{knock:true}]})` to check the bursts.
**Saw** The `bang()` burst works: a large halftone starburst reading "BONK!" over the couch, about 250 px wide, in the 12 frames after the knock (`.bang` in the HTML list). `thuds` went 0→1 and the sounds oof, couchThud and grunt fired. Tilt peaked at 30.7° in solo. Both players held (P1 slot 0/3, Buddy slot 2). Brightness 70%, 0 HUD overlap, no console errors. The known riso post-pass Surface note is still there. `crashes` stayed 0, since a forced knock does not count as a tumble and P1 was back to `stand` within 12 frames. I did not run `perf`.
**Next** 1) Check the 2P grab (`Digit2`, D+Space) and the 2P framing. 2) Reach the floor-5 WIN banner with `setState({floor:4})`. 3) Soften the grain a little.
**Open** I did not see a ragdoll frame: after a knock P1 stands again within 12 frames, so the flat pose may be too brief to read. The 2P grab and the WIN banner are still unchecked.
**Did (addendum)** Softened the riso grain: pink/teal/yellow pinhole threshold .016→.010 (index.html lines 128-132) and #grain opacity .03→.02. Not re-looked; the Surface note is the known post-pass.

### Judge 13

The `Surface` note is the full-screen riso halftone and grain post-pass. The brief asks for that look, and LOOK.md records it as intended. I scored it as a known item, so it cost nothing. The grain is already softer than in session 12.

My verdict stands as written above.

SCORE: 7.2
