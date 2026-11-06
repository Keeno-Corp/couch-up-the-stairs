The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 89

The page looks good, and it's close to the brief. The burst is smaller now and the couch is clear in frame. WIN wasn't reached in 1500 frames, but floor 2 was reached by about 26 s.

**Judge 89**

1. Plays as DESIGN.md's Core loop and Controls say: 7. `P1` and `Buddy` both show `gripping`, `thuds` was 4 and `slips` 2, but only floor 2 was reached in 1500 frames of simple D-hold.
2. Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A; WIN at floor 5: 7. The `1A` door and pink railing show. `won` was still false, so the real climb is unchecked.
3. Tumble and ragdoll, with a clip moment in the first minute: 8. A `WHOOPS!` burst fired, `slips` was 2 and `oof` and `yelp` sounds played.
4. HUD: timer, Floor n/5, tilt meter, WIN banner, printed type: 8. `div#tl`, `div#tilt`, `div#grips` and `div#toast` show with no overlap or cut-off. The WIN banner wasn't seen.
5. Risograph look as LOOK.md says: 8. Halftone dots, misregistered offset on the toast text, and the teal, yellow, pink, navy and cream inks all read in the look.
6. Orthographic cutaway camera that follows floor by floor: 7. `cam.y` was 8.09 on floor 2 and the stairs and couch stay in frame. The top of the frame cuts off the floor above.
7. Toy hoodie characters and puffy pink couch match CHARACTERS.md and the sheets: 7. The cushioned couch with legs and the egg-shaped hoodie mover read well. Both could still be bigger.
8. Comic bursts and a lamp glow per floor: 7. The DOM burst is no longer covering the couch, and the floor lamps show. The lamp glow halo is faint.
9. `window.__game`, starts on load, one index.html + import map + vendor/: 8. `describe`, `observe` and `act` all answered, and the page starts without input.

**Faults: 7.** There were no console errors. `perf` gave 129 ms a frame on a SwiftShader software renderer, which is noise. It did show 192 draw calls and 45k triangles. The `Subject:` line said "couch drew no pixel", which looks like a naming mismatch, since the couch is plainly on screen.

**Next:**
1. Reach WIN with a real climb. Use `interact` with a scripted `D` and `W` plus Space hold, and `trace` on `floor` and `couch.pos.y` over 1800 frames. Find what stalls the couch before floor 3, then check the WIN card shows at floor 5 and not on floor 4. A WIN card reached by real play shows `won: true`.
2. Make the couch and movers about 15% bigger, and name the couch mesh so `look`'s `Subject:` line lists its parts instead of "drew no pixel".
3. Cut the 192 draw calls by instancing the halftone dots and railing posts with `instances`, and add a soft glow halo per lamp. `look` with `sample` on a lamp shade should read brighter than the wall beside it.

SCORE: 7.4

## Iteration 95
**Did** No code change: about 5 minutes left, so only read LATEST.md and the git log.
**Saw** Nothing measured; the page was not opened. Last judge (89) scored 7.4: no console errors, 192 draw calls, 45k triangles, floor 2 reached in 1500 frames.
**Next** Run a scripted D, W and Space climb with `until: {won: true}`, tracing `floor` and `couch.pos.y`, to find the stall before floor 3. Then scale the couch and movers about 15% (visuals and colliders together). After that, instance the dots and railing posts and add a lamp halo.
**Open** WIN, 2P and perf are unverified. The `Subject:` line's "couch drew no pixel" message is unexplained; the couch Group is already named `couch`.
