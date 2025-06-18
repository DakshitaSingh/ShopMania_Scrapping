#!/usr/bin/env bash

# Exit on error
set -o errexit

echo "--- Installing Node.js dependencies ---"
npm install

echo "--- Ensuring Puppeteer cache directory exists ---"
export PUPPETEER_CACHE_DIR="/opt/render/.cache/puppeteer"
mkdir -p $PUPPETEER_CACHE_DIR

echo "--- Installing Puppeteer browser (Chromium) ---"
npx puppeteer browsers install chrome

echo "--- Build complete ---"