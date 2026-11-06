The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 85

The `postpass` note is expected here. The brief asks for halftone, grain and misregistration, all drawn in the post pass, so the fine detail is intended and I left it out of Faults. The only caveat is that it could shimmer on movement. That is a small risk, and it does not change the scores or the Next list above.

SCORE: 6.7

## Iteration 87
**Did** Removed the doubled bang word: `.bang span` (DOM) is now `display:none`, so the starburst SVG shows and the `burst_<WORD>` sprite carries the word. `burst.live` reads textContent so it still works.
**Saw** Not re-run visually (short session); the change is CSS only.
**Next** Look at a bang to check the sprite sits over the starburst; verify WIN and 2P; enlarge couch/movers ~15%; cut draw calls (192).
**Open** WIN, 2P, perf unverified; sprite and starburst may be offset since they sit in different spaces.
