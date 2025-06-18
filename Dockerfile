# Use a Node.js base image that has apt and can install Chromium
# node:20-slim is a good choice as it's small but Debian-based.
FROM node:20-slim

# Install Chromium and its necessary system dependencies
# Updated: Removed libjpeg-turbo8 and libwebp6 which are causing issues on Bookworm.
# Added libu2f-udev which is often a missing dependency for Chromium on modern Debian.
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
    libnotify4 \
    libpng16-16 \
    libstdc++6 \
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
    libu2f-udev \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker's build cache
COPY package*.json ./

# Install Node.js dependencies
RUN npm install --omit=dev

# Copy the rest of your application code
COPY . .

# If your main server.js is in a subdirectory (e.g., 'scrapping'), change to that directory
WORKDIR /app/scrapping

# Expose the port your Express app is listening on
EXPOSE 10000

# Command to run your application when the container starts
CMD ["node", "server.js"]