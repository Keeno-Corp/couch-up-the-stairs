The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 17
**Did** Fixed portrait framing: the resize handler (index.html ~line 158) reset the ortho camera to `VH` while `VHcur` already held the wide value, so `updateCamera` never re-applied it. The handler now sets `VHcur = max(VH, 3.4/a)` and uses it. Moved `let VHcur` up beside `VH` (avoids a TDZ error from resize).
**Saw** `look` at 390x800: couch and the buddy are now in view at the stairs' foot; `#tilt` (111-179) clears `#tl` (7-108); 0 overlaps, 0 cut off; no never-visible objects. Surface note is the intended riso halftone. Subject "couch" still reported as not in scene (naming). Bottom third of the portrait canvas is empty paper/floor.
**Next** 1) Shift camTarget y up/down in portrait so less empty space under the floor. 2) Ragdoll frame after a tumble. 3) Instancing for the 234 draw calls.
**Open** Did not run `perf`; the couch is small at phone width; `window.__game.subject` still names an object not in scene.

### Judge 17

That `Surface` note is the full-screen riso halftone and grain post-pass. The brief asks for it, and LOOK.md records it as intended, so I scored it as a known item and it cost nothing. My verdict from the last turn stands as written.

SCORE: 7.8
