// chrome.js
const puppeteer = require('puppeteer-extra');
const StealthPlugin = require('puppeteer-extra-plugin-stealth');
// const fs = require('fs'); // No longer needed if not checking fs.existsSync

// Add and use the stealth plugin
puppeteer.use(StealthPlugin());

// REMOVE THE findChrome FUNCTION ENTIRELY, it's causing the problem

const launchBrowser = async () => {
  // const executablePath = await findChrome(); // <-- DELETE THIS LINE

  console.log("Launching Puppeteer with auto-detected executablePath..."); // Add a log for clarity

  return puppeteer.launch({
    headless: 'new', // Using new headless mode
    // executablePath, // <-- DELETE OR COMMENT OUT THIS LINE
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox',
      '--disable-dev-shm-usage',
      // Add other arguments if needed, but these three are critical for Render
      // '--disable-gpu' // Often useful in headless environments
    ]
  });
};

module.exports = launchBrowser;