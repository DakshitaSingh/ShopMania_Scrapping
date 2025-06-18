// chrome.js
const puppeteer = require('puppeteer-extra');
const StealthPlugin = require('puppeteer-extra-plugin-stealth');

puppeteer.use(StealthPlugin());

const launchBrowser = async () => {
  // Use the standard path for system-installed Chromium within a Debian-based Docker image
  const executablePath = '/usr/bin/chromium'; // Corrected path for 'chromium' package

  console.log(`Launching Puppeteer with explicit executablePath: ${executablePath}`);

  return puppeteer.launch({
    headless: 'new',
    executablePath: executablePath, // Point to the system-installed Chromium in Docker
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox',
      '--disable-dev-shm-usage',
      // '--disable-gpu' // Often useful in headless environments
    ]
  });
};

module.exports = launchBrowser;