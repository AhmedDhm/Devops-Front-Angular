#stage 1: Compile and Build angular codebase


# Use official node image as the base image
FROM node:latest 

# Set the working directory
WORKDIR /devops-angular

# Add the source code to app
COPY ./ /devops-angular

# Install all the dependencies
RUN npm install

# Generate the build of the application
RUN npm run build --prod

#stage 2: Serve app with nginx server
FROM nginx:alpine
COPY --from=node:latest /devops-angular/dist/devops-front-angular /usr/share/nginx/html

# Expose port 80
EXPOSE 80