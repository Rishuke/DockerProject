# Créer un Dockerfile pour cette application en mode production
FROM node:latest

WORKDIR ./server

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

CMD ["node","dist/main"]