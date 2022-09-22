FROM alpine:3.16

ARG VERSION=0.7.5

ADD https://github.com/pocketbase/pocketbase/releases/download/v${VERSION}/pocketbase_${VERSION}_linux_amd64.zip /tmp/pocketbase.zip
RUN unzip /tmp/pocketbase.zip -d /usr/local/bin \
    && chmod +x /usr/local/bin/pocketbase \
    && rm /tmp/pocketbase.zip

RUN adduser -D pocketbase pocketbase

# For healthchecks
RUN apk add curl

USER pocketbase
WORKDIR /home/pocketbase

EXPOSE 8090
RUN mkdir -p /home/pocketbase/pb_data
VOLUME /home/pocketbase/pb_data

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "curl", "-f", "0.0.0.0:8090/_" ]

CMD ["pocketbase", "serve", "--http", "0.0.0.0:8090"]
