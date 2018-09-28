#!/usr/bin/env bash
echo "step1:${BASH_SOURCE-$0}"
ZOOBIN="${BASH_SOURCE-$0}"
echo "step2:$ZOOBIN"
ZOOBIN="$(dirname "${ZOOBIN}")"
echo "step3:$ZOOBINDIR"
ZOOBINDIR="$(cd "${ZOOBIN}"; pwd)"

echo "step4:cp $ZOOBINDIR/../conf/zoo_sample.cfg $ZOOBINDIR/../conf/zoo.cfg"
cp $ZOOBINDIR/../conf/zoo_sample.cfg $ZOOBINDIR/../conf/zoo.cfg

echo "step5:${HOSTNAME##*-} > $ZOOBINDIR/../data/myid"
echo ${HOSTNAME##*-} > $ZOOBINDIR/../data/myid

echo "step6:$ZOO_COUNT"
if [ "$ZOO_COUNT" != "" ];then
	for id in $(seq 1 $ZOO_COUNT)
	do
		echo "server.$id=${HOSTNAME%-*}-$id:2888:3888" >> $ZOOBINDIR/../conf/zoo.cfg
	done
fi

echo "step7:$ZOOBINDIR/zkServer.sh start-foreground"
$ZOOBINDIR/zkServer.sh start-foreground