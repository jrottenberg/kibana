FROM node:8-alpine

CMD /opt/kibana/bin/kibana serve --elasticsearch ${ELASTICSEARCH_URL} --host 0.0.0.0

EXPOSE 5601/tcp


ENV KIBANA_VERSION=6.0.0 \
    ELASTICSEARCH_CURATOR_VERSION=5.5.1

RUN  apk add --update --no-cache ca-certificates curl nodejs py-pip && \
     curl -sL https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz | tar -zx -C /opt/ && \
     mv /opt/kibana-* /opt/kibana && \
     rm -rf /opt/kibana/node/ && \
     mkdir -p /opt/kibana/node/bin/ && \
     ln -s $(which node) /opt/kibana/node/bin/node && \
     pip install elasticsearch-curator==${ELASTICSEARCH_CURATOR_VERSION}

USER node

