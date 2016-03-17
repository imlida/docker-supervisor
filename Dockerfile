FROM registry.aliyuncs.com/com.lida/ubuntu-ssh:14.04
MAINTAINER Li Da <lidaemail@qq.com>

RUN apt-get update && apt-get install supervisor

CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]