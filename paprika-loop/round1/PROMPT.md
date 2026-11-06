# Couch Up The Stairs
## What it is
A browser three.js comedy co-op physics game: 1–2 friends carry an orange couch up a 5-floor switchback stairwell. Let go or tilt too far and it tumbles back down, bowling players over. Solo (default, AI buddy) or local 2P on one keyboard.
## Must have
1. Plays as DESIGN.md's Core loop and Controls say (solo default, 1/2/R, P1 WASD+Space, P2 arrows+Enter/RShift).
2. Rapier couch + 5-floor stairwell with tight 180° switchbacks, railings, landings, doors 1A..5A; WIN at floor-5 landing.
3. Slide-back/tumble knocks players into ragdoll, they get up; tumble clip moment within first minute (AI buddy slips at first turn).
4. HUD: timer, Floor n/5, tilt meter, WIN banner.
5. Looks as LOOK.md says: its Checks hold. Characters match CHARACTERS.md.
6. window.__game describe/observe/act/setState; starts playing on load; one index.html + import map, no build.
## References
refs/01.jpg · style, mood, layout · match · pitch image (provided)
## Sheets
LOOK.md · CHARACTERS.md · DESIGN.md
Web study: no (no person) · Picture sheets: no · Asset style: low-poly, all in code (builder)
## Left to the builder
All creative calls, logged in DESIGN.md Decision log.
## Improve focus (this loop)
Funnier physics comedy; reliable, readable couch-tumble-takes-a-player clip within the first minute; smooth AI buddy; good local 2P; readable camera through all 5 floors; juice (thuds, dust, shake, grunts); satisfying win at floor 5. Keep improving the existing index.html. Free sources only.
