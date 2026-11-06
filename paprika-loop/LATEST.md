The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 69
**Did** `updateCamera`: pulled the camera in (`camOff.z` 8.4→6.4 + spread*.6, floor>=3 bonus 1.6→1.0; `camOff.y` 3.4 + spread*.3) and weighted the framing toward the couch (0.6 vs 0.4) so `couch` and players are bigger mid-climb.
**Saw** Not run (no look/perf this session); only the edit applied.
**Next** 1) `look` after D+Space 500 frames: check couch >8%, player* >2%, red player visible. 2) P1 lag / stall at frame 461 (tilt 40°). 3) `feel` on win; move one coplanar stairwell box off z=-1.60 by 0.001.
**Open** Camera change unverified; may crop the players when spread is large.

### Judge 69

**Judge 69**

I ran one 500-frame solo `interact` with D and Space held, with a trace and a look, and ran `perf` once. I did not play 2P, take a `sheet` or run `feel`.

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** `floor` 2 arrives at frame 280. `slips` reached 2 at frame 324. P1 and Buddy are both `gripping`. P1 is at y=3.33 and `couch.pos.y` is 5.21, a gap of about 1.9 m. That is unchanged from last session. The `couch` stops at frame 461 with `tilt` 40° and `speed` 0.22 at frame 495. Buddy (y=4.88) carries it mostly alone. P1 lagging and the stall are both asked again.
2. **Rapier couch and 5-floor stairwell, doors 1A..5A, WIN: 8.** The `couch` turned 187° at the switchback. The railings and the landings show. The shot shows the `stairwell` steps, and I did not take a win look this session.
3. **Slide-back/tumble ragdoll, get up: 7.** `slips` is 2 and `thuds` is 1. Sounds fire: grunt, yelp, oof and couchThud. The tumble happens early, in the first 5 s. The wider camera still puts the players small in the frame.
4. **HUD: 8.** `div#tl`, `div#tilt`, `div#grips` and `div#help` show with 0 overlap and 0 cut off. The `div#tl` timer sits over the Floor line and is a little cramped, though still readable.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.5.** The camera change worked. The `couch` is now 12% of the picture, up from 7.3%, and `player*` is 2.4%, up from 1.6%. The orange couch stands out, with colour 65% against 29% around it. The green Buddy reads well. The red P1 is not on screen, because the shot is framed on the couch and Buddy. The brown `stairwell` blocks still fill the right third. The couch is cropped at the left edge, at x=57.
6. **`window.__game` and one index.html: 8.** `observe` returns `dbg`, `grips` and `players`. The page starts playing on load. There is no build.
7. **Faults: 7.** There were no console errors and no `Never visible` object. `perf` read 115 ms a frame, 132 draw calls and 21.6k triangles. That is SwiftShader (host load 2.9), so it is no budget signal. The `couch` is not framed with both players. `observe` has no `players.0.y` path, though `players[0].pos.y` works.

**Next:**
1. **Keep P1 in the shot and close the P1 lag and the stall at frame 461 (asked again).** Include P1's position in the `updateCamera` framing. P1 is the player the user controls and is currently off screen. In the same pass, re-grab P1 faster after a rag, and give the AI buddy more lift once `tilt` passes about 30°. The same 500-frame `interact` should end with |P1 y − couch y| under 1.5 m, `couch.speed` above 0 after frame 461, and a red hood visible in the look. A `look` with `sample` at the red-hood pixels would show it.
2. **Frame the couch inside the screen (new).** Add a left margin, or shift the camera x a bit so the couch is not cropped at x=57. Fade the `stairwell` blocks at the right that cover the picture's right third. A `look` after the same 500 frames should show the whole couch.
3. **Win and tumble `feel` pass, plus a win look (asked again).** Run `feel` after `{state:{floor:5}}` to check the shake and the jingle. Use a `look` `sheet` of `{floor:5}` to confirm the `couch` is above 8% at the win. Move one of the two coplanar `stairwell` boxes 0.001 m off z=-1.60. Expose `players.0` in `observe` to make tracing easier.

SCORE: 7.1
