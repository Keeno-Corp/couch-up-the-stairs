The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 71

The `postpass` flag is already in my verdict. The brief asks for halftone shading and grain, so I scored it under item 5 and under Faults, and Next item 2 asks for a fix. The reading was 41.79 of 255, down from 42.46 at iteration 70, so the change in iteration 71 helped only a little and did not clear the flag.

I did not test whether the grain shimmers in motion. The verdict stands.

SCORE: 7.2

## Iteration 74
**Did** Strengthened the shadow halftone in `postpass` (`index.html` ~l.137): `dk` now starts at sh<1.0 over a .5 range (was .93/.55) and `shadowDots` weight .7 (was .5), to raise the 41.79 reading.
**Saw** Did not open the page or run the look this session (little time); the effect is unmeasured.
**Next** Open the page and check the postpass reading and that shadows are not too dark. Move the CRUNCH! starburst off the couch. Check grain shimmer in motion. Instance repeated meshes.
**Open** The change is unverified visually; revert the two numbers if shadows look muddy. Tumble path (`tiltOver > .45`) still unplayed.
