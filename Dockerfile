FROM ubuntu:latest AS myapp

RUN apt-get update && apt-get install -y curl gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

WORKDIR /usr/src/app

RUN npm install -g nodemon

COPY package*.json ./
RUN npm install

COPY react-src/package*.json ./react-src/
RUN cd react-src && npm install

COPY . .

FROM node:alpine

WORKDIR /app

COPY --from=myapp /usr/src/app /app

RUN npm install -g nodemon

EXPOSE 3000 4200

CMD ["npm", "start"]
