#!/usr/bin/env bash

directory=$(cd `dirname $0` && pwd)
source ${directory}/helpers/common.sh
source ${directory}/../.envrc

checkPreRequisites

docker-compose -f docker-compose.yml up -d --build

while ! nc -z localhost 9200 </dev/null; do sleep 5; done
#while ! nc -z localhost 24224 </dev/null; do sleep 5; done
#
## Check entire elasticsearch cluster
#checkURL "${elasticsearchCurlPrefix}" "-X GET https://localhost:9200/_cluster/health"
#
#checkURL "${kibanaCurlPrefix}" "${kibanaUrl}/app/kibana#"
#createKibanaIndices
#open "${kibanaUrl}/app/kibana#/discover?_g=()"