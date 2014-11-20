FROM centos:centos7
MAINTAINER Jan Weitz <me@janweitz.de>
RUN yum --quiet install -y tar \
      mercurial \
      gcc \
      gcc-c++ \
      make \
      cmake \
      openssl-static \
      libuuid-devel \
      c-ares-devel && \
      cd /tmp && curl -s -O http://git.warmcat.com/cgi-bin/cgit/libwebsockets/snapshot/libwebsockets-1.3-chrome37-firefox30.tar.gz && \
      tar xzf libwebsockets-1.3-chrome37-firefox30.tar.gz && \
      cd libwebsockets-1.3-chrome37-firefox30 && mkdir build && cd build && cmake .. && make && make install && cp lib/libwebsockets.so* /lib64/ && \
      cd /tmp && hg clone https://bitbucket.org/oojah/mosquitto && cd mosquitto && \
      hg pull && hg update 1.4 && \
      sed -i 's/WITH_WEBSOCKETS:=no/WITH_WEBSOCKETS:=yes/' config.mk && \
      make binary && cp src/mosquitto /usr/local/bin/ && cp mosquitto.conf /usr/local/etc/ && \
      useradd mosquitto && \
      yum --quiet remove -y tar \
      mercurial \
      gcc \
      gcc-c++ \
      make \
      cmake \
      openssl-static \
      libuuid-devel \
      c-ares-devel && \
      rm -rf /tmp/*

