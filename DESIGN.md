# Design doc: Couch Up The Stairs
## Core loop
Walk to a couch corner, hold grab to carry, haul it up 4 flights (floors 1→5) around tight U-turns. Release/overtilt/overstretch → couch slides down, flattens people, everyone gets up, retry. Timer runs until WIN.
## Controls
P1 WASD + Space (hold to grab). P2 arrows + Enter/RShift. 1 solo (AI buddy), 2 local 2P, R restart.
## Progression
Single run, floors 1–5; couch must reach floor-5 landing by door 5A.
## Win and lose
Win: couch on floor-5 landing. No lose; failure = slide back.
## Levels
8 flights of 7 steps, mid-landings and floor landings, doors 1A..5A.
## Feel
Heavy, wobbly spring grips; tilt meter; ragdoll flops; camera shake on thuds.
## Audio
fx.js synthesized thuds, grunts, oofs.
## UI
Timer, Floor n/5, tilt bar, grip indicators, WIN banner.
## Decisions
Left to the builder: all.
## Decision log
2026-11-06 · AI slip · guaranteed on first approach to the first turn (flight 1 of floor 1), 35% later · builder, unasked (headless)
2026-11-06 · couch collides with real steps, players with an invisible ramp · builder
2026-11-06 · tilt = angle of couch up vs stair-surface normal; limit 40° for 0.4s drops it · builder
2026-11-06 · camera: open-side cutaway, no near wall · builder
