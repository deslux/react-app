# BUILD Phase 
FROM node:alpine
WORKDIR '/app'
COPY package.json .

RUN npm install 

COPY . . 
RUN npm run build 

# DEPLOY/RUN Phase 
FROM nginx as run
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

# Use default container command to start nginx 
# docker run -it -p 8080:80 CONTAINER_ID
# Bug in AWS Beanstalk: Use unnamed builders (from=0)