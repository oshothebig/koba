FROM ubuntu:24.04
ARG MISE_VERSION=v2026.6.0

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        dnsutils \
        fd-find \
        file \
        git \
        iproute2 \
        iputils-ping \
        jq \
        less \
        openssh-client \
        ripgrep \
        tmux \
        tree \
        unzip \
        xz-utils \
        zip \
    && ln -s /usr/bin/fdfind /usr/local/bin/fd \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL "https://github.com/jdx/mise/releases/download/${MISE_VERSION}/mise-${MISE_VERSION}-linux-arm64.tar.gz" \
        | tar -xz -C /usr/local/bin --strip-components=2 mise/bin/mise
