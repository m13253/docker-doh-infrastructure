#!/bin/sh

always() {
  while true
  do
    "$@"
    sleep 5
  done
}

unbound-anchor -v
crond
always unbound -d -v &
always /opt/dns-over-https/doh-client/doh-client -conf /etc/dns-over-https/doh-client.conf &
always /opt/dns-over-https/doh-server/doh-server -conf /etc/dns-over-https/doh-server.conf
