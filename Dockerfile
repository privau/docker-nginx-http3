FROM debian:bullseye-slim
COPY ./nginx.deb /

RUN apt-get update && apt-get install --allow-change-held-packages --allow-downgrades --allow-remove-essential \
  -o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold -fy \
  cmake curl git libmaxminddb-dev mercurial ninja-build rsync wget zlib1g-dev \
  > /dev/null 2>&1
  apt-get install --allow-change-held-packages --allow-downgrades --allow-remove-essential \
  -o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold -fy \
  -t bullseye-backports golang > /dev/null 2>&1 \
  && dpkg -i /nginx.deb \
  && rm -rf /nginx.deb \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/log/*.log

CMD ["nginx", "-g", "daemon off;"]
