# Use an official Node runtime as a parent image
FROM apify/actor-node:20

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Ensure Puppeteer installs Chromium
RUN npm install puppeteer@latest --ignore-scripts

# Copy the rest of the application code to the working directory
COPY . .

# Make port 80 available to the world outside this container
EXPOSE 80

# Run the application when the container launches
CMD ["node", "screenshot.js"]
