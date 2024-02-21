# Créer un Dockerfile pour cette application en mode production
FROM node:lts-alpine as build-stage

WORKDIR ./server

COPY . .

RUN npm install

RUN npm run build



FROM node:lts-alpine

COPY --from=build-stage server/dist ./dist
COPY --from=build-stage server/node_modules ./node_modules

CMD ["node","dist/main"]