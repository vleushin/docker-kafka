FROM java:8

RUN wget -q http://www.trieuvan.com/apache/kafka/0.9.0.0/kafka_2.10-0.9.0.0.tgz -O /tmp/kafka.tgz && \
    tar xfz /tmp/kafka.tgz -C /opt && \
    mv /opt/kafka_2.10-0.9.0.0 /opt/kafka && \
    rm /tmp/kafka.tgz

EXPOSE 9092

WORKDIR /opt/kafka

VOLUME ["/opt/kafka/conf", "/tmp/kafka-logs"]

CMD ["/opt/kafka/bin/kafka-server-start.sh", "config/server.properties"]
