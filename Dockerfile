FROM debian:bookworm-slim
COPY ./nginx.deb /

RUN apt-get update && apt-get install -y libmaxminddb0 > /dev/null 2>&1 \
  && dpkg -i /nginx.deb > /dev/null 2>&1 \
  && rm -rf /nginx.deb > /dev/null 2>&1 \
  && rm -rf /var/lib/apt/lists/* > /dev/null 2>&1 \
  && rm -rf /var/log/*.log > /dev/null 2>&1

CMD ["nginx", "-g", "daemon off;"]
