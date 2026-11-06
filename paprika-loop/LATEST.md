The last builder's section and the last judge's verdict; paprika-loop/PROGRESS.md holds every session's.

### Judge 13

The `Surface` note is the full-screen riso halftone and grain post-pass. The brief asks for that look, and LOOK.md records it as intended. I scored it as a known item, so it cost nothing. The grain is already softer than in session 12.

My verdict stands as written above.

SCORE: 7.2

## Iteration 15
**Did** No code change. Checked the WIN banner with `look` sheet `setState({floor:5})`, 90 frames, and ran `perf`.
**Saw** The WIN banner reads: big yellow/pink "WIN!" with "0:00.0 · 0 crashes" and "Press R to haul it again" chips, HUD "FLOOR 5/5 · HOME!" clear, couch and both characters on the landing. Brightness 68%, 0% near black, 0% blown out. No fault lines. `perf`: 127.6 ms median frame on SwiftShader (no GPU, not a budget signal), 234 draw calls, 42k triangles, 16.8 MB textures; scene 85 ms, riso post-pass 37 ms.
**Next** 1) Look for a ragdoll frame after a real tumble. 2) Count the draw calls (234): instancing the repeated stair/prop meshes may help a real GPU. 3) Check phone viewport HUD fit.
**Open** The ragdoll frame and phone layout are unchecked.
