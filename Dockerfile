FROM alpine:3.6
MAINTAINER Daniel Parnell <me@danielparnell.com>

RUN apk --update --no-progress upgrade \
    && apk add --no-progress bash freeswitch tzdata vim \
    && mkdir -p /db \
    && mkdir -p /scripts \
    && mkdir -p /conf \
    && mkdir -p /recordings \
    && mkdir -p /storage \
    && mkdir -p /sounds \
    && mkdir -p /log \
    && rm -rf /var/cache/apk/*

VOLUME ["/db", "/scripts", "/conf", "/recordings", "/storage", "/sounds", "/log"]
ENV TZ=Australia/Melbourne
ENTRYPOINT /usr/bin/freeswitch -c -db /db -scripts /scripts -conf /conf -recordings /recordings -storage /storage -sounds /sounds -log /log

