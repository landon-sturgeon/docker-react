# install phase
FROM node:alpine as builder

WORKDIR /usr/app

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# Run phase
FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html