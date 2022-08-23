FROM alpine:edge AS builder

# set version
RUN wget https://github.com/ononoki1/nginx-http3/releases/download/v4.4.3/nginx.deb
RUN dpkg -i nginx.deb