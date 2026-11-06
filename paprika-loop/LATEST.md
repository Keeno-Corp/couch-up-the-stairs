The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 58
**Did** `knock()`: three tan dust puffs (via `sparks.emit`, colour 0xd9c7a5, life .9–1.3 s) at the knocked player's feet; `shk.kick` raised .5 -> .8. Camera x clamp (`tx`, `want`) widened from 4.8 to 6.2 so floors 3–5 show more of the flight on the right.
**Saw** `look` at start: page loads, no Lighting/Surfaces lines, no Never visible; couch 11% of frame, brightness 45%. I did not look at f3/f5, the slip frames, or run `perf`.
**Next** 1) `look` f3/f5 to confirm the crop is fixed (the clamp may not be the cause). 2) `look` at frame ~120 of a slip to check the dust is visible; enlarge it if not. 3) Fade the wall scribble/peel decals (~line 79) like `brickPatch`.
**Open** Crop fix and dust are unverified visually.

### Judge 58

**Judge 58**

I looked at `sheet` moments for f3, f5 and two slip frames, ran one 400-frame `interact` with no input, and ran `perf`. I did not play 2P. Judge 57's evidence is the only evidence for 2P and for the tumble ragdoll.

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** Solo starts on load with the red P1 and green Buddy holding the couch ("Buddy: HOLDING" in `div#grips`). Over 400 frames with no input, the couch stopped at frame 129 and tilt peaked at 10°. Floor stayed at 1, and I saw no tumble or buddy slip. I could not reproduce the clip within the first minute.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 7.** Door 2A, the rails, the landing and the `stairwell` steps read. The WIN banner shows over the f5 landing, but the couch is not in the picture (0%). The f5 camera framing is odd: the landing is a dark slab, and door 3A sits below it. The rail is still cut off at the right edge of f3 and f5, so the camera x clamp widening from 4.8 to 6.2 did not fix the crop.
3. **Slide-back/tumble ragdoll, get up: 6.** At frames 110 and 122 the `slip` looks are identical, with 0 sparks on screen. The `sparks` object is "Never visible" ("outside the view"). The tan dust puffs from `knock()` are not seen in any look, because the knock never happened in these frames.
4. **HUD: 8.** `div#tl` (Floor 1/5 and the timer), the `div#tilt` meter, `div#grips` and `div#help` all show with 0 overlap and 0 cut off. The WIN banner shows on f5.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 7.** The couch is the subject: 7.9% of the frame, brightness 52% against 38% around it, colour 71% against 37%. The red and green hooded players match CHARACTERS.md. The wall scribbles and peel decals at f3 are still hard-edged orange cut-outs, and the brick patch is fine.
6. **`window.__game` and one index.html: 8.** The state is clean and readable, the page runs on load, and there is no build.
7. **Faults: 7.** No `Lighting:` or `Surfaces:` lines and no console errors. `sparks` is "Never visible". `perf` gives 95.9 ms on SwiftShader (host load 3.8), which is not a usable signal. It shows 125 draw calls and 21.7k triangles.

**Next:**
1. **Make the first-minute tumble reliable and show the dust.** The buddy did not slip in 400 frames (about 6.7 s). Force or time the first-turn slip so `knock()` fires, then keep the dust puffs and shake visible for at least 0.5 s. Check: `interact` for about 900 frames with `trace` on `players.0.state` and `players.1.state` shows a `rag` state, and `look` right after shows tan puffs and `sparks` no longer "Never visible". (asked again)
2. **Fix the f3–f5 right-edge crop.** The rail and flight are still cut off at the right on f3 and f5. The clamp is not the cause, so shift the camera `lookAt` and position toward the stairs per floor, and check where the camera tracks the couch on a floor 3 to 5 move. Check: `look` `sheet` of `{floor:3}` and `{floor:5}` shows the full rail, and the couch is in frame on f5.
3. **Soften the wall scribble and peel decals** (~line 79). Give them the `brickPatch` radial alpha fade and a tan-shifted colour. Check: the f3 `look` shows no hard-edged saturated orange shapes on the wall, and `sample` at (100,60) and (150,90) reads close to the wall tan.

SCORE: 7.1
