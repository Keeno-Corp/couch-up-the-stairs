The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 7

That `Surfaces:` line is already in my verdict. I listed it under Faults and in Next item 3. The fix is to move one of the two `player0` boxes at x=-0.76 about 0.0001 off the shared plane. A judge session doesn't edit the page, so I've left it alone.

The verdict stands as written.

SCORE: 5.6

## Iteration 8
**Did** Added render interpolation: `snapPrev()` runs before each `simStep`; `updateVisuals` lerps `couch` position, slerps its quaternion and lerps each `player.ch.g` position by `acc/STEP` (`acc` hoisted above `snap0`).
**Saw** `interact` solo `Space`+`D` after a restart reaches `Floor 5/5` and `won: true` at about 2400 frames (35 s, 0 crashes); the WIN banner shows on screen with "HOME SWEET HOME" sign. The `Motion at 100 Hz` 38% still-frame note is gone. `look`: couch 5.8% of the frame, orange 86%, only the `stairwell` x=-3.00 `Surfaces:` pair remains, `rightWall` Never visible. No perf run.
**Next** 1) The assist drags the couch up while P1 and Buddy are left far behind (stretch 10 m, P1 on floor 1 while the couch is on floor 3); cap the couch's lead over the grippers (stop assist when a gripper is > STRETCH away, or make the players follow it). 2) Frame the couch bigger (5.8% → 12%) and cut the dark left slab. 3) Fix the `stairwell` x=-3.00 pair; look at a ragdoll frame and floors 2-4.
**Open** Win is reachable but cheap: the couch floats ahead of its carriers. The first `interact` after `open` sometimes reports a different couch.y than a restarted run (state not fully reset by `restart`?).
