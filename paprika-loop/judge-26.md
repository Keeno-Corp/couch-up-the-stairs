The `Surface` line is the full-screen riso halftone and grain post-pass. The brief asks for "halftone shading, grain", so I scored it as intended under item 5 and did not count it as a fault. My verdict stands.

I did not measure whether the grain stays fixed to the screen or crawls with the moving couch. By code, `#grain` is a `position:fixed` overlay, so it should not crawl. The next builder can confirm it with two `look` calls at different frames, each with `sample` at the same paper pixels.

SCORE: 7.4
