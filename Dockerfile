FROM debian:buster-slim
LABEL maintainer "https://github.com/weiji14"
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV NODE_VERSION=6

# Get beaker browser source files and dependencies https://github.com/beakerbrowser/beaker#building-from-source
RUN apt-get -qq update && apt-get install -y --no-install-recommends \
    # Main build dependencies
    libtool \
    m4 \
    automake \
    make \
    g++ \

    # Other build required dependencies
    git \
    ca-certificates \
    curl \
    gnupg \

    # Some X11 GUI dependencies for electron, and python for node-gyp
    libgtk2.0-0 \
    libx11-xcb1 \
    libxtst6 \
    libxss1 \
    libgconf-2-4 \
    libnss3 \
    libasound2 \
    python

# Get node source as per https://github.com/nodesource/distributions#installation-instructions
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - \

    # Install npm and update it to the latest version
    && apt-get install -y --no-install-recommends nodejs
    #&& npm install npm@latest -g

# Setup beaker user and workdir
RUN useradd -d /home/beaker -m beaker
USER beaker
WORKDIR /home/beaker

# Git clone from beaker's github source and use latest tagged release
RUN git clone https://github.com/beakerbrowser/beaker.git
WORKDIR /home/beaker/beaker
RUN git checkout `git tag | sort -n | tail -1`

# Build and install beaker browser using npm
RUN npm install
#RUN npm run burnthemall
#RUN npm run rebuild #see https://github.com/electron/electron/issues/5851
CMD npm start
