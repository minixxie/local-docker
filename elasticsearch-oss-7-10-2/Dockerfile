FROM docker.elastic.co/elasticsearch/elasticsearch-oss:7.10.2

COPY        --from=wtfcoderz/static-healthcheck /healthcheck /
HEALTHCHECK --interval=5s --timeout=2s --start-period=30s --retries=2 CMD ["/healthcheck", "-http", "http://127.0.0.1:9200"]
