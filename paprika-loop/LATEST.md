The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

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

## Iteration 12
**Did** Diagnosis only; no change to `index.html` (a y-rescue/teleport of `couchBody` to the carriers' mean was tried and reverted: it did not help).
**Saw** Held Space+D: the stop at frame 373 is expected. P1 reaches x 4.81 on the mid landing and pushes into the wall, while the route assist keeps carrying `couch` onto the F2 flight (`couchIdx` 20, couch y 5.03 against players y 2.7, Buddy `cI` 20 vs `myI` 10). So the "stuck above the carriers" is a test-input artefact plus an assist with no leash in y. Playing D for 230 frames, then A: floor 2 at f314, `couch` y 4.6 while P1 is at y 2.72 and low 0.56 at f382 (P1 drops off the flight: `players.0.pos.y` goes 2.96 → 0.56). Buddy gripping at x 4.67, y 3.53; `crashes` 0. Perf, win and tumble not run.
**Next** 1) Leash the assist in `simStep` (the "route assist" block): cap tg.y at the mean carrier y + .9 and slow the couch to 0 when any gripper is more than 1.5 from it in y; test with D until x≈4.5, then A, not held D. 2) Find why P1 falls from y 2.96 to 0.56 at about f382 on the F2 flight (railing or gap?). 3) Then the tumble clip, WIN banner and confetti, and merging `stairwell` boxes.
**Open** Win not verified. Held-D in a playtest is not a valid climb; use D then A. Tumble clip and enlarged HUD still undone.
