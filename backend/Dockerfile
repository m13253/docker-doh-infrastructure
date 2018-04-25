FROM alpine:edge

RUN apk update && \
    apk upgrade && \
    apk add git go make musl-dev unbound

RUN mkdir /opt && \
    git clone https://github.com/m13253/dns-over-https.git /opt/dns-over-https && \
    cd /opt/dns-over-https && \
    make

COPY unbound.conf /etc/unbound/unbound.conf
COPY doh-*.conf /etc/dns-over-https/
COPY entrypoint.sh /entrypoint.sh

EXPOSE 8054
CMD /entrypoint.sh
