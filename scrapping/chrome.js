// chrome.js
const puppeteer = require('puppeteer-extra');
const StealthPlugin = require('puppeteer-extra-plugin-stealth');

puppeteer.use(StealthPlugin());

const launchBrowser = async () => {
  // Use the exact path from the Render error log.
  // This path includes the specific Chromium version.
  const renderExecutablePath = '/opt/render/.cache/puppeteer/chrome/linux-137.0.7151.70/chrome-linux64/chrome';

  // Use an environment variable if set, otherwise fall back to the Render-specific path,
  // or Puppeteer's default if neither is available (though renderExecutablePath should almost always be used here for Render)
  const executablePath = process.env.PUPPETEER_EXECUTABLE_PATH || renderExecutablePath;

  console.log(`Launching Puppeteer with executablePath: ${executablePath}`);

  return puppeteer.launch({
    headless: 'new', // Using new headless mode
    executablePath: executablePath, // Set the explicit path here
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox',
      '--disable-dev-shm-usage',
      // '--disable-gpu' // Often useful in headless environments
    ]
  });
};

module.exports = launchBrowser;