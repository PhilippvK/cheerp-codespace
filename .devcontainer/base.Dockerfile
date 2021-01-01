# Update the VARIANT arg in devcontainer.json to pick an Ubuntu version: focal, bionic
ARG VARIANT="focal"
FROM buildpack-deps:${VARIANT}-curl

# Options for setup script
ARG INSTALL_ZSH="true"
ARG UPGRADE_PACKAGES="true"
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install needed packages and setup non-root user. Use a separate RUN statement to add your own dependencies.
COPY library-scripts/*.sh /tmp/library-scripts/
RUN bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

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
