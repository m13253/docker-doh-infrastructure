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
    go build && \
    mkdir -p /usr/local/share/GeoIP

RUN wget -O /usr/local/share/GeoIP/GeoLite2-Country.mmdb https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz #redo

COPY unbound.conf /etc/unbound/unbound.conf
COPY doh-*.conf /etc/dns-over-https/
COPY entrypoint.sh /entrypoint.sh

EXPOSE 8053
CMD /entrypoint.sh
