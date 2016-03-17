FROM registry.aliyuncs.com/com.lida/ubuntu-ssh:14.04
MAINTAINER Li Da <lidaemail@qq.com>

RUN apt-get update && apt-get install -y supervisor

COPY inet_http_server.conf /etc/supervisor/conf.d/inet_http_server.conf

EXPOSE 9001

CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]

