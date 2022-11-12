#stage 1
FROM node:12-alpine as node-build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
EXPOSE 9092
#stage 2
FROM nginx:alpine
COPY --from=node-build /app/dist/devops-front-angular /usr/share/nginx/html