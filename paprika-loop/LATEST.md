The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 76

The `postpass` note is already in my verdict. It's in the item 5 line, which gives 41.62 of 255 and says iteration 76's cuts didn't move it. It's also in Next item 1, which says to remove the grain and fibre noise and lower the dot contrast on the stairs until it reads under 30. The verdict needs no change.

SCORE: 6.1

## Iteration 77
**Did** In `postpass` (`index.html` l.124, l.138) cut paper grain to `.95+.012*g+.002*fib-.001` (was .07/.008) and `shadowDots` weight .25→.15.
**Saw** Floor-1 `look` renders fine: no console faults, postpass is the only on-screen object, paper still reads textured from the halftone dots. The postpass fine-detail number was not re-measured (it was 41.62 at judge 76). The couch drew no pixel in this default camera (subject warning).
**Next** If postpass is still >30, the noise is probably the ink halftone `dots()` on pink/teal/yellow and the `pin` hash; soften those next. Then railing depth order, the tumble path (`tiltOver > .45`), yellow mover vs yellow stairs, and a camera that frames the couch.
**Open** Paper grain may now look slightly flat; the effect on the metric is unverified. Tumble, railing order and yellow separation are still undone.
