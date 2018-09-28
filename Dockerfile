FROM registry.cn-shenzhen.aliyuncs.com/sjroom/alpine-base
ADD zookeeper-3.4.9 /export/servers/zookeeper-3.4.9
RUN chmod +x /export/servers/zookeeper-3.4.9/bin/*
RUN echo "/export/servers/zookeeper-3.4.9/bin/start.sh"  >> /export/servers/start.sh