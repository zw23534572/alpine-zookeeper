#!/usr/bin/env bash

ZOOBIN="${BASH_SOURCE-$0}"
ZOOBIN="$(dirname "${ZOOBIN}")"
ZOOBINDIR="$(cd "${ZOOBIN}"; pwd)"

if [ -z $consul_service_name ];then
    export consul_service_name='zookeeper'
fi
mkdir -p /export/servers/consul/
echo '{
    "service": {
        "name": "'$consul_service_name'",
        "port": 2181,
        "checks": [
            {
                "script": "if test $(netstat -nltp|grep 2181|wc -l) -eq 0 ; then return -1; else return 0; fi",
                "interval": "5s",
				"timeout": "2s"
            }
        ]
    }
}' > /export/servers/consul/consul.json


cp $ZOOBINDIR/../conf/zoo_sample.cfg $ZOOBINDIR/../conf/zoo.cfg

echo ${HOSTNAME##*-} > $ZOOBINDIR/../data/myid

if [ "$ZOO_COUNT" != "" ];then
	for id in $(seq 1 $ZOO_COUNT)
	do
		echo "server.$id=${HOSTNAME%-*}-$id:2888:3888" >> $ZOOBINDIR/../conf/zoo.cfg
	done
fi

$ZOOBINDIR/zkServer.sh start-foreground
