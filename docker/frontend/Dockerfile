# Use an official Node.js runtime as a base image
FROM node:14-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in package.json
RUN npm install

# Make port 80 available to the world outside this container
EXPOSE 80

# Run app.js when the container launches
CMD ["node", "app.js"]
