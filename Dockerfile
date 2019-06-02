FROM alpine:3.6
MAINTAINER Daniel Parnell <me@danielparnell.com>

RUN apk --update --no-progress upgrade \
    && apk add --no-progress bash freeswitch tzdata vim \
    && mkdir -p /freeswitch/db \
    && mkdir -p /freeswitch/scripts \
    && mkdir -p /freeswitch/conf \
    && mkdir -p /freeswitch/recordings \
    && mkdir -p /freeswitch/storage \
    && mkdir -p /freeswitch/sounds \
    && mkdir -p /freeswitch/log \
    && rm -rf /var/cache/apk/*

VOLUME ["/freeswitch"]
ENV TZ=Australia/Melbourne
ENTRYPOINT /usr/bin/freeswitch -c -db /freeswitch/db -scripts /freeswitch/scripts -conf /freeswitch/conf -recordings /freeswitch/recordings -storage /freeswitch/storage -sounds /freeswitch/sounds -log /freeswitch/log

