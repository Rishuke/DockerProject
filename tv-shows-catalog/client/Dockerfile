# Créer un Dockerfile pour cette application en mode production
# FROM nginx:latest

# COPY ./build /usr/share/nginx/html

# COPY ./default.conf /etc/nginx/conf.d/default.conf

# RUN nginx -g daemon off;

FROM node:lts-alpine as build-stage

WORKDIR ./client

ENV API_BASE_URL=http://apiMakeMeWatch:3000

COPY . .

RUN npm install

RUN npm run build

FROM node:lts-alpine

WORKDIR ./client

COPY --from=build-stage client/build ./build
COPY --from=build-stage client/package.json  .
COPY --from=build-stage client/node_modules ./node_modules

CMD ["node", "build/index.js","--", "--host", "0.0.0.0"]
