FROM alpine:edge

ADD https://nlnetlabs.nl/downloads/unbound/unbound-1.8.1.tar.gz.asc /tmp/unbound-1.8.1.tar.gz.asc
ADD https://nlnetlabs.nl/downloads/unbound/unbound-1.8.1.tar.gz /tmp/unbound-1.8.1.tar.gz
RUN apk update && \
    apk upgrade && \
    apk add dnssec-root expat git go libevent make musl-dev openssl && \
    apk add -t build-dep expat-dev gnupg libevent-dev linux-headers make openssl-dev && \
    cd /tmp && \
    gpg --recv-keys 9F6F1C2D7E045F8D && \
    gpg --verify unbound-*.tar.gz.asc unbound-*.tar.gz && \
    tar xvf unbound-*.tar.gz && \
    cd unbound-*/ && \
    ./configure --enable-subnet --with-libevent && \
    make && \
    make install && \
    apk del build-dep && \
    rm -rf /tmp/unbound-* /var/cache/apk/*
