#!/bin/sh

unbound-anchor -v
crond
unbound
/opt/dns-over-https/doh-client/doh-client -conf /etc/dns-over-https/doh-client.conf &
exec /opt/dns-over-https/doh-server/doh-server -conf /etc/dns-over-https/doh-server.conf
