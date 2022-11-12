#stage 1
FROM node:12
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/devops-front-angular /usr/share/nginx/html