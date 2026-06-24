FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        make \
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
WORKDIR /workspace

RUN curl https://mise.run | sh
RUN echo 'eval "$(mise activate bash)"' >> ~/.bashrc
RUN mkdir -p /root/.config/mise
COPY mise.toml /root/.config/mise/config.toml
RUN mise install --yes
