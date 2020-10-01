# base image​
FROM ubuntu:focal

ARG developer_uid=1000
ARG developer_gid=1000

# default on Linux ["/bin/sh", "-c"] and on Windows ["cmd", "/S", "/C"]
SHELL ["/bin/bash", "-c"] 

# install tools​
RUN apt-get update -qq && apt-get install -y \
    gcc \
    g++​

ENV HOME /home/developer
RUN groupadd -g ${developer_gid} developer \
    && useradd --create-home --uid ${developer_uid} --gid ${developer_gid} --home-dir $HOME developer \
	&& chown -R developer:developer $HOME \
    && echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
# setup developer user instead of root
USER developer

# copy files​
COPY ./app /app​

# default command​
CMD [ "/app/start.sh", "--args" ]