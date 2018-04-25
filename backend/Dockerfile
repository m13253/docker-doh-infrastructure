FROM alpine:edge

RUN apk update && \
    apk upgrade && \
    apk add dnssec-root expat-dev file git gnupg go linux-headers make musl-dev openssl-dev

RUN cd /tmp && \
    wget https://www.unbound.net/downloads/unbound-1.7.0.tar.gz{.asc,} && \
    gpg --recv-keys 9F6F1C2D7E045F8D && \
    gpg --verify unbound-*.tar.gz{.asc,} && \
    tar xvf unbound-*.tar.gz && \
    cd unbound-*/ && \
    ./configure --enable-subnet && \
    make && \
    make install && \
    rm -rf /tmp/unbound-*

RUN mkdir /opt && \
    git clone https://github.com/m13253/dns-over-https.git /opt/dns-over-https && \
    cd /opt/dns-over-https && \
    make

COPY unbound.conf /usr/local/etc/unbound/unbound.conf
COPY doh-*.conf /etc/dns-over-https/
COPY entrypoint.sh /entrypoint.sh

EXPOSE 8054
CMD /entrypoint.sh
