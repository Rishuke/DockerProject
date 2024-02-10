# Créer un Dockerfile pour cette application en mode production
# FROM node:latest

FROM node:latest

WORKDIR ./client

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

CMD ["npm","run","preview"]

# FROM nginx:latest

# COPY --from=build client /usr/share/nginx/html

# COPY ./default.conf /etc/nginx/conf.d/default.conf

# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]