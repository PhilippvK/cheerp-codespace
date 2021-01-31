# [Choice] Ubuntu version: bionic, focal
ARG VARIANT=focal
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

# Install essential packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends software-properties-common build-essential python3-distutils


# Install Cheerp packages
RUN export DEBIAN_FRONTEND=noninteractive \
    && add-apt-repository -y ppa:leaningtech-dev/cheerp-ppa \
    && apt-get update \
    && apt-get -y install --no-install-recommends cheerp-core

# Install NodeJS
RUN export DEBIAN_FRONTEND=noninteractive \
    && curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash - \
    && apt-get update \
    && apt-get -y install --no-install-recommends nodejs

# Install Chromium
RUN export DEBIAN_FRONTEND=noninteractive \
    && add-apt-repository -y ppa:saiarcot895/chromium-beta \
    && apt-get update \
    && apt-get -y install --no-install-recommends update

# Install Minimal HTTP server etc.
RUN npm install --global http-server
RUN npm install --global codespaces-port

# TODO: cd ~ && wget https://d3415aa6bfa4.leaningtech.com/cheerpj_linux_2.1.tar.gz && tar xvf cheerpj_linux_2.1.tar.gz

