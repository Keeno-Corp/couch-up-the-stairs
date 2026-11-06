**Judge 13**

1. **Plays as DESIGN.md's Core loop and Controls say: 6.** I held Space, then D for 230 frames, then A for 400. `floor` stayed at 1 for all 600 frames, and the `couch` stopped at frame 614 at y 2.38, so the carry is stalled, not climbing. P1 ends at y 1.06 with "P1: free" and Buddy holding. `crashes` went 0→1 at f379. I did not test 2P or R.
2. **Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A, WIN: 6.** Door "A", the railings and the `stairwell` flights are there. I never got past floor 1, and WIN is still unverified (`won` false).
3. **Slide-back/tumble knocks players into ragdoll, they get up; clip in the first minute: 4.** `slips` is 1 and `thuds` 1, with sounds (yelp, couchThud), but at the end both players are in state "stand". No ragdolled hood was visible, so the clip is still not forced or readable.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner: 6.** `div#tl` (Floor 1/5 and the timer), `div#tilt` and `div#grips` are present, with no overlap or cut-off. The text is small and no WIN banner was seen.
5. **Looks as LOOK.md says, characters match CHARACTERS.md: 7.** `Subject:` gives `couch` 14% (above the 10% check), saturation 74%, 0% blown out, 0% near black. The orange `couch` against the red and green hoods reads well, and the framing is lit with no dark slab. `Stands out` shows only 0.21 edge contrast, and `look` reports two `stairwell` boxes sharing a face at x=-3.00.
6. **`window.__game` describe/observe/act/setState, one index.html, no build: 8.** `describe` returns the name, stack, units and keys. The page loads in 0.2 s with no console errors.
7. **Faults: 6.** `perf` gave 115.9 ms a frame on a software renderer at host load 2.4, which says nothing about a GPU. It counted 301 draw calls and 21k triangles. `look` says `leftWall` and `rightWall` are "Never visible" although they are in view. The carry stalls on the first flight.

**Next:**
1. **The carry stalls on the F1 flight (new, from the leash).** In the play above the couch stops at y 2.38, x 3.75 with `speed` 0.13 and `floor` never reaches 2. The leash scales speed to 0 once the couch is 1.5–2.3 m off the carriers' mean y, and P1 (y 1.06) has dropped while Buddy is at y 1.94. Run `interact` with `trace` on `couch.pos.y`, `players.0.pos.y` and `players.1.pos.y`, and loosen `dyMax` or make P1 follow the stairs. The check is a held Space+A play that reaches `floor` 2 within 900 frames.
2. **Readable tumble clip (asked again).** Force Buddy to slip at the first turn, then ragdoll that player. Add a dust `burst`, `shake`, slow-motion and a "WHOOPS" pop. The check is `look` `sheet` at the slip frame showing a ragdolled hood.
3. **Full win run, then a big WIN banner with confetti, a larger HUD, and static `stairwell` boxes merged with `instances`.** Run `interact` with `until: {won: true}` and report the result. The check is `perf` showing draw calls well under 301.

SCORE: 6.1
