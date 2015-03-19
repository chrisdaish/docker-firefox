FROM ubuntu:14.04

MAINTAINER Chris Daish <chrisdaish@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV FIREFOXVERSION 36.0.1+build2-0ubuntu0.14.04.1
ENV uid 1000
ENV gid 1000

COPY CanonicalPartners.list /etc/apt/sources.list.d/

RUN useradd -m firefox; \
    apt-get update; \
    apt-get install -y firefox=$FIREFOXVERSION dbus-x11 adobe-flashplugin; \
    rm -rf /var/lib/apt/lists/*

COPY start-firefox.sh /tmp/

ENTRYPOINT ["/tmp/start-firefox.sh"]
