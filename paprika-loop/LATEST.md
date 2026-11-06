The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 57

**Judge 57**

The brick blend is done: at f3 and f5 the `brickPatch` edge dissolves into the plaster with no outline. The wall scribbles and peel decals are still hard-edged orange cut-outs. I did not run `interact` or `feel` this session, so 2P, the AI buddy and the tumble clip are scored from the sheet and from Judge 56's evidence.

1. **Plays as DESIGN.md's Core loop and Controls say: 8.** The `start` moment shows the red P1 and green Buddy holding the couch, with "Buddy: HOLDING" in `div#grips`. The `slip` moment shows the tilt meter at 7° and the couch on a dark floor patch. I did not play 2P.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 8.** Doors 2A and 4A, the rails, the landings and the `stairwell` steps all read. The WIN banner shows ("0:00:0 · 0 crashes · Press R to haul it again") with sparks. At f3 and f5 the flight is cut off at the right edge.
3. **Slide-back/tumble ragdoll, get up: 7.** I didn't run the tumble this session. Last session's evidence is the rag state, X eyes and the toast. The `slip` look at frame 120 shows no readable dust cloud at the players' feet, so the knock-over still lacks impact.
4. **HUD: 8.** `Floor n/5`, the timer, the `TILT` meter, the grips line and the WIN banner all show and are legible. The f5 `div#tl` is dimmed behind the WIN text and the help line is tiny, but nothing overlaps.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 7.** The couch is the subject, with the orange couch at 5–10% of the frame and brightness 44–56%. The red and green hoods match CHARACTERS.md. The scribble and peel decals on the wall at f3 look like pasted, floating cut-outs. The brick patch itself now blends.
6. **`window.__game` and one index.html: 8.** The page starts playing on load, with no build and a clean state readout.
7. **Faults: 8.** There are no `Lighting:` or `Surfaces:` lines and no `Never visible` objects. `perf` gives 96.3 ms on SwiftShader, so it is not a usable signal. It shows 125 draw calls and 21.7k triangles (host load 3.7).

**Next:**
1. **Fix the right-edge crop on f3–5.** The flight and rail are cut off at the right on the f3 and f5 looks. Shift the camera x and lookAt toward the stairs on floors 3–5 (also floors 2 and 4). Check: `look` `sheet` of `{floor:3}` and `{floor:5}` shows the full flight and rail with the couch still large. (asked again)
2. **Make the slip dust and knock-over readable.** At the slip point, burst a larger dust cloud of soft, short-lived puffs, and add a `shake` of about 0.15 s on impact. Check: `look` at about frame 117–125 shows a cloud at the players' feet, and `feel` on the slip shows camera motion. (asked again)
3. **Tone down the wall scribble and peel decals.** At f3 the scribbles and peels are saturated orange cut-outs. Give them the same radial or alpha fade as `brickPatch` and shift their colour toward the wall tan. Check: the f3 `look` shows no hard-edged orange shapes on the wall.

SCORE: 7.7

## Iteration 58
**Did** `knock()`: three tan dust puffs (via `sparks.emit`, colour 0xd9c7a5, life .9–1.3 s) at the knocked player's feet; `shk.kick` raised .5 -> .8. Camera x clamp (`tx`, `want`) widened from 4.8 to 6.2 so floors 3–5 show more of the flight on the right.
**Saw** `look` at start: page loads, no Lighting/Surfaces lines, no Never visible; couch 11% of frame, brightness 45%. I did not look at f3/f5, the slip frames, or run `perf`.
**Next** 1) `look` f3/f5 to confirm the crop is fixed (the clamp may not be the cause). 2) `look` at frame ~120 of a slip to check the dust is visible; enlarge it if not. 3) Fade the wall scribble/peel decals (~line 79) like `brickPatch`.
**Open** Crop fix and dust are unverified visually.
