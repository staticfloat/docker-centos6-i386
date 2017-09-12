FROM scratch
MAINTAINER Elliot Saba <staticfloat@gmail.com>

ADD build_out/centos6.tar.gz /
RUN echo "i686" > /etc/yum/vars/arch && \
    echo "i386" > /etc/yum/vars/basearch

ENTRYPOINT ["linux32"]
