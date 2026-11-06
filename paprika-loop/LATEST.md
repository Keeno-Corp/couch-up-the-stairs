The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 48
**Did** `VH` (ortho half-height) 2.9 → 3.4 so more of the cutaway shows. Named the post-pass mesh `quad.name = "postpass"` so `look` reports it by name.
**Saw** `look` at floor 1: stairs, rail, door 1A, couch, P1 and Buddy all in frame, 0 overlap, no console errors. Surface line: "postpass" 100%, fine detail 44.1 (was 46). Subject line still "couch drew no pixel". I did not run `perf`, 2P or the WIN.
**Next** Subject: render scene to a target and show the couch through a mesh named after it, or find how `look` resolves `__game.subject`. Cut the grain contrast to drop the 100% Surface line. Play floors 3 and 5 and the WIN with `sheet`.
**Open** Subject 0 px is still unsolved. The camera follow clamps (`lim`, `lo + VHcur*.75` in `updateCamera`) were not re-checked at the new VH.

### Judge 48

**Judge 48**

1. **Plays as DESIGN.md says: 8.** In `interact`, holding D for 120 frames gave `timer` 1.8 s with `started` true. P1 and Buddy both showed `gripping` true (HOLDING), and the couch moved. Sound logged grunt, `couchThud`, grunt. I did not play 2P this session.
2. **Rapier couch and 5-floor stairwell, doors 1A..5A, WIN at floor 5: 6.** The switchbacks, pink railings and landings render. The `floor` 3 and `floor` 5 sheet cells both show doors labelled "1A", so the numbering is not 1A..5A. In those two cells the couch is not in frame at all, because `setState` floor moves the camera but not the couch. The WIN banner shows at floor 5 ("FLOOR 5/5 · HOME!", "0:00.0 · 0 crashes"). Floor 5 was set directly; I did not check whether the WIN also fires early at floor 4.
3. **Tumble and ragdoll with a comic burst: 7.** No tumble happened in this short run. Judge 47 saw `crashes` 1 and a `rag` state with an OOF! burst within 7 s. I did not recheck it this session.
4. **HUD: 8.** `FLOOR 1/5`, the timer, `TILT 24°` and the grips chips show in printed type, with 0 overlap and 0 cut off.
5. **Riso look: 8.** The picture has five inks, halftone dots, grain and navy outlines. `look` still reports "postpass" at 100% with fine detail 43.7. That is the intended post-pass, but it is dense.
6. **Orthographic cutaway camera: 7.** At floor 1 the camera is better after the half-height change from 2.9 to 3.4. The couch, P1 and Buddy are in frame. The floor 3 and floor 5 cells show the stairs, but not the couch, because it was not moved there.
7. **Toy hoodie characters and puffy couch: 7.** The pink couch has cushions and feet, P1 is a teal hoodie and Buddy is a yellow one. The two bodies overlap into one blob at the stair foot, so Buddy's face and P1's hood are hard to tell apart.
8. **Comic bursts and a lamp glow per floor: 7.** The lamps show on floor 1, and the floor 3 and 5 cells show lamps and plants. No burst was on screen in this run, and the lamp glow is faint.
9. **`window.__game` and one `index.html` with vendor: 7.** `__game` returns its full state and there are no console errors. `look` still says "Subject: couch drew no pixel".

**Faults: 6.** `perf` gave a 120 ms median frame, but this is SwiftShader (the host load of 2.1 is low), so that is not a fault. The `Subject: couch drew no pixel` line is still wrong, since the "postpass" quad covers 100% of the screen. The wrong door labels are a content fault.

**Next:**
1. Number the doors 1A..5A (new). Each floor's door label texture should read its own floor, for example `${f}A`. Check it with `look` sheet at `floor` 1..5, where the doors should read 1A, 2A, 3A, 4A and 5A.
2. Make `setState({floor:n})` also place the couch and both players on that floor (new). Then show a sheet at floors 2, 4 and 5 with the couch visible. Confirm the camera follows and that WIN does not appear at floor 4. One `interact` with `state:{floor:4}` and `expect` for `won` false would show it.
3. Make the subject resolve in `look` (asked again). Name the couch group `couch`, or expose a `subject` mesh that the post pass draws through, so a plain `look` reports "couch drew N px". Also lower the grain contrast so the "postpass" Surface line drops below about 30 fine detail.

SCORE: 7.0
