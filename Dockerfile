FROM debian:bullseye-slim
COPY ./nginx.deb /

RUN apt-get update \
  && dpkg -i /nginx.deb \
  && rm -rf /nginx.deb \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/log/*.log

CMD ["nginx", "-g", "daemon off;"]
