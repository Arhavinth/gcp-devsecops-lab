FROM nginx:1.27-alpine

COPY k8s/index.html /usr/share/nginx/html/index.html

EXPOSE 80
