FROM centos:centos7
MAINTAINER Jan Weitz <me@janweitz.de>
RUN yum --quiet install -y tar \
      gcc \
      gcc-c++ \
      make \
      openssl-static \
      c-ares-devel && \
      curl -s -O http://mosquitto.org/files/source/mosquitto-1.3.5.tar.gz && \
      tar xzf mosquitto-1.3.5.tar.gz && \
      cd mosquitto-1.3.5 && \
      make && \
      cp src/mosquitto /usr/local/bin/ && \
      cp mosquitto.conf /usr/local/etc/ && \
      cd / && \
      rm -rf mosquitto-1.3.5* && \
      useradd mosquitto && \
      yum --quiet remove -y tar \
      gcc \
      gcc-c++ \
      make \
      openssl-static \
      c-ares-devel

