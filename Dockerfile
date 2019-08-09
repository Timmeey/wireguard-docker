FROM debian:stable

RUN apt update && \
 apt install -y --no-install-recommends wireguard-tools iptables nano net-tools && \
 apt clean

WORKDIR /scripts
ENV PATH="/scripts:${PATH}"
COPY install-module /scripts
COPY run /scripts
COPY genkeys /scripts
RUN chmod 755 /scripts/*

CMD ["run"]
