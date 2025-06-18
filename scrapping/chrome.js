// chrome.js
const puppeteer = require('puppeteer-extra');
const StealthPlugin = require('puppeteer-extra-plugin-stealth');

puppeteer.use(StealthPlugin());

const launchBrowser = async () => {
  console.log("Launching Puppeteer with auto-detected executablePath..."); // Add a log for clarity

  return puppeteer.launch({
    headless: 'new', // Or true, but 'new' is preferred
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox',
      '--disable-dev-shm-usage',
      // No executablePath specified here!
    ]
  });
};

module.exports = launchBrowser;