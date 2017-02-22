FROM ubuntu:14.04.3

MAINTAINER Chris Daish <chrisdaish@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

COPY AptSources /etc/apt/sources.list.d/

RUN useradd -m firefox; \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections; \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886; \
    apt-get update

RUN apt-get install -y --no-install-recommends  dbus-x11 \
                                                adobe-flashplugin \
                                                libxext-dev \
                                                libxrender-dev \
                                                libxtst-dev \
                                                oracle-java8-installer \
                                                oracle-java8-set-default

RUN apt-get install -y --no-install-recommends  firefox; \
    rm -rf /var/lib/apt/lists/*

COPY start-firefox.sh /tmp/
RUN chmod 0755 /tmp/start-firefox.sh 

ENTRYPOINT ["/tmp/start-firefox.sh"]
