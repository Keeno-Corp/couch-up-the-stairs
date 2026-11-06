The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 49
**Did** The slate patch was the scene `background` (0x3a4a66 in `stage(...)`), not a floor material: now 0x8a7556 (warm brown). Added `setState({floor:n})`: puts the couch at (-2.2, H*(n-1)+.9, .2) and both players beside it, zero velocities.
**Saw** Frame-0 `look`: no blue in the hue list (orange 64%, yellow 21%, grey 7%, red 5%); sample [100,450] = #8a7556. `setState {floor:5}` then 30 frames: `won` true, `div#win` shows "WIN!" over the whole canvas with confetti `sparks`, console clean, `Never visible` none. Timer on WIN read 0:00.0 because the timer had not run (setState jump), not checked whether it stops in normal play. Orange over objects still 60%. `perf`, 2P not run. The look flags a shared face plane at z=-1.60 between `merged` and a `stairwell` box (back side only).
**Next** 1) Lower orange share: lighten `merged` and treads to a beige-grey, tone the couch a little. 2) Dust puffs plus a `shake` at the slip (the slip branch has `sparks` and `shk.kick(.8)` already; make the puffs bigger and visible). 3) Recolour the wall's olive band to a warmer tone and check floors 2 to 5 mid-play.
**Open** Wall on floors 2 to 5 mid-play unchecked. The win confetti is dense and covers the picture; thin it.

### Judge 49

**Judge 49 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** Holding Space+D for 120 frames gives `grips` P1 slot 3 and Buddy slot 2, `thuds` 1, and the sounds grunt and couchThud. `timer` runs and `tilt` reads 1.77. The `div#grips` text goes to "HOLDING" for both, and the couch moves up the stairs. I did not run the slip or 2P this session.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 7.** `setState {floor:5}` now gives `won` true and `div#win` "WIN!" with the door, the rails, `merged` and the couch behind it. The treads, risers and landings in `merged` and `stairwell` are still flat brown planks. WIN is only reached by teleport, and I did not play it through normally. The win timer reads 0:01.8 with "0 crashes".
3. **Slide-back/tumble ragdoll, get up: 6.** Not replayed this session. Last verdict: Buddy goes to `rag` and recovers, and the slip shows only `sparks`, with no dust. After the WIN jump the toast "WHOA! Lost grip!" still shows on top of "WIN!", which is a clash.
4. **HUD: 8.** `div#tl`, `div#tilt`, `div#grips`, `div#toast` and `div#win` have 0 overlap and 0 cut off. The "Floor 5/5 · HOME!" label updates. The toast sits behind the banner text and reads as clutter.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** The slate patch is gone: [100,450] is #8a7556. Orange over objects is 60 to 63%, against the 55% target. The wall's olive band with its dark blobs is murky and looks like a camouflage pattern. The red P1 and green Buddy match CHARACTERS.md and read clearly. The couch's subject contrast is good at 54% against 39% around it, but it drops to 37% against 31% in the WIN frame.
6. **`window.__game` and one index.html: 8.** `describe` works, the page starts playing on load, and `setState({floor})` now moves the couch and players.
7. **Faults: 7.** The console is clean and `Never visible` is none. `perf` is 81 ms, 116 draw calls and 20.5k triangles on a software renderer (host load 1.6), so the frame time is not a signal. `Surfaces:` flags a shared face plane at z=-1.60 between `merged` and a `stairwell` box, on faces turned away from the camera. The WIN confetti `sparks` are dense and blur the whole picture at 3.7%.

**Next:**
1. **Lower the orange share and warm up the walls (asked again).** Tone the orange `couch` down a little. Make `merged` and the treads a mid beige-grey. Change the wall's olive band with the dark blobs to a warm tan with fainter blobs. Check: a frame-0 `look` reads orange over objects under 55% and the olive band no longer reads as camouflage.
2. **Dust puffs and a stronger shake at the slip (asked again).** On `slips` increment, spawn larger, longer-lived dust puffs (greyish-beige, 0.5 to 1 s) at the couch and players, alongside the existing `sparks` and `shk.kick`. Check: the Space+D `interact` with `look: true` after the slip shows puffs beside Buddy's `rag`.
3. **Clean up the WIN screen.** Clear `div#toast` when `won` is set. Cut the confetti to about a third of its count, in coloured pieces that fall, so the couch and door stay readable. Also fix the z=-1.60 coplanar face by moving that `stairwell` box 0.001 off the plane. Check: the `{state:{floor:5}}` `interact` with `look: true` shows no toast, a thinner confetti layer, and no `Surfaces:` line.

SCORE: 7.0
