FROM debian:12

ARG DEBIAN_FRONTEND=noninteractive
ENV CONFLUENT_MAJOR_VERSION="7.5"
ENV CONFLUENT_SYMLINK=/usr/local/confluent
ENV CONFLUENT_FULL_VERSION="${CONFLUENT_MAJOR_VERSION}.2"
ENV PATH="$CONFLUENT_SYMLINK/bin:$PATH"
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
      kafkacat \
      openjdk-17-jdk-headless \
      nmap \
      iperf3 \
      iproute2 \
      traceroute \
      tcptraceroute \
      procps \
      bmon \
    && rm -rf /var/lib/apt/lists/*
RUN \
    mkdir -p /root/.confluent \
    && cd /usr/local \
    && curl -O https://packages.confluent.io/archive/${CONFLUENT_MAJOR_VERSION}/confluent-${CONFLUENT_FULL_VERSION}.zip \
    && unzip confluent-${CONFLUENT_FULL_VERSION}.zip \
    && ln -s /usr/local/confluent-${CONFLUENT_FULL_VERSION} ${CONFLUENT_SYMLINK} \
    && curl -sL --http1.1 https://cnfl.io/cli | sh -s -- latest \
    && echo '{"disable_updates": true, "disable_plugins": true}' > /root/.confluent/config.json

