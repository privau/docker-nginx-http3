FROM alpine:edge AS builder

# set version
ENV ONONOKI_VERSION = v4.4.3  

RUN wget https://github.com/ononoki1/nginx-http3/releases/download/$version/nginx.deb \
    dpkg -i nginx.deb