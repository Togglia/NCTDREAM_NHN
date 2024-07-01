FROM nginx:1.14-alpine

COPY /build /usr/share/nginx/html/build

COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
