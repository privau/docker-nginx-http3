FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y libmaxminddb0 wget

RUN wget https://github.com/ononoki1/nginx-quictls/releases/latest/download/nginx

RUN mv /nginx /nginx.deb \
  && dpkg -i /nginx.deb \
  && rm -rf /nginx.deb \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/log/*.log

CMD ["nginx", "-g", "daemon off;"]
