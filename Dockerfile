#stage 1
FROM node:12 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
EXPOSE 9092
#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/devops-front-angular /usr/share/nginx/html