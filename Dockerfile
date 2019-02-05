FROM mono:latest

ADD startup /sbin/startup

RUN apt update \
    && chmod 755 /sbin/startup \
    && mkdir -p /opt/eco \
WORKDIR /opt/eco
EXPOSE 3000-3001

ENTRYPOINT ["/bin/sh", "--"]
CMD ["/sbin/startup"]
