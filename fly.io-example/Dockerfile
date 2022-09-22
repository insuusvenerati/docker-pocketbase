## Fetch litefs
FROM flyio/litefs:pr-109 AS litefs


FROM alpine:3.16

COPY --from=litefs /usr/local/bin/litefs /usr/local/bin/litefs

ARG VERSION=0.7.5

ADD https://github.com/pocketbase/pocketbase/releases/download/v${VERSION}/pocketbase_${VERSION}_linux_amd64.zip /tmp/pocketbase.zip
ADD litefs.yml /etc/litefs.yml

RUN unzip /tmp/pocketbase.zip -d /usr/local/bin \
    && chmod +x /usr/local/bin/pocketbase \
    && rm /tmp/pocketbase.zip

RUN adduser -D pocketbase pocketbase

## For healthchecks and litefs
RUN apk add curl fuse sqlite

## Can't run litefs as non-root?
# USER pocketbase
WORKDIR /home/pocketbase

EXPOSE 8090
RUN mkdir -p /home/pocketbase/pb_data /data
VOLUME /home/pocketbase/pb_data

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "curl", "-f", "0.0.0.0:8090/_" ]

## Use litefs as the entrypoint since the main command gets passed in litefs.yml
ENTRYPOINT "litefs"