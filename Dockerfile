# Build React App
FROM node:14 as build
WORKDIR /app
COPY ./my-react-app/package.json ./my-react-app/package-lock.json ./
RUN npm install
COPY ./my-react-app ./
RUN npm run build

# Nginx Server
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
