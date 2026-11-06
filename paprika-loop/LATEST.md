The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 68

**Judge 68**

I ran one 500-frame solo `interact` with D and Space held, with a trace and a look. I took a `{floor:5}` sheet and ran `perf` once. I did not play 2P or run `feel`.

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** `floor` 2 now arrives at frame 280. It was 369 last session. P1 and Buddy are both `gripping`, and P1 ragged twice (frames 118 and 324) and got up each time. At frame 500 P1 is at y=3.33 and `couch.pos.y` is 5.21, a gap of about 1.9 m. The target was under 1.5 m. The `couch` stops at frame 461 with `tilt` 40°, and the Buddy (y=4.88) carries it mostly alone.
2. **Rapier couch and 5-floor stairwell, doors 1A..5A, WIN: 8.** Door 1A, door 2A, the railings and the landings show. The `couch` turned 187° at the switchback. The win sheet shows door 4A and "Floor 5/5 · HOME!".
3. **Slide-back/tumble ragdoll, get up: 7.** `slips` is 2 and `thuds` is 1. The sounds grunt, yelp, oof and couchThud fire. The tumble is early, but the couch is small in the frame while it happens.
4. **HUD: 8.** `div#tl`, `div#tilt`, `div#grips` and `div#help` show with 0 overlap and 0 cut off. The win banner is now large, gold "WIN!" with the crash count under it, and it reads well. The "Floor 5/5" line stays small. The win text and the confetti overlap the couch.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** The win moment is good: the red and green hoods read clearly and the confetti shows. Mid-climb is still weak. The `couch` is 7.3% of the picture and `player*` 1.6%. Brown `stairwell` steps fill the right half. The red player is not visible in the mid-climb picture. At the win moment the `couch` is only 3.8%. Surfaces still flags two `stairwell` boxes sharing the face plane z = -1.60.
6. **`window.__game` and one index.html: 8.** `observe` works and returns `dbg`, `grips` and `players`. The page starts playing on load. There is no build.
7. **Faults: 7.** There were no console errors and no `Never visible` object. `perf` read 103 ms a frame, 139 draw calls and 22.1k triangles on SwiftShader, which is no budget signal (host load 2.7). The z = -1.60 coplanar faces are minor.

**Next:**
1. **Show the couch and both players mid-climb (asked again).** Fade or lower the stair-block boxes in front of the `couch`, and pull the camera in on the couch and both players, for example by framing the midpoint of the P1, Buddy and `couch` positions. After D and Space held for 500 frames, `look` should list `couch` above 8% and `player*` above 2%, with the red player on screen. Today it shows 7.3% and 1.6%.
2. **Close the P1 lag and the stop at frame 461 (asked again).** P1 is still about 1.9 m below the `couch`, and the couch stalls at tilt 40°. Re-grab P1 faster after a rag and give the AI buddy more lift once the tilt passes about 30°. The same 500-frame `interact` should end with |P1 y − couch y| under 1.5 m and `couch.speed` above 0 after frame 461.
3. **Add a `feel` pass on the win and the tumble.** Run `feel` after `{state:{floor:5}}` and check that the shake and the win jingle land. Frame the win camera on the couch so it is above 8% of the picture, since it is 3.8% now. Move one of the two coplanar `stairwell` boxes 0.001 m off z = -1.60.

SCORE: 7.1

## Iteration 69
**Did** `updateCamera`: pulled the camera in (`camOff.z` 8.4→6.4 + spread*.6, floor>=3 bonus 1.6→1.0; `camOff.y` 3.4 + spread*.3) and weighted the framing toward the couch (0.6 vs 0.4) so `couch` and players are bigger mid-climb.
**Saw** Not run (no look/perf this session); only the edit applied.
**Next** 1) `look` after D+Space 500 frames: check couch >8%, player* >2%, red player visible. 2) P1 lag / stall at frame 461 (tilt 40°). 3) `feel` on win; move one coplanar stairwell box off z=-1.60 by 0.001.
**Open** Camera change unverified; may crop the players when spread is large.
