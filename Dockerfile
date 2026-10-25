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
# Expose mise shims so tools work without an interactive shell (e.g. `docker run koba claude`)
ENV PATH="/root/.local/share/mise/shims:${PATH}"
RUN echo 'eval "$(mise activate bash)"' >> ~/.bashrc
RUN mkdir -p /root/.config/mise
COPY config/mise.toml /root/.config/mise/config.toml
ARG MISE_INSTALL_CACHE_BUST
RUN : "${MISE_INSTALL_CACHE_BUST}" && mise install --yes
RUN echo 'eval "$(starship init bash)"' >> ~/.bashrc
