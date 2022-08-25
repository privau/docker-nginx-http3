FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y libmaxminddb0 wget

RUN wget https://github.com/ononoki1/nginx-quictls/releases/latest/download/nginx -O /nginx/

RUN dpkg -i /nginx/nginx \
  && rm -rf /nginx/nginx \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/log/*.log

CMD ["nginx", "-g", "daemon off;"]
