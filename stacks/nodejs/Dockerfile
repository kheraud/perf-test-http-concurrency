# Node 12.15.0-alpine3.11 linux/amd64
FROM node@sha256:53f3ac17d2b5084361606457acc8e16ebea3fd5536dc79b374774e8b99ee62ff

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

#RUN npm install

# If you are building your code for production
RUN npm ci --only=production

# Bundle app source
COPY . .

ENV NODE_ENV=production

EXPOSE 9000
CMD [ "node", "server.js" ]
