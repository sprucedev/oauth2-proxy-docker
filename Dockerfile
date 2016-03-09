FROM alpine:3.2
MAINTAINER Ricky Cook <ricky@spruce.sh>

ENV OAUTH2_PROXY_VERSION 2.0.1.linux-amd64.go1.4.2

RUN apk add --update openssl
RUN wget -O - "https://github.com/bitly/oauth2_proxy/releases/download/v2.0.1/oauth2_proxy-$OAUTH2_PROXY_VERSION.tar.gz" | tar xz \
    && mv oauth2_proxy-$OAUTH2_PROXY_VERSION/oauth2_proxy /usr/local/bin/ \
    && chmod +x /usr/local/bin/oauth2_proxy \
    && rm -r oauth2_proxy*

EXPOSE 4180
ENTRYPOINT ["/usr/local/bin/oauth2_proxy"]
