FROM gliderlabs/alpine

RUN apk --update add socat bash

EXPOSE 514

ADD syslog /usr/bin/syslog

RUN chmod +x /usr/bin/syslog && mkdir -p /syslog

VOLUME /syslog

ENTRYPOINT ["/usr/bin/syslog"]

CMD [ "-t", "tcp" ]
