FROM node:14-alpine as builder 
#tagged as builder
#Production  

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# app/build contain all stuff

#second phase

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
