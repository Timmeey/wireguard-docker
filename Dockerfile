FROM ubuntu:18.04

RUN apt update && \
 apt install iproute2 -y && \
 apt install software-properties-common -y && \
 add-apt-repository ppa:wireguard/wireguard -y && \
 apt update  && \
 apt install -y --no-install-recommends wireguard-tools iptables nano net-tools && \
 apt clean

WORKDIR /scripts
ENV PATH="/scripts:${PATH}"
COPY install-module /scripts
COPY run /scripts
COPY genkeys /scripts
RUN chmod 755 /scripts/*

CMD ["run"]
