FROM nginx:latest

MAINTAINER sentinel1985

RUN mkdir -p /etc/nginx/passwords
COPY nginx.conf /etc/nginx/nginx.conf
COPY kibana.conf /etc/nginx/sites-enabled/kibana.conf
