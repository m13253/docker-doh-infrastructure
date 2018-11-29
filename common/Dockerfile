FROM alpine:edge

RUN apk update && \
    apk upgrade && \
    apk add dnssec-root expat git go libevent make musl-dev openssl && \
    apk add -t build-dep expat-dev file gnupg libevent-dev linux-headers make openssl-dev && \
    cd /tmp && \
    wget https://www.unbound.net/downloads/unbound-1.7.0.tar.gz.asc https://www.unbound.net/downloads/unbound-1.7.0.tar.gz && \
    gpg --recv-keys 9F6F1C2D7E045F8D && \
    gpg --verify unbound-*.tar.gz.asc unbound-*.tar.gz && \
    tar xvf unbound-*.tar.gz && \
    cd unbound-*/ && \
    ./configure --enable-subnet --with-libevent && \
    make && \
    make install && \
    apk del build-dep && \
    rm -rf /tmp/unbound-* /var/cache/apk/*
