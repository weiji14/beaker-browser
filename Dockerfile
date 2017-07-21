FROM debian:buster-slim
LABEL maintainer "https://github.com/weiji14"
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV NODE_VERSION=6

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
    curl \
    gnupg

# Get node source as per https://github.com/nodesource/distributions#installation-instructions
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - \

    # Install npm and update it to the latest version
    && apt-get install -y --no-install-recommends nodejs \
    && npm install npm@latest -g

    # Get beaker browser source from https://github.com/beakerbrowser/
    #&& git clone https://github.com/beakerbrowser/beaker.git \

    # Remove dev/build stuff as not needed anymore
    #&& apt-get remove -y \
    #build-essential \
    #python3-dev \

    # More purging
    #&& apt-get autoremove -y \
    #&& rm -rf /var/lib/apt/lists/*

# Setup beaker user and workdir
RUN useradd -d /home/beaker -m beaker
USER beaker
WORKDIR /home/beaker

# Build and install beaker browser
RUN git clone https://github.com/beakerbrowser/beaker.git
WORKDIR /home/beaker/beaker
RUN git checkout `git tag | sort -n | tail -1`
RUN npm install
#RUN npm run burnthemall
RUN npm start
