#!/bin/bash

while true; do
    echo "Uploading filebeat.template.json to elasticsearch ..."
    response=$(curl -XPUT --write-out %{http_code} --output /dev/null --silent 'http://elasticsearch:9200/_template/filebeat?pretty' -d@/etc/filebeat/filebeat.template.json)
    if [ "$response" == "200" ]; then
        echo "Done!"
        break
    fi
    echo "Failure (HTTP response code = $response)"
    echo "Retry in 3 seconds ... "
    sleep 3
done

echo "Starting Filebeat ..."
/etc/init.d/filebeat start
echo "Done!"
echo "Starting NGINX ... "
nginx
echo "Done!"
tail -f /var/log/nginx/access.log -f /var/log/nginx/error.log
