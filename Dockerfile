FROM nginx:alpine
COPY ./public_html /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
