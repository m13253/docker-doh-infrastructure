FROM alpine:edge

RUN apk update && \
    apk upgrade && \
    apk add dnssec-root expat-dev file git gnupg go linux-headers make musl-dev openssl-dev

RUN cd /tmp && \
    wget https://www.unbound.net/downloads/unbound-latest.tar.gz{.asc,} && \
    gpg --recv-keys 9F6F1C2D7E045F8D && \
    gpg --verify unbound-latest.tar.gz{.asc,} && \
    tar xvf unbound-latest.tar.gz && \
    cd unbound-*/ && \
    ./configure --enable-subnet && \
    make && \
    make install && \
    rm -rf /tmp/unbound-*

RUN mkdir /opt && \
    git clone https://github.com/m13253/dns-over-https.git /opt/dns-over-https && \
    cd /opt/dns-over-https && \
    make

RUN git clone https://github.com/m13253/geodns-injector.git /opt/geodns-injector && \
    cd /opt/geodns-injector && \
    go get -d -v . && \
    go build

ADD https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz /tmp/GeoLite2-Country.tar.gz

RUN cd /tmp && \
    tar xvf GeoLite2-Country.tar.gz && \
    mkdir -p /usr/local/share/GeoIP && \
    mv /tmp/GeoLite2-Country_*/GeoLite2-Country.mmdb /usr/local/share/GeoIP && \
    rm -rf /tmp/GeoLite2-Country*

COPY unbound.conf /usr/local/etc/unbound/unbound.conf
COPY doh-*.conf /etc/dns-over-https/
COPY entrypoint.sh /entrypoint.sh

EXPOSE 8053
CMD /entrypoint.sh
