The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 15

**Judge 15 verdict**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** I held Space, then D for 200 frames and A for 700. `floor` reached 2 (`couch` y 4.88) by about 40 s, and `won` stayed false after another 1500 frames. In the first 600 frames `tilt` peaked at 58° at f268. `players.0.pos.y` went 2.32 (f202) → 0.56 (f380) → 0.72 (f591), so P1 still falls back on the F1→F2 flight. I did not run 2P or R.
2. **Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN: 6.** Door 1A, the plant, the railings and the `stairwell` flights show. `rightWall` is listed "Never visible" although it is in view. The WIN landing is unverified because floor 3 was never reached.
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 7.** Held Space with no steering, `slips` went 0→1 at f142. The Buddy ragdoll (`state` "rag", X-eyes, "*KO*") appeared with the `sparks` dust and a "WHOOPS! BUDDY SLIPPED!" toast, and the sounds were grunt, grunt, yelp. It reads in the look. The slip comes at f142, not at the first turn, so it still depends on the input. There is no slow-motion, and I did not see the get-up.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 7.** `div#tl` (Floor 1/5, 0:02.4), `div#tilt` (TILT 7° bar), `div#grips` and `div#toast` have 0 overlap and nothing cut off. The text in `div#tl` and `div#help` is small. The WIN banner is unseen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 7.** `couch` takes 12% of the picture, 74% saturation, 0% blown out, 0% near black. Edge contrast is 0.202 and subject brightness is 59% against 37% around it. The orange couch against the green Buddy and red P1 reads well. The tilted camera and railing clutter reduce clarity. `look` reports two `stairwell` boxes sharing a face at x=-3.00.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` and `observe` work, the page loads in 0.1 s and the console is clean. `observe` lacks a `couch.tilt` path, only a top-level `tilt`.
7. **Faults: 6.** `perf` gave 121 ms a frame on SwiftShader at host load 1.9, which is noise. It counted 301 draw calls and 21k triangles, and the many `stairwell` boxes are not merged. P1's fall on the F1→F2 flight and the 58° tilt peak are real gameplay faults.

**Next:**
1. **P1 falls on the F1→F2 flight, and tilt hits 58° (asked again).** Run `interact` with `trace` on `players.0.pos.y`, `couch.pos.y` and `tilt` over the climb. Find why P1's y drops from 2.3 to 0.56, for example a missing collider at the first landing or the couch shoving P1, and fix it. Also add a tilt limiter or auto-level assist. It is done when `players.0.pos.y` never drops more than 1 m while `floor` rises and `tilt` stays under 45°.
2. **Verify a full win and make the climb completable.** Floor 2 took 40 s and floor 3 was not reached. Make the AI buddy carry its share from `grips` slot 2 onward. Then run `interact` with `until: {won: true}`, `max` 3000. It is done when `won` is true and the WIN banner with the `sparks` confetti shows in `look`. Report that look.
3. **Add slow-motion and a forced slip at the first turn.** Add 0.3 s of slow-motion at the slip with a camera nudge. Trigger Buddy's slip at the first switchback so it does not depend on input. Then merge the static `stairwell` boxes with `instances` and move the near railings out of the camera line to the couch. It is done when `look` at the slip frame shows the ragdoll without railing clutter and `perf` shows draw calls well under 301.

SCORE: 6.7

## Iteration 16
**Did** Traced F1→F2 with `interact` (Space held, D 200f, A 500f). Tried an extra full-axis leveling torque on `couchBody` in `simStep` when `tiltDeg` > 25; it made things worse, so I reverted it with `git checkout -- index.html`. No code change this session.
**Saw** Baseline run: `players.0.pos.y` 0.9 → low 0.58 (f34) → peak 3.38 (f553); `couch.pos.y` reached 4.45, `floor` 2 at f587; `tilt` peaked 59.7 at f312, which is right after the slip and crash (`slips` 1, `crashes` 1). With the torque: tilt still peaked at 61.5, the grips dropped, `floor` stayed at 1 and the sound log spammed grunt/yelp ~700 times (re-grab/release loop). The earlier "P1 falls to 0.56" is not a fall in this run; P1 climbed to 3.3.
**Next** 1) Find what makes tilt spike at f312 (the Buddy slip `release(ai)` + `tumbleKick`, probably an impulse on `couchBody`); cap that impulse or hold `assisting` through the slip; 2) rate-limit the grunt/yelp sounds (a release/re-grab loop spams them); 3) run `until: {won: true}`, merge the `stairwell` boxes, add slow-mo at the slip.
**Open** Tilt peak ~60° after the slip; win unverified; slip look unplayed.
