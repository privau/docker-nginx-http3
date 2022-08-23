FROM alpine:edge AS builder

# set version
RUN wget https://github.com/ononoki1/nginx-http3/releases/download/v4.4.3/nginx.deb

# install dpkg
RUN apk add dpkg

RUN dpkg -i nginx.deb

CMD ["nginx", "-g", "daemon off;"]