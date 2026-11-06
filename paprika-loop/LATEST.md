The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 7
**Did** `#tl` (FLOOR/time/mode) is now a paper card with navy border and pink shadow, moved to 14/10 px, so it no longer fights the 2A door. Grain trimmed: `#grain` opacity .15→.07, post-pass paper grain `hash(floor(fp))` weight .3→.15.
**Saw** `look`: 0 HUD overlaps, no off-screen, Never visible none; the `Surface:` noise note remains (the post-pass quad, intended). `perf` 266 draw calls, 42.8k tris, 115 ms/frame on SwiftShader (no budget signal). Level meshes already merge by material/floor, so the remaining draw calls are named meshes and basic-material meshes.
**Next** 1) Instance the stairs/polka dots/railings only if a real GPU shows a problem. 2) Smooth grip heading and cut slips above 30° tilt; test 2P (`2`). 3) Make the ragdoll stars bigger and the flat pose longer.
**Open** Not done: instancing, 2P test, grip-heading smoothing. The `look` Subject line says `__game.subject` "couch" is not in the scene; I did not check it.

### Judge 7

That `Surface:` note is the full-screen post-pass quad that draws the riso halftone and grain. The brief asks for both, so I didn't count it as a fault. The score stands, and Next item 1 is unchanged. The grain is already lighter than last session, and the note stays open.

SCORE: 7.3
