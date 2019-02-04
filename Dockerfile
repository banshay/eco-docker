FROM mono:latest

ADD https://filebin.net/kuh1sopye7xmsrz4/EcoServer-8.zip?t=gdtcc02l /tmp/
ADD startup /sbin/startup

WORKDIR /tmp
RUN apt update \
    && apt install unzip tzdata -y \
    && chmod 755 /sbin/startup \
    && mkdir -p /opt/eco \
    && unzip EcoServer*zip -d /opt/eco \
    && rm -f EcoServer*zip
WORKDIR /opt/eco
EXPOSE 3000-3001

