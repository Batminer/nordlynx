FROM bubuntux/nordvpn
LABEL 
ARG 
HEALTHCHECK --interval=5m --timeout=20s --start-period=1m \
	CMD if test $( curl -m 10 -s https://api.nordvpn.com/v1/helpers/ips/insights | jq -r '.["protected"]' ) = "true" ; then exit 0; else nordvpn disconnect; nordvpn connect ${CONNECT} ; exit $?; fi

RUN apt-get install wireguard

CMD 
COPY 
