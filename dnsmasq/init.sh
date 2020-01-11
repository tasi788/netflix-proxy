CWD=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

if [[ -f "${CWD}/proxy-domains.txt" ]] && [[ -f "${CWD}/dnsmasq.template.conf" ]] ; then
    cp dnsmasq.template.conf dnsmasq.conf
else
    echo "[failed] File proxy-domains or dnsmasq.template.confdoes not found."
    exit 1;
fi

EXTIP=$(curl -s ifconfig.io/ip)
RESOLVER_PRI=${RESOLVER_PRI:-8.8.8.8}
RESOLVER_SEC=${RESOLVER_SEC:-8.8.4.4}

if [[ -n "${EXTIP}" ]]; then
    for domain in $(cat ${CWD}/proxy-domains.txt); do
        printf "address=/${domain}/${EXTIP}\n"\
          | tee -a ${CWD}/dnsmasq.conf &>> /dev/null
    done
fi

for domain in $(cat ${CWD}/bypass-domains.txt); do
    printf "server=/${domain}/${RESOLVER_PRI}\n"\
      | tee -a ${CWD}/dnsmasq.conf &>> /dev/null
    printf "server=/${domain}/${RESOLVER_SEC}\n"\
      | tee -a ${CWD}/dnsmasq.conf &>> /dev/null
done

echo "[ok] dnsmasq init finished"