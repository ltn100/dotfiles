FROM ubuntu:22.04

RUN : && \
    apt-get update && \
    apt-get install -y \
        software-properties-common \
        build-essential \
        git \
        wget \
        curl \
    && \
    add-apt-repository -y ppa:neovim-ppa/stable && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y neovim nodejs && \
    :

