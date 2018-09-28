#!/usr/bin/env bash

ZOOBIN="${BASH_SOURCE-$0}"
ZOOBIN="$(dirname "${ZOOBIN}")"
ZOOBINDIR="$(cd "${ZOOBIN}"; pwd)"

cp $ZOOBINDIR/../conf/zoo_sample.cfg $ZOOBINDIR/../conf/zoo.cfg

echo ${HOSTNAME##*-} > $ZOOBINDIR/../data/myid

if [ "$ZOO_COUNT" != "" ];then
	for id in $(seq 1 $ZOO_COUNT)
	do
		echo "server.$id=${HOSTNAME%-*}-$id:2888:3888" >> $ZOOBINDIR/../conf/zoo.cfg
	done
fi

$ZOOBINDIR/zkServer.sh start-foreground
