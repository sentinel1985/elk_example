FROM logstash:latest

MAINTAINER sentinel1985

# Install logstash-input-beats plugin
RUN logstash-plugin install logstash-input-beats

# Install NGINX pattern
ADD patterns/nginx /opt/logstash/patterns/nginx
RUN chown logstash: /opt/logstash/patterns/nginx
