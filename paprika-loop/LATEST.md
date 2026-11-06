The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 56
**Did** `mRailNear` opacity .18 -> .06 so the near rails no longer read as a grey glass band over the couch and P1 (one-line change, line 103).
**Saw** Not run through look/perf this session (short on time); no other code touched.
**Next** 1) Look at Space+D to confirm the band is gone. 2) Blend the brick patch and wall scribble decals. 3) Lighten the couch or add a rim light for brightness contrast; shift camera x toward the stairs on f3–5 to fix the right-edge crop.
**Open** Rail change unverified visually.

### Judge 56

Rail band is gone; the picture is clearer. Couch brightness gap is 10 points now.

1. **Plays as DESIGN.md's Core loop and Controls say: 8.** P1 (`players.0`) stands until frame 117, then `rag`. `slips` goes to 1 at frame 117, and `tilt` peaks at 35.6°. The sounds are grunt, yelp and oof. I did not play 2P.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 8.** Door 1A, the rails, the landing and the switchback all read. The `mRailNear` glass band is gone, so the couch is clean. I did not look at WIN or the upper floors this session.
3. **Slide-back/tumble ragdoll, get up: 8.** Both P1 and Buddy go to `rag` with X eyes, and the "WHOOPS! BUDDY SLIPPED!" toast shows. The dust puff reads as faint, speckled dots.
4. **HUD: 8.** `div#tl`, `div#tilt`, `div#grips`, `div#toast` and `div#help` show 0 overlaps and 0 cut off. The toast covers part of the wall and couch area, but it is readable.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 7.** "Stands out" gives couch brightness 53% against 43% and colour 72% against 33%. The red and green hoods match CHARACTERS.md. The brick patch and the wall scribbles still read as pasted decals, with hard outlines and a floating bright "paper" shape.
6. **`window.__game` and one index.html: 8.** The page starts playing on load. `started` is true after input, and the state is readable.
7. **Faults: 8.** There are no console errors and `Never visible` is none. There are no `Lighting:` or `Surfaces:` fault lines. `perf` gives 96.7 ms on SwiftShader (host load 2.4), which is not a usable signal. It shows 125 draw calls and 21.7k triangles.

**Next:**
1. **Blend the wall decor.** Fade the brick patch edge into the plaster with a rough, irregular, plaster-coloured border. Tone the scribble and peel decals down toward the wall colour, since they currently read as hard-edged orange cut-outs. Check: the f3 `look` shows the brick patch without a hard outline.
2. **Fix the right-edge crop of the flight on f3–5 and check the upper floors.** Shift the camera x toward the stairs there, then run a `look` `sheet` of `{floor:3}`, `{floor:5}` and the WIN moment. Check: the full flight is visible, and `div#tl` and the WIN banner don't overlap anything.
3. **Make the slip dust and the knock-over more readable.** Make the puff at the slip point a larger, short-lived burst that fades quickly, with a small camera shake. Check: a `look` at frame 117 shows a puff cloud at the players' feet, and `feel` on the slip shows a shake.

SCORE: 7.9
