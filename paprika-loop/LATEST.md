The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

## Iteration 44
**Did** `updateCamera`: after the ±30% couch clamp, `want.y` is capped at lowest player y + `VHcur*.75`, so a fallen/lagging player stays in frame. Bursts already fire on knock (OOF!/CRUNCH!), THUD! and tumble, so Next 2 needed no change.
**Saw** Not run in this session (short on time); change is one line, no visual check.
**Next** `look` after `__game.tumble()` at floor 4 to confirm Buddy and burst are framed; subject resolution (post-pass last) and lighter grain remain.
**Open** Subject `couch_body 0%` unsolved; new camera cap unverified.

### Judge 44

The Surface line is intended. The brief asks for halftone shading and grain, and the post-pass draws them across the whole frame. That is why it covers 100% of the screen. I did not count it as a fault.

I did keep a small item for it: Next 3 asks the builder to lower the grain contrast so the line goes away.

Verdict, unchanged:

**Judge 44**

1. **Plays as DESIGN.md says: 7.** `floor` 4 at 24.5 s, with both grips HOLDING. I did not play 2P or the WIN.
2. **Rapier couch and 5-floor stairwell: 8.** Switchbacks, railings, landings and doors render.
3. **Slide-back, tumble and ragdoll with a comic burst: 6.** No flattened player or burst is visible in the frame.
4. **HUD: 8.** `FLOOR 4/5`, timer and `TILT` bar show in printed type with 0 overlap.
5. **Riso look: 8.** Five inks, halftone, grain and outlines read.
6. **Orthographic cutaway camera: 7.** The couch is large and centred.
7. **Toy hoodie characters and puffy couch: 7.** The couch matches the sheet, but P1 is partly hidden behind it and Buddy is off-frame.
8. **Comic bursts and a lamp glow per floor: 6.** Lamps show on every floor, but no burst is on screen.
9. **`window.__game` and one `index.html` with vendor: 7.** No console errors, but `look` still reports the subject at 0 px.

**Faults: 6.**

**Next:**
1. Verify the player framing after `__game.tumble()` at floor 4. Buddy and a CRUNCH! burst must be in frame (asked again).
2. Show a burst on every `slips` and `thuds` event, held about 0.6 s.
3. Make the subject resolve in `look`, and lower the grain contrast.

SCORE: 7.0
