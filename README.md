# Couch Up The Stairs

Carry an orange physics couch up a five-floor apartment stairwell with a friend. Let go, or tilt it too far, and it tumbles back down, flattening whoever is below.

Play: https://couch-up-the-stairs.pages.dev

- Solo (default): P1 WASD + hold Space to grab; an AI buddy holds the other end.
- Local 2-player (press 2): P1 WASD + Space, P2 arrows + Enter / Right Shift.
- 1 solo, 2 two-player, R restart.

Built with [paprika3d](https://github.com/Keeno-Corp/paprika3d) (`/paprika3d:paprika-make`, then `/paprika3d:paprika-loop`). Plain three.js + Rapier page, no build step; `./deploy.sh` deploys it to Cloudflare Pages. The page follows the `window.__game` convention.
