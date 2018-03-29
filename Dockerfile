FROM alpine:edge

ADD https://s3-us-west-2.amazonaws.com/eco-releases/EcoServer_v0.7.3.1-beta.zip /tmp/
ADD startup /sbin/startup

WORKDIR /tmp
RUN apk add --no-cache --upgrade apk-tools \
    && apk add --no-cache tini libssl1.0 \
    && apk add --no-cache mono --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    && chmod 755 /sbin/startup \
    && mkdir -p /opt/eco \
    && unzip EcoServer*zip -d /opt/eco \
    && rm -f EcoServer*zip
WORKDIR /opt/eco
EXPOSE 3000-3001
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/sbin/startup"]

