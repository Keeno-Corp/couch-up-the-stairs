The `Surface: "BufferGeometry"` note is the full-screen riso post-pass, so I scored it as intended and did not count it as a fault. Item 5 of the brief asks for halftone shading and grain, so that fine detail is requested. It doesn't need softening. My verdict stands.

I did not confirm that the grain stays fixed to the screen instead of crawling with the moving couch. The code makes `#grain` a `position:fixed` overlay, so it should stay fixed. Two `look` calls at different frames, each with `sample` on the same paper pixels, would confirm it.

SCORE: 7.6
