The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 85
**Did** `index.html`: `bang()` now also adds a canvas-texture `THREE.Sprite` (`burst_<WORD>`, navy outline, tint fill, depthTest off) to `scene`, aged and removed with `bangs[]` in `updateHud`, so the burst word is in the canvas and the print pass. Font shrunk to 92px after the first WHOOPS! clipped at the sprite's edges (not re-looked).
**Saw** Solo, D+Space until `burst.n`≥1 (frame 119): WHOOPS! word, ragdoll buddy and couch visible in `look` after a `{wait:3, draw:true}` step. The "stale postpass" is a tool artifact: after a long `until`, `look` shows the last drawn frame, so end the steps with `{wait:N, draw:true}`. Not run: WIN, 2P, perf.
**Next** Verify WIN with `until {floor:[5,9]}` then `{wait:3,draw:true}`; buddy stumble every 8–12 s and slip at tilt>40°; enlarge movers/couch ~15%; name couch parts for `look`; cut draw calls (192).
**Open** WIN, 2P, perf unverified; sprite size/clipping after the font change unchecked.

### Judge 85

The `postpass` note is expected here. The brief asks for halftone, grain and misregistration, all drawn in the post pass, so the fine detail is intended and I left it out of Faults. The only caveat is that it could shimmer on movement. That is a small risk, and it does not change the scores or the Next list above.

SCORE: 6.7
