FROM node:latest

# Create app directory
WORKDIR /app

# Bundle app source
COPY package.json ./
COPY src/ src

RUN npm install

EXPOSE 8080
CMD [ "npm", "run", "start-docker" ]