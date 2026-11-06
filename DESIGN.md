# Design doc: Couch Up The Stairs
## Core loop
Walk to a couch corner, hold grab to carry, haul it up 4 flights (floors 1→5) around tight U-turns. Release/overtilt/overstretch → couch slides down, flattens people (they squash flat, then get up), retry. Timer runs until WIN.
## Controls
P1 WASD + Space (hold to grab). P2 arrows + Enter/RShift. 1 solo (AI buddy), 2 local 2P, R restart.
## Progression
Single run, floors 1–5; couch must reach floor-5 landing by door 5A.
## Win and lose
Win: couch on floor-5 landing. No lose; failure = slide back.
## Levels
8 flights of 7 steps, mid-landings and floor landings, doors 1A..5A, one lamp per landing.
## Feel
Heavy, wobbly spring grips; tilt meter; ragdoll flops with squash; camera shake on thuds; every hit also jolts the ink misregistration wider for a moment (the print "shakes").
## Camera
Orthographic cutaway, side-on, slight top-down, follows the couch floor by floor, whole shaft always in frame, never a close-up (see LOOK.md).
## Impact text
Comic bursts (star + chunky word, pink/teal misregistered copies) at the hit point, offset so the couch stays visible: THUD! on a hard couch landing, OOF!/BONK!/NOOO! when a player is knocked, CRUNCH! (bigger, yellow) when the couch flattens a player at speed, WHOOPS! when the buddy slips. Max 3 on screen, 0.45 s repeat limit per word, ~1 s life.
## Audio
fx.js synthesized thuds, grunts, oofs.
## UI
Printed cards: Floor n/5 chip and timer top-left, tilt meter top centre, grip chips top right, help strip bottom, WIN banner. Type and colours per LOOK.md.
## Decisions
Left to the builder: all.
## Decision log
2026-11-06 · AI slip · guaranteed on first approach to the first turn (flight 1 of floor 1), 35% later; slip happens ~2–4 s in, so the tumble clip is inside the first minute · builder, unasked (headless)
2026-11-06 · couch collides with real steps, players with an invisible ramp · builder
2026-11-06 · tilt = angle of couch up vs stair-surface normal; limit 40° for 0.4s drops it · builder
2026-11-06 · restyle: risograph cutaway, orthographic camera replaces perspective cutaway; the old "hide floors above" logic dropped (not needed side-on) · owner direction + builder
2026-11-06 · web study yes, refs yes, asset search yes (nothing adopted), picture sheets: no usable key, board/mover/couch pictures supplied by the owner, refs/sheets/LOOK.png made free · builder
2026-11-06 · classification-based print shader (ink by chromaticity, shade by luminance) instead of per-material ink channels, so any material in the five inks works · builder
