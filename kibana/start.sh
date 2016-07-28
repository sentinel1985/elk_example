#!/usr/bin/env bash

echo "Waiting for Elasticsearch ... "
while true; do
    nc -q 1 elasticsearch 9200 2>/dev/null && break
    echo "..."
    sleep 3
done
echo "Elasticsearch has started ... Done!"
echo "Starting Kibana ... "
exec kibana
echo "Done!"
