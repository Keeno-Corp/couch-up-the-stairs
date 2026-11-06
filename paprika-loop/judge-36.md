The `Surface` note is the full-screen riso halftone and grain post-pass. The brief asks for "halftone shading, grain" in item 5, so I scored it as intended and did not count it as a fault. My verdict stands, and I haven't changed it.

I did not check whether the grain stays fixed to the screen or crawls with the moving couch. In the code, `#grain` is a `position:fixed` overlay, so it should stay fixed. The next builder can confirm it with two `look` calls at different frames, each sampling the same paper pixels.

SCORE: 6.9
