FROM nginx:latest
MAINTAINER sentinel1985


RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y curl \
 && apt-get clean

RUN curl -L -O https://download.elastic.co/beats/filebeat/filebeat_1.2.3_amd64.deb \
 && dpkg -i filebeat_1.2.3_amd64.deb \
 && rm filebeat_1.2.3_amd64.deb

RUN rm /var/log/nginx/access.log /var/log/nginx/error.log

ADD filebeat.yml /etc/filebeat/filebeat.yml

ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
CMD [ "/usr/local/bin/start.sh" ]
