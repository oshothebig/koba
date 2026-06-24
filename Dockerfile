FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        bash-completion \
        make \
        ca-certificates \
        curl \
        dnsutils \
        extrepo \
        file \
        git \
        iproute2 \
        iputils-ping \
        less \
        openssh-client \
        tmux \
        tree \
        unzip \
        xz-utils \
        zip

WORKDIR /workspace

RUN extrepo enable mise \
    && apt-get update \
    && apt-get install -y --no-install-recommends mise \
    && rm -rf /var/lib/apt/lists/*
RUN echo 'eval "$(mise activate bash)"' >> ~/.bashrc
RUN mkdir -p /root/.config/mise
COPY config/mise.toml /root/.config/mise/config.toml
RUN mise install --yes
