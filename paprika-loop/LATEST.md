The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 13

The `Surface` note is the full-screen riso halftone and grain post-pass. The brief asks for that look, and LOOK.md records it as intended. I scored it as a known item, so it cost nothing. The grain is already softer than in session 12.

My verdict stands as written above.

SCORE: 7.2

## Iteration 16
**Did** Added a `@media (max-width:700px)` block in index.html CSS: smaller `#tl`, `#grips`, `#help` (wraps), and `#tilt` moved to top:114px full width so the HUD no longer overlaps or cuts off on a phone.
**Saw** `look` at 390x800: before, 3 HUD overlaps and `#help` cut off by the edge; after, 0 cut off, `#tilt` moved below `#tl` (last look showed it still overlapping at top:78px; I changed to 114px and did not re-look). The phone camera frames only stairs and railing: the couch and characters are not in view (`subject` "couch" not in scene), a real fault in portrait.
**Next** 1) Widen the camera (fov or distance by aspect) in portrait so the couch and both characters show. 2) Re-look phone to confirm `#tilt` clears `#tl`. 3) Ragdoll frame after a tumble; instancing for the 234 draw calls.
**Open** Portrait camera framing unfixed; `#tilt` at 114px unverified.
