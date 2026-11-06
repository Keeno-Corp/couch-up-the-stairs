The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 6

Lifting the couch 0.5 m lets it move, so it's snagging on stair geometry at that height. I'm raising the assist's target height.

### Judge 6

The `Surfaces:` line from my last `look` is already in the verdict. I listed it under Faults (score 5) and in Next item 3. The fix is to offset or remove the hidden face of the `couch` RoundedBoxGeometry pair at x = -0.40, or give the top one `polygonOffset` with a factor of -1.

The verdict stands as written. The judge session doesn't edit the page.

SCORE: 6.6
