FROM node:20-alpine

WORKDIR /app

# Copy dependency manifests first so Docker can cache this layer
COPY package*.json ./

# Install production dependencies only
RUN npm ci --omit=dev

# Copy the rest of the app
COPY . .

EXPOSE 3000

CMD ["node", "server.js"]
