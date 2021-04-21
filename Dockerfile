FROM bubuntux/nordvpn

LABEL maintainer="faelterman" <frederic.aelterman@gmail.com>

ARG 

HEALTHCHECK --interval=5m --timeout=20s --start-period=1m \
	CMD if test $( curl -m 10 -s https://api.nordvpn.com/v1/helpers/ips/insights | jq -r '.["protected"]' ) = "true" ; then exit 0; else nordvpn disconnect; nordvpn connect ${CONNECT} ; exit $?; fi


RUN apt-get install wireguard

VOLUME [ "/nordlynx" ]

ENV CAP_ADD=net_admin
ENV CAP_ADD=sys_module
ENV SYSCTLS=net.ipv4.conf.all.rp_filter=2
ENV DEVICES=/dev/net/tun  




CMD 

COPY 
