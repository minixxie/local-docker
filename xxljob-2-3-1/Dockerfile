FROM ${PULL_THRU_CACHE}minixxie/xxl-job-admin:2.3.1

COPY        --from=minixxie/static-healthcheck /healthcheck /
HEALTHCHECK --interval=5s --timeout=2s --start-period=30s --retries=2 CMD ["/healthcheck", "-http", "http://127.0.0.1:8080"]
