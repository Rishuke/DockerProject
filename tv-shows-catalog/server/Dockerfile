# Créer un Dockerfile pour cette application en mode production
FROM node:lts-alpine as build-stage

COPY . .

RUN npm install

RUN npm run build

FROM node:lts-alpine

WORKDIR ./server

COPY --from=build-stage /dist ./dist
COPY --from=build-stage /node_modules ./node_modules

CMD ["node","dist/main"]