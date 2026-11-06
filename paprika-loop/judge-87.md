**Judge 87**

I looked at the page from frame 0, a short walk with grab, and 2400 frames in. I also set `won: true`. I did not play a full 2P round or a full solo run to the end, so WIN and the first-minute tumble are unchecked this session.

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** The solo default starts on its own with `Buddy: HOLDING` and `P1: free`. The "WHOA! LOST GRIP!" caption appears at 2.9 s. By 39 s the couch is on floor 4 with the TILT meter at 7°, so the climb works. 2P and R were not exercised.
2. **Rapier couch + 5-floor stairwell, switchbacks, railings, landings, doors 1A..5A; WIN at floor 5: 7.** The pink railings, yellow stairs, and doors 1A and 4A all show. The `won:true` frame showed "FLOOR 1/5 0:00.3" and no WIN banner, so the win screen is unverified (asked again).
3. **Tumble and ragdoll, with a clip moment in the first minute: 5.** The couch reached floor 4 in 40 s with no tumble visible in my frames. The only burst seen was at start and at the `won` reload, where there is no impact.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner, printed type: 7.** The `FLOOR 4/5` card with its timer, the `TILT 7°` bar, the P1/Buddy chips and the bottom hint strip are all in printed type. The WIN banner was not seen.
5. **Risograph look as LOOK.md says: 8.** The five inks, halftone dots, grain, misregistration and navy outlines all read, and the frames match the LOOK-board. The `postpass` shimmer on movement is expected, as in Judge 85.
6. **Orthographic cutaway camera that follows floor by floor: 7.** It follows to floor 4 and the stairs and couch stay visible. In the walk frame the bottom of the cutaway is cut off.
7. **Toy hoodie characters and puffy pink couch match CHARACTERS.md and the sheets: 6.** The green and white hoodie movers and the pink couch read well. At 1024 px they are still small next to the stairwell, and the whole cutaway frame is much larger than they are.
8. **Comic bursts and a lamp glow per floor: 5.** Iteration 87 hid the DOM word, but the starburst at start and at win is **blank**: a pink spiky shape with no THUD!/OOF! text. The `burst_<WORD>` sprite is not showing over it. The lamp glow is present on the floor lamps.
9. **`window.__game`, starts on load, one index.html + import map + vendor/: 8.** The page started on load and the describe output was returned. No console errors showed.

**Faults: 5.** The burst word sprite is missing, so the burst reads as an empty blob. `perf` gave 129.8 ms a frame and 192 draw calls, but the host was busy and the renderer was software, so frame time is noise. The draw-call count is still high. `setState({won:true})` did not show a win.

**Next:**
1. Fix the burst text. The sprite `burst_<WORD>` is not drawn over the starburst SVG, so the word is gone. Draw the word inside the SVG, or make sure the sprite is visible and centred. Check with `look` after forcing a hit: `sample` at the burst centre should show white or navy text pixels, not flat pink.
2. Verify and fix WIN. Drive the couch to the floor-5 landing, or use `act`/`setState` with the real win flag, then `look`. The printed WIN banner should be visible and the timer should stop. The page must not show WIN with the couch on floor 4.
3. Force a real tumble in solo play with `interact` and `trace`, for example by releasing the grab mid-flight on floor 2. A player should go flat with a CRUNCH! burst within 60 s. Then enlarge the couch and movers by about 15%, and cut the 192 draw calls by instancing the dots and railing posts.

SCORE: 6.7
