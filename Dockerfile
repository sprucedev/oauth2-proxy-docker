FROM alpine:3.2
MAINTAINER Ricky Cook <ricky@spruce.sh>

ENV OAUTH2_PROXY_VERSION 2.0.1.linux-amd64.go1.4.2

RUN wget -O - "https://github.com/bitly/oauth2_proxy/releases/download/v2.0.1/oauth2_proxy-$OAUTH2_PROXY_VERSION.tar.gz" | tar xzvf oauth2_proxy.tar.gz \
    && mv oauth2_proxy-$OAUTH2_PROXY_VERSION/oauth2_proxy /bin/ \
    && chmod +x /bin/oauth2_proxy \
    && rm -r oauth2_proxy*

EXPOSE 4180
ENTRYPOINT ["oauth2_proxy"]

