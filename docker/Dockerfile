FROM hashicorp/terraform:latest

RUN addgroup -S ubuntu && adduser -u 1000 -S ubuntu -G ubuntu

ENV HTTP_PROXY=$HTTP_PROXY
ENV HTTPS_PROXY=$HTTPS_PROXY

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
