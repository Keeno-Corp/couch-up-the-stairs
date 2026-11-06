# Couch Up The Stairs
## What it is
A browser three.js comedy co-op physics game: 1–2 friends carry a pink couch up a 5-floor switchback stairwell, drawn as a risograph-printed cutaway apartment block. Let go or tilt too far and it tumbles back down, flattening players. Solo (default, AI buddy) or local 2P on one keyboard.
## Must have
1. Plays as DESIGN.md's Core loop and Controls say (solo default, 1/2/R, P1 WASD+Space, P2 arrows+Enter/RShift).
2. Rapier couch + 5-floor stairwell with tight 180° switchbacks, railings, landings, doors 1A..5A; WIN at floor-5 landing.
3. Slide-back/tumble knocks players flat into ragdoll, they get up; tumble clip moment with a comic burst within the first minute of solo play.
4. HUD: timer, Floor n/5, tilt meter, WIN banner, in printed type.
5. STYLE: risograph look as LOOK.md says: five inks only, halftone shading, grain, misregistration, navy outlines, all via the post pass; its Checks hold. Judged as hard as gameplay.
6. STYLE: orthographic side-on cutaway camera that follows floor by floor and never hides the stairs or the couch.
7. STYLE: toy hoodie characters and puffy pink couch match CHARACTERS.md and refs/sheets/mover.png, couch.png.
8. STYLE: comic impact bursts (THUD!, OOF!, CRUNCH!) on slide/hit/slip; a lamp glow per floor.
9. window.__game describe/observe/act/setState; starts playing on load; one index.html + import map + vendor/, no build.
## References
refs/sheets/LOOK-board.png · style, mood, layout, composition · match · owner-supplied target picture
refs/sheets/mover.png · style, characters · match · owner-supplied
refs/sheets/couch.png · style, couch · match · owner-supplied
refs/01.jpg · layout, mood only (its brown palette is retired) · inspiration · pitch image (provided)
refs/02.png–07.jpg · cutaway / dollhouse / riso texture · inspiration · Wikimedia Commons / Flickr (licences in git log of refs; PD, CC BY, CC BY-SA)
refs/study/STUDY.md · web study notes (Moving Out, Totally Reliable Delivery Service, riso, Wes Anderson sets)
## Inspirations and notes
Moving Out, Totally Reliable Delivery Service (grip physics comedy), Mini Metro (flat clean shapes), Wes Anderson cross-section sets, risograph zines.
## Sheets
LOOK.md · CHARACTERS.md · DESIGN.md · refs/sheets/LOOK.png
Web study: yes (given) · Picture sheets: owner-supplied pictures, no key (given) · Asset style: toy / flat ink, code-built (builder; library models rejected)
## Left to the builder
All creative calls, logged in DESIGN.md Decision log.
