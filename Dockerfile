#multi stage process

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# next stage
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

#default copmmand is starting the nginx