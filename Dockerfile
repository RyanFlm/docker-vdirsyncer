FROM debian:latest
LABEL maintainer="RyanFlm"
ENV REFRESHED_AT=20170408 LC_ALL=C.UTF-8 LANG=C.UTF-8
RUN useradd -m -s /bin/bash vds
RUN apt-get update; \
    apt-get upgrade -y; \
    apt-get install -y libxml2 libxslt1.1 zlib1g python3-pip; \
    python3 -m pip install -U pip; \
    python3 -m pip install request-oauthlib; \
    python3 -m pip install vdirsyncer
USER vds
RUN mkdir -p /home/vds/.config/vdirsyncer
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
