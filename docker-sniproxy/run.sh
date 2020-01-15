#!/usr/bin/env bash

# import common functions
# CDW=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
# [ -f ${CDW}/functions ] && source ${CDW}/functions

# # update sniproxy config
# printf "Setting sniproxy resolver to ${RESOLVER_IP}\n"
# sed -i -r "s/nameserver ([0-9]{1,3}+\.[0-9]{1,3}+\.[0-9]{1,3}+\.[0-9]{1,3})/nameserver ${RESOLVER_IP}/" /etc/sniproxy.conf

# function showip() {
#     IP=$(curl -s ifconfig.io/ip)
#     echo "Your Current IP: $IP"
# }

# showip
openvpn --config /openvpn/default.ovpn &
$(which sniproxy) -c /etc/sniproxy.conf -f
