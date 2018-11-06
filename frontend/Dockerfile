FROM m13253/doh-infrastructure:common

RUN mkdir -p /opt && \
    git clone https://github.com/m13253/dns-over-https.git /opt/dns-over-https && \
    cd /opt/dns-over-https && \
    make

ADD https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz /tmp/GeoLite2-Country.tar.gz

RUN git clone https://github.com/m13253/geodns-injector.git /opt/geodns-injector && \
    cd /opt/geodns-injector && \
    go get -d -v . && \
    go build && \
    cd /tmp && \
    tar xvf GeoLite2-Country.tar.gz && \
    mkdir -p /usr/local/share/GeoIP && \
    mv /tmp/GeoLite2-Country_*/GeoLite2-Country.mmdb /usr/local/share/GeoIP && \
    rm -rf /tmp/GeoLite2-Country*

COPY unbound.conf /usr/local/etc/unbound/unbound.conf
COPY doh-*.conf /etc/dns-over-https/
COPY entrypoint.sh /entrypoint.sh

EXPOSE 8053
CMD /entrypoint.sh
