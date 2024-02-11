# Créer un Dockerfile pour cette application en mode production
# FROM nginx:latest

# COPY ./build /usr/share/nginx/html

# COPY ./default.conf /etc/nginx/conf.d/default.conf

# RUN nginx -g daemon off;

FROM node:latest

WORKDIR ./client

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]


