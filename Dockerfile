FROM node:latest AS build

#creata a working directory in the container
WORKDIR /app

#copy package.json from the root folder path
COPY package*.json ./

#install dependencies
RUN yarn install

#copy rest of the code to the /app folder
COPY . .

#Build application for production
RUN yarn build


# Stage 2 - Serve the built app with Nginx
FROM nginx:alpine

# Copy built files from Stage 1 (build) to Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Nginx runs on port 80 by default
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]