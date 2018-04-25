FROM alpine:edge

RUN apk update && \
    apk upgrade && \
    apk add git go make musl-dev unbound

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

COPY unbound.conf /etc/unbound/unbound.conf
COPY doh-*.conf /etc/dns-over-https/
COPY entrypoint.sh /entrypoint.sh

EXPOSE 8053
CMD /entrypoint.sh
