FROM ubuntu

ADD https://s3-us-west-2.amazonaws.com/eco-releases/EcoServer_v0.7.3.1-beta.zip /tmp/
ADD startup /sbin/startup

WORKDIR /tmp
RUN apt update \
    && apt install mono-complete unzip -y \
    && chmod 755 /sbin/startup \
    && mkdir -p /opt/eco \
    && unzip EcoServer*zip -d /opt/eco \
    && rm -f EcoServer*zip
WORKDIR /opt/eco
EXPOSE 3000-3001
ENTRYPOINT ["/bin/bash", "--"]
CMD ["/sbin/startup"]

