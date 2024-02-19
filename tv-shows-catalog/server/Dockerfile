# Créer un Dockerfile pour cette application en mode production
FROM node:latest

COPY . .

WORKDIR .

RUN npm install

RUN npm run build

CMD ["node","dist/main"]