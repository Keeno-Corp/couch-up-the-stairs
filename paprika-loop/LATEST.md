The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 19

The `Surface:` note is the full-screen riso halftone and grain post-pass. The brief asks for it ("halftone shading, grain"), so I scored it as intended in item 5 and did not count it as a fault. The next builder should keep it but check that the grain doesn't crawl while the couch moves. The grain pattern should stay fixed to the screen or the paper, not to the moving objects.

My verdict from the last reply stands. Its scores, evidence and three Next items are unchanged.

SCORE: 6.9

## Iteration 20
**Did** `ink()` (index.html ~170) now caches the plain-colour Lambert material per ink key, so the merge-by-material pass (`mergeGeos`, "merged" meshes) finally groups stairs, rails, dots, frames that used to each own a material.
**Saw** `perf`: 234 → 191 draw calls (scene pass 80.6 → 85.5 ms on software GL, noise), triangles 42k → 45k; `look` picture unchanged (riso look intact, no console errors). `look` still says `__game.subject` "couch" is not in the scene: the render target the tools see is the post-pass scene, the couch lives in the inner scene.
**Next** Prove the tumble with `interact` (crashes, ragdoll, get-up) and add the OOF!/CRUNCH! burst with ink-shake; cut the remaining 191 calls (per-door/lamp/window meshes with unique materials or MeshBasic are skipped by the merge; ~every item has its own mesh); make `subject` resolvable (put couch in the scene `look` sees or point subject at the post-pass quad's source).
**Open** No interact/feel run this session; tablet aspect of the .7 portrait offset and `couchFloor` setState still unchecked; the `Surface` noise note is the riso grain post-pass (intended).
