FROM node:10-alpine
WORKDIR /docker
COPY package*.json /docker
RUN npm install
COPY . /app
CMD [ "npm", "start" ]


