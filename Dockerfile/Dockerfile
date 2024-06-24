FROM nginx:alpine

COPY /build /usr/share/nginx/html/build

COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 801

CMD ["nginx", "-g", "daemon off;"]
