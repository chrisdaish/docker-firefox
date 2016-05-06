FROM ubuntu:14.04.3

MAINTAINER Chris Daish <chrisdaish@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

COPY AptSources /etc/apt/sources.list.d/

ENV FIREFOXVERSION 46.0+build5-0ubuntu0.14.04.2

RUN useradd -m firefox; \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections; \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886; \
    apt-get update; \
    apt-get install -y --no-install-recommends  firefox=$FIREFOXVERSION \
                                                dbus-x11 \
                                                adobe-flashplugin \
                                                libxext-dev \
                                                libxrender-dev \
                                                libxtst-dev \
                                                oracle-java8-installer \
                                                oracle-java8-set-default; \
    rm -rf /var/lib/apt/lists/*

COPY start-firefox.sh /tmp/

ENTRYPOINT ["/tmp/start-firefox.sh"]
