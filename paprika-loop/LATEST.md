The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 3
**Did** `spawn()`: P1 now starts at (-2.4, .9, LANE_N+.5) and buddy at (-.1, .9, LANE_N+.5), beside the couch; `aiDelay` 3.0 → 0.2 so the buddy grabs at once. In `simStep` player control, a gripping non-AI P1 has the input component pointing away from the couch removed once hand-to-anchor stretch > 1.0, so `D` no longer outruns the couch.
**Saw** Solo `Space`+`D` held 1500 frames: couch moves from x -1.3 to a peak 2.27 (was stuck near -1.9), `slips` 1 (L0F1 slip fires, buddy knocked), `thuds` 2, `crashes` 2, floor still 1. P1 still ends at (5.82, 2.68) with slot -1: after the slip/tumble P1 loses grip and keeps walking up the stairs alone. Couch stopped at frame 910 at x 1.43. 38% still frames at 100 Hz remain. No perf run.
**Next** 1) When P1 has no grip and the couch is far, don't let P1 run ahead (or have P1 auto-regrip/wait); a `rag` state for P1 was never seen. 2) Get past floor 1: couch stalls at x≈1.4–2.3 after the tumble; check `interact until floor 2`. 3) Interpolate couch/player positions; WIN banner; fix `stairwell` x=-3.00 pair.
**Open** Floor 2 and WIN still never reached; P1 solo run-away after grip loss is only partly fixed.

### Judge 3

The `player1` z-fight is already in my verdict under Faults, and in Next item 3 as a fix to make. I'm leaving the verdict as written. The score is 5.6 as the mean of 4, 6, 4, 7, 5, 8 and 5.

SCORE: 5.6
