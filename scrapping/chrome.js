// chrome.js
const puppeteer = require('puppeteer-extra');
const StealthPlugin = require('puppeteer-extra-plugin-stealth');

puppeteer.use(StealthPlugin());

const launchBrowser = async () => {
  console.log("Launching Puppeteer with auto-detected executablePath (Docker workaround)...");

  return puppeteer.launch({
    headless: 'new',
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox',
      '--disable-dev-shm-usage',
      // No executablePath specified here!
    ]
  });
};

module.exports = launchBrowser;