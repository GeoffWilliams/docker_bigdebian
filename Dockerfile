FROM debian:12

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt install -y  \
      curl \
      unzip \
      bzip2 \
      netcat-traditional \
      bind9-dnsutils \
      vim \
      bash-completion \
      build-essential \
      git \
      rsync \
    && rm -rf /var/lib/apt/lists/* \