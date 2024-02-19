# Créer un Dockerfile pour cette application en mode production
# FROM nginx:latest

# COPY ./build /usr/share/nginx/html

# COPY ./default.conf /etc/nginx/conf.d/default.conf

# RUN nginx -g daemon off;

FROM node:latest

COPY . .

WORKDIR ./client

RUN npm install

RUN npm run build

CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]
