# --------------> The build image
FROM node:latest AS builder 
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY --chown=node:node . /usr/src/app
RUN npm install
USER node
CMD ["npm", "start"]


# made by Ziad 6/1/2021
# --------------> The production image
FROM node:lts-alpine
RUN mkdir /usr/src/app
USER node
WORKDIR /usr/src/app
COPY --chown=node:node --from=builder /usr/src/app/node_modules /usr/src/app/node_modules
COPY --chown=node:node . /usr/src/app
EXPOSE 8080
CMD ["npm", "start"]