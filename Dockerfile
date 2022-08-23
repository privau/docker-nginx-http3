FROM debian:bookworm-slim

COPY ./nginx.deb /nginx/

RUN apt-get update && apt-get install -y nginx \
  && apt remove nginx -y

RUN dpkg -i /nginx/nginx.deb \
  && rm -rf /nginx/*.deb \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/log/*.log

CMD ["nginx", "-g", "daemon off;"]