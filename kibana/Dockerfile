FROM kibana:latest

MAINTAINER sentinel1985

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y netcat

COPY start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh

RUN kibana plugin --install elastic/sense

CMD ["/tmp/start.sh"]
