FROM ubuntu:14.04
MAINTAINER Li Da <lidaemail@qq.com>
# 修改apt-get为阿里镜像源
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
        openssh-server \
		supervisor \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

RUN echo 'root:root' | chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#COPY inet_http_server.conf /etc/supervisor/conf.d/inet_http_server.conf

COPY run /app/run
RUN chmod a+x /app/run

EXPOSE 22 9901

CMD ["/app/run"]