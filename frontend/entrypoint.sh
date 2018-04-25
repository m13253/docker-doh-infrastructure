#!/bin/sh

unbound-anchor -v
crond
unbound
/opt/geodns-injector/geodns-injector -country CN -replace 223.5.5.0 -upstream '[::1]:5380' &
/opt/dns-over-https/doh-client/doh-client -conf /etc/dns-over-https/dns-client.conf &
exec /opt/dns-over-https/doh-server/doh-server -conf /etc/dns-over-https/dns-server.conf
