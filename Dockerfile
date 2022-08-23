FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
  expect curl ca-certificates iproute2 wget jq iptables \
  && wget -q https://github.com/ononoki1/nginx-http3/releases/download/v4.4.3/nginx.deb -O /nginx/nginx.deb \
  && dpkg -i /nginx/nginx.deb \
  && rm -rf /nginx/*.deb \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get purge --autoremove -y wget \
  && rm -rf /var/log/*.log

CMD ["nginx", "-g", "daemon off;"]