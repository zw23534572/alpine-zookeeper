FROM alpine:edge
ADD zookeeper-3.4.9 /export/servers/zookeeper-3.4.9
WORKDIR /export/servers/zookeeper-3.4.9/bin/
RUN chmod +x /export/servers/zookeeper-3.4.9/bin/start.sh

CMD ["bash", "/export/servers/zookeeper-3.4.9/bin/start.sh"]