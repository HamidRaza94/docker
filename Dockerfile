# Alpine dist with Node JS app
FROM node:18.19.1-alpine3.19 AS base

# Setup user configuration
RUN addgroup app && adduser -S -G app app
USER app

# Set working directory
WORKDIR /app

# Copy dependency configuration to working directory
COPY package*.json .

# Install the dependency
RUN npm Install

# Copy all file to working directory
COPY . .

# Expose the app on port
EXPOSE 3000

# Start the application
CMD [ "npm", "run", "start" ]
