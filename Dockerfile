FROM ubuntu:20.04

RUN apt-get update \
  && apt-get install -y wget \
  && apt-get install -y unzip \
  && rm -rf /var/lib/apt/lists/*

ADD epic-node /root/epic-node
RUN chmod +x /root/epic-node
ADD entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh
ADD foundation.json /epic/foundation.json
ADD epic-server.toml /epic/epic-server.toml
ENTRYPOINT ["/root/entrypoint.sh"]



