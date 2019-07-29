# Production container

#Build Phase
FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm build

#Run phase
FROM nginx AS runner
COPY --from=builder /app/build /usr/share/nginx/html
# NGINX repo starts automatically no RUN commadnd required
