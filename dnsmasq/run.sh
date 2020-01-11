#!/usr/bin/env bash
mv /etc/dnsmasq.conf /etc/dnsconf/dnsmasq.conf
dnsmasq -C /etc/dnsconf/dnsmasq.conf -k