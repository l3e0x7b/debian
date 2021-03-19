FROM debian:10

LABEL description="修改 Debian 10 官方镜像的默认时区为 Asia/Shanghai，并将软件源替换为国内镜像源" \
	author="l3e0x7b, <lyq0x7b@foxmail.com>"

SHELL ["/bin/bash", "-c"]

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	echo "Asia/Shanghai" > /etc/timezone && \
	apt-get update && apt-get -y upgrade && \
	apt-get -y install apt-transport-https ca-certificates && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /var/log/apt/* /var/log/dpkg.log

COPY sources.list /etc/apt/sources.list
