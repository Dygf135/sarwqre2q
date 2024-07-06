# Use an official Node runtime as a parent image
FROM apify/actor-node:20

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . ./

# Install any needed packages specified in package.json
RUN npm install --quiet --only=prod --no-optional

# Install Puppeteer and download Chromium
RUN npm install puppeteer

# Make port 80 available to the world outside this container
EXPOSE 80

# Run the application when the container launches
CMD ["node", "screenshot.js"]
