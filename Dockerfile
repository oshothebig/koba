FROM ubuntu:24.04

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

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV MISE_INSTALL_PATH="/usr/local/bin/mise"

RUN curl https://mise.run | sh
RUN echo 'eval "$(mise activate bash)"' >> ~/.bashrc
RUN mise use -g \
    # Languages
    node@lts python@3.14 go bun deno zig \
    # Package manager
    uv \
    # Development tools
    helix
