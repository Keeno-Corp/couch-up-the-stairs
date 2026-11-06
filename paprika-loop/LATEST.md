The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 50
**Did** Wall `plasterTex` dado from olive (#5b6650) to a grey-tan (#8e8a7c) with fainter blobs, base plaster #a8a296, `wallMat` tint 0xd4d0c8. `mStep` 0xc8c0b0. `couch` orange/orange2 toned down (0xc9561f / 0xdb6a2c). Slip branch: 90 larger beige `sparks` (gravity -.3, life 1) and `shk.kick(1.4)`. On WIN: `toastT=0` and toast hidden, confetti 380 -> 120. Moved the mid-landing `mWood` box and the tread boxes 0.0002/0.0003 off z=ZB (the coplanar face).
**Saw** Frame-0 `look`: orange over objects 83% (was 60%; the warm bulb light plus the tan wall now read as orange in the hue list, so it rose, not fell). Couch stands out 53% against 42%, colour 72% against 43%. Console clean, `Never visible` none. The wall no longer looks like camouflage. Slip dust, WIN screen and `Surfaces:` not re-checked; `perf` and 2P not run.
**Next** 1) Cut the orange share: the wall reads orange under the 0xe8d0b0 bulbs; make the wall a cooler grey or lower the bulb warmth, then re-`look`. 2) Check the slip dust and the WIN frame with `interact`. 3) Play floors 2 to 5 mid-play.
**Open** Orange share went up, not down. The slip dust `size` option is unverified, so `sparks.emit` may ignore it.

### Judge 50

**Judge 50 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** Holding Space+D for 240 frames puts `grips` at P1 slot 0 and Buddy slot 1, with `timer` 3.75. The couch travels 5.66 units. `slips` went 0→1 at frame 117, and `tilt` peaked at 31° at frame 222. The sounds are grunt and yelp. `div#grips` reads "HOLDING". I did not run 2P.
2. **Rapier couch and 5-floor stairwell, doors 1A.., WIN: 7.** `setState {floor:5}` gives `won` true and `div#win` "WIN!" with the door and rails behind it. In the floor-1 look the `merged` treads and risers fill 68% of the frame as flat brown slabs, and they hide the couch. The z=-1.60 `Surfaces:` fault between `merged` and a `stairwell` box is still reported.
3. **Slide-back/tumble ragdoll, get up: 6.** The slip happened at frame 117, but both players read `stand` at the end. I did not see a `rag` state or the dust puffs this session, so they are unverified.
4. **HUD: 6.** There are 0 overlaps and 0 cut off. The WIN screen still shows `div#toast` "WHOA! Lost grip!" over "WIN!" at [405,196,874,282]. The builder's Did said it hid the toast on win, but that did not work in this teleport case.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 5.** Orange over objects is 83%, against the 55% target. This is worse than last session's 60 to 63%. The frame-0 wall is now a grey-tan that reads as orange under the bulb light. The red P1 and green Buddy are clear. The couch stands out at 53% against 42% at frame 0, but in the WIN frame it is 35% against 33% with edge contrast 0.09.
6. **`window.__game` and one index.html: 8.** `describe` works, the page starts playing on load, and `setState` and `act` work.
7. **Faults: 6.** The console is clean and `Never visible` is none. `perf` is 80 ms, 116 draw calls and 20.5k triangles on a software renderer, so the frame time is not a signal. The `Surfaces:` face plane at z=-1.60 is still flagged. The WIN confetti `sparks` still cover 4% of the frame as blurry spots. The `merged` stair block is a visual fault (see item 2).

**Next:**
1. **Cut the orange share and keep the stairs from hiding the couch (asked again).** Make `wallMat` and `backWall` a neutral cool grey-blue, so the orange is only the couch. Lower the warm bulb tint (0xe8d0b0) toward white. Check: a frame-0 `look` reads orange over objects under 55%, and the couch stays above 50% against 42% around it. In the Space+D `look`, the `merged` treads (68% of the frame) should be a lighter grey-beige with a visible stair edge, and should stop covering the couch. Move or fade the near `merged` flight (or raise the camera) when it comes between the camera and the couch.
2. **Make the WIN screen clean (asked again).** Find why `div#toast` stays visible after `won` is set. Probably the toast is re-shown each frame by the slip or grip code, so guard that code with `!won`, or set `display:none` in the win handler. Replace the round confetti blobs in `sparks` (about 120) with small coloured, falling quads. Move the `stairwell` box off the z=-1.60 plane by 0.001. Check: the `{state:{floor:5}}` `interact` with `look: true` shows no toast, no `Surfaces:` line, and a couch that stands out against the wall by more than 0.15 edge contrast.
3. **Verify the slip clip and the dust (asked again).** Run Space+D `interact` with `trace:["players.1.state"]`, then `look` at frames 117 to 135. Make the slip produce a visible `rag` on a player and a beige dust cloud beside the couch. Check that `sparks.emit` honours the `size` option. If it doesn't, scale up a dedicated `dust` sprite pool instead. The `look` after the slip should show puffs next to the ragdolled player.

SCORE: 6.4
