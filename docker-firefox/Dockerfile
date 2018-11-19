# Run a GUI app in a container
#
# This is a docker file for firefox, together with video codecs, 
# and ublock-origin. The latter is installed on start up and requires
# user confirmation.
#
# Startup page is set to www.duckduckgo.com
#
### Build this image: ###
# docker build --tag dockerfirefox - < docker-firefox/Dockerfile
#
# optionally use --no-cache

### Allow X connection to the host:
# xhost +local:
# or, for only the user at id 999 (first user uid for this Ubuntu version)
# xhost +SI:localuser:$(id -un 999)

### Create a container and run the app ###
# docker run --rm --device /dev/snd -d -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw -v $HOME/.Xauthority:/home/.Xauthority  -v /run/dbus/:/run/dbus/ -v /dev/shm:/dev/shm -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native dockerfirefox:latest
# Options explanations
# docker run -it \
#       --rm \ #remove container after closing the app
#	--net host \ # may as well YOLO
#	--cpuset-cpus 0 \ # control the cpu
#	--memory 512mb \ # max memory it can use
#	-v /tmp/.X11-unix:/tmp/.X11-unix \ # mount the X11 socket
#       -v $HOME/.Xauthority:/home/.Xauthority \ #for X
#       -v /run/dbus/:/run/dbus/
#       -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \ #for sound
#       -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \ 
#	-e DISPLAY=unix$DISPLAY \
#	-v $HOME/Downloads:/home/dockerapp/Downloads \
#	--device /dev/snd \ # so we have sound
#	-v /dev/shm:/dev/shm \
#	--name firefox\
#	dockerfirfox:latest
#

# Base docker image
FROM ubuntu:16.04 
LABEL maintainer="datamove@gmail.com"

# Install Firefox
RUN apt-get update && apt-get install -y wget \
libavcodec-ffmpeg56 \
libavdevice-ffmpeg56 \
libavformat-ffmpeg56 \
firefox 

# Add runtime user
RUN groupadd -r dockerapp && useradd -r -g dockerapp -G audio,video dockerapp \
    && mkdir -p /home/dockerapp/Downloads \
    && chown -R dockerapp:dockerapp /home/dockerapp


# Run firefox as non privileged user
# the id will be used in the host. For xenial - 999
USER dockerapp
WORKDIR /home/dockerapp

RUN wget https://addons.mozilla.org/firefox/downloads/latest/ghostery/addon-ghostery-latest.xpi


# Autorun the app
ENTRYPOINT [ "firefox" ]
CMD ["addon-ghostery-latest.xpi", "www.duckduckgo.com" ]


