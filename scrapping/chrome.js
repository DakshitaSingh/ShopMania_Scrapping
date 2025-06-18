// chrome.js
const puppeteer = require('puppeteer-extra');
const StealthPlugin = require('puppeteer-extra-plugin-stealth');

puppeteer.use(StealthPlugin());

const launchBrowser = async () => {
  // Use the standard path for system-installed Chromium on Ubuntu/Debian
  const executablePath = '/usr/bin/chromium-browser';

  console.log(`Launching Puppeteer with explicit executablePath: ${executablePath}`);

  return puppeteer.launch({
    headless: 'new', // Or true
    executablePath: executablePath, // Point to the system-installed Chromium
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox',
      '--disable-dev-shm-usage',
      // '--disable-gpu' // Often useful in headless environments
    ]
  });
};

module.exports = launchBrowser;