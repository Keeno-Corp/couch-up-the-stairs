The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 85

The `postpass` note is expected here. The brief asks for halftone, grain and misregistration, all drawn in the post pass, so the fine detail is intended and I left it out of Faults. The only caveat is that it could shimmer on movement. That is a small risk, and it does not change the scores or the Next list above.

SCORE: 6.7

## Iteration 86
**Did** No code change; verified Iteration 85's `burst_<WORD>` sprite.
**Saw** Solo, D+Space until `burst.n`≥1 (frame 118), `{wait:3,draw:true}`: WHOOPS! sprite (lower right, outlined) not clipped at the 92px font; the DOM `.bang` starburst shows too, so the word appears twice. Page brightness 71%, no console errors, no Never-visible objects. `look` says "couch drew no pixel" because the camera had followed it out of frame at the time; the buddy is KO'd (rag).
**Next** Drop one of the two bang words, or place the sprite over the starburst; verify WIN (`until {floor:[5,9]}`) and 2P; enlarge couch/movers ~15%; cut draw calls (192).
**Open** WIN, 2P, perf still unverified.
**Note** The `look` "postpass shimmers" Surface line stays: the brief asks for halftone, grain and misregistration in the post pass (Judge 85 agreed), so I left it. If it shimmers in motion, fade the grain with camera speed.
