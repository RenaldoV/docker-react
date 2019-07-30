# Production container

#Build Phase
FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm build

#Run phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# NGINX repo starts automatically no RUN command
