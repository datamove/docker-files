# Run a GUI app in a container
#
# This is a docker file for firefox, together with video codecs, 
# and ublock-origin
#
### Build this image: ###
# docker build --tag dockerfirefox - <docker-firefox/Dockerfile

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
FROM ubuntu:latest 
LABEL maintainer "datamove@gmail.com"

#ADD https://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb /src/google-talkplugin_current_amd64.deb

# Install Chrome
RUN apt-get update && apt-get install -y \
libavcodec-ffmpeg56 \
libavdevice-ffmpeg56 \
libavformat-ffmpeg56	\
xul-ext-ublock-origin \
firefox 

# Add chrome user
RUN groupadd -r dockerapp && useradd -r -g dockerapp -G audio,video dockerapp \
    && mkdir -p /home/dockerapp/Downloads \
    && chown -R dockerapp:dockerapp /home/dockerapp

#COPY local.conf /etc/fonts/local.conf

# Run Chrome as non privileged user
USER dockerapp

# Autorun the app
ENTRYPOINT [ "firefox" ]
CMD [ "--user-data-dir=/data" ]

