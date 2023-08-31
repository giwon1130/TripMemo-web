# Build React App
FROM node:14 as build
WORKDIR /app
COPY ./trip_memo_web/package.json ./trip_memo_web/package-lock.json ./
RUN npm install
COPY ./trip_memo_web ./
RUN npm run build

# Nginx Server
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
