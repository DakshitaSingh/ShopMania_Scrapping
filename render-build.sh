#!/usr/bin/env bash

# Exit on error
set -o errexit

echo "--- Installing Node.js dependencies ---"
npm install

echo "--- Preparing Puppeteer cache directory ---"
# Define the cache directory explicitly
export PUPPETEER_CACHE_DIR="/opt/render/.cache/puppeteer"
mkdir -p $PUPPETEER_CACHE_DIR

echo "--- Installing Puppeteer browser (Chromium) to cache directory ---"
# Use the --path option to ensure it installs into PUPPETEER_CACHE_DIR correctly
npx puppeteer browsers install chrome --cache-dir $PUPPETEER_CACHE_DIR

echo "--- Build complete ---"