The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 53
**Did** Small, low-risk edits only. `#win` banner now sits at the top (flex-start, 84px, gradient scrim fading out by 40% height) so the couch and players are clear. `backWall` moved to z = ZB-.004 (behind the `stairwell` box face) to clear the z=-1.60 `Surfaces:` fault.
**Saw** Page opens, no load error. Not run: `look` on WIN, Space+D, 2P, `perf`; so the backWall move and banner are unchecked by eye.
**Next** 1) Clip whole flights (clipTop at the floor height of the flight above) so no slab edge shows; `merged` was 68%. 2) Replace round `sparks` with coloured quads for WIN confetti; check `look` with `{floor:5}`. 3) Beige dust at the slip, couch knocks P1 over too; test key 2 with Space+Enter.
**Open** backWall at ZB-.004 may sit inside the hidden `solid(... ZB-.5, ZB)` box (vis:false) so it should still render; verify with `look` for a `Surfaces:` line or a missing back wall. Confetti still round; 2P untested.

### Judge 53

**Judge 53 verdict.** I ran the solo Space+D play for 240 frames, the WIN and f3 sheet looks, a 2P hold-and-move play and `perf`. I did not check the slip dust or the WIN confetti closely.

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** In solo, `grips` are P1 slot 0 and Buddy slot 1, `timer` is 3.73 and the couch travelled 5.68. `slips` went 0→1 and `tilt` peaked at 31°. In 2P (key `2`), `grips` became P1 and P2 and the couch moved from x -1.3 to 2.87 under ArrowRight. P1 is still never knocked over.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 6.** Doors 1A and the rails show, and the f3 and WIN looks show the landing, the couch and both players. The WIN look no longer reports a `Surfaces:` fault, so the `backWall` move held. The Space+D look still has `merged` at 68% of the frame. A long brown slab edge, left by `clipTop`, still crosses the middle, with sliver treads above it.
3. **Slide-back/tumble ragdoll, get up: 7.** Buddy goes `rag` for frames 117–166 and then stands up. The first-minute clip still rests on Buddy alone, and P1 is not knocked over.
4. **HUD: 8.** `div#tl`, `div#tilt`, `div#grips` and `div#help` show 0 overlaps and 0 cut off. The WIN banner is now at the top, and the couch and both players are clear of it.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** The couch stands out at brightness 55% against 41%, with edge contrast 0.2. The red P1 and green Buddy read clearly. The washed-out `backWall`, the translucent grey panels over the landings and the cut `merged` slab keep it a first draft.
6. **`window.__game` and one index.html: 8.** The page starts playing on load, is a single index.html with no build, and `setState` with `{floor:N}` and `act` both worked in this session.
7. **Faults: 6.** The console is clean and `Never visible` is none. `perf` gives 84 ms, 116 draw calls and 20.5k triangles on SwiftShader (host load 3.0), so the frame time is no signal. The slab edge is the main visible fault. The WIN `sparks` are still round blobs.

**Next:**
1. **Hide the clipped flight's slab edge (asked again, third time).** `clipTop` still cuts `merged` at `camTarget.y+1.2`, which leaves a flat brown slab across the frame. Split `merged` per flight, so a whole flight above the camera's floor is set `visible=false`. Failing that, give those materials a transparent fade. Check: the Space+D 240-frame `interact` with `look: true` shows no horizontal brown slab edge, and `merged` is under 35% on screen.
2. **Make the tumble funnier and knock P1 over too (asked again).** Add a beige dust puff at the slip, and let the sliding couch send P1 into `rag`. Check: the Space+D `interact` with `trace:["players.0.state","players.1.state"]` shows `rag` on P1 as well.
3. **Replace the round WIN `sparks` with coloured falling quads, and clear the washed-out `backWall`.** Use small rotating red, green and yellow quads for the confetti, and give `backWall` a darker, more saturated colour. Check: the `look` sheet with `{floor:5}, frames:60` shows coloured confetti, and a `look` `sample` at the wall pixels shows more saturation than the current grey.

SCORE: 6.9
