#!/bin/bash
apt-get update && apt-get upgrade -y
if [ ! -d "elk_example" ]; then
  	apt-get install -y apt-transport-https ca-certificates git
	apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list
	apt-get update
	apt-get purge lxc-docker
	apt-get install -y linux-image-extra-$(uname -r)
	apt-get install -y apparmor
	apt-get update
	apt-get install -y docker-engine
	service docker start
	curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
	git clone https://github.com/sentinel1985/elk_example.git
fi
cd elk_example
docker-compose up --build -d