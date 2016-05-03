FROM ubuntu:14.04

MAINTAINER Raffaele Sommese <raffysommy@gmail.com>

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install nano lsof iptables ipsec-tools iproute2 openswan openssl xl2tpd wget

RUN mkdir /tmp/setup

WORKDIR /tmp/setup
ENV SERVERIP 46.101.178.141
ENV USERNAME vpnuser
ENV PASSWORD ch4ng3m3
ENV PRESHAREDKEY y0umustc4ngeme
VOLUME /lib/modules



COPY setup.sh ./

RUN chmod +x setup.sh

COPY ipsec.conf /etc/ipsec.conf
COPY xl2tpd.conf /etc/xl2tpd/xl2tpd.conf
COPY options.xl2tpd /etc/ppp/options.xl2tpd
COPY avvio.sh ./
RUN chmod +x avvio.sh
CMD ["./setup.sh"]

