# Use a Node.js base image that is suitable for Puppeteer
# node:20-slim is a good choice as it's lean but based on Debian/Ubuntu,
# allowing us to use apt-get for Chromium.
FROM node:20-slim

# Install system dependencies required for Puppeteer to run Chromium
# This list is comprehensive and covers most common needs.
# '--no-install-recommends' keeps the image size smaller.
RUN apt-get update && apt-get install -y \
    chromium \
    fontconfig \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libgbm1 \
    libxkbcommon0 \
    libatspi2.0-0 \
    libgtk-3-0 \
    libasound2 \
    libgcc1 \
    libgconf-2-4 \
    libgdk-pixbuf2.0-0 \
    libjpeg-turbo8 \
    libnotify4 \
    libpng16-16 \
    libstdc++6 \
    libwebp6 \
    libx11-6 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    ca-certificates \
    fonts-liberation \
    libappindicator1 \
    libdbus-glib-1-2 \
    libnss3 \
    libexpat1 \
    libpam0g \
    libxcb1 \
    xdg-utils \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker's build cache
# This means if only your code changes, but dependencies don't, npm install won't re-run.
COPY package*.json ./

# Install Node.js dependencies
# --omit=dev keeps the production image smaller
RUN npm install --omit=dev

# Copy the rest of your application code to the container
# This will copy your 'scrapping' folder, 'server.js', etc.
COPY . .

# Set the working directory to where your server.js is located
# Adjust this if your server.js is directly in /app, otherwise '/app/scrapping' is correct for your structure
WORKDIR /app/scrapping

# Expose the port your Express app will listen on.
# Render automatically maps this container port to an external port.
EXPOSE 10000

# Define the command to run your application when the container starts
# This should match your 'start' script from package.json, adjusted for the WORKDIR
CMD ["node", "server.js"]