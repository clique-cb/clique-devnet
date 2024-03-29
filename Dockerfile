FROM node:16-bullseye-slim as base

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        build-essential \
        python3 && \
    rm -fr /var/lib/apt/lists/* && \
    rm -rf /etc/apt/sources.list.d/*

RUN npm install --global --quiet truffle ganache

FROM base as ganache

RUN mkdir -p /home
WORKDIR /home
EXPOSE 8545

ENTRYPOINT ["ganache", "--server.host='0.0.0.0'"]
