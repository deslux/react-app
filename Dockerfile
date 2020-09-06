# BUILD Phase 
FROM node:alpine as build
WORKDIR '/app'
COPY package.json .

RUN npm install 

COPY . . 
RUN npm run build 

# DEPLOY/RUN Phase 
FROM nginx as run
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html

# Use default container command to start nginx 
# docker run -it -p 8080:80 CONTAINER_ID