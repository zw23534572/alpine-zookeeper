FROM registry.cn-shenzhen.aliyuncs.com/sjroom/alpine-java8
ADD zookeeper-3.4.9 /export/servers/zookeeper
RUN chmod +x /export/servers/zookeeper/bin/*
RUN echo "/export/servers/zookeeper/bin/start.sh"  >> /export/servers/script/start.sh