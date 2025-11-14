# Use an official Node.js runtime
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install 

# Copy the rest of the project
COPY . .

# Expose port
EXPOSE 4040

# Start the app
CMD ["npm", "start"]

