# Look: Couch Up The Stairs
One direction: a **risograph cutaway apartment block**. A side-on, slightly top-down orthographic cross-section of a narrow stairwell, five floors stacked like lit boxes (dollhouse / Wes Anderson section set), printed in three spot inks plus a navy key line on warm paper. Target pictures: `refs/sheets/LOOK-board.png` (cutaway, inks, burst), `refs/sheets/mover.png`, `refs/sheets/couch.png`; free board `refs/sheets/LOOK.png`. `refs/01.jpg` is layout/mood only (its brown palette is retired). Study notes: `refs/study/STUDY.md` (flat colour fields, few big props, shading only by halftone, shadow = a second ink overprinted).

## Palette (the only colours that exist; sampled from LOOK-board.png)
paper #f8f1de · fluorescent pink #fb5f98 · teal #1fa58f · sunflower yellow #f9cd45 · navy key line #1c3150.
Roles: yellow = interior walls and stairs; teal = floor slabs, cut section walls, hoodies/boots; pink = couch (hero, the only big pink mass), doors, railings, polka dots; navy = outlines, trousers, shadow dots, eyes; paper = background outside the building, lamp shades, window glass, label plates. Overprint (pink x yellow = orange, teal x pink = purple-navy) appears only where misregistered layers overlap.

## Lighting
No realism: the scene is rendered with flat Lambert inks (ambient 2.05 + one sun 1.4 from upper left-front, soft shadow map) calibrated so a lit ink reads at its own luminance. Shade below 0.93 becomes **navy halftone dots** (45°), shade above ~1.2 becomes **paper-dot knockout** in the ink (the warm glow). Every floor has a floor lamp (navy pole, paper shade, yellow additive glow) on each landing and a bare bulb, plus point lights so the glow pools on walls as dots.

## Materials
Flat ink colour only, no textures. Per-floor pattern: floors 1/3/5 teal wainscot band, floors 2/4 pink polka dots; windows (teal frame, paper glass, navy mullions); doors pink with navy knob and paper label plate; cut slabs and side walls teal.

## Post-processing pass (the print; all in `printMat`, index.html)
Scene -> RT (supersampled 1.3x, with depth) -> one fullscreen shader that: classifies every pixel to an ink by chromaticity; composites each ink as its own layer with its own **misregistration offset** (pink -1.8,+1.1 px; teal +1,-1.5; yellow +1.6,+1.4; navy +.5,-.4; offsets boosted by impacts); **multiplies** the layers over paper so overlaps overprint; **halftone** dots by luminance (rotated screen per ink); **outline ink** from depth jumps, depth creases (Laplacian) and ink changes; **paper grain**, fibre streaks, uneven ink density and pin-hole speckle; plus a CSS multiply grain overlay on top of the HUD.

## Shape language
Chunky toy rounded shapes: puffy rounded-box couch, oversized hoodie characters with mitten hands, stubby legs, round heads. Thick stair blocks, rails thin. Comic impact bursts: 14-point star, paper/yellow fill, navy outline, pink+teal misregistered copies behind, chunky navy word.

## Camera
Orthographic, half-height 5.2 m (about 2.5 floors visible), yaw 7 degrees and 17 degrees down from the open (+z) side, x locked to the shaft centre, y follows the couch/players (couch weighted) with smoothing and a lead of 1.9 m so the stairs above show; view widens a little when players spread. Whole shaft width always fits; paper margin each side. No close-ups, no near wall, nothing hides the stairs.

## UI and type
Printed look: heavy display face ("Arial Black"/Impact/DejaVu Sans Bold, 900), navy ink on paper cards with 3 px navy border, pink + teal misregistered drop shadows, slight rotations (-1.2 to 1 degree). Timer teal with navy stroke and pink shadow, Floor chip in yellow, tilt bar a dotted paper bar with teal fill (yellow, then pink near the limit), WIN in yellow with navy stroke and pink/teal offset shadows. Impact words THUD! OOF! BONK! CRUNCH! WHOOPS! NOOO! as bursts.

## Sound mood
Loud synthesized cartoon thuds, grunts, oofs (fx.js) (builder's call).

## Assets
style: toy / flat ink, all code-built. asset_search/web picks reviewed and rejected (see CHARACTERS.md).

## Avoid
Any colour outside the five inks, gradients, realistic shading, brown/grey murk, perspective close-ups, walls hiding the couch, HUD in plain system font.

## Checks
1. Opening look uses only the five inks: sampled colours cluster on paper, pink, teal, yellow, navy (overprints excepted).
2. Visible halftone dots in shadows and lamp glows, paper grain, and a 1-3 px misregistration fringe on outlines and fills.
3. Navy outlines on every object silhouette and on stair creases.
4. Cutaway composition: the five-floor stairwell column centred on paper, orthographic, side-on, slightly top-down; couch and both players fully visible and un-occluded at 1280x800 and 1376x768.
5. Couch is the dominant pink mass; players read as teal/pink/yellow hoodies with mitten hands.
6. A comic burst (word + star) appears on slide/hit/slip within the first minute of solo play and does not cover the couch.
7. HUD uses printed type (ink colours, misregistered shadow), not a system look; timer, Floor n/5, tilt meter readable.
8. A lamp on each floor with a dotted glow.
