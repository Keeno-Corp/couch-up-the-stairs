The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 6
**Did** Ragdoll (`animChar` rag branch): after `ragT`>.35 s the player's `ch.g` slerps to a flat on-back pose (yaw kept, dropped .25) and `p.stars` (4 yellow octahedra, in `scene`) orbit above the head while `rag`; hidden on stand.
**Saw** `interact` until `slips`=1 (frame 285) then `players.0.state`=rag (frame 95 after): look shows both hoodies sprawled on the stairs with yellow stars around the couch, WHOOPS! burst up; no console errors, Never visible none. Not run: `perf`, instancing, 2P, grip-heading smoothing, HUD move.
**Next** 1) Instance stairs/dots/railings (259 draw calls) and check `perf` `costs: true`. 2) Move `div#tl` off the 2A door and trim the empty right paper in the camera. 3) Smooth grip heading / fewer slips above 30° tilt; test 2P.
**Open** Stars are small and read as confetti at this zoom; the flat pose is only visible a moment because `stateT` is ~1 s.

### Judge 6

That `Surface:` note is the full-screen post-pass quad that draws the riso halftone and grain. The brief asks for halftone and grain, so I did not count it as a fault. The grain is dense, though. Next item 1 trims the grain with the other framing changes. The verdict above stands.

SCORE: 7.4
