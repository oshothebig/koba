FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        dnsutils \
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
        zip \
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
    bat fd fzf gh helix jq just ripgrep \
    # Coding agents
    claude-code codex opencode pi
