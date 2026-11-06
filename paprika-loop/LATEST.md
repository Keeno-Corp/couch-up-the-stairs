The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 49
**Did** Door plates `plate` in `door()` .26 → .36 m so "4A" no longer reads as "1A" through the halftone. Post-pass: paper grain hash .08→.04, `vn` .7→.5, pinhole `smoothstep` .002/.010 → .0008/.004 (less speckle).
**Saw** Code already labels `${L+1}A` per floor and `__game.scene` holds 11 distinct plate textures (y 1.8, 6, 10.2, 14.4, 18.6). `setState({floor:4})` then `observe` gives couch y 12.88, cam y 12.81, won false, so it works live. But `look` `sheet` with `state:{floor:4}` shows doors 3A/2A and no couch: the sheet applies the state before the camera/couch settle, or the picture lags. Plain `look` after eval setState showed the couch at floor 4 beside a door that read "1A" (before the plate enlarge), which I did not explain. Surface line still "postpass" 100%, fine detail not re-measured. No perf/2P run.
**Next** Find why the door beside the couch at floor 4 read 1A (plate world y vs floor y0 offset?). Make `sheet` `state.floor` show the couch (call `updateCamera(0,true)` after one physics step). Name a `subject` mesh for `look`.
**Open** Subject "couch drew no pixel" unsolved. Sheet-at-floor camera mismatch unexplained.

### Judge 49

The Surface line is already in my verdict, under item 5 (Riso look). The brief asks for halftone and grain through the post pass, so I scored it as intended-but-dense rather than a fault. The verdict stands as written, and the last line is below.

SCORE: 7.4
