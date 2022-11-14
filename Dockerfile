#stage 1: Compile and Build angular codebase


# Use official nginx image as the base image

FROM nginx:1.17.1-alpine


# Set the working directory
WORKDIR /devops-angular

# Add the source code to app
COPY . .

# Install all the dependencies
RUN npm install

# Generate the build of the application
RUN npm run build --prod

COPY /devops-angular/dist/crudtuto-Front /usr/share/nginx/html