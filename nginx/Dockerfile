FROM ${PULL_THRU_CACHE}library/nginx:alpine

COPY        --from=minixxie/static-healthcheck /healthcheck /
HEALTHCHECK --interval=5s --timeout=2s --start-period=30s --retries=2 CMD ["/healthcheck", "-tcp", "127.0.0.1:80"]
