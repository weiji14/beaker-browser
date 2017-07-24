# Beaker-browser

Docker build of the experimental beaker browser with peer-to-peer Web protocols.

## Pre-requisites

- [Linux](https://en.wikipedia.org/wiki/Linux)
- [docker](https://www.docker.com/)
- [git](https://git-scm.com/) (only if building manually)

## Running the image

### Automated (recommended)

    docker run --rm -it --init -v /tmp/.X11-unix/:/tmp/.X11-unix/ -e DISPLAY weiji14/beaker-browser

### Manual

    git clone https://github.com/weiji14/beaker-browser.git
    cd beaker-browser
    docker build -f Dockerfile -t beaker-browser .
    docker run --rm -it --init -v /tmp/.X11-unix/:/tmp/.X11-unix/ -e DISPLAY beaker-browser

## Troubleshooting

If nothing seems to happen, you may need to allow access to the X Server from other hosts using a tool like xhost (see [here](https://stackoverflow.com/questions/16296753/can-you-run-gui-apps-in-a-docker-container#comment65709322_25168483)). Try running `xhost +local:`, then re-run the command above.
