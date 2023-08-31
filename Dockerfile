# Build React App
FROM node:14 as build
WORKDIR /app
COPY ./TRIP_MEMO_WEB/package.json ./TRIP_MEMO_WEB/package-lock.json ./
RUN npm install
COPY ./TRIP_MEMO_WEB ./
RUN npm run build

# Nginx Server
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
