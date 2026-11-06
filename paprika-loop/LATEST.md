The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 11
**Did** `updateCamera`: `camTarget` now aims at the mean of `couch` and the non-ragdolled players (x clamp .3..4.8, y +.5); `camOff` pulls back by .5/.6 × the player-to-couch height spread (max 3). `level` (`stairwell`) children are hidden when their bbox min y > camTarget.y + .4 and wider than .3 (bboxes cached in `level.userData.bb`).
**Saw** Held Space+D `look` sheet: `couch` 13% at f30, 11% at f200 (was 6%), 2.2% at f600. At f30 and f200 both hoods are in view and there is no dark slab. At f600 the couch is at the far top, the hoods are in the top right, and a dark flight still covers the left. Not run: perf, win, tumble clip.
**Next** 1) At f600 the couch is 2.2%: the couch is still stuck above the carriers at the switchback (the stop at about frame 373), so find why and re-run the win. 2) Readable tumble clip (forced slip, dust, shake, slow-motion). 3) WIN banner and confetti, and merging static `stairwell` boxes to cut draw calls.
**Open** The hide threshold may pop floor geometry visibly on the stairs. Win not verified.

### Judge 11

**Judge 11**

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** Solo starts on load. Holding `Space`+`D`, P1 and Buddy carry the `couch`. The HUD reads Floor 1/5 at f30 and f200 and Floor 2/5 at f400 and f600, and the timer runs. I did not test 2P or R. At f400 and f600 the `couch` is off screen and only the hoods show, so the carry is not readable.
2. **Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN: 7.** Door 1A shows at f30 and f200 and door 1B at f400 and f600. The railings, brick `backWall`, `leftWall` and `rightWall` are there. The climb to floor 2 works. I did not reach WIN, and Iteration 11 did not verify it either.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 4.** No ragdoll or knocked-over player shows in any of the four moments. At f200 Buddy reads "free" for a moment but stays upright. The clip is still neither forced nor readable.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 6.** The timer, "Floor n/5", the TILT bar and the P1/Buddy grip lines are all present. They are tiny, and the WIN banner was not seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 6.** The `Subject:` line gives `couch` 13% at f30 and 11% at f200, which meet the 10% check, but 1.5% at f400 and 2.1% at f600. Saturation is 72–74%, nothing is blown out, and the red and green hoods against the orange `couch` read well. At f400 and f600 a dark `stairwell` flight slab still covers the left half and the `couch` is hidden. The hide threshold has not fixed that slab.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` returns the name, stack, units and key map. The page loads in 0.1 s with no console errors.
7. **Faults: 6.** `perf` gave 128.6 ms a frame on a software renderer at host load 6.6, so the time is noise. It counted 301 draw calls (down from 388) and 21k triangles. The camera is still occluded by `stairwell` geometry after the first turn, and the `couch` is lost from view there.

**Next:**
1. **The `couch` is lost after the first switchback (asked again).** At f400 and f600 it is under 3%, with the hoods at the frame edge and a dark flight covering the left. Call `observe` at f400 to find where `couch` sits relative to the players. If it is stuck above them (the frame-373 stop), fix the physics or grip so it stays between them. Also hide the whole flight above the carriers (hide by flight index, not by bbox), and make `camTarget` follow `couch.position` directly during turns. The check is `look` `sheet` at f400 and f600 of the held Space+D play: `couch` 10% or more and no dark slab.
2. **Readable tumble clip (asked again, still undone).** Force Buddy to slip at the first turn around f70–250, then ragdoll that player. Add dust `burst`, `shake`, a brief slow-motion hold and a "WHOOPS" HUD pop. The check is a `look` `sheet` at the slip frame showing a ragdolled hood, and `feel` on the slip showing shake.
3. **Full win run, then a big WIN banner with confetti.** Run an `interact` with `until: {won: true}` and report the result. Add a large centred WIN banner and a confetti `burst`. Enlarge the HUD text, and merge the static `stairwell` boxes with `instances` so `perf` draw calls fall well under 301.

SCORE: 6.3
