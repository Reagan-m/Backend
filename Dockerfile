# Use Node.js base image
FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy all source files
COPY . .

# Expose app port (change if needed)
EXPOSE 5000

# Start the app
CMD ["npm", "start"]
