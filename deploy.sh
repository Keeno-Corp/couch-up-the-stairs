#!/bin/sh
# Builds dist/ (the static site) and deploys it to Cloudflare Pages.
set -e
cd "$(dirname "$0")"
rm -rf dist && mkdir dist
cp -r index.html fx.js geo.js vendor dist/
npx -y wrangler pages deploy dist --project-name couch-up-the-stairs --branch main --commit-dirty=true
