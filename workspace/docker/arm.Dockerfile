FROM build_container:latest

# install tools
RUN sudo apt-get update -qq && \
    DEBIAN_FRONTEND=non-interactive sudo apt-get install -y --no-install-recommends \
    # cross compilation
    g++-aarch64-linux-gnu \
    && sudo rm -r /var/lib/apt/lists/*