FROM redis


ADD sentinel.conf /etc/redis/sentinel.conf
RUN chown redis:redis /etc/redis/sentinel.conf
ENV SENTINEL_QUORUM 1
ENV SENTINEL_DOWN_AFTER 5000
ENV SENTINEL_FAILOVER 10000
ENV SENTINEL_PORT 26379
ADD entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]