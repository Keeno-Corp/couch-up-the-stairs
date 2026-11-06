The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 18

**Judge 18.** I looked at a four-moment sheet (start, hold, 90 s, floor-4 setState), phone and desktop viewports, and `perf`. I did not run `interact` or `feel` and did not run `reference` against LOOK-board, so the Looks, characters and burst scores rest on the sheet alone. The sheet took 367 s on the software renderer.

1. **Plays as DESIGN.md's Core loop and Controls say: 7.** The page starts playing on load. The solo AI buddy shows "Buddy: HOLDING" and "SOLO · buddy helps". Holding D then Space gave a tilt readout of 3° and a "WHOA! LOST GRIP!" burst. The 90 s moment reached "WIN! 0:48.5 · 4 crashes", so a full solo run is possible. I did not test the P2 keys or the 1/2/R switches.
2. **Rapier couch and 5-floor stairwell with switchbacks, railings, landings, doors 1A..5A; WIN at the floor-5 landing: 7.** The pink railings, yellow stair blocks, landings and doors "1A" and "4A" are all visible. The WIN banner shows with the couch on the upper landing. The `setState` `couchFloor: 4` test did not change the scene (the HUD still read FLOOR 1/5), so I could not confirm that the earlier WIN-on-floor-4 bug is fixed. The tight 180° turns hold up in the frames.
3. **Slide-back/tumble knocks players flat into ragdoll, they get up; tumble clip with a comic burst in the first minute: 6.** The 90 s frame shows debris and a pile on the lower landing, and the HUD counts "4 crashes", so crashes do happen. I did not see a ragdoll flatten frame, and I did not check that the crash falls inside the first 60 s. The start frame's "THUD!" burst fired at 0.3 s on the very first frame.
4. **HUD: timer, Floor n/5, tilt meter, WIN banner, in printed type: 8.** The panels read "FLOOR 1/5", "0:00.3", "TILT 0°", the "P1/Buddy" chips and the key-hint strip. The WIN banner and the "Press R to haul it again" card are good.
5. **STYLE: risograph look as LOOK.md says: 8.** The five inks (teal, yellow, pink, cream, navy) read. The halftone and grain look good, the pink door gradients are halftoned, and the outlines are misregistered. I found no `Lighting:` or `Surfaces:` fault lines. The picture is close to LOOK-board. It is slightly pale at 90 s, with saturation at 29%.
6. **STYLE: orthographic side-on cutaway camera that follows floor by floor and never hides the stairs or the couch: 6.** Desktop framing is good. On phone, pillarboxed to about 135×280 px, the cutaway is tiny and the movers are barely readable. Iteration 18's offset `.3` is still unverified. At 90 s the top HUD overlaps the floor-5 landing region.
7. **STYLE: toy hoodie characters and puffy pink couch match CHARACTERS.md and the mover/couch sheets: 7.** The teal and yellow hoodie toys have chunky bodies and the couch is puffy. They are bigger than before. The start frame has them small against the stairwell, and they overlap the couch at the start.
8. **STYLE: comic impact bursts and a lamp glow per floor: 7.** The "THUD!" starburst and "WHOA! LOST GRIP!" are visible, and the lamps are drawn on the landings. I did not run `feel` on the ink-shake or the halftone dust puffs, so those are unchecked.
9. **`window.__game` describe/observe/act/setState; starts playing on load; one index.html + import map + vendor/, no build: 8.** `__game` describe answered with units and keys, and the page runs with no build. `look` reports "no subject", so `__game.subject` is still unnamed.

**Faults: 6.**
- There are no console errors and no fault lines.
- `perf` showed 126 ms a frame with 234 draw calls and 42k triangles. That is over budget, but this is a software renderer, so the frame time is not a fault. The draw count is the real cost, 77 ms of the 114 ms.
- The phone layout is badly pillarboxed.
- The `couchFloor` setState is not honoured, which makes testing harder.

**Next:**
1. Phone and narrow viewports: the canvas fills only about a third of the width. Make it fill the 390×844 viewport and widen the ortho frustum, so that the couch and movers are at least as big as on desktop and the camera fits the current flight. Check it with `look` `viewports: ["phone"]`; it should show the whole width used.
2. Prove the tumble within the first minute. Run `interact` for 3600 frames with the keys held. Trace `crashes`, `players[].ragdoll` and the couch y to show a real slide that flattens a player and then a get-up. Add a clear CRUNCH!/OOF! burst with an ink-shake at the flatten. Also make `setState` accept `couchFloor` (or give an `act` teleport per floor), so the floor-4 and win-gate check can run and a floor-4 frame can show no WIN banner.
3. Draw calls: 234 per frame, and the scene pass is two thirds of the frame time. Instance or merge the repeated stair, railing and halftone dots, and name the movers/couch so that `__game.subject` works. Check it with `perf` (draw calls well under 100, with the picture unchanged).

SCORE: 7.0

## Iteration 19
**Did** `updateCamera` portrait offset factor changed .3 → .7 (index.html ~672); `__game.setState` now accepts `couchFloor` as an alias of `floor` (1-based).
**Saw** `look` at 390x844: canvas fills the full width (the "pillarbox" in the judge's sheet was the sheet's viewport, not the page). Offset .3 left ~150 px of empty cream under the floor; -.35 made it far worse (the sign is right as positive); .7 shows floor 1 at the bottom with no empty strip, couch and mover readable. No perf/interact run. Surface note is still the riso post-pass.
**Next** Prove the tumble in the first minute with `interact` (crashes, ragdoll, get-up) and add an OOF!/CRUNCH! burst with ink-shake at the flatten; merge/instance stairs, rails and dots (234 draw calls); name the couch/movers so `__game.subject` resolves ("couch" is reported as not in the scene).
**Open** The `couchFloor` setState not re-tested on screen; the .7 offset not checked at other aspect ratios (e.g. tablet).
