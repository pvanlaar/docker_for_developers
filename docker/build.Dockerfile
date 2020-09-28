FROM ubuntu:focal

SHELL ["/bin/bash", "-c", "-l"]

ARG developer_uid=1000
ARG developer_gid=1000

ARG cmake_version=3.18
ARG cmake_build=1

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    sudo \
    gcc \
    g++ \
    nano \
    make \
    git \
    wget \
    && apt-get clean && rm -r /var/lib/apt/lists/*  && rm -rf /var/cache/apt

# install cmake
RUN export version=${cmake_version} \
    && export build=${cmake_build} \
    && export install_file=cmake-${version}.${build}-Linux-x86_64.sh \
    && export download_folder=${HOME}/temp \
    && mkdir ${download_folder} \
    && cd ${download_folder} \
    && wget https://cmake.org/files/v${version}/${install_file} \
    && sudo mkdir -p /opt/cmake/${version} \
    && sudo bash ${install_file} --skip-license --prefix=/opt/cmake/${version} \
    && echo "PATH=/opt/cmake/${cmake_version}/bin:$PATH" | sudo tee --append /etc/bash.bashrc > /dev/null \
    && rm -rf ${download_folder} \
    && sudo ln -s /opt/cmake/${cmake_version}/bin/cmake /usr/bin/cmake

# setup developer user instead of root
ENV HOME /home/developer
RUN groupadd -g ${developer_gid} developer \
    && useradd --create-home --uid ${developer_uid} --gid ${developer_gid} --home-dir $HOME developer \
	&& chown -R developer:developer $HOME
RUN echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER developer

WORKDIR "/home/developer"