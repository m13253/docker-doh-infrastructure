#!/bin/sh

unbound-anchor -v
crond
unbound
exec /opt/dns-over-https/doh-server/doh-server -conf /etc/dns-over-https/dns-server.conf
