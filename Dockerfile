#FROM node:14.3.0-alpine 
#RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
#WORKDIR /docker
#ADD package.json ./
#COPY package*.json /docker
#RUN npm install
#COPY . /docker
#CMD [ "npm", "start" ]


FROM node:14.3.0-alpine 
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
ADD package.json ./
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
USER node
RUN  npm install
#RUN npm audit
COPY --chown=node:node . .
EXPOSE 3000
#CMD [ "node", "server" ]
ENTRYPOINT ["/docker-entrypoint.sh"]

#FROM node:14.3.0-alpine 
#RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
#WORKDIR /home/node/app
#ADD package.json ./
#COPY ./docker-entrypoint.sh /docker-entrypoint.sh
#RUN chmod +x /docker-entrypoint.sh
#USER node
#RUN  npm install
#RUN npm audit
#COPY --chown=node:node . .
#EXPOSE 3000
#CMD [ "node", "server" ]
#ENTRYPOINT ["/docker-entrypoint.sh"]




