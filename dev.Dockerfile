FROM node:12

# Create app directory
WORKDIR /couch-potato

# Install app dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

EXPOSE 8100
CMD [ "npm", "start" ]
