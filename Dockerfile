FROM registry.aliyuncs.com/com.lida/ubuntu-ssh:14.04
MAINTAINER Li Da <lidaemail@qq.com>

RUN apt-get update && apt-get install supervisor

COPY inet_http_server.conf /etc/supervisor/conf.d/inet_http_server.conf

CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]