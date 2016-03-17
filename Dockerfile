FROM registry.aliyuncs.com/com.lida/ubuntu-ssh
MAINTAINER Li Da <lidaemail@qq.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
		supervisor \
    && rm -rf /var/lib/apt/lists/*

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY run /app/run
RUN chmod a+x /app/run

EXPOSE 9001

CMD ["/app/run"]
