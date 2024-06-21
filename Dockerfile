FROM oven/bun

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json, package-lock.json (if available), bun.lockb, and other necessary files
COPY package*.json bun.lockb ./

# Install dependencies
RUN bun install

# Copy the rest of your application's source code
COPY . .

# Build your Next.js application
RUN bun run build

RUN bun next telemetry disable

# Start the application
CMD ["bun", "start"]
