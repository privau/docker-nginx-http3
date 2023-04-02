FROM debian:bullseye-slim
COPY ./nginx.deb /

RUN echo deb http://deb.debian.org/debian bullseye-backports main >> /etc/apt/sources.list

RUN apt update && apt install --allow-change-held-packages --allow-downgrades --allow-remove-essential \
  -o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold -fy \
  cmake curl git libmaxminddb-dev mercurial ninja-build rsync wget zlib1g-dev &&
  apt install --allow-change-held-packages --allow-downgrades --allow-remove-essential \
  -o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold -fy \
  -t bullseye-backports golang \
  && dpkg -i /nginx.deb \
  && rm -rf /nginx.deb \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/log/*.log

CMD ["nginx", "-g", "daemon off;"]
