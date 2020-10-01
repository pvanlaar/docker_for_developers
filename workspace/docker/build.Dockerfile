# Note: You can use any Debian/Ubuntu based image you want. 
FROM ubuntu:focal

ARG developer_uid=1000
ARG developer_gid=1000

# install tools
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=non-interactive apt-get install -y --no-install-recommends \
    sudo \
    nano \
    g++ \
    make \
    cmake \
    git \
    ca-certificates \
    && rm -r /var/lib/apt/lists/*

# setup developer user instead of root
ENV HOME /home/developer
RUN groupadd -g ${developer_gid} developer \
    && useradd --create-home --uid ${developer_uid} --gid ${developer_gid} --home-dir $HOME developer \
	&& chown -R developer:developer $HOME \
    && echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER developer

WORKDIR ${HOME}