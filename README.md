# Beaker-browser

Docker build of the experimental beaker browser with peer-to-peer Web protocols.

## Building

### Pre-requisites

- [git](https://git-scm.com/)
- [docker](https://www.docker.com/)

### Building

    git clone https://github.com/weiji14/beaker-browser.git
    cd beaker-browser
    docker build -f Dockerfile -t beaker-browser .

### Running the docker image

    docker run --rm -it beaker-browser
