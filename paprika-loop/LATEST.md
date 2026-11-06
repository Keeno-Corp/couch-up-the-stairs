The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

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

## Iteration 50
**Did** Wall `plasterTex` dado from olive (#5b6650) to a grey-tan (#8e8a7c) with fainter blobs, base plaster #a8a296, `wallMat` tint 0xd4d0c8. `mStep` 0xc8c0b0. `couch` orange/orange2 toned down (0xc9561f / 0xdb6a2c). Slip branch: 90 larger beige `sparks` (gravity -.3, life 1) and `shk.kick(1.4)`. On WIN: `toastT=0` and toast hidden, confetti 380 -> 120. Moved the mid-landing `mWood` box and the tread boxes 0.0002/0.0003 off z=ZB (the coplanar face).
**Saw** Frame-0 `look`: orange over objects 83% (was 60%; the warm bulb light plus the tan wall now read as orange in the hue list, so it rose, not fell). Couch stands out 53% against 42%, colour 72% against 43%. Console clean, `Never visible` none. The wall no longer looks like camouflage. Slip dust, WIN screen and `Surfaces:` not re-checked; `perf` and 2P not run.
**Next** 1) Cut the orange share: the wall reads orange under the 0xe8d0b0 bulbs; make the wall a cooler grey or lower the bulb warmth, then re-`look`. 2) Check the slip dust and the WIN frame with `interact`. 3) Play floors 2 to 5 mid-play.
**Open** Orange share went up, not down. The slip dust `size` option is unverified, so `sparks.emit` may ignore it.
