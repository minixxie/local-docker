FROM ${PULL_THRU_CACHE}clickhouse/clickhouse-server:23.9.1

COPY        --from=wtfcoderz/static-healthcheck /healthcheck /
HEALTHCHECK --interval=5s --timeout=2s --start-period=30s --retries=2 CMD ["/healthcheck", "-http", "http://127.0.0.1:8123/ping"]
