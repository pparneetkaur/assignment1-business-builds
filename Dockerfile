# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /kaur_parneet_site

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React app for production
RUN npm run build

# Install serve to serve the build files
RUN npm install -g serve

# Expose the port the app runs on
EXPOSE 7775

# Command to run the application
CMD ["serve", "-s", "build", "-l", "7775"]
