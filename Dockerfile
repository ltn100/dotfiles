FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common gpg-agent \
    && add-apt-repository ppa:neovim-ppa/unstable \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        git \
        neovim \
        python3 \
        sudo \
        tmux \
        vim \
        zsh \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /usr/bin/zsh ubuntu -g sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ubuntu
WORKDIR /home/ubuntu
