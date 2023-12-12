# Production Dockerfile for Angular
FROM node:18 as build
WORKDIR /app
COPY . /app
RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
