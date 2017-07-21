FROM debian:buster-slim
LABEL maintainer "https://github.com/weiji14"
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Get beaker browser source files and dependencies https://github.com/beakerbrowser/beaker#building-from-source
RUN apt-get -qq update && apt-get install -y --no-install-recommends \
    # Install build dependencies
    libtool \
    m4 \
    automake \
    make \
    g++ \

    # Other required dependencies
    git \
    ca-certificates \

    # Get beaker browser source from https://github.com/beakerbrowser/
    #&& git clone https://github.com/beakerbrowser/beaker.git \

    # Remove dev/build stuff as not needed anymore
    #&& apt-get remove -y \
    #build-essential \
    #python3-dev \

    # More purging
    #&& apt-get autoremove -y \
    #&& rm -rf /var/lib/apt/lists/*

# Install beaker browser
RUN git clone https://github.com/beakerbrowser/beaker.git
RUN cd beaker && npm install
