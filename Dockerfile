# Use the official Node.js 16 image as a parent image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and pnpm-lock.yaml files into the container at /app
COPY package.json pnpm-lock.yaml ./

# Install pnpm
RUN npm install -g pnpm

# Install project dependencies
RUN pnpm install

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .

# Make port 5000 available to the world outside this container
EXPOSE 3002

# Run the specified command within the container.
CMD [ "pnpm", "run", "dev", "--", "--host" ]
