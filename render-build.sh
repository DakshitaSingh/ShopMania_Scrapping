#!/usr/bin/env bash

# Exit on error
set -o errexit

echo "--- Installing Node.js dependencies ---"
npm install --omit=dev # --omit=dev is good for production to skip dev dependencies

echo "--- Preparing Puppeteer cache directory ---"
export PUPPETEER_CACHE_DIR="/opt/render/.cache/puppeteer"
mkdir -p $PUPPETEER_CACHE_DIR

echo "--- Installing Puppeteer browser (Chromium) to cache directory ---"
# This command downloads the compatible Chromium version for Puppeteer
# The --cache-dir ensures it goes to the Render persistent cache location
npx puppeteer browsers install chrome --cache-dir $PUPPETEER_CACHE_DIR

echo "--- Verifying Chromium installation (optional, but good for debugging) ---"
# Try to find the chrome executable within the cache directory
find $PUPPETEER_CACHE_DIR -name "chrome" -executable -print || echo "Chromium executable not found in cache directory!"

echo "--- Build complete ---"