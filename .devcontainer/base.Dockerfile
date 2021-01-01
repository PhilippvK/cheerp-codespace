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

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

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

# Install Minimal HTTP server
RUN npm install --global http-server

# TODO: wget https://d3415aa6bfa4.leaningtech.com/cheerpj_linux_2.1.tar.gz
